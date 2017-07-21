module jit_cont #(parameter soc_echo = 0,
					parameter pos_offset = 0, //a?aeo oaaee?eaa?uee a?aiy oeeea ia eiinoaioo a in. e?aoiia 10 oaeia iiei?eoaeuiia ?enei
					parameter neg_offset = 0,
					parameter max_jitter = 32'd20,
					parameter COUNTER_WIDTH = 32// ia?aiia?aeuiue ionooi neieu-oi oai a?eooa?ia.  32'd4900 a?iaa niioaaonoaoao 7,1 ien oc eae oae iieo?eeinu
					)
		(
		clk,
		rst,
		
		rm_tx_en_mst,
		rm_tx_data_mst,
		rm_crs_dv_mst,
		rm_rx_data_mst,
		rm_clk_mst,
		
		
		rm_tx_en_sl,
		rm_tx_data_sl,
		rm_crs_dv_sl,
		rm_rx_data_sl,
		rm_clk_sl,
		
		soc_in,
		soc_out,
		rled,
		tt_soc
		

		);

	 	input 			clk;
		input 			rst;
		
		output reg			rm_tx_en_mst;
		output reg [1:0]	rm_tx_data_mst;
		input			rm_crs_dv_mst;
		input [1:0]		rm_rx_data_mst;
		output 			rm_clk_mst;
		
		
		wire			rm_tx_en_sl_w;
		wire	 [1:0]	rm_tx_data_sl_w;
		
		output reg			rm_tx_en_sl;
		output reg [1:0]	rm_tx_data_sl;
		input			rm_crs_dv_sl;
		input [1:0]		rm_rx_data_sl;
		output 			rm_clk_sl;
		
		output			soc_in;
		output			soc_out;
		output  			rled;
		output  			tt_soc;
	
	/*reg rm_clk;
	
	always @(posedge clk, posedge rst)
		if(rst)
			rm_clk <= 0;
		else
			rm_clk <= ~rm_clk;*/

			
	assign rm_clk_mst = ~clk;
	assign rm_clk_sl  = ~clk;
		
   wire	rm_tx_en_mst_s;
	wire	[1:0]rm_tx_data_mst_s;


	retr_soc #(	.soc_echo(0),

				.pos_offset(0),
				.neg_offset (0),
				.max_jitter(0),
				.COUNTER_WIDTH(COUNTER_WIDTH)
				) sl_to_mst 

	(.rst(rst),
	.clk(clk),
	//.rmii_clk(rm_clk),
	.rm_tx_en(rm_tx_en_mst_s),
	.rm_tx_data(rm_tx_data_mst_s),
	.rm_crs_dv(rm_crs_dv_sl),
	.rm_rx_data(rm_rx_data_sl),
	.fast_eth(1'b1)
	);

	wire soc_is_runnig;

	
	always@(posedge rst, posedge clk)
		if(rst)
			begin
				rm_tx_en_sl   <= 0;
				rm_tx_data_sl <= 0;	
			end
		else
			begin
				rm_tx_en_sl   <= rm_tx_en_sl_w;
				rm_tx_data_sl <= rm_tx_data_sl_w;	
			end
	
	always@(posedge rst, posedge clk)
		if(rst)
			begin
				rm_tx_en_mst <= 0;
				rm_tx_data_mst <= 0;  
			end
		else
			if(soc_is_runnig)
				begin
					rm_tx_en_mst <= rm_tx_en_sl_w;
					rm_tx_data_mst <= rm_tx_data_sl_w;
				end
			else
				begin
					rm_tx_en_mst <= rm_tx_en_mst_s;
					rm_tx_data_mst <= rm_tx_data_mst_s;
				end
	
	retr_soc #(	.soc_echo(soc_echo),
				.pos_offset(pos_offset),
				.neg_offset (neg_offset),
				.max_jitter(max_jitter),
				.COUNTER_WIDTH(COUNTER_WIDTH)
				) mst_to_sl (
	.rst(rst),
	.clk(clk),
	//.rmii_clk(rm_clk),
	.rm_tx_en(rm_tx_en_sl_w),
	.rm_tx_data(rm_tx_data_sl_w),
	.rm_crs_dv(rm_crs_dv_mst),
	.rm_rx_data(rm_rx_data_mst),
	.fast_eth(1'b1),
	.soc_edge(soc_in),
	.soc_out_edge(soc_out),
	.soc_is_runnig(soc_is_runnig),
	.rled(rled),
	.tt_soc(tt_soc)
	);

		
endmodule
