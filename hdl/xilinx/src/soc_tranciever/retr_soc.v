module retr_soc #(parameter soc_echo = 0,
					parameter pos_offset = 0,
					parameter neg_offset = 0,
					parameter max_jitter = 32'd4900,
					parameter COUNTER_WIDTH = 32
					) (
	rst,
	clk,
	//rmii_clk,
	rm_tx_en,
	rm_tx_data,
	rm_crs_dv,
	rm_rx_data,
	fast_eth,
	soc_edge,
	soc_out_edge,
	soc_is_runnig,
	rled,
	tt_soc
	);
	
	localparam preamble_offset = 10'd8;
	localparam frame_buff_wide = 10;
	
	localparam st_idle = 0;
	localparam st_trans = 1;
	
	wire preq;
	output wire soc_is_runnig;	 
	
	
	input 		rst;
	input 		clk;
	//input		rmii_clk;
	output		rm_tx_en;
	output[ 1:0]rm_tx_data;
	input		rm_crs_dv;
	input [ 1:0]rm_rx_data;
	input		fast_eth;
	
	output reg soc_out_edge; 
	output reg soc_edge;
	output rled;
	output tt_soc;
	
	wire soc;
	wire head_done;
	
	wire soc_out;
	wire head_done_out;
	
	
	always @(posedge rst, posedge clk)
		if(rst)
			soc_edge <= 0;
		else			
			if(soc)
				soc_edge <= ~soc_edge;
				
	always @(posedge rst, posedge clk)
		if(rst)
			soc_out_edge <= 0;
		else
			if(soc_out)
				soc_out_edge <= ~soc_out_edge;
	
	reg [frame_buff_wide-1 :0] recv_addr;
	reg [ 				  7	:0]	recv_data;
	wire [ 				  7	:0]	r_data_a;
	reg						recv_we;
	
	
	reg [frame_buff_wide-1 :0] trans_addr;
	wire [ 				  7	:0]	trans_data;	 
	wire 						trans_rdy;

	reg [frame_buff_wide-1 :0] recv_addr2;
	reg [ 				  7	:0]	recv_data2;
	wire [ 				  7	:0]	r_data_a2;
	reg						recv_we2;
	
	
	reg [frame_buff_wide-1 :0] trans_addr2;
	wire [ 				  7	:0]	trans_data2;	 
	
	
	wire [frame_buff_wide-1 :0] recv_addr_dev;
	wire [ 				  7	:0]	recv_data_dev;
	wire						recv_we_dev;
	wire [frame_buff_wide-1 :0] recv_count_dev;
	wire 						recv_rdy_dev;
	
	wire [frame_buff_wide-1 :0] trans_addr_dev;
	reg [ 				  7	:0]	trans_data_dev;	 
	reg  [frame_buff_wide-1 :0] trans_count_dev;
	reg         				trans_start_dev;
	wire						trans_done_dev;
	
	
	wire time_to_soc;
	wire time_out_end;
	
	assign tt_soc = time_to_soc;
	
	reg [31:0] count_buf_1;
	reg [31:0] count_buf_2;
	reg [1: 0] buffer_is_full;
	reg [1: 0] buffer_not_empty;
	reg [1: 0] soc_in_buffer;
	
	
	reg comutate_in_1;
	reg comutate_out_1;
	
	
	powerlink_rhub_pdo_recv #(.master(1)) Label1 (.rst(rst),
	.clk(clk),
	.node(1'b0),
	//.rm_clk(rmii_clk),
	.rm_rx(rm_rx_data),
	.rm_crs_dv(rm_crs_dv),
	.pdo_st(preq)
);
	
	
	wire [63:0]relative_time;
	wire relative_time_valid;
	
	
	
	always @(posedge clk, posedge rst)
		if(rst)
			begin
				count_buf_1 <= 0; 
				count_buf_2 <= 0;
				comutate_in_1 <= 1;
				comutate_out_1 <= 1;
				buffer_is_full <= 2'b00;
				soc_in_buffer <= 2'b00;
				buffer_not_empty <= 2'b0;
			end
		else
			begin
				
				if(head_done && soc)	
					soc_in_buffer[comutate_in_1] <= 1'b1; 
				
				if(head_done)			   
					buffer_not_empty[comutate_in_1] <= 1'b1; 
					
				if(recv_rdy_dev)
					begin
						comutate_in_1 <= ~comutate_in_1;    
						buffer_is_full[comutate_in_1] <= 1'b1;	
						if(comutate_in_1)					
							count_buf_1 <= recv_count_dev;
						else
							count_buf_2 <= recv_count_dev;
					end
				if(trans_done_dev)
					begin
						comutate_out_1 <= ~comutate_out_1; 
						buffer_is_full[comutate_out_1] <= 2'b0;
						buffer_not_empty[comutate_out_1] <= 2'b0;
						soc_in_buffer[comutate_out_1] <= 2'b0;	
					end
			end
	
reg [1:0] retr_state;


wire send_no_soc; 
assign send_no_soc = (buffer_not_empty[comutate_out_1] && time_out_end &&  !soc_in_buffer[comutate_out_1] );

wire send_soc;	  
assign send_soc = (buffer_not_empty[comutate_out_1] && time_out_end &&  soc_in_buffer[comutate_out_1] && time_to_soc );

assign soc_is_runnig = send_soc && rm_tx_en && soc_echo && rled;


always @(posedge rst, posedge clk)
	if(rst)
		begin
			retr_state <= 0;
			trans_count_dev <= 0;
			trans_start_dev	<= 0;
		end
	else
		begin
			case(retr_state)
				st_idle :
					begin
						if (( send_no_soc || send_soc  )/*&& !rmii_clk*/)//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
							begin
								retr_state <= st_trans;
								trans_count_dev <= -2;
								trans_start_dev	<=  1;
							end
						else
							begin
								retr_state <= st_idle;
								trans_count_dev <= 0;
								trans_start_dev	<= 0;
							end
					end
				st_trans :
					begin
					 	trans_start_dev <= 0;
						if(buffer_is_full[comutate_out_1])
							if(comutate_out_1)
								trans_count_dev	<= count_buf_1 + 8;
							else
								trans_count_dev <= count_buf_2 + 8;
						if(trans_rdy /*&& (!rmii_clk)*/)//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
							retr_state <= st_idle; 
					end
				default :
					begin
					   	trans_count_dev <= 0;
						trans_start_dev	<= 0;
					end	
			endcase
		end
			

		jitter_timer #(.pos_offset(pos_offset),
			.neg_offset (neg_offset),
			.COUNTER_WIDTH(COUNTER_WIDTH)
			) jitter_timer (
		.clk(clk),
		.rst(rst),
		.max_jitter(max_jitter),
		.relative_time(relative_time),
		.time_valid(relative_time_valid),
		.soc(soc),
		.send_done(trans_done_dev),
		.time_to_soc(time_to_soc),
		.time_out_end(time_out_end),
		.preq(preq),
		.rled(rled)
	);
		
		
		
		relative_time_det #(.L(frame_buff_wide)) time_det (
			.rst(rst),
			.clk(clk),
			.data(recv_data_dev),
			.adress(recv_addr_dev),
			.relative_time(relative_time),
			.relative_time_valid(relative_time_valid),
			.head_done(head_done),
			.soc(soc),
			.we(recv_we_dev)
		);
	
	
	
	
rmii_send_mem #(.L(frame_buff_wide)) transmitter (.rst(rst),
	.not_det(1'b1),
	.clk(clk),
	///.rmii_clk(rmii_clk),
	.start(trans_start_dev),
	.fast_eth(fast_eth),
	.count(trans_count_dev),
	.addr(trans_addr_dev),
	.rdata(trans_data_dev),
	.rm_tx_en(rm_tx_en),
	.rm_tx_data(rm_tx_data),
	.rdy(trans_rdy),
	.done(trans_done_dev)
);	

	
rmii_recv_mem #(.L(frame_buff_wide)) reciever (
	.rst(rst),
	.clk(clk),
	//.rmii_clk(rmii_clk),
	.offset(preamble_offset),
	.rm_rx_data(rm_rx_data),
	.rm_crs_dv(rm_crs_dv),
	.fast_eth(fast_eth),
	.addr(recv_addr_dev),
	.wdata(recv_data_dev),
	.we(recv_we_dev),
	.count(recv_count_dev),
	.rdy(recv_rdy_dev)
);



soc_pdo_recv soc_detect_in (
	.rst(rst),
	.clk(clk),
	//.rm_clk(rmii_clk),
	.rm_rx(rm_rx_data),
	.rm_crs_dv(rm_crs_dv),
	.soc(soc),
	.head_o(head_done)
);


soc_pdo_recv soc_detect_out (
	.rst(rst),
	.clk(clk),
	//.rm_clk(rmii_clk),
	.rm_rx(rm_tx_data),
	.rm_crs_dv(rm_tx_en),
	.soc(soc_out),
	.head_o(head_done_out)
);
	
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


mem_2port #(
	.N(8),
	.L(10),
	.do_clk_b(0)
) frame_buf2 (
	.clk(clk),
	//.rst(rst),
	.addr_a(recv_addr2),
	.en_a(recv_we2),
	.we_a(recv_we2),
	.w_data_a(recv_data2),
	.r_data_a(r_data_a2),
	.clk_b(),
	.addr_b(trans_addr2),
	.en_b(1'b1),
	.we_b(1'b0),
	.w_data_b(8'b0000_0000),
	.r_data_b(trans_data2)
);

always @(*)		
	if (comutate_in_1)
		begin
			recv_addr <= recv_addr_dev;
			recv_we <= recv_we_dev;
			recv_data <= recv_data_dev;
			recv_addr2 <= 0;
			recv_we2 <= 0;
			recv_data2 <= 0;
		end
	else
		begin
			recv_addr <= 0;
			recv_we <= 0;
			recv_data <= 0;
			recv_addr2 <= recv_addr_dev;
			recv_we2 <= recv_we_dev;
			recv_data2 <= recv_data_dev;
		end

		
always @(*)			
	if (comutate_out_1)
		begin
			trans_addr <= trans_addr_dev;
			trans_addr2 <= 0;
			trans_data_dev <= trans_data;
		end
	else
		begin
			trans_addr <= 0;
			trans_addr2 <= trans_addr_dev;
			trans_data_dev <= trans_data2;
		end

endmodule