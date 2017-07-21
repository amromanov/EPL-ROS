module rmii_send_byte_50_MHz(
    input rst,              //Асинхронный сброс
    input clk,              //Тактовый генератор 50 МГц
    input start,            //Строб запуска
    input fast_eth,         //Скорость передачи 0 - 10 Мбит/с, 1 - 100 МБит/с    
    input [7:0]data,        //Данные, которые надо передать
    output reg rm_tx_en,        //Разрешение на запись для phy
    output reg [1:0]rm_tx_data, //Данные, передаваемые на phy
    output reg rdy              //Сигнал готовности к передаче
);

reg [4:0]wait_cnt;      //Счетчик ожидания для передачи со скоростью 10 Мбит/c     

reg [5:0]tx_data;       //Регистр данных ожидающих передачи
reg [1:0]bit_cnt;       //Счетчик переданных пар бит

always @(posedge rst, posedge clk)
    if(rst)
    begin
        rm_tx_data <= 0;
        rm_tx_en <= 0;
        wait_cnt <= 0;
        rdy <= 1;
        bit_cnt <= 0;
		tx_data <= 0;
    end else
        if(wait_cnt==0)
	        begin
	            if(rdy)
		            begin   
		                if(start)
			                begin
    							rm_tx_en <= 1;  //выставляем tx_en, иначе он сам выставится через такт    
	                    		{tx_data,rm_tx_data} <= data;
								bit_cnt <= 1;
	                    		rdy <= 0;
								if(!fast_eth)
		                        	wait_cnt <=9;
			                end 
						else
		                    begin               //Если команды на передачу новых данных не поступило,
		                        rm_tx_en <= 0;  //снимаем разрешение на запись
		                        rm_tx_data <= 0;
		                    end    
		            end 
				else
	                begin
                        if(rm_tx_en)
                        begin
                            {tx_data,rm_tx_data} <= {2'b00,tx_data};        //Выдвигаем в rm_tx_data новую порцию данных
                            bit_cnt <= bit_cnt + 1;
                        end
                        if(!fast_eth)
                            wait_cnt <=9;

	                    if(bit_cnt=={fast_eth,fast_eth})               //Если байт передан, то переходим в rdy
	                    begin
	                        rdy <= 1;
	                        wait_cnt <=0;                               //Если байт передан, нет смысла ждать 10 тактов, надо готовится пересылать следующий 
	                    end
	                end
	        end 
		else
        begin
            wait_cnt <= wait_cnt - 1;                               //Уменьщаем счетчик
            if(~fast_eth)
            begin
                if((wait_cnt == 1)&&(bit_cnt==0))           //Поднимаем rdy на последнем такте последнего бита предыдущего пакета, чтобы успеть подготовиться
                    rdy <= 1;                               //К приему следующего байта
            end        
        end
endmodule
