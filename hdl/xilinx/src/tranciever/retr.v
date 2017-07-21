`timescale 1ns/100ps
//���������� �������(����������������)
//������ ������������ ��� ������� Ethernet ������ �� ��������� ������ �����������
//�������� ������� � �������������� ������(������������ ������������ ������)
module retr(
	rst,
	clk,		
	rmii_clk,	//������ ������������ ������
//////////////////��������� �����///////////////////////////	
	rm_tx_en,
	rm_tx_data,
//////////////////�������� �����////////////////////////////	
	rm_crs_dv,
	rm_rx_data,
//////////////////100 ����/�?///////////////////////////////	
	fast_eth
	);
	
	localparam preamble_offset = 10'd8; // ������ �������� � ������
	localparam frame_buff_wide = 10;	// ������ ��������� ������
	
	/////////////��������� ��������///////////////////
	localparam st_idle = 0;		//�� ��������
	localparam st_trans = 1;	//��������
	//////////////////////////////////////////////////
	
	
	/////////////���������� � ������� �������/////////
	reg [1:0] retr_state;	//��������� ��������
	
	input 		rst;
	input 		clk;
	input		rmii_clk;
	output		rm_tx_en;
	output[ 1:0]rm_tx_data;
	input		rm_crs_dv;
	input [ 1:0]rm_rx_data;
	input		fast_eth;
	
	wire [frame_buff_wide-1 :0] recv_addr;
	wire [ 				  7	:0]	recv_data;
	wire [ 				  7	:0]	r_data_a;
	wire						recv_we;
	wire [frame_buff_wide-1 :0] recv_count;
	wire 						recv_rdy;
	
	wire [frame_buff_wide-1 :0] trans_addr;
	wire [ 				  7	:0]	trans_data;	 
	reg  [frame_buff_wide-1 :0] trans_count;
	wire 						trans_rdy;
	reg         				trans_start;
	//////////////////////////////////////////////////
	
///////////////������ �����������������///////////
rmii_send_mem #(.L(frame_buff_wide)) transmitter (.rst(rst),
	.not_det(1'b1), // ����� ���� � ������ ���������� ��� ����������� ���� ��� �������� ��������� ���������� � ��� ������������� ��� ���������
	.clk(clk),
	.rmii_clk(rmii_clk),
	.start(trans_start),
	.fast_eth(fast_eth),
	.count(trans_count),
	.addr(trans_addr),
	.rdata(trans_data),
	.rm_tx_en(rm_tx_en),
	.rm_tx_data(rm_tx_data),
	.rdy(trans_rdy),
	.done()
);	
//////////////////////////////////////////////////
	

///////////////������ �������� �������////////////	
rmii_recv_mem #(.L(frame_buff_wide)) reciever (
	.rst(rst),
	.clk(clk),
	.rmii_clk(rmii_clk),
	.offset(preamble_offset),
	.rm_rx_data(rm_rx_data),
	.rm_crs_dv(rm_crs_dv),
	.fast_eth(fast_eth),
	.addr(recv_addr),
	.wdata(recv_data),
	.we(recv_we),
	.count(recv_count),
	.rdy(recv_rdy)
);	
//////////////////////////////////////////////////

//////////////������������ ������/////////////////	
mem_2port #(
	.N(8),
	.L(10),
	.do_clk_b(0)
) frame_buf (
	.clk(clk),
	.addr_a(recv_addr),
	.en_a(recv_we),
	.we_a(recv_we),
	.w_data_a(recv_data),
	.r_data_a(r_data_a),
	.clk_b(),
	.addr_b(trans_addr),
	.en_b(1'b1),
	.we_b(1'b0),
	.w_data_b(8'b0000_0000),
	.r_data_b(trans_data)
);
//////////////////////////////////////////////////
	
////////////������ ������ ��������////////////////
always @(posedge rst, posedge clk)
	if(rst)
		begin
			retr_state <= 0;
			trans_count <= 0;
			trans_start	<= 0;
		end
	else
		begin
			case(retr_state)
				st_idle :
					begin
						if (recv_we)
							begin
								retr_state <= st_trans;		//���� �������� ������ ������ � ������ (recv_we == 1)
								trans_count <= -2;			//�� ��� ������ ��� ������ �������� ������ ���������, ��������� ����� ������ ������� �
								trans_start	<=  1;			//����� �������� �������� ������ (-2 ��������� ������� �����)
							end
						else
							begin
								retr_state <= st_idle;
								trans_count <= 0;
								trans_start	<= 0;
							end
					end
				st_trans :
					begin
					 	trans_start <= 0;
						if(recv_rdy)
							trans_count <= recv_count + 8;		//	�� ����� ������� ������ ������� ����� ��������� ����� ����� �� �������� ������ ���������� ����������
						if(trans_rdy && (!rmii_clk))
							retr_state <= st_idle; 
					end
				default :
					begin
					   	trans_count <= 0;
						trans_start	<= 0;
					end	
			endcase
		end	 
////////////////////////////////////////////////////////////


endmodule