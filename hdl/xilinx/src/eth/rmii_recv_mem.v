module rmii_recv_mem #(parameter L=8      //Разрядность адреса в памяти
)(
    input rst,                  //Асинхронный сброс
    input clk,                  //Тактовый генератор 100 МГц
    //input rmii_clk,             //Синхронный с clk тактовый генератор 50 МГц
    input [L-1:0]offset,        //Адрес, начиная с которого надо писать в память
    input [1:0]rm_rx_data,      //Данные, полученные от phy
    input rm_crs_dv,            //Сигнал phy о наличия принимаемого пакета 
    input fast_eth,            //Скорость передачи, на которой был принят последний пакет 0 - 10 Мбит/с, 1 - 100 МБит/с  
    output reg [L-1:0]addr,     //Выход адреса в памяти
    output reg [7:0]wdata,      //Данные, которое надо записать в память
    output reg we,              //Разрешение на запись в память
    output reg [L-1:0]count,    //Объем принятых данных
    output reg rdy              //Флаг окончания приёма
);

//Интерфейс к PHY
wire [7:0]data;     //Байт принятый по сети
wire brdy;          //Флаг того, что байт принят
wire busy;          //Флаг того, что осуществляется приём пакета

/*rmii_recv_byte
rmii_recv_byte(
	.rst(rst),
	.clk(clk),
	.rmii_clk(rmii_clk),
	.fast_eth(fast_eth),
	.rm_rx_data(rm_rx_data),
	.rm_crs_dv(rm_crs_dv),
	.data(data),
	.rdy(brdy),
	.busy(busy)
);*/

rmii_recv_byte_50_MHz rmii_recv_byte (
	.rst(rst),
	.clk(clk),
	.fast_eth(fast_eth),
	.rm_rx_data(rm_rx_data),
	.rm_crs_dv(rm_crs_dv),
	.data(data),
	.rdy(brdy),
	.busy(busy)
);

//Сохранение данных в память
reg [L-1:0]recv_cnt;    //Счетчик принятых данных
reg s_busy;             //busy, задержанный на такт, для определения фронта

always @(posedge clk, posedge rst)
    if(rst) 
        s_busy <= 0;
    else
        s_busy <= busy;

always @(posedge clk, posedge rst)
    if(rst)
    begin
        addr <= 0;
        wdata <= 0;
        we <= 0;
        count <= 0;
        rdy <= 0;
        recv_cnt <= 0;        
    end else
        begin
            if(rdy)
                rdy <= 0;
            if(!busy)           //Если пакет не принимается, то выставляем адрес в начальное значение -1 (чтобы при приеме пакета увеличить его на 1 и начать писать сразу с правильного места)
            begin
                addr <= offset-1;
                wdata <= 0;
                we <= 0;
                recv_cnt <= 0;             
                if(s_busy)      //Если отрицательный фронт busy, то сохраняем кол-во принятых данных
                begin
                    count <= recv_cnt;  
                    rdy <= 1;
                end                
            end else
                begin
                    we <= brdy;     //Если принят байт, то пишем его в память и переходим к следующему адресу
                    if(brdy)
                    begin
                        wdata <= data;
                        addr <= addr + 1;
                        recv_cnt <= recv_cnt + 1;
                    end
                end
        end

endmodule
