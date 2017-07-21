// Инженер: Зоолотых А.И. КРМО-01-15 МТУ(МИРЕА)
// Мдуль: Счетчик единиц времени(микросекунд)
// Описание: В счетчике организована функция счета заданного в тиках синхрочастоты
// интервала времени, реализована функция сокращения подсчета последнего интервала 
// (использовалась для компенсации регистровых задержек в верхних уровнях дезайна)
module pulsator #(
	parameter cnt_wide = 7, // Ширина регистра счетчика
	parameter count_to = 100, // Период времени в тиках
	parameter last_neg_offset = 0 // Смещение последнего счета в тиках
	)(
	rst,
	clk,
	start, // синхронизация начала счета
	pulse, // обозначение временной отметки, равно '1' один такт за период счета в первый раз поднимается через период счета после start
	last   // флаг того, что счет последний
	);
	
	input rst;
	input clk;
	input start;
	input last;
	output reg pulse;
	reg [cnt_wide-1:0]cnt;
	
	always@(posedge rst, posedge clk)
		if(rst)
			begin
				cnt <=0;
				pulse <=0;
			end
		else
			begin
				if(~start)
					begin
						if(~last)
							begin
								if(cnt == count_to - 1)
									begin
										pulse <= 1;
										cnt <= 0;
									end
								else
									begin
										pulse <= 0;
										cnt <= cnt + 1;
									end
							end
						else
							begin
								if(cnt == count_to - 1 - last_neg_offset)
									begin
										pulse <= 1;
										cnt <= 0;
									end
								else
									begin
										pulse <= 0;
										cnt <= cnt + 1;
									end
							end
					end
				else
					begin
						cnt <=1;
						pulse <= 0;
					end
			end
	
endmodule