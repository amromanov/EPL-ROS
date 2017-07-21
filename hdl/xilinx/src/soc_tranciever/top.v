`timescale 10ns / 100ps
module top # (parameter soc_echo = 1,
					parameter pos_offset = 0, //a?aeo oaaee?eaa?uee a?aiy oeeea ia eiinoaioo a in. e?aoiia 10 oaeia iiei?eoaeuiia ?enei
					parameter neg_offset = 0,
					parameter max_jitter = 32'd250,
					parameter COUNTER_WIDTH = 32// ia?aiia?aeuiue ionooi neieu-oi oai a?eooa?ia.  32'd4900 a?iaa niioaaonoaoao 7,1 ien oc eae oae iieo?eeinu
					)
		(
		clk_50,
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

	 	input 			clk_50;
		input 			rst;
		
		output 			rm_tx_en_mst;
		output  [1:0]	rm_tx_data_mst;
		input				rm_crs_dv_mst;
		input [1:0]		rm_rx_data_mst;
		output 			rm_clk_mst;
		
		output 			rm_tx_en_sl;
		output  [1:0]	rm_tx_data_sl;
		input				rm_crs_dv_sl;
		input [1:0]		rm_rx_data_sl;
		output 			rm_clk_sl;
		
		output			soc_in;
		output			soc_out;
		output  			rled;
		output  			tt_soc;
		
		wire clk;
		assign clk = clk_50;
/*clk_gen pll (
    .CLKIN_IN(clk_50), 
    .RST_IN(rst), 
    .CLKFX_OUT(clk), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT()
    );*/

jit_cont
#(					.soc_echo (soc_echo),
					.pos_offset (pos_offset), //a?aeo oaaee?eaa?uee a?aiy oeeea ia eiinoaioo a in. e?aoiia 10 oaeia iiei?eoaeuiia ?enei
					.neg_offset (neg_offset),
					.max_jitter (max_jitter),
					.COUNTER_WIDTH (COUNTER_WIDTH)// ia?aiia?aeuiue ionooi neieu-oi oai a?eooa?ia.  32'd4900 a?iaa niioaaonoaoao 7,1 ien oc eae oae iieo?eeinu
					) jit_cont (
    .clk(clk), 
    .rst(rst), 
    .rm_tx_en_mst(rm_tx_en_mst), 
    .rm_tx_data_mst(rm_tx_data_mst), 
    .rm_crs_dv_mst(rm_crs_dv_mst), 
    .rm_rx_data_mst(rm_rx_data_mst), 
    .rm_clk_mst(rm_clk_mst), 
    .rm_tx_en_sl(rm_tx_en_sl), 
    .rm_tx_data_sl(rm_tx_data_sl), 
    .rm_crs_dv_sl(rm_crs_dv_sl), 
    .rm_rx_data_sl(rm_rx_data_sl), 
    .rm_clk_sl(rm_clk_sl), 
    .soc_in(soc_in), 
    .soc_out(soc_out), 
    .rled(rled), 
    .tt_soc(tt_soc)
    );

endmodule
