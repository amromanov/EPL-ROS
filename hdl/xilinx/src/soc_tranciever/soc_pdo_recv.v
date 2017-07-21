module soc_pdo_recv #(parameter master = 0   //Параметр определяет, что должен ожидать	
)(                                                      //модуль запрос от мастера или ответ от слейва
    input rst,                     //Асинхронный сброс
    input clk,                     //Тактовый генератор
    //input rm_clk,                  //RMI Clock    
    input [1:0]rm_rx,              //RMI Rx
    input rm_crs_dv,               //RMI CRS
    output reg soc,              //Строб прихода пакета 
	output reg head_o					//head is recieved
	 //inout [35:0] control
);

wire rx_rdy;                //Строб прихода очередного байта
wire [7:0]rx_data;          //Данные из очередного байта
wire rx_busy;               //Флаг того, что идет ethernet пакет

/*rmii_recv_byte rmii_recv_byte(
	.rst(rst),
	.clk(clk),
	.rmii_clk(rm_clk),
	.fast_eth(1),
	.rm_rx_data(rm_rx),
	.rm_crs_dv(rm_crs_dv),
	.data(rx_data),
	.rdy(rx_rdy),
	.busy(rx_busy)
);*/

rmii_recv_byte_50_MHz Label1 (
	.rst(rst),
	.clk(clk),
	.fast_eth(1'b1),
	.rm_rx_data(rm_rx),
	.rm_crs_dv(rm_crs_dv),
	.data(rx_data),
	.rdy(rx_rdy),
	.busy(rx_busy)
);

reg [11:0] state_m;        //Условный номер принятого байта или st_idle (12 бит, чтобы точно переварить Ethernet пакет любого размера)
parameter st_idle = 8;     //Cостояние ожидания (для удобства выбран номер первого байта после приамбулы) 

reg [8:0]cmp_data;         //Данные, которые надо сравнить в принимаемом пакете, чтобы понять, что его надо отсеить. Единица в 9 бите означает, что этой байт сравнивать не надо
                           //Т.е. cmp_data=9'd256 обозначает 'не проверять'
always @(posedge clk, posedge rst)
    if(rst)
        cmp_data = 9'd256;
    else
    case(state_m)   //В case все номер уменьшены на 1, т.к. cmp_data обновится только на следующем такте после прихода соотвествующего значения state_m
      default  : cmp_data = 9'd256;     //Все байты не описанные ниже в case не проверяются
//--------------Ethernet пакет--------------//
            20 : cmp_data = 9'h88;      //Тип протокола - IP (0x88AB)        
            21 : cmp_data = 9'hAB;          
//--------------Powerlink пакет-------------//
            22 : 	begin                           //Тип сообщения
						cmp_data = {1'b0,/*rx_data[7],*/8'h01};	 //SoC    
					end
	  endcase
	  
	  
    parameter  last_head = 25; //Номер последнего анализируемого байта пакета. На всякий случай 
                               //выбран на 1 больше последнего байта, который нас интересует,
                               //чтобы точно все обработать
    
    reg fault;      //Служебная переменная, показывающая, что принимаемый в даннный момент пакет не корректен
    reg head;       //Служебная переменная, показывающая, что весь заголовок успешно принят    

	always @(posedge clk or posedge rst)
		if(rst)
			begin
				state_m <= st_idle; 
                fault <= 0;
                soc <= 0;
                head <= 0;
				head_o <= 0;
			end	
		else 
			begin		
              	if(soc)              //Авто сброс сигнала soc
                  	soc <= 0; 
				if(head_o)
					head_o <= 0;
			   	if(rx_busy)            //Если принимается пакет
			   		begin
                   		if(rx_rdy&(~head))
                   			begin
                      			state_m <= state_m + 1;
                      			if(~((cmp_data[7:0]==rx_data)||cmp_data[8]))  //Если байт надо проверять и он не равен тому значению, которому бы он должен был бы быть равен
									fault <= 1;                                 //Маркируем данный пакет, как битый
		                      	if(state_m==last_head)     //Если принят последний байт заголовка, то
		                        	begin
											head <= 1;
											head_o <= 1;
											if(!fault)
												soc <= 1;//выставляем флаг head и больше ничего не проверяем
									
									end
		                   	end
               end else
                   begin
                       //Возвращаем служебные переменные в начальные состояния
                       state_m <= st_idle;
                       fault   <= 0;
					   head <= 0;
                   end
            end










endmodule
