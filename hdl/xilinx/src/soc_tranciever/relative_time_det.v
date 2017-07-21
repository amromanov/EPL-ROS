//приемник релатив тайм с интейфейса ПДП
//Модуль определяет поле relative time в пакете Ethernet Powerlink по интерфейсу ПДП из байтового потока приемника пакетов
module relative_time_det #(
	parameter L = 10	//Ширина адреса
	)
	(
	////////////////Глобальные сигналы////////////////
		rst,
		clk,
	////////////////ПДП///////////////////////////////	
		data,
		adress,
		we,
	////////////////Relative time interface///////////	
		relative_time,
		relative_time_valid,
	////////////////Сигналы от анализаторапакетов/////	
		head_done,	//Заголовок обрабатываемого пакета закончился
		soc		//Обрабатываемый пакет - Start Of Cycle
	//////////////////////////////////////////////////	
	);
	
	input 					rst;
	input 					clk;
	input 		[7  :0] 	data;
	input 		[L-1:0]		adress;
	input					we;
	output reg	[63 :0]		relative_time;
	output reg				relative_time_valid;
	input 					head_done;
	input					soc;
	
	
	///////////Параметры и переменная автомата////////
	parameter idle = 0;					//Ожидание
	parameter waiting_for_time = 1;		//Ждем в пакете поле Relative time
	parameter recv_time = 2;			//Записываем поле Relative time
	reg [1:0] state;
	//////////////////////////////////////////////////
	
	always @(posedge rst, posedge clk)
		if(rst)
			begin
				state <= idle;
				relative_time <= 64'b0;
				relative_time_valid <= 1'b0;
			end
		else
			begin
				case(state)		   
					default:
						begin
							if(head_done && soc)
								begin
									state <= waiting_for_time;
								end
							else
								begin
									state <= idle;
									relative_time <= 64'b0;
									relative_time_valid <= 1'b0;
								end
						end
					idle :
						begin
							if(head_done && soc)
								begin
									state <= waiting_for_time;
								end
							else
								begin
									state <= idle;
									relative_time <= 64'b0;
									relative_time_valid <= 1'b0;
								end
						end
					waiting_for_time :
						begin
							if(we && (adress == 36))
								begin
									relative_time <= {data,relative_time[63:8]};
									state <= recv_time;
								end
						end
					recv_time:
						begin
						   	if(we)
							   	begin
									if(adress == 43)
										begin
											relative_time <= {data,relative_time[63:8]};
											state <= idle;
											relative_time_valid <= 1;
											
										end
									else
										begin
											relative_time <= {data,relative_time[63:8]};
										end
								end
						end
					
				endcase
			end
	
	
	
	
	
endmodule