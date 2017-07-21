// �������: �������� �.�. ����-01-15 ���(�����)
// �����: ������� ������ �������(�����������)
// ��������: � �������� ������������ ������� ����� ��������� � ����� �������������
// ��������� �������, ����������� ������� ���������� �������� ���������� ��������� 
// (�������������� ��� ����������� ����������� �������� � ������� ������� �������)
module pulsator #(
	parameter cnt_wide = 7, // ������ �������� ��������
	parameter count_to = 100, // ������ ������� � �����
	parameter last_neg_offset = 0 // �������� ���������� ����� � �����
	)(
	rst,
	clk,
	start, // ������������� ������ �����
	pulse, // ����������� ��������� �������, ����� '1' ���� ���� �� ������ ����� � ������ ��� ����������� ����� ������ ����� ����� start
	last   // ���� ����, ��� ���� ���������
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