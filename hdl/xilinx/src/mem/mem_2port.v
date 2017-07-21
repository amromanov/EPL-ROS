//**********************"вух портовая синхронная память*******************
//Модуль синтезируется в двухпортовую синхронную память Xilinx с общим
//тактовым генератором обоих портов. Объем памяти N*2^L бит.
//
//Автор: Романов А.М.
//		 Кафедра "Проблем управления" МИРЭА(ТУ), 2011-2012 г.
//************************************************************************

module mem_2port #(parameter N=16,      //Размер ячеек
							 L=2,	    //Размер адреса
                             do_clk_b=0 //"ля порта B используется отдельный выход. 1 - раздельные клоки, 0 - обший
)(
	input clk,		    	    //Тактовый генератор входа А (и B при do_clk_b=0)
	//input rst,
//Порт А	
	input [L-1:0]addr_a,		//Адрес порта А
	input en_a,					//Разрешение на работу порта А
	input we_a,					//Разрешение на запись порта A
	input [N-1:0]w_data_a,		//"анные для записи в порт A
	output reg [N-1:0]r_data_a, //"анные прочитанные из порта А
//Порт B	
    input clk_b,                //Тактовый генератор входа B
	input [L-1:0]addr_b,		//Адрес порта B
	input en_b,					//Разрешение на работу порта B
	input we_b,					//Разрешение на запись порта B
	input [N-1:0]w_data_b,		//"анные для записи в порт B
	output reg [N-1:0]r_data_b  //"анные прочитанные из порта B	
);

parameter MaxM = (1<<L);    //Максимальный

reg [N-1:0]mem[0:MaxM-1];   //Память
integer i;

//synthesis attribute ram_style of mem is block

always @(posedge clk/*, posedge rst*/)
	/*if(rst)
		begin
			r_data_a <= 1'b0;
			for(i = 0; i < 7; i = i + 1)
				mem[i] <= 8'h55;
			mem[7] <= 8'hD5;	
			for(i = 8; i < MaxM; i = i + 1)
				mem[i] <= 1'b0;
		end
	else*/
		if(en_a)
			begin
				if(we_a)
					mem[addr_a] <= w_data_a;
				r_data_a <= mem[addr_a];		
			end

wire clk_b_in;      //Тактовый сигнал для тактирования входа B
assign clk_b_in = (do_clk_b) ? clk_b : clk;

always @(posedge clk_b_in/*, posedge rst*/)
	/*if(rst)
		begin
			r_data_b <= 1'b0;
		end
	else*/
		if(en_b)
			begin
				if(we_b)
					mem[addr_b] <= w_data_b;
				r_data_b <= mem[addr_b];		
			end

initial
begin
	$readmemh("src/mem/mem.hex",mem);
	//$readmemh("C:/FPGA/study/123/7.hex", slave_mem);
	//$readmemh("/home/and/FPGA/study/retr2/source/mem.hex",mem);
end	
	
endmodule
