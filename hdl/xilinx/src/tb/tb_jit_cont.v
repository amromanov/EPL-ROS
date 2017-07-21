`timescale 1ns/1ps
module jit_cont_tb();
	
	parameter L = 11;
	
	reg 			rst;
	reg 			clk;
	reg				clk_50;
	reg 			m_start;
	reg				s_start;
	reg 			fast_eth;
	reg 	[L-1:0] m_count;
	wire 	[L-1:0]	m_addr;
	reg 	[7  :0]	m_rdata;
	wire 			m_rm_tx_en;
	wire 	[1  :0]	m_rm_tx_data;
	wire 			m_rdy;
	
	reg 	[L-1:0] s_count;
	wire 	[L-1:0]	s_addr;
	reg 	[7  :0]	s_rdata;
	wire 			s_rm_tx_en;
	wire 	[1  :0]	s_rm_tx_data;
	wire 			s_rdy;
	
	wire	[1  :0]	rm_tx_data_sl;
	
	//wire 			rm_tx_en;
	//wire 	[1  :0]	rm_tx_data;
	
	wire [1 : 0] rm_tx_data_mst;
	
	wire rled;
	wire tt_soc;
	
	integer i;
	

	reg [7:0] master_mem [0:1023];
	reg [7:0] slave_mem  [0:1023];
	reg [7:0] slave1_mem [0:1023];
	
	initial 
		begin
			for ( i=0 ; i < 1024; i= i + 1)
				begin
					master_mem [i] <= 8'b0;
					slave_mem  [i] <= 8'b0;
					slave1_mem [i] <= 8'b0;
				end
		end
	
	
	wire rm_clk_sl;
	wire rm_clk_mst;
	
	integer time_to_enable;
	reg[(256*8)-1 : 0] path;
	
	always @(posedge rst, posedge clk)
		if (rst)
			begin
				m_rdata <= 0;
			end
		else
			begin
				m_rdata <= master_mem[m_addr];
			end
			
			
			
	always @(posedge rst, posedge clk)
		if (rst)
			begin
				s_rdata <= 0;
			end
		else
			begin
				s_rdata <= slave_mem[s_addr];
			end
			
			always #10 clk = ~clk;
	
	rmii_send_mem #(.L(11)) master (
	.rst(rst),
	.not_det(1),
	.clk(clk),
	//.rmii_clk(rm_clk_mst),
	.start(m_start),
	.fast_eth(fast_eth),
	.count(m_count),
	.addr(m_addr),
	.rdata(m_rdata),
	.rm_tx_en(m_rm_tx_en),
	.rm_tx_data(m_rm_tx_data),
	.rdy(m_rdy),
	.done(m_done)
);


rmii_send_mem #(.L(11)) slave (
.rst(rst),
	.not_det(1),
	.clk(clk),
	//.rmii_clk(rm_clk_sl),
	.start(s_start),
	.fast_eth(fast_eth),
	.count(s_count),
	.addr(s_addr),
	.rdata(s_rdata),
	.rm_tx_en(s_rm_tx_en),
	.rm_tx_data(s_rm_tx_data),
	.rdy(s_rdy),
	.done(s_done)
);
	
	
	jit_cont #(
	.soc_echo (1),
	.pos_offset (0), 
	.neg_offset (0),
	.max_jitter (32'd20)
	)uut (
	.clk(clk),
	.rst(rst),
	
	.rm_tx_en_mst(rm_tx_en_mst),
	.rm_tx_data_mst(rm_tx_data_mst),
	.rm_crs_dv_mst(m_rm_tx_en),
	.rm_rx_data_mst(m_rm_tx_data),
	.rm_clk_mst(rm_clk_mst),
	
	.rm_tx_en_sl(rm_tx_en_sl),
	.rm_tx_data_sl(rm_tx_data_sl),
	.rm_crs_dv_sl(s_rm_tx_en),
	.rm_rx_data_sl(s_rm_tx_data),
	.rm_clk_sl(rm_clk_sl),
	
	.soc_in(soc_in),
	.soc_out(soc_out),
	.rled(rled),
	.tt_soc(tt_soc)
);


rmii_recv_mem #(.L(10)) test_mst_reciever (.rst(rst),
	.clk(clk),
	//.rmii_clk(rm_clk_mst),
	.offset(8),
	.rm_rx_data(rm_tx_data_mst),
	.rm_crs_dv(rm_tx_en_mst),
	.fast_eth(1),
	.addr(addr),
	.wdata(wdata),
	.we(we),
	.count(count),
	.rdy(rdy)
);

rmii_recv_mem #(.L(10)) test_sl_reciever (.rst(rst),
	.clk(clk),
	//.rmii_clk(rm_clk_sl),
	.offset(8),
	.rm_rx_data(rm_tx_data_sl),
	.rm_crs_dv(rm_tx_en_sl),
	.fast_eth(1),
	.addr(addr),
	.wdata(wdata),
	.we(we),
	.count(count),
	.rdy(rdy)
);

localparam cycle_time =	2000000;
integer start_time = 200;

initial
		begin
			rst = 1;
			clk = 1;
			
			//trans_start_dev = 0;
			
			m_start = 0;
			fast_eth = 1;
			m_count = 0;
			m_rdata = 0;
			
			s_start = 0;
			s_count = 0;
			s_rdata = 0;
			#100;
			rst = 0;
			#100;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc.hex", master_mem);
			//model_time = $time;
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;  
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			/*path = 	"C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex";
			model_time = 16720;
			slave_send_at_time(model_time,path);*/
			
			
			/*model_time = 16720;
			while (model_time < $time)
						begin
							@(posedge clk);
						end
						$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", slave_mem);
						s_start = 1;	//второй пакет
						s_count = 72;
						#20;
						s_start = 0;*/
			
			
			#16500;
			#240;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/Asnd_ident_res.hex", slave_mem);
			
			s_start = 1;	//второй пакет
			s_count = 68;
			#20;
			s_start = 0;
			
			
			//#(40000000 - 16780);
			time_to_enable = (cycle_time - start_time + 300);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc2.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			
			
			time_to_enable = (cycle_time*2 - start_time + 600);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc3.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;
			
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			time_to_enable = (cycle_time*3 - start_time -500);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc4.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;
			
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			
			time_to_enable = (cycle_time*4 - start_time +300);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc5.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0; 
			
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			start_time = 40000000;
			
			
			time_to_enable = (cycle_time - start_time + 300);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc2.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			
			

			time_to_enable = (cycle_time*2 - start_time + 600);

			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc3.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;
			
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			

			time_to_enable = (cycle_time*3 - start_time -500);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc4.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0;
			
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
			
			
			time_to_enable = (cycle_time*4 - start_time +300);
			while (time_to_enable > $time)
						begin
							@(posedge clk);
						end
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/soc5.hex", master_mem);
			
			m_start = 1;
			m_count = 72;  //первый пакет
			#20;
			m_start = 0; 
			
			
			#10000;
			
			$readmemh("C:/FPGA/Active-HDL/retr3/retr3/src/pack_soucre/preq.hex", master_mem);
			
			m_start = 1;	//второй пакет
			m_count = 72;
			#20;
			m_start = 0;
			
		end
	
		/*task slave_send_at_time;
			input integer model_time;
			reg[(256*8)-1 : 0] path;
				begin
					while (model_time < $time)
						begin
							@(posedge clk);
						end
						$readmemh(path, slave_mem);
						s_start = 1;	//второй пакет
						s_count = 72;
						#20;
						s_start = 0;
				end
		endtask*/
			
			
		
endmodule
