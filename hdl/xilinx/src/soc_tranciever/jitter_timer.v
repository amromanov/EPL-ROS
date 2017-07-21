//Iiaoeu ii?aaaeyao eiaaa ii?ii ioi?aaeyou iaeaou

module jitter_timer #(	parameter pos_offset = 0, //a?aeo oaaee?eaa?uee a?aiy oeeea ia eiinoaioo a in. e?aoiia 10 oaeia iiei?eoaeuiia ?enei
						parameter neg_offset = 0,
						parameter COUNTER_WIDTH = 64) //a?aeo oiaiuoa?uee a?aiy oeeea ia eiinoaioo a in. e?aoiia 10 oaeia iiei?eoaeuiia ?enei
	(
		clk,
		rst,
		max_jitter,
		relative_time,
		time_valid,
		soc,
		preq,
		send_done,
		time_to_soc,
		time_out_end,
		rled
		
	);
	input clk;
	input rst;
	input preq;
	input [31:0] max_jitter;
	input [63:0] relative_time;	// ?aeaoea oaei
	input time_valid;			// aai neaiae aaeeaiinoe
	input soc;		 // i?eoae nie
	input send_done; // ioi?aaeai eaeieoi iaeao io IEEN NEAEAO
	output rled;
	
	reg [31:0] time_out_counter;
	
	output reg time_to_soc;	 // ii?a ioi?aaeyou nie
	output time_out_end;	 // ii?ii iaeaou oaei aoo ia?ao iaeaoaie ieii?ai
	assign time_out_end =  (time_out_counter == 0);
	//reg [31:0] time_out_counter;
	reg [COUNTER_WIDTH - 1:0] cnt;
	reg start_cnt;
	wire cnt_done;
	wire rst_cnt_done;
	reg rst_cnt;
	
	
	always @(posedge rst, posedge clk)
		if(rst)
			begin
				time_to_soc <= 0;	
			end
		else
			begin
				if(rst_cnt_done) // iaauei nieia ~2 a?aiaie oeeea - caauaaainy
					begin
						time_to_soc <= 0;  
					end
				else
					begin
						if(cnt_done) // n?ao?ee ion?eouaa?uee iaena?eooa?(1 e aoi?ie niee) e ion?eouaa?uee a?aiy oeeea(3 e aaeaa) ain?eoae
							begin
								time_to_soc <= 1;  // a?aiy ioi?aaeyou nie
							end
						else
							begin
								if(send_done)  // nie o?a ioi?aaeeny
									time_to_soc <= 0;
							end
					end
			end
	
	
	parameter inititalyze_first = 0;
	parameter inititalyze_second = 1;
	parameter count = 2;
	reg [1:0]state;
	
	
	reg [63:0]time_now;
	reg [63:0]time_prev;
	reg	[63:0]cycle_time;
	reg [63:0]cycle_time_prev;
	
	reg preq_prev;
	reg preq_was;
	always @(posedge rst, posedge clk)
		if(rst)
			begin				 
				preq_was <= 0;
				preq_prev <= 0;
			end
		else
			begin
				if(rst_cnt_done)
					begin
						preq_was <= 0;
						preq_prev <= 0;	
					end
				else
					begin
						if(soc)
							begin
								preq_was <= 0;
								preq_prev <= preq_was;
							end
							else
						if(preq)
							begin
								preq_was <= 1;
							end
					end
			end
	
	//iaoeia ninoiyiee ii?aaaey?uay neieuei iiai?aaou a?aiaie aey ioi?aaee niea
	always @(posedge rst, posedge clk)
		if(rst)
			begin
				state <= inititalyze_first;
				cnt <= 0;
				start_cnt <= 0;
				rst_cnt <= 0;
			end
		else
			begin
				case(state)
					default :
						begin
						
						end
					inititalyze_first :
						begin
							rst_cnt <= 0;
							if(soc)
								begin
									cnt <= max_jitter;
									start_cnt <= 1; 
								end
							else
								begin
									cnt <= max_jitter;
									start_cnt <= 0;
								end
							if((cycle_time == cycle_time_prev) && preq_prev)
								begin
									state <= count;
								end
						end
					inititalyze_second :
						begin
							
							if(rst_cnt_done)
								begin
									state <= inititalyze_first;
									cnt <= 0;
									start_cnt <= 0;
									rst_cnt <= 1;
								end
							else
								begin
									if(soc)
										begin
											cnt <= max_jitter;
											start_cnt <= 1; 
										end
									else
										begin
											cnt <= max_jitter;
											start_cnt <= 0;
										end
									if(time_valid)
										begin
											state <= count;
										end
								end
						end
					count :
						begin
							if(rst_cnt_done)
								begin
									state <= inititalyze_first;
									cnt <= 0;
									start_cnt <= 0;
									rst_cnt <= 1;
								end
							else
								begin
									if(cnt_done)
										begin
											cnt <= cycle_time[COUNTER_WIDTH-1:0] ;
											start_cnt <= 1; 
										end
									else
										begin
											cnt <= cycle_time[COUNTER_WIDTH-1:0];
											start_cnt <= 0;
										end
									if((cycle_time != cycle_time_prev)|| (! preq_prev))
										begin
											state <= inititalyze_first;
										end
								end
						end
				endcase
			end
	
	assign rled = (state == count);
	
	////////////////?an?ao a?aiaie oeeea//////////////
	always @(posedge rst, posedge clk)
		if(rst)
			cycle_time <= 0;
		else
			cycle_time <= time_now - time_prev;
	///////////////////////////////////////////////////
	
	
	/////////////////caiiieiaiea i?ioeiai a?aiaie oeeea(a?iaa ia eniieucoaony)/////////////////////////////////
	
	always @(posedge rst, posedge clk)
		if(rst)
			cycle_time_prev <= 0;
		else
			if(time_valid)
				cycle_time_prev <= cycle_time;
	
	//////////////////////////////////////////////////
	
	
	///////////////i?eaiiee a?aiaie EPL ianoa?a///////
	always @(posedge rst, posedge clk)
		if(rst)
			begin
				time_now <= 0;
				time_prev <= 0;
			end	
		else
			begin
				if(time_valid)
					begin
						time_now <= relative_time;
						time_prev <= time_now;
					end		
			end
	///////////////////////////////////////////////////////
	
	/////////////n?ao?ee ia?a?uaa ia?ao iaeaoaie////////////////
	always @(posedge clk, posedge rst)
		if(rst)
			time_out_counter <= 0;
		else
			if(|time_out_counter)
				time_out_counter <= time_out_counter - 1;
			else
				if(send_done)
					time_out_counter <= (96 - 8)/2;	  // iii?aaea ia caaa??ee aioo?e nenoaiu, ?ann?eoaia i?e oanoao
				else
					time_out_counter <= time_out_counter;
	/////////////////////////////////////////////////////////////	
	
	//n?ao?ee iaena?eooa?a e a?aiaie oeeea
	counter #(.wide(COUNTER_WIDTH)) counter (
	.clk(clk),
	.rst(rst||rst_cnt),
	.count(cnt),
	.start(start_cnt),
	.count_done(cnt_done)
	);

	
	//n?ao?ee aey caauaaiey anaai anee naou eaaea
	counter #(.wide(COUNTER_WIDTH)) reset_counter (
	.clk(clk),
	.rst(rst||rst_cnt),
	.count({cnt[COUNTER_WIDTH-1:0] + max_jitter}),
	.start(soc && (state == count)),
	.count_done(rst_cnt_done)
	);
	
	
	
endmodule