module counter
	#(
	parameter wide = 32
	)
	(
	clk,
	rst,
	count,
	start,
	count_done
	
	);
	
	input clk;
	input rst;
	input [wide - 1: 0] count;
	input start;
	output reg count_done;
	
	reg [wide - 1: 0] cnt;
	reg [wide - 1: 0] count_to;
	reg [wide - 1: 0] count_to_minus_one;
	reg cnt_en;
	reg last;
	
	wire pulse;
	
	pulsator #(
	.cnt_wide(7),
	.count_to(50),
	.last_neg_offset(3)
	) microsecond (
	.rst(rst),
	.clk(clk),
	.start(start),
	.pulse(pulse),
	.last(last)
	);
	
	always@(posedge rst, posedge clk)
		if(rst)
			count_to_minus_one <= 0;
		else
			count_to_minus_one <= count_to - 1;
	
	always @(posedge clk, posedge rst)
		if(rst)
			begin
				cnt <=0;
				count_to <= 0;
				count_done <= 0;
				cnt_en <= 0;
				last <= 0;
			end
		else
			if(start)
				begin
					count_to <= count;
					cnt <= 0;
					count_done <= 0;
					cnt_en <= 1;
				end
			else
				begin
					if(cnt_en)
						begin
							if(cnt == count_to)
								begin
									cnt_en <= 0;
									count_done <= 1;
									last <= 0;
								end
							else
								begin
									if(pulse) cnt <= cnt + 1;
									if(cnt == (count_to_minus_one))
										last <= 1;
								end
						end
					else
						count_done <= 0;
				end
	endmodule                   