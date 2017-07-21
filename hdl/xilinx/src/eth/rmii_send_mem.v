module rmii_send_mem #(parameter L=8      //Разрядность адреса в памяти
)(
	input rst,                  //Асинхронный сброс
	input not_det,
    input clk,                  //Тактовый генератор 100 МГц
    //input rmii_clk,             //Синхронный с clk тактовый генератор 50 МГц
    input start,                //Строб запуска
    input fast_eth,             //Скорость передачи 0 - 10 Мбит/с, 1 - 100 МБит/с  
    input [L-1:0]count,         //Сколько байт из памяти надо передать  
    output reg [L-1:0]addr,     //Адрес доступа к памяти
    input [7:0]rdata,           //Данные, прочитанные из памяти
    output rm_tx_en,            //Разрешение на запись для phy
    output [1:0]rm_tx_data,     //Данные, передаваемые на phy
    output reg rdy,              //Сигнал готовности к передаче
	output reg done
);

reg [1:0]state;     //Состояния передачи
parameter st_idle       = 2'b00,
          st_read_byte  = 2'b01,
          st_start_send = 2'b11,
          st_send       = 2'b10;

//Блок передачи одного байта через RMII
reg send_byte_start;    //Строб запуска передачи одного байта
reg [7:0]send_buf;      //Байт, который надо передать
wire send_rdy;          //Передатчик байта, готов передавать
reg [L-1:0]addr_lim;    //Значение адреса при котором необходимо закончить передачу

/*rmii_send_byte
rmii_send_byte(
	.rst(rst),
	.clk(clk),
	.rmii_clk(rmii_clk),
	.start(send_byte_start),
	.fast_eth(fast_eth),
	.data(send_buf),
	.rm_tx_en(rm_tx_en),
	.rm_tx_data(rm_tx_data),
	.rdy(send_rdy)
);*/

rmii_send_byte_50_MHz rmii_send_byte (
	.rst(rst),
	.clk(clk),
	.start(send_byte_start),
	.fast_eth(fast_eth),
	.data(send_buf),
	.rm_tx_en(rm_tx_en),
	.rm_tx_data(rm_tx_data),
	.rdy(send_rdy)
);

always @(posedge rst, posedge clk)
    if(rst)
	    begin
	        state <= st_idle;
	        addr <= 0;
	        rdy <= 1;
	        send_buf <= 0;
	        send_byte_start <= 0;
	        addr_lim <= 0;
			done <= 0;
	    end 
	else
	   begin
		   if(done)
			   done <= 0;
	        if(send_rdy /*&& rmii_clk*/)
	            case(state)
	                st_idle/*0*/:        begin           //Ожидание	
	                                  addr <= 0;
	                                  if(start)
		                                  begin
		                                    addr_lim <= count + 1; //Значение адреса, по которому считается, что пакет передан (установлено экспериментально)
		                                    state <= st_send;
		                                    rdy <= 0;
										  end 
									  else
									  	  begin
									  		rdy <= 1;
										  end
									  
	                                end
	                st_send/*2*/:        begin    //Передача оставшихся байт     
	                                  if(addr == addr_lim)           //Если все передано
	                                  begin
	                                    state <= st_idle;
	                                    rdy <= 1;
										done <= 1;
	                                  end else                  //Иначе вычитываем из следующего адреса
	                                      begin
	                                        addr <= addr + 1;
	                                        send_buf <= rdata;
											send_byte_start <= 1;
											if(not_det)
												addr_lim <= count + 1;
	                                      end
	                                end
	            endcase
	        else 
				if(addr==addr_lim)    //Если все передано снимаем строб старта передачи, чтобы не иницировать в конце лишнюю передачу
	                send_byte_start <= 0;
		end

endmodule
