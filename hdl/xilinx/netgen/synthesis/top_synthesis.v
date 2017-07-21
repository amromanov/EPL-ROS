////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: top_synthesis.v
// /___/   /\     Timestamp: Mon Nov 21 16:19:17 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim top.ngc top_synthesis.v 
// Device	: xc3s1200e-4-fg320
// Input file	: top.ngc
// Output file	: C:\FPGA\study\jitter_controller_new\imp\prj\netgen\synthesis\top_synthesis.v
// # of Modules	: 28
// Design Name	: top
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module pulsator_INST_1 (
  clk, start, rst, last, pulse
);
  input clk;
  input start;
  input rst;
  input last;
  output pulse;
  wire N01;
  wire N02;
  wire N10;
  wire N13;
  wire N14;
  wire N3;
  wire N4;
  wire N8;
  wire cnt_cmp_eq00001;
  wire pulse_mux0000;
  wire [3 : 3] Madd_cnt_share0000_cy;
  wire [6 : 0] cnt;
  wire [6 : 0] cnt_mux0000;
  FDC   cnt_0 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[6]),
    .Q(cnt[0])
  );
  FDC   cnt_1 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[5]),
    .Q(cnt[1])
  );
  FDC   cnt_2 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[4]),
    .Q(cnt[2])
  );
  FDC   cnt_3 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[3]),
    .Q(cnt[3])
  );
  FDC   cnt_4 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[2]),
    .Q(cnt[4])
  );
  FDC   cnt_5 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[1]),
    .Q(cnt[5])
  );
  FDC   cnt_6 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[0]),
    .Q(cnt[6])
  );
  FDC   pulse_2836 (
    .C(clk),
    .CLR(rst),
    .D(pulse_mux0000),
    .Q(pulse)
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  \cnt_mux0000<5>1  (
    .I0(start),
    .I1(cnt[0]),
    .I2(cnt[1]),
    .O(cnt_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \Madd_cnt_share0000_cy<3>11  (
    .I0(cnt[2]),
    .I1(cnt[3]),
    .I2(cnt[0]),
    .I3(cnt[1]),
    .O(Madd_cnt_share0000_cy[3])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \cnt_mux0000<6>_SW0  (
    .I0(last),
    .I1(cnt[1]),
    .O(N02)
  );
  LUT4 #(
    .INIT ( 16'hFF23 ))
  \cnt_mux0000<6>  (
    .I0(N02),
    .I1(cnt[0]),
    .I2(N3),
    .I3(start),
    .O(cnt_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  pulse_mux00001 (
    .I0(start),
    .I1(N01),
    .O(pulse_mux0000)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \cnt_mux0000<0>21  (
    .I0(start),
    .I1(N14),
    .O(N4)
  );
  LUT4 #(
    .INIT ( 16'h6A00 ))
  \cnt_mux0000<4>1  (
    .I0(cnt[2]),
    .I1(cnt[1]),
    .I2(cnt[0]),
    .I3(N4),
    .O(cnt_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'h6A00 ))
  \cnt_mux0000<1>1  (
    .I0(cnt[5]),
    .I1(cnt[4]),
    .I2(Madd_cnt_share0000_cy[3]),
    .I3(N4),
    .O(cnt_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \cnt_mux0000<3>_SW1  (
    .I0(cnt[0]),
    .I1(cnt[1]),
    .I2(cnt[2]),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h0802 ))
  \cnt_mux0000<3>  (
    .I0(N01),
    .I1(cnt[3]),
    .I2(start),
    .I3(N8),
    .O(cnt_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \cnt_mux0000<0>_SW1  (
    .I0(Madd_cnt_share0000_cy[3]),
    .I1(cnt[4]),
    .I2(cnt[5]),
    .O(N10)
  );
  LUT4 #(
    .INIT ( 16'h0802 ))
  \cnt_mux0000<0>  (
    .I0(N01),
    .I1(cnt[6]),
    .I2(start),
    .I3(N10),
    .O(cnt_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'h0028 ))
  \cnt_mux0000<2>1  (
    .I0(N01),
    .I1(cnt[4]),
    .I2(Madd_cnt_share0000_cy[3]),
    .I3(start),
    .O(cnt_mux0000[2])
  );
  GND   XST_GND (
    .G(N13)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  cnt_cmp_eq000011 (
    .I0(cnt[2]),
    .I1(cnt[4]),
    .I2(cnt[5]),
    .I3(cnt[3]),
    .O(cnt_cmp_eq00001)
  );
  MUXF5   cnt_cmp_eq00001_f5 (
    .I0(N13),
    .I1(cnt_cmp_eq00001),
    .S(cnt[6]),
    .O(N3)
  );
  LUT4_D #(
    .INIT ( 16'hBDFF ))
  \cnt_mux0000<0>11  (
    .I0(last),
    .I1(cnt[1]),
    .I2(cnt[0]),
    .I3(N3),
    .LO(N14),
    .O(N01)
  );
endmodule

module counter_INST_1 (
  clk, start, rst, count_done, count
);
  input clk;
  input start;
  input rst;
  output count_done;
  input [31 : 0] count;
  wire Mcount_cnt;
  wire Mcount_cnt1;
  wire Mcount_cnt10;
  wire Mcount_cnt11;
  wire Mcount_cnt12;
  wire Mcount_cnt13;
  wire Mcount_cnt14;
  wire Mcount_cnt15;
  wire Mcount_cnt16;
  wire Mcount_cnt17;
  wire Mcount_cnt18;
  wire Mcount_cnt19;
  wire Mcount_cnt2;
  wire Mcount_cnt20;
  wire Mcount_cnt21;
  wire Mcount_cnt22;
  wire Mcount_cnt23;
  wire Mcount_cnt24;
  wire Mcount_cnt25;
  wire Mcount_cnt26;
  wire Mcount_cnt27;
  wire Mcount_cnt28;
  wire Mcount_cnt29;
  wire Mcount_cnt3;
  wire Mcount_cnt30;
  wire Mcount_cnt31;
  wire Mcount_cnt4;
  wire Mcount_cnt5;
  wire Mcount_cnt6;
  wire Mcount_cnt7;
  wire Mcount_cnt8;
  wire Mcount_cnt9;
  wire \Msub_count_to_minus_one_sub0000_cy<0>_rt_2484 ;
  wire N0;
  wire N01;
  wire N1;
  wire cnt_en_2582;
  wire cnt_en_not0001;
  wire cnt_not0001;
  wire count_done_mux0000;
  wire count_done_not0001;
  wire last_2716;
  wire last_and0000_2717;
  wire last_mux0000;
  wire pulse;
  wire start_inv;
  wire [15 : 0] Mcompar_cnt_cmp_eq0000_cy;
  wire [15 : 0] Mcompar_cnt_cmp_eq0000_lut;
  wire [15 : 0] Mcompar_last_cmp_ne0000_cy;
  wire [15 : 0] Mcompar_last_cmp_ne0000_lut;
  wire [30 : 0] Mcount_cnt_cy;
  wire [31 : 0] Mcount_cnt_lut;
  wire [30 : 0] Msub_count_to_minus_one_sub0000_cy;
  wire [31 : 1] Msub_count_to_minus_one_sub0000_lut;
  wire [31 : 0] cnt;
  wire [31 : 0] count_to;
  wire [31 : 0] count_to_minus_one;
  wire [31 : 0] count_to_minus_one_sub0000;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   cnt_en (
    .C(clk),
    .CE(cnt_en_not0001),
    .CLR(rst),
    .D(start),
    .Q(cnt_en_2582)
  );
  FDCE   count_to_0 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[0]),
    .Q(count_to[0])
  );
  FDCE   count_to_1 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[1]),
    .Q(count_to[1])
  );
  FDCE   count_to_2 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[2]),
    .Q(count_to[2])
  );
  FDCE   count_to_3 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[3]),
    .Q(count_to[3])
  );
  FDCE   count_to_4 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[4]),
    .Q(count_to[4])
  );
  FDCE   count_to_5 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[5]),
    .Q(count_to[5])
  );
  FDCE   count_to_6 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[6]),
    .Q(count_to[6])
  );
  FDCE   count_to_7 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[7]),
    .Q(count_to[7])
  );
  FDCE   count_to_8 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[8]),
    .Q(count_to[8])
  );
  FDCE   count_to_9 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[9]),
    .Q(count_to[9])
  );
  FDCE   count_to_10 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[10]),
    .Q(count_to[10])
  );
  FDCE   count_to_11 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[11]),
    .Q(count_to[11])
  );
  FDCE   count_to_12 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[12]),
    .Q(count_to[12])
  );
  FDCE   count_to_13 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[13]),
    .Q(count_to[13])
  );
  FDCE   count_to_14 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[14]),
    .Q(count_to[14])
  );
  FDCE   count_to_15 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[15]),
    .Q(count_to[15])
  );
  FDCE   count_to_16 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[16]),
    .Q(count_to[16])
  );
  FDCE   count_to_17 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[17]),
    .Q(count_to[17])
  );
  FDCE   count_to_18 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[18]),
    .Q(count_to[18])
  );
  FDCE   count_to_19 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[19]),
    .Q(count_to[19])
  );
  FDCE   count_to_20 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[20]),
    .Q(count_to[20])
  );
  FDCE   count_to_21 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[21]),
    .Q(count_to[21])
  );
  FDCE   count_to_22 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[22]),
    .Q(count_to[22])
  );
  FDCE   count_to_23 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[23]),
    .Q(count_to[23])
  );
  FDCE   count_to_24 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[24]),
    .Q(count_to[24])
  );
  FDCE   count_to_25 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[25]),
    .Q(count_to[25])
  );
  FDCE   count_to_26 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[26]),
    .Q(count_to[26])
  );
  FDCE   count_to_27 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[27]),
    .Q(count_to[27])
  );
  FDCE   count_to_28 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[28]),
    .Q(count_to[28])
  );
  FDCE   count_to_29 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[29]),
    .Q(count_to[29])
  );
  FDCE   count_to_30 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[30]),
    .Q(count_to[30])
  );
  FDCE   count_to_31 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[31]),
    .Q(count_to[31])
  );
  FDCE   count_done_2540 (
    .C(clk),
    .CE(count_done_not0001),
    .CLR(rst),
    .D(count_done_mux0000),
    .Q(count_done)
  );
  FDE   last (
    .C(clk),
    .CE(last_and0000_2717),
    .D(last_mux0000),
    .Q(last_2716)
  );
  FDC   count_to_minus_one_0 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[0]),
    .Q(count_to_minus_one[0])
  );
  FDC   count_to_minus_one_1 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[1]),
    .Q(count_to_minus_one[1])
  );
  FDC   count_to_minus_one_2 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[2]),
    .Q(count_to_minus_one[2])
  );
  FDC   count_to_minus_one_3 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[3]),
    .Q(count_to_minus_one[3])
  );
  FDC   count_to_minus_one_4 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[4]),
    .Q(count_to_minus_one[4])
  );
  FDC   count_to_minus_one_5 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[5]),
    .Q(count_to_minus_one[5])
  );
  FDC   count_to_minus_one_6 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[6]),
    .Q(count_to_minus_one[6])
  );
  FDC   count_to_minus_one_7 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[7]),
    .Q(count_to_minus_one[7])
  );
  FDC   count_to_minus_one_8 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[8]),
    .Q(count_to_minus_one[8])
  );
  FDC   count_to_minus_one_9 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[9]),
    .Q(count_to_minus_one[9])
  );
  FDC   count_to_minus_one_10 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[10]),
    .Q(count_to_minus_one[10])
  );
  FDC   count_to_minus_one_11 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[11]),
    .Q(count_to_minus_one[11])
  );
  FDC   count_to_minus_one_12 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[12]),
    .Q(count_to_minus_one[12])
  );
  FDC   count_to_minus_one_13 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[13]),
    .Q(count_to_minus_one[13])
  );
  FDC   count_to_minus_one_14 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[14]),
    .Q(count_to_minus_one[14])
  );
  FDC   count_to_minus_one_15 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[15]),
    .Q(count_to_minus_one[15])
  );
  FDC   count_to_minus_one_16 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[16]),
    .Q(count_to_minus_one[16])
  );
  FDC   count_to_minus_one_17 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[17]),
    .Q(count_to_minus_one[17])
  );
  FDC   count_to_minus_one_18 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[18]),
    .Q(count_to_minus_one[18])
  );
  FDC   count_to_minus_one_19 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[19]),
    .Q(count_to_minus_one[19])
  );
  FDC   count_to_minus_one_20 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[20]),
    .Q(count_to_minus_one[20])
  );
  FDC   count_to_minus_one_21 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[21]),
    .Q(count_to_minus_one[21])
  );
  FDC   count_to_minus_one_22 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[22]),
    .Q(count_to_minus_one[22])
  );
  FDC   count_to_minus_one_23 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[23]),
    .Q(count_to_minus_one[23])
  );
  FDC   count_to_minus_one_24 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[24]),
    .Q(count_to_minus_one[24])
  );
  FDC   count_to_minus_one_25 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[25]),
    .Q(count_to_minus_one[25])
  );
  FDC   count_to_minus_one_26 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[26]),
    .Q(count_to_minus_one[26])
  );
  FDC   count_to_minus_one_27 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[27]),
    .Q(count_to_minus_one[27])
  );
  FDC   count_to_minus_one_28 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[28]),
    .Q(count_to_minus_one[28])
  );
  FDC   count_to_minus_one_29 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[29]),
    .Q(count_to_minus_one[29])
  );
  FDC   count_to_minus_one_30 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[30]),
    .Q(count_to_minus_one[30])
  );
  FDC   count_to_minus_one_31 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[31]),
    .Q(count_to_minus_one[31])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<0>  (
    .I0(start),
    .I1(cnt[0]),
    .I2(N0),
    .O(Mcount_cnt_lut[0])
  );
  MUXCY   \Mcount_cnt_cy<0>  (
    .CI(start_inv),
    .DI(N0),
    .S(Mcount_cnt_lut[0]),
    .O(Mcount_cnt_cy[0])
  );
  XORCY   \Mcount_cnt_xor<0>  (
    .CI(start_inv),
    .LI(Mcount_cnt_lut[0]),
    .O(Mcount_cnt)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<1>  (
    .I0(start),
    .I1(cnt[1]),
    .I2(N0),
    .O(Mcount_cnt_lut[1])
  );
  MUXCY   \Mcount_cnt_cy<1>  (
    .CI(Mcount_cnt_cy[0]),
    .DI(N0),
    .S(Mcount_cnt_lut[1]),
    .O(Mcount_cnt_cy[1])
  );
  XORCY   \Mcount_cnt_xor<1>  (
    .CI(Mcount_cnt_cy[0]),
    .LI(Mcount_cnt_lut[1]),
    .O(Mcount_cnt1)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<2>  (
    .I0(start),
    .I1(cnt[2]),
    .I2(N0),
    .O(Mcount_cnt_lut[2])
  );
  MUXCY   \Mcount_cnt_cy<2>  (
    .CI(Mcount_cnt_cy[1]),
    .DI(N0),
    .S(Mcount_cnt_lut[2]),
    .O(Mcount_cnt_cy[2])
  );
  XORCY   \Mcount_cnt_xor<2>  (
    .CI(Mcount_cnt_cy[1]),
    .LI(Mcount_cnt_lut[2]),
    .O(Mcount_cnt2)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<3>  (
    .I0(start),
    .I1(cnt[3]),
    .I2(N0),
    .O(Mcount_cnt_lut[3])
  );
  MUXCY   \Mcount_cnt_cy<3>  (
    .CI(Mcount_cnt_cy[2]),
    .DI(N0),
    .S(Mcount_cnt_lut[3]),
    .O(Mcount_cnt_cy[3])
  );
  XORCY   \Mcount_cnt_xor<3>  (
    .CI(Mcount_cnt_cy[2]),
    .LI(Mcount_cnt_lut[3]),
    .O(Mcount_cnt3)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<4>  (
    .I0(start),
    .I1(cnt[4]),
    .I2(N0),
    .O(Mcount_cnt_lut[4])
  );
  MUXCY   \Mcount_cnt_cy<4>  (
    .CI(Mcount_cnt_cy[3]),
    .DI(N0),
    .S(Mcount_cnt_lut[4]),
    .O(Mcount_cnt_cy[4])
  );
  XORCY   \Mcount_cnt_xor<4>  (
    .CI(Mcount_cnt_cy[3]),
    .LI(Mcount_cnt_lut[4]),
    .O(Mcount_cnt4)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<5>  (
    .I0(start),
    .I1(cnt[5]),
    .I2(N0),
    .O(Mcount_cnt_lut[5])
  );
  MUXCY   \Mcount_cnt_cy<5>  (
    .CI(Mcount_cnt_cy[4]),
    .DI(N0),
    .S(Mcount_cnt_lut[5]),
    .O(Mcount_cnt_cy[5])
  );
  XORCY   \Mcount_cnt_xor<5>  (
    .CI(Mcount_cnt_cy[4]),
    .LI(Mcount_cnt_lut[5]),
    .O(Mcount_cnt5)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<6>  (
    .I0(start),
    .I1(cnt[6]),
    .I2(N0),
    .O(Mcount_cnt_lut[6])
  );
  MUXCY   \Mcount_cnt_cy<6>  (
    .CI(Mcount_cnt_cy[5]),
    .DI(N0),
    .S(Mcount_cnt_lut[6]),
    .O(Mcount_cnt_cy[6])
  );
  XORCY   \Mcount_cnt_xor<6>  (
    .CI(Mcount_cnt_cy[5]),
    .LI(Mcount_cnt_lut[6]),
    .O(Mcount_cnt6)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<7>  (
    .I0(start),
    .I1(cnt[7]),
    .I2(N0),
    .O(Mcount_cnt_lut[7])
  );
  MUXCY   \Mcount_cnt_cy<7>  (
    .CI(Mcount_cnt_cy[6]),
    .DI(N0),
    .S(Mcount_cnt_lut[7]),
    .O(Mcount_cnt_cy[7])
  );
  XORCY   \Mcount_cnt_xor<7>  (
    .CI(Mcount_cnt_cy[6]),
    .LI(Mcount_cnt_lut[7]),
    .O(Mcount_cnt7)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<8>  (
    .I0(start),
    .I1(cnt[8]),
    .I2(N0),
    .O(Mcount_cnt_lut[8])
  );
  MUXCY   \Mcount_cnt_cy<8>  (
    .CI(Mcount_cnt_cy[7]),
    .DI(N0),
    .S(Mcount_cnt_lut[8]),
    .O(Mcount_cnt_cy[8])
  );
  XORCY   \Mcount_cnt_xor<8>  (
    .CI(Mcount_cnt_cy[7]),
    .LI(Mcount_cnt_lut[8]),
    .O(Mcount_cnt8)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<9>  (
    .I0(start),
    .I1(cnt[9]),
    .I2(N0),
    .O(Mcount_cnt_lut[9])
  );
  MUXCY   \Mcount_cnt_cy<9>  (
    .CI(Mcount_cnt_cy[8]),
    .DI(N0),
    .S(Mcount_cnt_lut[9]),
    .O(Mcount_cnt_cy[9])
  );
  XORCY   \Mcount_cnt_xor<9>  (
    .CI(Mcount_cnt_cy[8]),
    .LI(Mcount_cnt_lut[9]),
    .O(Mcount_cnt9)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<10>  (
    .I0(start),
    .I1(cnt[10]),
    .I2(N0),
    .O(Mcount_cnt_lut[10])
  );
  MUXCY   \Mcount_cnt_cy<10>  (
    .CI(Mcount_cnt_cy[9]),
    .DI(N0),
    .S(Mcount_cnt_lut[10]),
    .O(Mcount_cnt_cy[10])
  );
  XORCY   \Mcount_cnt_xor<10>  (
    .CI(Mcount_cnt_cy[9]),
    .LI(Mcount_cnt_lut[10]),
    .O(Mcount_cnt10)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<11>  (
    .I0(start),
    .I1(cnt[11]),
    .I2(N0),
    .O(Mcount_cnt_lut[11])
  );
  MUXCY   \Mcount_cnt_cy<11>  (
    .CI(Mcount_cnt_cy[10]),
    .DI(N0),
    .S(Mcount_cnt_lut[11]),
    .O(Mcount_cnt_cy[11])
  );
  XORCY   \Mcount_cnt_xor<11>  (
    .CI(Mcount_cnt_cy[10]),
    .LI(Mcount_cnt_lut[11]),
    .O(Mcount_cnt11)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<12>  (
    .I0(start),
    .I1(cnt[12]),
    .I2(N0),
    .O(Mcount_cnt_lut[12])
  );
  MUXCY   \Mcount_cnt_cy<12>  (
    .CI(Mcount_cnt_cy[11]),
    .DI(N0),
    .S(Mcount_cnt_lut[12]),
    .O(Mcount_cnt_cy[12])
  );
  XORCY   \Mcount_cnt_xor<12>  (
    .CI(Mcount_cnt_cy[11]),
    .LI(Mcount_cnt_lut[12]),
    .O(Mcount_cnt12)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<13>  (
    .I0(start),
    .I1(cnt[13]),
    .I2(N0),
    .O(Mcount_cnt_lut[13])
  );
  MUXCY   \Mcount_cnt_cy<13>  (
    .CI(Mcount_cnt_cy[12]),
    .DI(N0),
    .S(Mcount_cnt_lut[13]),
    .O(Mcount_cnt_cy[13])
  );
  XORCY   \Mcount_cnt_xor<13>  (
    .CI(Mcount_cnt_cy[12]),
    .LI(Mcount_cnt_lut[13]),
    .O(Mcount_cnt13)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<14>  (
    .I0(start),
    .I1(cnt[14]),
    .I2(N0),
    .O(Mcount_cnt_lut[14])
  );
  MUXCY   \Mcount_cnt_cy<14>  (
    .CI(Mcount_cnt_cy[13]),
    .DI(N0),
    .S(Mcount_cnt_lut[14]),
    .O(Mcount_cnt_cy[14])
  );
  XORCY   \Mcount_cnt_xor<14>  (
    .CI(Mcount_cnt_cy[13]),
    .LI(Mcount_cnt_lut[14]),
    .O(Mcount_cnt14)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<15>  (
    .I0(start),
    .I1(cnt[15]),
    .I2(N0),
    .O(Mcount_cnt_lut[15])
  );
  MUXCY   \Mcount_cnt_cy<15>  (
    .CI(Mcount_cnt_cy[14]),
    .DI(N0),
    .S(Mcount_cnt_lut[15]),
    .O(Mcount_cnt_cy[15])
  );
  XORCY   \Mcount_cnt_xor<15>  (
    .CI(Mcount_cnt_cy[14]),
    .LI(Mcount_cnt_lut[15]),
    .O(Mcount_cnt15)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<16>  (
    .I0(start),
    .I1(cnt[16]),
    .I2(N0),
    .O(Mcount_cnt_lut[16])
  );
  MUXCY   \Mcount_cnt_cy<16>  (
    .CI(Mcount_cnt_cy[15]),
    .DI(N0),
    .S(Mcount_cnt_lut[16]),
    .O(Mcount_cnt_cy[16])
  );
  XORCY   \Mcount_cnt_xor<16>  (
    .CI(Mcount_cnt_cy[15]),
    .LI(Mcount_cnt_lut[16]),
    .O(Mcount_cnt16)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<17>  (
    .I0(start),
    .I1(cnt[17]),
    .I2(N0),
    .O(Mcount_cnt_lut[17])
  );
  MUXCY   \Mcount_cnt_cy<17>  (
    .CI(Mcount_cnt_cy[16]),
    .DI(N0),
    .S(Mcount_cnt_lut[17]),
    .O(Mcount_cnt_cy[17])
  );
  XORCY   \Mcount_cnt_xor<17>  (
    .CI(Mcount_cnt_cy[16]),
    .LI(Mcount_cnt_lut[17]),
    .O(Mcount_cnt17)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<18>  (
    .I0(start),
    .I1(cnt[18]),
    .I2(N0),
    .O(Mcount_cnt_lut[18])
  );
  MUXCY   \Mcount_cnt_cy<18>  (
    .CI(Mcount_cnt_cy[17]),
    .DI(N0),
    .S(Mcount_cnt_lut[18]),
    .O(Mcount_cnt_cy[18])
  );
  XORCY   \Mcount_cnt_xor<18>  (
    .CI(Mcount_cnt_cy[17]),
    .LI(Mcount_cnt_lut[18]),
    .O(Mcount_cnt18)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<19>  (
    .I0(start),
    .I1(cnt[19]),
    .I2(N0),
    .O(Mcount_cnt_lut[19])
  );
  MUXCY   \Mcount_cnt_cy<19>  (
    .CI(Mcount_cnt_cy[18]),
    .DI(N0),
    .S(Mcount_cnt_lut[19]),
    .O(Mcount_cnt_cy[19])
  );
  XORCY   \Mcount_cnt_xor<19>  (
    .CI(Mcount_cnt_cy[18]),
    .LI(Mcount_cnt_lut[19]),
    .O(Mcount_cnt19)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<20>  (
    .I0(start),
    .I1(cnt[20]),
    .I2(N0),
    .O(Mcount_cnt_lut[20])
  );
  MUXCY   \Mcount_cnt_cy<20>  (
    .CI(Mcount_cnt_cy[19]),
    .DI(N0),
    .S(Mcount_cnt_lut[20]),
    .O(Mcount_cnt_cy[20])
  );
  XORCY   \Mcount_cnt_xor<20>  (
    .CI(Mcount_cnt_cy[19]),
    .LI(Mcount_cnt_lut[20]),
    .O(Mcount_cnt20)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<21>  (
    .I0(start),
    .I1(cnt[21]),
    .I2(N0),
    .O(Mcount_cnt_lut[21])
  );
  MUXCY   \Mcount_cnt_cy<21>  (
    .CI(Mcount_cnt_cy[20]),
    .DI(N0),
    .S(Mcount_cnt_lut[21]),
    .O(Mcount_cnt_cy[21])
  );
  XORCY   \Mcount_cnt_xor<21>  (
    .CI(Mcount_cnt_cy[20]),
    .LI(Mcount_cnt_lut[21]),
    .O(Mcount_cnt21)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<22>  (
    .I0(start),
    .I1(cnt[22]),
    .I2(N0),
    .O(Mcount_cnt_lut[22])
  );
  MUXCY   \Mcount_cnt_cy<22>  (
    .CI(Mcount_cnt_cy[21]),
    .DI(N0),
    .S(Mcount_cnt_lut[22]),
    .O(Mcount_cnt_cy[22])
  );
  XORCY   \Mcount_cnt_xor<22>  (
    .CI(Mcount_cnt_cy[21]),
    .LI(Mcount_cnt_lut[22]),
    .O(Mcount_cnt22)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<23>  (
    .I0(start),
    .I1(cnt[23]),
    .I2(N0),
    .O(Mcount_cnt_lut[23])
  );
  MUXCY   \Mcount_cnt_cy<23>  (
    .CI(Mcount_cnt_cy[22]),
    .DI(N0),
    .S(Mcount_cnt_lut[23]),
    .O(Mcount_cnt_cy[23])
  );
  XORCY   \Mcount_cnt_xor<23>  (
    .CI(Mcount_cnt_cy[22]),
    .LI(Mcount_cnt_lut[23]),
    .O(Mcount_cnt23)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<24>  (
    .I0(start),
    .I1(cnt[24]),
    .I2(N0),
    .O(Mcount_cnt_lut[24])
  );
  MUXCY   \Mcount_cnt_cy<24>  (
    .CI(Mcount_cnt_cy[23]),
    .DI(N0),
    .S(Mcount_cnt_lut[24]),
    .O(Mcount_cnt_cy[24])
  );
  XORCY   \Mcount_cnt_xor<24>  (
    .CI(Mcount_cnt_cy[23]),
    .LI(Mcount_cnt_lut[24]),
    .O(Mcount_cnt24)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<25>  (
    .I0(start),
    .I1(cnt[25]),
    .I2(N0),
    .O(Mcount_cnt_lut[25])
  );
  MUXCY   \Mcount_cnt_cy<25>  (
    .CI(Mcount_cnt_cy[24]),
    .DI(N0),
    .S(Mcount_cnt_lut[25]),
    .O(Mcount_cnt_cy[25])
  );
  XORCY   \Mcount_cnt_xor<25>  (
    .CI(Mcount_cnt_cy[24]),
    .LI(Mcount_cnt_lut[25]),
    .O(Mcount_cnt25)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<26>  (
    .I0(start),
    .I1(cnt[26]),
    .I2(N0),
    .O(Mcount_cnt_lut[26])
  );
  MUXCY   \Mcount_cnt_cy<26>  (
    .CI(Mcount_cnt_cy[25]),
    .DI(N0),
    .S(Mcount_cnt_lut[26]),
    .O(Mcount_cnt_cy[26])
  );
  XORCY   \Mcount_cnt_xor<26>  (
    .CI(Mcount_cnt_cy[25]),
    .LI(Mcount_cnt_lut[26]),
    .O(Mcount_cnt26)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<27>  (
    .I0(start),
    .I1(cnt[27]),
    .I2(N0),
    .O(Mcount_cnt_lut[27])
  );
  MUXCY   \Mcount_cnt_cy<27>  (
    .CI(Mcount_cnt_cy[26]),
    .DI(N0),
    .S(Mcount_cnt_lut[27]),
    .O(Mcount_cnt_cy[27])
  );
  XORCY   \Mcount_cnt_xor<27>  (
    .CI(Mcount_cnt_cy[26]),
    .LI(Mcount_cnt_lut[27]),
    .O(Mcount_cnt27)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<28>  (
    .I0(start),
    .I1(cnt[28]),
    .I2(N0),
    .O(Mcount_cnt_lut[28])
  );
  MUXCY   \Mcount_cnt_cy<28>  (
    .CI(Mcount_cnt_cy[27]),
    .DI(N0),
    .S(Mcount_cnt_lut[28]),
    .O(Mcount_cnt_cy[28])
  );
  XORCY   \Mcount_cnt_xor<28>  (
    .CI(Mcount_cnt_cy[27]),
    .LI(Mcount_cnt_lut[28]),
    .O(Mcount_cnt28)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<29>  (
    .I0(start),
    .I1(cnt[29]),
    .I2(N0),
    .O(Mcount_cnt_lut[29])
  );
  MUXCY   \Mcount_cnt_cy<29>  (
    .CI(Mcount_cnt_cy[28]),
    .DI(N0),
    .S(Mcount_cnt_lut[29]),
    .O(Mcount_cnt_cy[29])
  );
  XORCY   \Mcount_cnt_xor<29>  (
    .CI(Mcount_cnt_cy[28]),
    .LI(Mcount_cnt_lut[29]),
    .O(Mcount_cnt29)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<30>  (
    .I0(start),
    .I1(cnt[30]),
    .I2(N0),
    .O(Mcount_cnt_lut[30])
  );
  MUXCY   \Mcount_cnt_cy<30>  (
    .CI(Mcount_cnt_cy[29]),
    .DI(N0),
    .S(Mcount_cnt_lut[30]),
    .O(Mcount_cnt_cy[30])
  );
  XORCY   \Mcount_cnt_xor<30>  (
    .CI(Mcount_cnt_cy[29]),
    .LI(Mcount_cnt_lut[30]),
    .O(Mcount_cnt30)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<31>  (
    .I0(start),
    .I1(cnt[31]),
    .I2(N0),
    .O(Mcount_cnt_lut[31])
  );
  XORCY   \Mcount_cnt_xor<31>  (
    .CI(Mcount_cnt_cy[30]),
    .LI(Mcount_cnt_lut[31]),
    .O(Mcount_cnt31)
  );
  FDCE   cnt_0 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt),
    .Q(cnt[0])
  );
  FDCE   cnt_1 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt1),
    .Q(cnt[1])
  );
  FDCE   cnt_2 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt2),
    .Q(cnt[2])
  );
  FDCE   cnt_3 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt3),
    .Q(cnt[3])
  );
  FDCE   cnt_4 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt4),
    .Q(cnt[4])
  );
  FDCE   cnt_5 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt5),
    .Q(cnt[5])
  );
  FDCE   cnt_6 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt6),
    .Q(cnt[6])
  );
  FDCE   cnt_7 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt7),
    .Q(cnt[7])
  );
  FDCE   cnt_8 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt8),
    .Q(cnt[8])
  );
  FDCE   cnt_9 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt9),
    .Q(cnt[9])
  );
  FDCE   cnt_10 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt10),
    .Q(cnt[10])
  );
  FDCE   cnt_11 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt11),
    .Q(cnt[11])
  );
  FDCE   cnt_12 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt12),
    .Q(cnt[12])
  );
  FDCE   cnt_13 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt13),
    .Q(cnt[13])
  );
  FDCE   cnt_14 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt14),
    .Q(cnt[14])
  );
  FDCE   cnt_15 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt15),
    .Q(cnt[15])
  );
  FDCE   cnt_16 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt16),
    .Q(cnt[16])
  );
  FDCE   cnt_17 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt17),
    .Q(cnt[17])
  );
  FDCE   cnt_18 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt18),
    .Q(cnt[18])
  );
  FDCE   cnt_19 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt19),
    .Q(cnt[19])
  );
  FDCE   cnt_20 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt20),
    .Q(cnt[20])
  );
  FDCE   cnt_21 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt21),
    .Q(cnt[21])
  );
  FDCE   cnt_22 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt22),
    .Q(cnt[22])
  );
  FDCE   cnt_23 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt23),
    .Q(cnt[23])
  );
  FDCE   cnt_24 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt24),
    .Q(cnt[24])
  );
  FDCE   cnt_25 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt25),
    .Q(cnt[25])
  );
  FDCE   cnt_26 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt26),
    .Q(cnt[26])
  );
  FDCE   cnt_27 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt27),
    .Q(cnt[27])
  );
  FDCE   cnt_28 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt28),
    .Q(cnt[28])
  );
  FDCE   cnt_29 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt29),
    .Q(cnt[29])
  );
  FDCE   cnt_30 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt30),
    .Q(cnt[30])
  );
  FDCE   cnt_31 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt31),
    .Q(cnt[31])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(\Msub_count_to_minus_one_sub0000_cy<0>_rt_2484 ),
    .O(Msub_count_to_minus_one_sub0000_cy[0])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<0>  (
    .CI(N1),
    .LI(\Msub_count_to_minus_one_sub0000_cy<0>_rt_2484 ),
    .O(count_to_minus_one_sub0000[0])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<1>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[0]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[1]),
    .O(Msub_count_to_minus_one_sub0000_cy[1])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<1>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[0]),
    .LI(Msub_count_to_minus_one_sub0000_lut[1]),
    .O(count_to_minus_one_sub0000[1])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<2>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[1]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[2]),
    .O(Msub_count_to_minus_one_sub0000_cy[2])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<2>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[1]),
    .LI(Msub_count_to_minus_one_sub0000_lut[2]),
    .O(count_to_minus_one_sub0000[2])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<3>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[2]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[3]),
    .O(Msub_count_to_minus_one_sub0000_cy[3])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<3>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[2]),
    .LI(Msub_count_to_minus_one_sub0000_lut[3]),
    .O(count_to_minus_one_sub0000[3])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<4>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[3]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[4]),
    .O(Msub_count_to_minus_one_sub0000_cy[4])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<4>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[3]),
    .LI(Msub_count_to_minus_one_sub0000_lut[4]),
    .O(count_to_minus_one_sub0000[4])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<5>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[4]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[5]),
    .O(Msub_count_to_minus_one_sub0000_cy[5])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<5>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[4]),
    .LI(Msub_count_to_minus_one_sub0000_lut[5]),
    .O(count_to_minus_one_sub0000[5])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<6>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[5]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[6]),
    .O(Msub_count_to_minus_one_sub0000_cy[6])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<6>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[5]),
    .LI(Msub_count_to_minus_one_sub0000_lut[6]),
    .O(count_to_minus_one_sub0000[6])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<7>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[6]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[7]),
    .O(Msub_count_to_minus_one_sub0000_cy[7])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<7>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[6]),
    .LI(Msub_count_to_minus_one_sub0000_lut[7]),
    .O(count_to_minus_one_sub0000[7])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<8>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[7]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[8]),
    .O(Msub_count_to_minus_one_sub0000_cy[8])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<8>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[7]),
    .LI(Msub_count_to_minus_one_sub0000_lut[8]),
    .O(count_to_minus_one_sub0000[8])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<9>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[8]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[9]),
    .O(Msub_count_to_minus_one_sub0000_cy[9])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<9>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[8]),
    .LI(Msub_count_to_minus_one_sub0000_lut[9]),
    .O(count_to_minus_one_sub0000[9])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<10>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[9]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[10]),
    .O(Msub_count_to_minus_one_sub0000_cy[10])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<10>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[9]),
    .LI(Msub_count_to_minus_one_sub0000_lut[10]),
    .O(count_to_minus_one_sub0000[10])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<11>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[10]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[11]),
    .O(Msub_count_to_minus_one_sub0000_cy[11])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<11>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[10]),
    .LI(Msub_count_to_minus_one_sub0000_lut[11]),
    .O(count_to_minus_one_sub0000[11])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<12>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[11]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[12]),
    .O(Msub_count_to_minus_one_sub0000_cy[12])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<12>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[11]),
    .LI(Msub_count_to_minus_one_sub0000_lut[12]),
    .O(count_to_minus_one_sub0000[12])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<13>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[12]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[13]),
    .O(Msub_count_to_minus_one_sub0000_cy[13])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<13>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[12]),
    .LI(Msub_count_to_minus_one_sub0000_lut[13]),
    .O(count_to_minus_one_sub0000[13])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<14>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[13]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[14]),
    .O(Msub_count_to_minus_one_sub0000_cy[14])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<14>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[13]),
    .LI(Msub_count_to_minus_one_sub0000_lut[14]),
    .O(count_to_minus_one_sub0000[14])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<15>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[14]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[15]),
    .O(Msub_count_to_minus_one_sub0000_cy[15])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<15>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[14]),
    .LI(Msub_count_to_minus_one_sub0000_lut[15]),
    .O(count_to_minus_one_sub0000[15])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<16>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[15]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[16]),
    .O(Msub_count_to_minus_one_sub0000_cy[16])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<16>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[15]),
    .LI(Msub_count_to_minus_one_sub0000_lut[16]),
    .O(count_to_minus_one_sub0000[16])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<17>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[16]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[17]),
    .O(Msub_count_to_minus_one_sub0000_cy[17])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<17>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[16]),
    .LI(Msub_count_to_minus_one_sub0000_lut[17]),
    .O(count_to_minus_one_sub0000[17])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<18>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[17]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[18]),
    .O(Msub_count_to_minus_one_sub0000_cy[18])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<18>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[17]),
    .LI(Msub_count_to_minus_one_sub0000_lut[18]),
    .O(count_to_minus_one_sub0000[18])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<19>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[18]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[19]),
    .O(Msub_count_to_minus_one_sub0000_cy[19])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<19>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[18]),
    .LI(Msub_count_to_minus_one_sub0000_lut[19]),
    .O(count_to_minus_one_sub0000[19])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<20>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[19]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[20]),
    .O(Msub_count_to_minus_one_sub0000_cy[20])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<20>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[19]),
    .LI(Msub_count_to_minus_one_sub0000_lut[20]),
    .O(count_to_minus_one_sub0000[20])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<21>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[20]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[21]),
    .O(Msub_count_to_minus_one_sub0000_cy[21])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<21>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[20]),
    .LI(Msub_count_to_minus_one_sub0000_lut[21]),
    .O(count_to_minus_one_sub0000[21])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<22>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[21]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[22]),
    .O(Msub_count_to_minus_one_sub0000_cy[22])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<22>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[21]),
    .LI(Msub_count_to_minus_one_sub0000_lut[22]),
    .O(count_to_minus_one_sub0000[22])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<23>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[22]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[23]),
    .O(Msub_count_to_minus_one_sub0000_cy[23])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<23>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[22]),
    .LI(Msub_count_to_minus_one_sub0000_lut[23]),
    .O(count_to_minus_one_sub0000[23])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<24>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[23]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[24]),
    .O(Msub_count_to_minus_one_sub0000_cy[24])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<24>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[23]),
    .LI(Msub_count_to_minus_one_sub0000_lut[24]),
    .O(count_to_minus_one_sub0000[24])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<25>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[24]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[25]),
    .O(Msub_count_to_minus_one_sub0000_cy[25])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<25>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[24]),
    .LI(Msub_count_to_minus_one_sub0000_lut[25]),
    .O(count_to_minus_one_sub0000[25])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<26>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[25]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[26]),
    .O(Msub_count_to_minus_one_sub0000_cy[26])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<26>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[25]),
    .LI(Msub_count_to_minus_one_sub0000_lut[26]),
    .O(count_to_minus_one_sub0000[26])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<27>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[26]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[27]),
    .O(Msub_count_to_minus_one_sub0000_cy[27])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<27>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[26]),
    .LI(Msub_count_to_minus_one_sub0000_lut[27]),
    .O(count_to_minus_one_sub0000[27])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<28>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[27]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[28]),
    .O(Msub_count_to_minus_one_sub0000_cy[28])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<28>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[27]),
    .LI(Msub_count_to_minus_one_sub0000_lut[28]),
    .O(count_to_minus_one_sub0000[28])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<29>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[28]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[29]),
    .O(Msub_count_to_minus_one_sub0000_cy[29])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<29>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[28]),
    .LI(Msub_count_to_minus_one_sub0000_lut[29]),
    .O(count_to_minus_one_sub0000[29])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<30>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[29]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[30]),
    .O(Msub_count_to_minus_one_sub0000_cy[30])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<30>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[29]),
    .LI(Msub_count_to_minus_one_sub0000_lut[30]),
    .O(count_to_minus_one_sub0000[30])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<31>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[30]),
    .LI(Msub_count_to_minus_one_sub0000_lut[31]),
    .O(count_to_minus_one_sub0000[31])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<0>  (
    .I0(cnt[0]),
    .I1(count_to[0]),
    .I2(cnt[1]),
    .I3(count_to[1]),
    .O(Mcompar_cnt_cmp_eq0000_lut[0])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[0]),
    .O(Mcompar_cnt_cmp_eq0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<1>  (
    .I0(cnt[2]),
    .I1(count_to[2]),
    .I2(cnt[3]),
    .I3(count_to[3]),
    .O(Mcompar_cnt_cmp_eq0000_lut[1])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<1>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[0]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[1]),
    .O(Mcompar_cnt_cmp_eq0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<2>  (
    .I0(cnt[4]),
    .I1(count_to[4]),
    .I2(cnt[5]),
    .I3(count_to[5]),
    .O(Mcompar_cnt_cmp_eq0000_lut[2])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<2>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[1]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[2]),
    .O(Mcompar_cnt_cmp_eq0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<3>  (
    .I0(cnt[6]),
    .I1(count_to[6]),
    .I2(cnt[7]),
    .I3(count_to[7]),
    .O(Mcompar_cnt_cmp_eq0000_lut[3])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<3>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[2]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[3]),
    .O(Mcompar_cnt_cmp_eq0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<4>  (
    .I0(cnt[8]),
    .I1(count_to[8]),
    .I2(cnt[9]),
    .I3(count_to[9]),
    .O(Mcompar_cnt_cmp_eq0000_lut[4])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<4>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[3]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[4]),
    .O(Mcompar_cnt_cmp_eq0000_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<5>  (
    .I0(cnt[10]),
    .I1(count_to[10]),
    .I2(cnt[11]),
    .I3(count_to[11]),
    .O(Mcompar_cnt_cmp_eq0000_lut[5])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<5>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[4]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[5]),
    .O(Mcompar_cnt_cmp_eq0000_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<6>  (
    .I0(cnt[12]),
    .I1(count_to[12]),
    .I2(cnt[13]),
    .I3(count_to[13]),
    .O(Mcompar_cnt_cmp_eq0000_lut[6])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<6>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[5]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[6]),
    .O(Mcompar_cnt_cmp_eq0000_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<7>  (
    .I0(cnt[14]),
    .I1(count_to[14]),
    .I2(cnt[15]),
    .I3(count_to[15]),
    .O(Mcompar_cnt_cmp_eq0000_lut[7])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<7>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[6]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[7]),
    .O(Mcompar_cnt_cmp_eq0000_cy[7])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<8>  (
    .I0(cnt[16]),
    .I1(count_to[16]),
    .I2(cnt[17]),
    .I3(count_to[17]),
    .O(Mcompar_cnt_cmp_eq0000_lut[8])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<8>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[7]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[8]),
    .O(Mcompar_cnt_cmp_eq0000_cy[8])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<9>  (
    .I0(cnt[18]),
    .I1(count_to[18]),
    .I2(cnt[19]),
    .I3(count_to[19]),
    .O(Mcompar_cnt_cmp_eq0000_lut[9])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<9>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[8]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[9]),
    .O(Mcompar_cnt_cmp_eq0000_cy[9])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<10>  (
    .I0(cnt[20]),
    .I1(count_to[20]),
    .I2(cnt[21]),
    .I3(count_to[21]),
    .O(Mcompar_cnt_cmp_eq0000_lut[10])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<10>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[9]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[10]),
    .O(Mcompar_cnt_cmp_eq0000_cy[10])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<11>  (
    .I0(cnt[22]),
    .I1(count_to[22]),
    .I2(cnt[23]),
    .I3(count_to[23]),
    .O(Mcompar_cnt_cmp_eq0000_lut[11])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<11>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[10]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[11]),
    .O(Mcompar_cnt_cmp_eq0000_cy[11])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<12>  (
    .I0(cnt[24]),
    .I1(count_to[24]),
    .I2(cnt[25]),
    .I3(count_to[25]),
    .O(Mcompar_cnt_cmp_eq0000_lut[12])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<12>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[11]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[12]),
    .O(Mcompar_cnt_cmp_eq0000_cy[12])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<13>  (
    .I0(cnt[26]),
    .I1(count_to[26]),
    .I2(cnt[27]),
    .I3(count_to[27]),
    .O(Mcompar_cnt_cmp_eq0000_lut[13])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<13>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[12]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[13]),
    .O(Mcompar_cnt_cmp_eq0000_cy[13])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<14>  (
    .I0(cnt[28]),
    .I1(count_to[28]),
    .I2(cnt[29]),
    .I3(count_to[29]),
    .O(Mcompar_cnt_cmp_eq0000_lut[14])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<14>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[13]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[14]),
    .O(Mcompar_cnt_cmp_eq0000_cy[14])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<15>  (
    .I0(cnt[30]),
    .I1(count_to[30]),
    .I2(cnt[31]),
    .I3(count_to[31]),
    .O(Mcompar_cnt_cmp_eq0000_lut[15])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<15>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[14]),
    .DI(N0),
    .S(Mcompar_cnt_cmp_eq0000_lut[15]),
    .O(Mcompar_cnt_cmp_eq0000_cy[15])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<0>  (
    .I0(cnt[0]),
    .I1(count_to_minus_one[0]),
    .I2(cnt[1]),
    .I3(count_to_minus_one[1]),
    .O(Mcompar_last_cmp_ne0000_lut[0])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[0]),
    .O(Mcompar_last_cmp_ne0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<1>  (
    .I0(cnt[2]),
    .I1(count_to_minus_one[2]),
    .I2(cnt[3]),
    .I3(count_to_minus_one[3]),
    .O(Mcompar_last_cmp_ne0000_lut[1])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<1>  (
    .CI(Mcompar_last_cmp_ne0000_cy[0]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[1]),
    .O(Mcompar_last_cmp_ne0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<2>  (
    .I0(cnt[4]),
    .I1(count_to_minus_one[4]),
    .I2(cnt[5]),
    .I3(count_to_minus_one[5]),
    .O(Mcompar_last_cmp_ne0000_lut[2])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<2>  (
    .CI(Mcompar_last_cmp_ne0000_cy[1]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[2]),
    .O(Mcompar_last_cmp_ne0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<3>  (
    .I0(cnt[6]),
    .I1(count_to_minus_one[6]),
    .I2(cnt[7]),
    .I3(count_to_minus_one[7]),
    .O(Mcompar_last_cmp_ne0000_lut[3])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<3>  (
    .CI(Mcompar_last_cmp_ne0000_cy[2]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[3]),
    .O(Mcompar_last_cmp_ne0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<4>  (
    .I0(cnt[8]),
    .I1(count_to_minus_one[8]),
    .I2(cnt[9]),
    .I3(count_to_minus_one[9]),
    .O(Mcompar_last_cmp_ne0000_lut[4])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<4>  (
    .CI(Mcompar_last_cmp_ne0000_cy[3]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[4]),
    .O(Mcompar_last_cmp_ne0000_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<5>  (
    .I0(cnt[10]),
    .I1(count_to_minus_one[10]),
    .I2(cnt[11]),
    .I3(count_to_minus_one[11]),
    .O(Mcompar_last_cmp_ne0000_lut[5])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<5>  (
    .CI(Mcompar_last_cmp_ne0000_cy[4]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[5]),
    .O(Mcompar_last_cmp_ne0000_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<6>  (
    .I0(cnt[12]),
    .I1(count_to_minus_one[12]),
    .I2(cnt[13]),
    .I3(count_to_minus_one[13]),
    .O(Mcompar_last_cmp_ne0000_lut[6])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<6>  (
    .CI(Mcompar_last_cmp_ne0000_cy[5]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[6]),
    .O(Mcompar_last_cmp_ne0000_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<7>  (
    .I0(cnt[14]),
    .I1(count_to_minus_one[14]),
    .I2(cnt[15]),
    .I3(count_to_minus_one[15]),
    .O(Mcompar_last_cmp_ne0000_lut[7])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<7>  (
    .CI(Mcompar_last_cmp_ne0000_cy[6]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[7]),
    .O(Mcompar_last_cmp_ne0000_cy[7])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<8>  (
    .I0(cnt[16]),
    .I1(count_to_minus_one[16]),
    .I2(cnt[17]),
    .I3(count_to_minus_one[17]),
    .O(Mcompar_last_cmp_ne0000_lut[8])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<8>  (
    .CI(Mcompar_last_cmp_ne0000_cy[7]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[8]),
    .O(Mcompar_last_cmp_ne0000_cy[8])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<9>  (
    .I0(cnt[18]),
    .I1(count_to_minus_one[18]),
    .I2(cnt[19]),
    .I3(count_to_minus_one[19]),
    .O(Mcompar_last_cmp_ne0000_lut[9])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<9>  (
    .CI(Mcompar_last_cmp_ne0000_cy[8]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[9]),
    .O(Mcompar_last_cmp_ne0000_cy[9])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<10>  (
    .I0(cnt[20]),
    .I1(count_to_minus_one[20]),
    .I2(cnt[21]),
    .I3(count_to_minus_one[21]),
    .O(Mcompar_last_cmp_ne0000_lut[10])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<10>  (
    .CI(Mcompar_last_cmp_ne0000_cy[9]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[10]),
    .O(Mcompar_last_cmp_ne0000_cy[10])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<11>  (
    .I0(cnt[22]),
    .I1(count_to_minus_one[22]),
    .I2(cnt[23]),
    .I3(count_to_minus_one[23]),
    .O(Mcompar_last_cmp_ne0000_lut[11])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<11>  (
    .CI(Mcompar_last_cmp_ne0000_cy[10]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[11]),
    .O(Mcompar_last_cmp_ne0000_cy[11])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<12>  (
    .I0(cnt[24]),
    .I1(count_to_minus_one[24]),
    .I2(cnt[25]),
    .I3(count_to_minus_one[25]),
    .O(Mcompar_last_cmp_ne0000_lut[12])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<12>  (
    .CI(Mcompar_last_cmp_ne0000_cy[11]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[12]),
    .O(Mcompar_last_cmp_ne0000_cy[12])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<13>  (
    .I0(cnt[26]),
    .I1(count_to_minus_one[26]),
    .I2(cnt[27]),
    .I3(count_to_minus_one[27]),
    .O(Mcompar_last_cmp_ne0000_lut[13])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<13>  (
    .CI(Mcompar_last_cmp_ne0000_cy[12]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[13]),
    .O(Mcompar_last_cmp_ne0000_cy[13])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<14>  (
    .I0(cnt[28]),
    .I1(count_to_minus_one[28]),
    .I2(cnt[29]),
    .I3(count_to_minus_one[29]),
    .O(Mcompar_last_cmp_ne0000_lut[14])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<14>  (
    .CI(Mcompar_last_cmp_ne0000_cy[13]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[14]),
    .O(Mcompar_last_cmp_ne0000_cy[14])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<15>  (
    .I0(cnt[30]),
    .I1(count_to_minus_one[30]),
    .I2(cnt[31]),
    .I3(count_to_minus_one[31]),
    .O(Mcompar_last_cmp_ne0000_lut[15])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<15>  (
    .CI(Mcompar_last_cmp_ne0000_cy[14]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[15]),
    .O(Mcompar_last_cmp_ne0000_cy[15])
  );
  pulsator_INST_1   microsecond (
    .clk(clk),
    .start(start),
    .rst(rst),
    .last(last_2716),
    .pulse(pulse)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_done_mux00001 (
    .I0(cnt_en_2582),
    .I1(start),
    .O(count_done_mux0000)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  count_done_not00011 (
    .I0(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I1(cnt_en_2582),
    .I2(start),
    .O(count_done_not0001)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  cnt_en_not00011 (
    .I0(start),
    .I1(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I2(cnt_en_2582),
    .O(cnt_en_not0001)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  cnt_not00011 (
    .I0(cnt_en_2582),
    .I1(pulse),
    .I2(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I3(start),
    .O(cnt_not0001)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  last_and0000_SW0 (
    .I0(cnt_en_2582),
    .I1(start),
    .O(N01)
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  last_and0000 (
    .I0(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I1(rst),
    .I2(N01),
    .I3(Mcompar_last_cmp_ne0000_cy[15]),
    .O(last_and0000_2717)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Msub_count_to_minus_one_sub0000_cy<0>_rt  (
    .I0(count_to[0]),
    .O(\Msub_count_to_minus_one_sub0000_cy<0>_rt_2484 )
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<1>_INV_0  (
    .I(count_to[1]),
    .O(Msub_count_to_minus_one_sub0000_lut[1])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<2>_INV_0  (
    .I(count_to[2]),
    .O(Msub_count_to_minus_one_sub0000_lut[2])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<3>_INV_0  (
    .I(count_to[3]),
    .O(Msub_count_to_minus_one_sub0000_lut[3])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<4>_INV_0  (
    .I(count_to[4]),
    .O(Msub_count_to_minus_one_sub0000_lut[4])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<5>_INV_0  (
    .I(count_to[5]),
    .O(Msub_count_to_minus_one_sub0000_lut[5])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<6>_INV_0  (
    .I(count_to[6]),
    .O(Msub_count_to_minus_one_sub0000_lut[6])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<7>_INV_0  (
    .I(count_to[7]),
    .O(Msub_count_to_minus_one_sub0000_lut[7])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<8>_INV_0  (
    .I(count_to[8]),
    .O(Msub_count_to_minus_one_sub0000_lut[8])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<9>_INV_0  (
    .I(count_to[9]),
    .O(Msub_count_to_minus_one_sub0000_lut[9])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<10>_INV_0  (
    .I(count_to[10]),
    .O(Msub_count_to_minus_one_sub0000_lut[10])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<11>_INV_0  (
    .I(count_to[11]),
    .O(Msub_count_to_minus_one_sub0000_lut[11])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<12>_INV_0  (
    .I(count_to[12]),
    .O(Msub_count_to_minus_one_sub0000_lut[12])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<13>_INV_0  (
    .I(count_to[13]),
    .O(Msub_count_to_minus_one_sub0000_lut[13])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<14>_INV_0  (
    .I(count_to[14]),
    .O(Msub_count_to_minus_one_sub0000_lut[14])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<15>_INV_0  (
    .I(count_to[15]),
    .O(Msub_count_to_minus_one_sub0000_lut[15])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<16>_INV_0  (
    .I(count_to[16]),
    .O(Msub_count_to_minus_one_sub0000_lut[16])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<17>_INV_0  (
    .I(count_to[17]),
    .O(Msub_count_to_minus_one_sub0000_lut[17])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<18>_INV_0  (
    .I(count_to[18]),
    .O(Msub_count_to_minus_one_sub0000_lut[18])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<19>_INV_0  (
    .I(count_to[19]),
    .O(Msub_count_to_minus_one_sub0000_lut[19])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<20>_INV_0  (
    .I(count_to[20]),
    .O(Msub_count_to_minus_one_sub0000_lut[20])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<21>_INV_0  (
    .I(count_to[21]),
    .O(Msub_count_to_minus_one_sub0000_lut[21])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<22>_INV_0  (
    .I(count_to[22]),
    .O(Msub_count_to_minus_one_sub0000_lut[22])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<23>_INV_0  (
    .I(count_to[23]),
    .O(Msub_count_to_minus_one_sub0000_lut[23])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<24>_INV_0  (
    .I(count_to[24]),
    .O(Msub_count_to_minus_one_sub0000_lut[24])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<25>_INV_0  (
    .I(count_to[25]),
    .O(Msub_count_to_minus_one_sub0000_lut[25])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<26>_INV_0  (
    .I(count_to[26]),
    .O(Msub_count_to_minus_one_sub0000_lut[26])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<27>_INV_0  (
    .I(count_to[27]),
    .O(Msub_count_to_minus_one_sub0000_lut[27])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<28>_INV_0  (
    .I(count_to[28]),
    .O(Msub_count_to_minus_one_sub0000_lut[28])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<29>_INV_0  (
    .I(count_to[29]),
    .O(Msub_count_to_minus_one_sub0000_lut[29])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<30>_INV_0  (
    .I(count_to[30]),
    .O(Msub_count_to_minus_one_sub0000_lut[30])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<31>_INV_0  (
    .I(count_to[31]),
    .O(Msub_count_to_minus_one_sub0000_lut[31])
  );
  INV   last_mux00001_INV_0 (
    .I(Mcompar_cnt_cmp_eq0000_cy[15]),
    .O(last_mux0000)
  );
  INV   start_inv1_INV_0 (
    .I(start),
    .O(start_inv)
  );
endmodule

module pulsator (
  clk, start, rst, last, pulse
);
  input clk;
  input start;
  input rst;
  input last;
  output pulse;
  wire N01;
  wire N02;
  wire N10;
  wire N13;
  wire N14;
  wire N3;
  wire N4;
  wire N8;
  wire cnt_cmp_eq00001;
  wire pulse_mux0000;
  wire [3 : 3] Madd_cnt_share0000_cy;
  wire [6 : 0] cnt;
  wire [6 : 0] cnt_mux0000;
  FDC   cnt_0 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[6]),
    .Q(cnt[0])
  );
  FDC   cnt_1 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[5]),
    .Q(cnt[1])
  );
  FDC   cnt_2 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[4]),
    .Q(cnt[2])
  );
  FDC   cnt_3 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[3]),
    .Q(cnt[3])
  );
  FDC   cnt_4 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[2]),
    .Q(cnt[4])
  );
  FDC   cnt_5 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[1]),
    .Q(cnt[5])
  );
  FDC   cnt_6 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[0]),
    .Q(cnt[6])
  );
  FDC   pulse_2447 (
    .C(clk),
    .CLR(rst),
    .D(pulse_mux0000),
    .Q(pulse)
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  \cnt_mux0000<5>1  (
    .I0(start),
    .I1(cnt[0]),
    .I2(cnt[1]),
    .O(cnt_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \Madd_cnt_share0000_cy<3>11  (
    .I0(cnt[2]),
    .I1(cnt[3]),
    .I2(cnt[0]),
    .I3(cnt[1]),
    .O(Madd_cnt_share0000_cy[3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \cnt_mux0000<6>_SW0  (
    .I0(last),
    .I1(cnt[1]),
    .O(N02)
  );
  LUT4 #(
    .INIT ( 16'hFF15 ))
  \cnt_mux0000<6>  (
    .I0(cnt[0]),
    .I1(N3),
    .I2(N02),
    .I3(start),
    .O(cnt_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  pulse_mux00001 (
    .I0(start),
    .I1(N01),
    .O(pulse_mux0000)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \cnt_mux0000<0>21  (
    .I0(start),
    .I1(N14),
    .O(N4)
  );
  LUT4 #(
    .INIT ( 16'h6A00 ))
  \cnt_mux0000<4>1  (
    .I0(cnt[2]),
    .I1(cnt[1]),
    .I2(cnt[0]),
    .I3(N4),
    .O(cnt_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'h6A00 ))
  \cnt_mux0000<1>1  (
    .I0(cnt[5]),
    .I1(cnt[4]),
    .I2(Madd_cnt_share0000_cy[3]),
    .I3(N4),
    .O(cnt_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \cnt_mux0000<3>_SW1  (
    .I0(cnt[0]),
    .I1(cnt[1]),
    .I2(cnt[2]),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h0802 ))
  \cnt_mux0000<3>  (
    .I0(N01),
    .I1(cnt[3]),
    .I2(start),
    .I3(N8),
    .O(cnt_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \cnt_mux0000<0>_SW1  (
    .I0(Madd_cnt_share0000_cy[3]),
    .I1(cnt[4]),
    .I2(cnt[5]),
    .O(N10)
  );
  LUT4 #(
    .INIT ( 16'h0802 ))
  \cnt_mux0000<0>  (
    .I0(N01),
    .I1(cnt[6]),
    .I2(start),
    .I3(N10),
    .O(cnt_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'h0028 ))
  \cnt_mux0000<2>1  (
    .I0(N01),
    .I1(cnt[4]),
    .I2(Madd_cnt_share0000_cy[3]),
    .I3(start),
    .O(cnt_mux0000[2])
  );
  GND   XST_GND (
    .G(N13)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  cnt_cmp_eq000011 (
    .I0(cnt[2]),
    .I1(cnt[4]),
    .I2(cnt[5]),
    .I3(cnt[3]),
    .O(cnt_cmp_eq00001)
  );
  MUXF5   cnt_cmp_eq00001_f5 (
    .I0(N13),
    .I1(cnt_cmp_eq00001),
    .S(cnt[6]),
    .O(N3)
  );
  LUT4_D #(
    .INIT ( 16'hBDFF ))
  \cnt_mux0000<0>11  (
    .I0(last),
    .I1(cnt[1]),
    .I2(cnt[0]),
    .I3(N3),
    .LO(N14),
    .O(N01)
  );
endmodule

module counter_reset_counter (
  clk, start, rst, count_done, count
);
  input clk;
  input start;
  input rst;
  output count_done;
  input [31 : 0] count;
  wire Mcount_cnt;
  wire Mcount_cnt1;
  wire Mcount_cnt10;
  wire Mcount_cnt11;
  wire Mcount_cnt12;
  wire Mcount_cnt13;
  wire Mcount_cnt14;
  wire Mcount_cnt15;
  wire Mcount_cnt16;
  wire Mcount_cnt17;
  wire Mcount_cnt18;
  wire Mcount_cnt19;
  wire Mcount_cnt2;
  wire Mcount_cnt20;
  wire Mcount_cnt21;
  wire Mcount_cnt22;
  wire Mcount_cnt23;
  wire Mcount_cnt24;
  wire Mcount_cnt25;
  wire Mcount_cnt26;
  wire Mcount_cnt27;
  wire Mcount_cnt28;
  wire Mcount_cnt29;
  wire Mcount_cnt3;
  wire Mcount_cnt30;
  wire Mcount_cnt31;
  wire Mcount_cnt4;
  wire Mcount_cnt5;
  wire Mcount_cnt6;
  wire Mcount_cnt7;
  wire Mcount_cnt8;
  wire Mcount_cnt9;
  wire N0;
  wire N1;
  wire cnt_en_2156;
  wire cnt_en_not0001;
  wire cnt_not0001;
  wire count_done_mux0000;
  wire count_done_not0001;
  wire last_2287;
  wire last_and0000_2288;
  wire last_mux0000;
  wire pulse;
  wire start_inv;
  wire [15 : 0] Mcompar_cnt_cmp_eq0000_cy;
  wire [15 : 0] Mcompar_cnt_cmp_eq0000_lut;
  wire [15 : 0] Mcompar_last_cmp_ne0000_cy;
  wire [15 : 0] Mcompar_last_cmp_ne0000_lut;
  wire [30 : 0] Mcount_cnt_cy;
  wire [31 : 0] Mcount_cnt_lut;
  wire [30 : 0] Msub_count_to_minus_one_sub0000_cy;
  wire [31 : 1] Msub_count_to_minus_one_sub0000_lut;
  wire [31 : 0] cnt;
  wire [31 : 1] count_to;
  wire [31 : 0] count_to_minus_one;
  wire [31 : 1] count_to_minus_one_sub0000;
  GND   XST_GND (
    .G(Msub_count_to_minus_one_sub0000_cy[0])
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   cnt_en (
    .C(clk),
    .CE(cnt_en_not0001),
    .CLR(rst),
    .D(start),
    .Q(cnt_en_2156)
  );
  FDCE   count_to_1 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[1]),
    .Q(count_to[1])
  );
  FDCE   count_to_2 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[2]),
    .Q(count_to[2])
  );
  FDCE   count_to_3 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[3]),
    .Q(count_to[3])
  );
  FDCE   count_to_4 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[4]),
    .Q(count_to[4])
  );
  FDCE   count_to_5 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[5]),
    .Q(count_to[5])
  );
  FDCE   count_to_6 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[6]),
    .Q(count_to[6])
  );
  FDCE   count_to_7 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[7]),
    .Q(count_to[7])
  );
  FDCE   count_to_8 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[8]),
    .Q(count_to[8])
  );
  FDCE   count_to_9 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[9]),
    .Q(count_to[9])
  );
  FDCE   count_to_10 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[10]),
    .Q(count_to[10])
  );
  FDCE   count_to_11 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[11]),
    .Q(count_to[11])
  );
  FDCE   count_to_12 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[12]),
    .Q(count_to[12])
  );
  FDCE   count_to_13 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[13]),
    .Q(count_to[13])
  );
  FDCE   count_to_14 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[14]),
    .Q(count_to[14])
  );
  FDCE   count_to_15 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[15]),
    .Q(count_to[15])
  );
  FDCE   count_to_16 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[16]),
    .Q(count_to[16])
  );
  FDCE   count_to_17 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[17]),
    .Q(count_to[17])
  );
  FDCE   count_to_18 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[18]),
    .Q(count_to[18])
  );
  FDCE   count_to_19 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[19]),
    .Q(count_to[19])
  );
  FDCE   count_to_20 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[20]),
    .Q(count_to[20])
  );
  FDCE   count_to_21 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[21]),
    .Q(count_to[21])
  );
  FDCE   count_to_22 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[22]),
    .Q(count_to[22])
  );
  FDCE   count_to_23 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[23]),
    .Q(count_to[23])
  );
  FDCE   count_to_24 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[24]),
    .Q(count_to[24])
  );
  FDCE   count_to_25 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[25]),
    .Q(count_to[25])
  );
  FDCE   count_to_26 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[26]),
    .Q(count_to[26])
  );
  FDCE   count_to_27 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[27]),
    .Q(count_to[27])
  );
  FDCE   count_to_28 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[28]),
    .Q(count_to[28])
  );
  FDCE   count_to_29 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[29]),
    .Q(count_to[29])
  );
  FDCE   count_to_30 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[30]),
    .Q(count_to[30])
  );
  FDCE   count_to_31 (
    .C(clk),
    .CE(start),
    .CLR(rst),
    .D(count[31]),
    .Q(count_to[31])
  );
  FDCE   count_done_2153 (
    .C(clk),
    .CE(count_done_not0001),
    .CLR(rst),
    .D(count_done_mux0000),
    .Q(count_done)
  );
  FDE   last (
    .C(clk),
    .CE(last_and0000_2288),
    .D(last_mux0000),
    .Q(last_2287)
  );
  FDC   count_to_minus_one_0 (
    .C(clk),
    .CLR(rst),
    .D(N1),
    .Q(count_to_minus_one[0])
  );
  FDC   count_to_minus_one_1 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[1]),
    .Q(count_to_minus_one[1])
  );
  FDC   count_to_minus_one_2 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[2]),
    .Q(count_to_minus_one[2])
  );
  FDC   count_to_minus_one_3 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[3]),
    .Q(count_to_minus_one[3])
  );
  FDC   count_to_minus_one_4 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[4]),
    .Q(count_to_minus_one[4])
  );
  FDC   count_to_minus_one_5 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[5]),
    .Q(count_to_minus_one[5])
  );
  FDC   count_to_minus_one_6 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[6]),
    .Q(count_to_minus_one[6])
  );
  FDC   count_to_minus_one_7 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[7]),
    .Q(count_to_minus_one[7])
  );
  FDC   count_to_minus_one_8 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[8]),
    .Q(count_to_minus_one[8])
  );
  FDC   count_to_minus_one_9 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[9]),
    .Q(count_to_minus_one[9])
  );
  FDC   count_to_minus_one_10 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[10]),
    .Q(count_to_minus_one[10])
  );
  FDC   count_to_minus_one_11 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[11]),
    .Q(count_to_minus_one[11])
  );
  FDC   count_to_minus_one_12 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[12]),
    .Q(count_to_minus_one[12])
  );
  FDC   count_to_minus_one_13 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[13]),
    .Q(count_to_minus_one[13])
  );
  FDC   count_to_minus_one_14 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[14]),
    .Q(count_to_minus_one[14])
  );
  FDC   count_to_minus_one_15 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[15]),
    .Q(count_to_minus_one[15])
  );
  FDC   count_to_minus_one_16 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[16]),
    .Q(count_to_minus_one[16])
  );
  FDC   count_to_minus_one_17 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[17]),
    .Q(count_to_minus_one[17])
  );
  FDC   count_to_minus_one_18 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[18]),
    .Q(count_to_minus_one[18])
  );
  FDC   count_to_minus_one_19 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[19]),
    .Q(count_to_minus_one[19])
  );
  FDC   count_to_minus_one_20 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[20]),
    .Q(count_to_minus_one[20])
  );
  FDC   count_to_minus_one_21 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[21]),
    .Q(count_to_minus_one[21])
  );
  FDC   count_to_minus_one_22 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[22]),
    .Q(count_to_minus_one[22])
  );
  FDC   count_to_minus_one_23 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[23]),
    .Q(count_to_minus_one[23])
  );
  FDC   count_to_minus_one_24 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[24]),
    .Q(count_to_minus_one[24])
  );
  FDC   count_to_minus_one_25 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[25]),
    .Q(count_to_minus_one[25])
  );
  FDC   count_to_minus_one_26 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[26]),
    .Q(count_to_minus_one[26])
  );
  FDC   count_to_minus_one_27 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[27]),
    .Q(count_to_minus_one[27])
  );
  FDC   count_to_minus_one_28 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[28]),
    .Q(count_to_minus_one[28])
  );
  FDC   count_to_minus_one_29 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[29]),
    .Q(count_to_minus_one[29])
  );
  FDC   count_to_minus_one_30 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[30]),
    .Q(count_to_minus_one[30])
  );
  FDC   count_to_minus_one_31 (
    .C(clk),
    .CLR(rst),
    .D(count_to_minus_one_sub0000[31]),
    .Q(count_to_minus_one[31])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<0>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[0]),
    .I2(start),
    .O(Mcount_cnt_lut[0])
  );
  MUXCY   \Mcount_cnt_cy<0>  (
    .CI(start_inv),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[0]),
    .O(Mcount_cnt_cy[0])
  );
  XORCY   \Mcount_cnt_xor<0>  (
    .CI(start_inv),
    .LI(Mcount_cnt_lut[0]),
    .O(Mcount_cnt)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<1>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[1]),
    .I2(start),
    .O(Mcount_cnt_lut[1])
  );
  MUXCY   \Mcount_cnt_cy<1>  (
    .CI(Mcount_cnt_cy[0]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[1]),
    .O(Mcount_cnt_cy[1])
  );
  XORCY   \Mcount_cnt_xor<1>  (
    .CI(Mcount_cnt_cy[0]),
    .LI(Mcount_cnt_lut[1]),
    .O(Mcount_cnt1)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<2>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[2]),
    .I2(start),
    .O(Mcount_cnt_lut[2])
  );
  MUXCY   \Mcount_cnt_cy<2>  (
    .CI(Mcount_cnt_cy[1]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[2]),
    .O(Mcount_cnt_cy[2])
  );
  XORCY   \Mcount_cnt_xor<2>  (
    .CI(Mcount_cnt_cy[1]),
    .LI(Mcount_cnt_lut[2]),
    .O(Mcount_cnt2)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<3>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[3]),
    .I2(start),
    .O(Mcount_cnt_lut[3])
  );
  MUXCY   \Mcount_cnt_cy<3>  (
    .CI(Mcount_cnt_cy[2]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[3]),
    .O(Mcount_cnt_cy[3])
  );
  XORCY   \Mcount_cnt_xor<3>  (
    .CI(Mcount_cnt_cy[2]),
    .LI(Mcount_cnt_lut[3]),
    .O(Mcount_cnt3)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<4>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[4]),
    .I2(start),
    .O(Mcount_cnt_lut[4])
  );
  MUXCY   \Mcount_cnt_cy<4>  (
    .CI(Mcount_cnt_cy[3]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[4]),
    .O(Mcount_cnt_cy[4])
  );
  XORCY   \Mcount_cnt_xor<4>  (
    .CI(Mcount_cnt_cy[3]),
    .LI(Mcount_cnt_lut[4]),
    .O(Mcount_cnt4)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<5>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[5]),
    .I2(start),
    .O(Mcount_cnt_lut[5])
  );
  MUXCY   \Mcount_cnt_cy<5>  (
    .CI(Mcount_cnt_cy[4]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[5]),
    .O(Mcount_cnt_cy[5])
  );
  XORCY   \Mcount_cnt_xor<5>  (
    .CI(Mcount_cnt_cy[4]),
    .LI(Mcount_cnt_lut[5]),
    .O(Mcount_cnt5)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<6>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[6]),
    .I2(start),
    .O(Mcount_cnt_lut[6])
  );
  MUXCY   \Mcount_cnt_cy<6>  (
    .CI(Mcount_cnt_cy[5]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[6]),
    .O(Mcount_cnt_cy[6])
  );
  XORCY   \Mcount_cnt_xor<6>  (
    .CI(Mcount_cnt_cy[5]),
    .LI(Mcount_cnt_lut[6]),
    .O(Mcount_cnt6)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<7>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[7]),
    .I2(start),
    .O(Mcount_cnt_lut[7])
  );
  MUXCY   \Mcount_cnt_cy<7>  (
    .CI(Mcount_cnt_cy[6]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[7]),
    .O(Mcount_cnt_cy[7])
  );
  XORCY   \Mcount_cnt_xor<7>  (
    .CI(Mcount_cnt_cy[6]),
    .LI(Mcount_cnt_lut[7]),
    .O(Mcount_cnt7)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<8>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[8]),
    .I2(start),
    .O(Mcount_cnt_lut[8])
  );
  MUXCY   \Mcount_cnt_cy<8>  (
    .CI(Mcount_cnt_cy[7]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[8]),
    .O(Mcount_cnt_cy[8])
  );
  XORCY   \Mcount_cnt_xor<8>  (
    .CI(Mcount_cnt_cy[7]),
    .LI(Mcount_cnt_lut[8]),
    .O(Mcount_cnt8)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<9>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[9]),
    .I2(start),
    .O(Mcount_cnt_lut[9])
  );
  MUXCY   \Mcount_cnt_cy<9>  (
    .CI(Mcount_cnt_cy[8]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[9]),
    .O(Mcount_cnt_cy[9])
  );
  XORCY   \Mcount_cnt_xor<9>  (
    .CI(Mcount_cnt_cy[8]),
    .LI(Mcount_cnt_lut[9]),
    .O(Mcount_cnt9)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<10>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[10]),
    .I2(start),
    .O(Mcount_cnt_lut[10])
  );
  MUXCY   \Mcount_cnt_cy<10>  (
    .CI(Mcount_cnt_cy[9]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[10]),
    .O(Mcount_cnt_cy[10])
  );
  XORCY   \Mcount_cnt_xor<10>  (
    .CI(Mcount_cnt_cy[9]),
    .LI(Mcount_cnt_lut[10]),
    .O(Mcount_cnt10)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<11>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[11]),
    .I2(start),
    .O(Mcount_cnt_lut[11])
  );
  MUXCY   \Mcount_cnt_cy<11>  (
    .CI(Mcount_cnt_cy[10]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[11]),
    .O(Mcount_cnt_cy[11])
  );
  XORCY   \Mcount_cnt_xor<11>  (
    .CI(Mcount_cnt_cy[10]),
    .LI(Mcount_cnt_lut[11]),
    .O(Mcount_cnt11)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<12>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[12]),
    .I2(start),
    .O(Mcount_cnt_lut[12])
  );
  MUXCY   \Mcount_cnt_cy<12>  (
    .CI(Mcount_cnt_cy[11]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[12]),
    .O(Mcount_cnt_cy[12])
  );
  XORCY   \Mcount_cnt_xor<12>  (
    .CI(Mcount_cnt_cy[11]),
    .LI(Mcount_cnt_lut[12]),
    .O(Mcount_cnt12)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<13>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[13]),
    .I2(start),
    .O(Mcount_cnt_lut[13])
  );
  MUXCY   \Mcount_cnt_cy<13>  (
    .CI(Mcount_cnt_cy[12]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[13]),
    .O(Mcount_cnt_cy[13])
  );
  XORCY   \Mcount_cnt_xor<13>  (
    .CI(Mcount_cnt_cy[12]),
    .LI(Mcount_cnt_lut[13]),
    .O(Mcount_cnt13)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<14>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[14]),
    .I2(start),
    .O(Mcount_cnt_lut[14])
  );
  MUXCY   \Mcount_cnt_cy<14>  (
    .CI(Mcount_cnt_cy[13]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[14]),
    .O(Mcount_cnt_cy[14])
  );
  XORCY   \Mcount_cnt_xor<14>  (
    .CI(Mcount_cnt_cy[13]),
    .LI(Mcount_cnt_lut[14]),
    .O(Mcount_cnt14)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<15>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[15]),
    .I2(start),
    .O(Mcount_cnt_lut[15])
  );
  MUXCY   \Mcount_cnt_cy<15>  (
    .CI(Mcount_cnt_cy[14]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[15]),
    .O(Mcount_cnt_cy[15])
  );
  XORCY   \Mcount_cnt_xor<15>  (
    .CI(Mcount_cnt_cy[14]),
    .LI(Mcount_cnt_lut[15]),
    .O(Mcount_cnt15)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<16>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[16]),
    .I2(start),
    .O(Mcount_cnt_lut[16])
  );
  MUXCY   \Mcount_cnt_cy<16>  (
    .CI(Mcount_cnt_cy[15]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[16]),
    .O(Mcount_cnt_cy[16])
  );
  XORCY   \Mcount_cnt_xor<16>  (
    .CI(Mcount_cnt_cy[15]),
    .LI(Mcount_cnt_lut[16]),
    .O(Mcount_cnt16)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<17>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[17]),
    .I2(start),
    .O(Mcount_cnt_lut[17])
  );
  MUXCY   \Mcount_cnt_cy<17>  (
    .CI(Mcount_cnt_cy[16]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[17]),
    .O(Mcount_cnt_cy[17])
  );
  XORCY   \Mcount_cnt_xor<17>  (
    .CI(Mcount_cnt_cy[16]),
    .LI(Mcount_cnt_lut[17]),
    .O(Mcount_cnt17)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<18>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[18]),
    .I2(start),
    .O(Mcount_cnt_lut[18])
  );
  MUXCY   \Mcount_cnt_cy<18>  (
    .CI(Mcount_cnt_cy[17]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[18]),
    .O(Mcount_cnt_cy[18])
  );
  XORCY   \Mcount_cnt_xor<18>  (
    .CI(Mcount_cnt_cy[17]),
    .LI(Mcount_cnt_lut[18]),
    .O(Mcount_cnt18)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<19>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[19]),
    .I2(start),
    .O(Mcount_cnt_lut[19])
  );
  MUXCY   \Mcount_cnt_cy<19>  (
    .CI(Mcount_cnt_cy[18]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[19]),
    .O(Mcount_cnt_cy[19])
  );
  XORCY   \Mcount_cnt_xor<19>  (
    .CI(Mcount_cnt_cy[18]),
    .LI(Mcount_cnt_lut[19]),
    .O(Mcount_cnt19)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<20>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[20]),
    .I2(start),
    .O(Mcount_cnt_lut[20])
  );
  MUXCY   \Mcount_cnt_cy<20>  (
    .CI(Mcount_cnt_cy[19]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[20]),
    .O(Mcount_cnt_cy[20])
  );
  XORCY   \Mcount_cnt_xor<20>  (
    .CI(Mcount_cnt_cy[19]),
    .LI(Mcount_cnt_lut[20]),
    .O(Mcount_cnt20)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<21>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[21]),
    .I2(start),
    .O(Mcount_cnt_lut[21])
  );
  MUXCY   \Mcount_cnt_cy<21>  (
    .CI(Mcount_cnt_cy[20]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[21]),
    .O(Mcount_cnt_cy[21])
  );
  XORCY   \Mcount_cnt_xor<21>  (
    .CI(Mcount_cnt_cy[20]),
    .LI(Mcount_cnt_lut[21]),
    .O(Mcount_cnt21)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<22>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[22]),
    .I2(start),
    .O(Mcount_cnt_lut[22])
  );
  MUXCY   \Mcount_cnt_cy<22>  (
    .CI(Mcount_cnt_cy[21]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[22]),
    .O(Mcount_cnt_cy[22])
  );
  XORCY   \Mcount_cnt_xor<22>  (
    .CI(Mcount_cnt_cy[21]),
    .LI(Mcount_cnt_lut[22]),
    .O(Mcount_cnt22)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Mcount_cnt_lut<23>  (
    .I0(Msub_count_to_minus_one_sub0000_cy[0]),
    .I1(cnt[23]),
    .I2(start),
    .O(Mcount_cnt_lut[23])
  );
  MUXCY   \Mcount_cnt_cy<23>  (
    .CI(Mcount_cnt_cy[22]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[23]),
    .O(Mcount_cnt_cy[23])
  );
  XORCY   \Mcount_cnt_xor<23>  (
    .CI(Mcount_cnt_cy[22]),
    .LI(Mcount_cnt_lut[23]),
    .O(Mcount_cnt23)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<24>  (
    .I0(start),
    .I1(cnt[24]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[24])
  );
  MUXCY   \Mcount_cnt_cy<24>  (
    .CI(Mcount_cnt_cy[23]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[24]),
    .O(Mcount_cnt_cy[24])
  );
  XORCY   \Mcount_cnt_xor<24>  (
    .CI(Mcount_cnt_cy[23]),
    .LI(Mcount_cnt_lut[24]),
    .O(Mcount_cnt24)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<25>  (
    .I0(start),
    .I1(cnt[25]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[25])
  );
  MUXCY   \Mcount_cnt_cy<25>  (
    .CI(Mcount_cnt_cy[24]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[25]),
    .O(Mcount_cnt_cy[25])
  );
  XORCY   \Mcount_cnt_xor<25>  (
    .CI(Mcount_cnt_cy[24]),
    .LI(Mcount_cnt_lut[25]),
    .O(Mcount_cnt25)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<26>  (
    .I0(start),
    .I1(cnt[26]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[26])
  );
  MUXCY   \Mcount_cnt_cy<26>  (
    .CI(Mcount_cnt_cy[25]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[26]),
    .O(Mcount_cnt_cy[26])
  );
  XORCY   \Mcount_cnt_xor<26>  (
    .CI(Mcount_cnt_cy[25]),
    .LI(Mcount_cnt_lut[26]),
    .O(Mcount_cnt26)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<27>  (
    .I0(start),
    .I1(cnt[27]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[27])
  );
  MUXCY   \Mcount_cnt_cy<27>  (
    .CI(Mcount_cnt_cy[26]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[27]),
    .O(Mcount_cnt_cy[27])
  );
  XORCY   \Mcount_cnt_xor<27>  (
    .CI(Mcount_cnt_cy[26]),
    .LI(Mcount_cnt_lut[27]),
    .O(Mcount_cnt27)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<28>  (
    .I0(start),
    .I1(cnt[28]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[28])
  );
  MUXCY   \Mcount_cnt_cy<28>  (
    .CI(Mcount_cnt_cy[27]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[28]),
    .O(Mcount_cnt_cy[28])
  );
  XORCY   \Mcount_cnt_xor<28>  (
    .CI(Mcount_cnt_cy[27]),
    .LI(Mcount_cnt_lut[28]),
    .O(Mcount_cnt28)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<29>  (
    .I0(start),
    .I1(cnt[29]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[29])
  );
  MUXCY   \Mcount_cnt_cy<29>  (
    .CI(Mcount_cnt_cy[28]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[29]),
    .O(Mcount_cnt_cy[29])
  );
  XORCY   \Mcount_cnt_xor<29>  (
    .CI(Mcount_cnt_cy[28]),
    .LI(Mcount_cnt_lut[29]),
    .O(Mcount_cnt29)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<30>  (
    .I0(start),
    .I1(cnt[30]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[30])
  );
  MUXCY   \Mcount_cnt_cy<30>  (
    .CI(Mcount_cnt_cy[29]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcount_cnt_lut[30]),
    .O(Mcount_cnt_cy[30])
  );
  XORCY   \Mcount_cnt_xor<30>  (
    .CI(Mcount_cnt_cy[29]),
    .LI(Mcount_cnt_lut[30]),
    .O(Mcount_cnt30)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Mcount_cnt_lut<31>  (
    .I0(start),
    .I1(cnt[31]),
    .I2(Msub_count_to_minus_one_sub0000_cy[0]),
    .O(Mcount_cnt_lut[31])
  );
  XORCY   \Mcount_cnt_xor<31>  (
    .CI(Mcount_cnt_cy[30]),
    .LI(Mcount_cnt_lut[31]),
    .O(Mcount_cnt31)
  );
  FDCE   cnt_0 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt),
    .Q(cnt[0])
  );
  FDCE   cnt_1 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt1),
    .Q(cnt[1])
  );
  FDCE   cnt_2 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt2),
    .Q(cnt[2])
  );
  FDCE   cnt_3 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt3),
    .Q(cnt[3])
  );
  FDCE   cnt_4 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt4),
    .Q(cnt[4])
  );
  FDCE   cnt_5 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt5),
    .Q(cnt[5])
  );
  FDCE   cnt_6 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt6),
    .Q(cnt[6])
  );
  FDCE   cnt_7 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt7),
    .Q(cnt[7])
  );
  FDCE   cnt_8 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt8),
    .Q(cnt[8])
  );
  FDCE   cnt_9 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt9),
    .Q(cnt[9])
  );
  FDCE   cnt_10 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt10),
    .Q(cnt[10])
  );
  FDCE   cnt_11 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt11),
    .Q(cnt[11])
  );
  FDCE   cnt_12 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt12),
    .Q(cnt[12])
  );
  FDCE   cnt_13 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt13),
    .Q(cnt[13])
  );
  FDCE   cnt_14 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt14),
    .Q(cnt[14])
  );
  FDCE   cnt_15 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt15),
    .Q(cnt[15])
  );
  FDCE   cnt_16 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt16),
    .Q(cnt[16])
  );
  FDCE   cnt_17 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt17),
    .Q(cnt[17])
  );
  FDCE   cnt_18 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt18),
    .Q(cnt[18])
  );
  FDCE   cnt_19 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt19),
    .Q(cnt[19])
  );
  FDCE   cnt_20 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt20),
    .Q(cnt[20])
  );
  FDCE   cnt_21 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt21),
    .Q(cnt[21])
  );
  FDCE   cnt_22 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt22),
    .Q(cnt[22])
  );
  FDCE   cnt_23 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt23),
    .Q(cnt[23])
  );
  FDCE   cnt_24 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt24),
    .Q(cnt[24])
  );
  FDCE   cnt_25 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt25),
    .Q(cnt[25])
  );
  FDCE   cnt_26 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt26),
    .Q(cnt[26])
  );
  FDCE   cnt_27 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt27),
    .Q(cnt[27])
  );
  FDCE   cnt_28 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt28),
    .Q(cnt[28])
  );
  FDCE   cnt_29 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt29),
    .Q(cnt[29])
  );
  FDCE   cnt_30 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt30),
    .Q(cnt[30])
  );
  FDCE   cnt_31 (
    .C(clk),
    .CE(cnt_not0001),
    .CLR(rst),
    .D(Mcount_cnt31),
    .Q(cnt[31])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<1>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[0]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[1]),
    .O(Msub_count_to_minus_one_sub0000_cy[1])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<1>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[0]),
    .LI(Msub_count_to_minus_one_sub0000_lut[1]),
    .O(count_to_minus_one_sub0000[1])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<2>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[1]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[2]),
    .O(Msub_count_to_minus_one_sub0000_cy[2])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<2>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[1]),
    .LI(Msub_count_to_minus_one_sub0000_lut[2]),
    .O(count_to_minus_one_sub0000[2])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<3>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[2]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[3]),
    .O(Msub_count_to_minus_one_sub0000_cy[3])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<3>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[2]),
    .LI(Msub_count_to_minus_one_sub0000_lut[3]),
    .O(count_to_minus_one_sub0000[3])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<4>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[3]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[4]),
    .O(Msub_count_to_minus_one_sub0000_cy[4])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<4>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[3]),
    .LI(Msub_count_to_minus_one_sub0000_lut[4]),
    .O(count_to_minus_one_sub0000[4])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<5>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[4]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[5]),
    .O(Msub_count_to_minus_one_sub0000_cy[5])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<5>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[4]),
    .LI(Msub_count_to_minus_one_sub0000_lut[5]),
    .O(count_to_minus_one_sub0000[5])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<6>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[5]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[6]),
    .O(Msub_count_to_minus_one_sub0000_cy[6])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<6>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[5]),
    .LI(Msub_count_to_minus_one_sub0000_lut[6]),
    .O(count_to_minus_one_sub0000[6])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<7>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[6]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[7]),
    .O(Msub_count_to_minus_one_sub0000_cy[7])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<7>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[6]),
    .LI(Msub_count_to_minus_one_sub0000_lut[7]),
    .O(count_to_minus_one_sub0000[7])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<8>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[7]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[8]),
    .O(Msub_count_to_minus_one_sub0000_cy[8])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<8>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[7]),
    .LI(Msub_count_to_minus_one_sub0000_lut[8]),
    .O(count_to_minus_one_sub0000[8])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<9>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[8]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[9]),
    .O(Msub_count_to_minus_one_sub0000_cy[9])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<9>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[8]),
    .LI(Msub_count_to_minus_one_sub0000_lut[9]),
    .O(count_to_minus_one_sub0000[9])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<10>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[9]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[10]),
    .O(Msub_count_to_minus_one_sub0000_cy[10])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<10>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[9]),
    .LI(Msub_count_to_minus_one_sub0000_lut[10]),
    .O(count_to_minus_one_sub0000[10])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<11>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[10]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[11]),
    .O(Msub_count_to_minus_one_sub0000_cy[11])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<11>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[10]),
    .LI(Msub_count_to_minus_one_sub0000_lut[11]),
    .O(count_to_minus_one_sub0000[11])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<12>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[11]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[12]),
    .O(Msub_count_to_minus_one_sub0000_cy[12])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<12>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[11]),
    .LI(Msub_count_to_minus_one_sub0000_lut[12]),
    .O(count_to_minus_one_sub0000[12])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<13>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[12]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[13]),
    .O(Msub_count_to_minus_one_sub0000_cy[13])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<13>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[12]),
    .LI(Msub_count_to_minus_one_sub0000_lut[13]),
    .O(count_to_minus_one_sub0000[13])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<14>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[13]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[14]),
    .O(Msub_count_to_minus_one_sub0000_cy[14])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<14>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[13]),
    .LI(Msub_count_to_minus_one_sub0000_lut[14]),
    .O(count_to_minus_one_sub0000[14])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<15>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[14]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[15]),
    .O(Msub_count_to_minus_one_sub0000_cy[15])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<15>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[14]),
    .LI(Msub_count_to_minus_one_sub0000_lut[15]),
    .O(count_to_minus_one_sub0000[15])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<16>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[15]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[16]),
    .O(Msub_count_to_minus_one_sub0000_cy[16])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<16>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[15]),
    .LI(Msub_count_to_minus_one_sub0000_lut[16]),
    .O(count_to_minus_one_sub0000[16])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<17>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[16]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[17]),
    .O(Msub_count_to_minus_one_sub0000_cy[17])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<17>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[16]),
    .LI(Msub_count_to_minus_one_sub0000_lut[17]),
    .O(count_to_minus_one_sub0000[17])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<18>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[17]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[18]),
    .O(Msub_count_to_minus_one_sub0000_cy[18])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<18>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[17]),
    .LI(Msub_count_to_minus_one_sub0000_lut[18]),
    .O(count_to_minus_one_sub0000[18])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<19>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[18]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[19]),
    .O(Msub_count_to_minus_one_sub0000_cy[19])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<19>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[18]),
    .LI(Msub_count_to_minus_one_sub0000_lut[19]),
    .O(count_to_minus_one_sub0000[19])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<20>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[19]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[20]),
    .O(Msub_count_to_minus_one_sub0000_cy[20])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<20>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[19]),
    .LI(Msub_count_to_minus_one_sub0000_lut[20]),
    .O(count_to_minus_one_sub0000[20])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<21>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[20]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[21]),
    .O(Msub_count_to_minus_one_sub0000_cy[21])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<21>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[20]),
    .LI(Msub_count_to_minus_one_sub0000_lut[21]),
    .O(count_to_minus_one_sub0000[21])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<22>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[21]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[22]),
    .O(Msub_count_to_minus_one_sub0000_cy[22])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<22>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[21]),
    .LI(Msub_count_to_minus_one_sub0000_lut[22]),
    .O(count_to_minus_one_sub0000[22])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<23>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[22]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[23]),
    .O(Msub_count_to_minus_one_sub0000_cy[23])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<23>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[22]),
    .LI(Msub_count_to_minus_one_sub0000_lut[23]),
    .O(count_to_minus_one_sub0000[23])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<24>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[23]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[24]),
    .O(Msub_count_to_minus_one_sub0000_cy[24])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<24>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[23]),
    .LI(Msub_count_to_minus_one_sub0000_lut[24]),
    .O(count_to_minus_one_sub0000[24])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<25>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[24]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[25]),
    .O(Msub_count_to_minus_one_sub0000_cy[25])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<25>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[24]),
    .LI(Msub_count_to_minus_one_sub0000_lut[25]),
    .O(count_to_minus_one_sub0000[25])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<26>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[25]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[26]),
    .O(Msub_count_to_minus_one_sub0000_cy[26])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<26>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[25]),
    .LI(Msub_count_to_minus_one_sub0000_lut[26]),
    .O(count_to_minus_one_sub0000[26])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<27>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[26]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[27]),
    .O(Msub_count_to_minus_one_sub0000_cy[27])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<27>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[26]),
    .LI(Msub_count_to_minus_one_sub0000_lut[27]),
    .O(count_to_minus_one_sub0000[27])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<28>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[27]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[28]),
    .O(Msub_count_to_minus_one_sub0000_cy[28])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<28>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[27]),
    .LI(Msub_count_to_minus_one_sub0000_lut[28]),
    .O(count_to_minus_one_sub0000[28])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<29>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[28]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[29]),
    .O(Msub_count_to_minus_one_sub0000_cy[29])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<29>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[28]),
    .LI(Msub_count_to_minus_one_sub0000_lut[29]),
    .O(count_to_minus_one_sub0000[29])
  );
  MUXCY   \Msub_count_to_minus_one_sub0000_cy<30>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[29]),
    .DI(N1),
    .S(Msub_count_to_minus_one_sub0000_lut[30]),
    .O(Msub_count_to_minus_one_sub0000_cy[30])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<30>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[29]),
    .LI(Msub_count_to_minus_one_sub0000_lut[30]),
    .O(count_to_minus_one_sub0000[30])
  );
  XORCY   \Msub_count_to_minus_one_sub0000_xor<31>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[30]),
    .LI(Msub_count_to_minus_one_sub0000_lut[31]),
    .O(count_to_minus_one_sub0000[31])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<0>  (
    .I0(cnt[0]),
    .I1(Msub_count_to_minus_one_sub0000_cy[0]),
    .I2(cnt[1]),
    .I3(count_to[1]),
    .O(Mcompar_cnt_cmp_eq0000_lut[0])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<0>  (
    .CI(N1),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[0]),
    .O(Mcompar_cnt_cmp_eq0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<1>  (
    .I0(cnt[2]),
    .I1(count_to[2]),
    .I2(cnt[3]),
    .I3(count_to[3]),
    .O(Mcompar_cnt_cmp_eq0000_lut[1])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<1>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[0]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[1]),
    .O(Mcompar_cnt_cmp_eq0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<2>  (
    .I0(cnt[4]),
    .I1(count_to[4]),
    .I2(cnt[5]),
    .I3(count_to[5]),
    .O(Mcompar_cnt_cmp_eq0000_lut[2])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<2>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[1]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[2]),
    .O(Mcompar_cnt_cmp_eq0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<3>  (
    .I0(cnt[6]),
    .I1(count_to[6]),
    .I2(cnt[7]),
    .I3(count_to[7]),
    .O(Mcompar_cnt_cmp_eq0000_lut[3])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<3>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[2]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[3]),
    .O(Mcompar_cnt_cmp_eq0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<4>  (
    .I0(cnt[8]),
    .I1(count_to[8]),
    .I2(cnt[9]),
    .I3(count_to[9]),
    .O(Mcompar_cnt_cmp_eq0000_lut[4])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<4>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[3]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[4]),
    .O(Mcompar_cnt_cmp_eq0000_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<5>  (
    .I0(cnt[10]),
    .I1(count_to[10]),
    .I2(cnt[11]),
    .I3(count_to[11]),
    .O(Mcompar_cnt_cmp_eq0000_lut[5])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<5>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[4]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[5]),
    .O(Mcompar_cnt_cmp_eq0000_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<6>  (
    .I0(cnt[12]),
    .I1(count_to[12]),
    .I2(cnt[13]),
    .I3(count_to[13]),
    .O(Mcompar_cnt_cmp_eq0000_lut[6])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<6>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[5]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[6]),
    .O(Mcompar_cnt_cmp_eq0000_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<7>  (
    .I0(cnt[14]),
    .I1(count_to[14]),
    .I2(cnt[15]),
    .I3(count_to[15]),
    .O(Mcompar_cnt_cmp_eq0000_lut[7])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<7>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[6]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[7]),
    .O(Mcompar_cnt_cmp_eq0000_cy[7])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<8>  (
    .I0(cnt[16]),
    .I1(count_to[16]),
    .I2(cnt[17]),
    .I3(count_to[17]),
    .O(Mcompar_cnt_cmp_eq0000_lut[8])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<8>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[7]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[8]),
    .O(Mcompar_cnt_cmp_eq0000_cy[8])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<9>  (
    .I0(cnt[18]),
    .I1(count_to[18]),
    .I2(cnt[19]),
    .I3(count_to[19]),
    .O(Mcompar_cnt_cmp_eq0000_lut[9])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<9>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[8]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[9]),
    .O(Mcompar_cnt_cmp_eq0000_cy[9])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<10>  (
    .I0(cnt[20]),
    .I1(count_to[20]),
    .I2(cnt[21]),
    .I3(count_to[21]),
    .O(Mcompar_cnt_cmp_eq0000_lut[10])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<10>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[9]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[10]),
    .O(Mcompar_cnt_cmp_eq0000_cy[10])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<11>  (
    .I0(cnt[22]),
    .I1(count_to[22]),
    .I2(cnt[23]),
    .I3(count_to[23]),
    .O(Mcompar_cnt_cmp_eq0000_lut[11])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<11>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[10]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[11]),
    .O(Mcompar_cnt_cmp_eq0000_cy[11])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<12>  (
    .I0(cnt[24]),
    .I1(count_to[24]),
    .I2(cnt[25]),
    .I3(count_to[25]),
    .O(Mcompar_cnt_cmp_eq0000_lut[12])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<12>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[11]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[12]),
    .O(Mcompar_cnt_cmp_eq0000_cy[12])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<13>  (
    .I0(cnt[26]),
    .I1(count_to[26]),
    .I2(cnt[27]),
    .I3(count_to[27]),
    .O(Mcompar_cnt_cmp_eq0000_lut[13])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<13>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[12]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[13]),
    .O(Mcompar_cnt_cmp_eq0000_cy[13])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<14>  (
    .I0(cnt[28]),
    .I1(count_to[28]),
    .I2(cnt[29]),
    .I3(count_to[29]),
    .O(Mcompar_cnt_cmp_eq0000_lut[14])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<14>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[13]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[14]),
    .O(Mcompar_cnt_cmp_eq0000_cy[14])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_cnt_cmp_eq0000_lut<15>  (
    .I0(cnt[30]),
    .I1(count_to[30]),
    .I2(cnt[31]),
    .I3(count_to[31]),
    .O(Mcompar_cnt_cmp_eq0000_lut[15])
  );
  MUXCY   \Mcompar_cnt_cmp_eq0000_cy<15>  (
    .CI(Mcompar_cnt_cmp_eq0000_cy[14]),
    .DI(Msub_count_to_minus_one_sub0000_cy[0]),
    .S(Mcompar_cnt_cmp_eq0000_lut[15]),
    .O(Mcompar_cnt_cmp_eq0000_cy[15])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<0>  (
    .I0(cnt[0]),
    .I1(count_to_minus_one[0]),
    .I2(cnt[1]),
    .I3(count_to_minus_one[1]),
    .O(Mcompar_last_cmp_ne0000_lut[0])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<0>  (
    .CI(Msub_count_to_minus_one_sub0000_cy[0]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[0]),
    .O(Mcompar_last_cmp_ne0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<1>  (
    .I0(cnt[2]),
    .I1(count_to_minus_one[2]),
    .I2(cnt[3]),
    .I3(count_to_minus_one[3]),
    .O(Mcompar_last_cmp_ne0000_lut[1])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<1>  (
    .CI(Mcompar_last_cmp_ne0000_cy[0]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[1]),
    .O(Mcompar_last_cmp_ne0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<2>  (
    .I0(cnt[4]),
    .I1(count_to_minus_one[4]),
    .I2(cnt[5]),
    .I3(count_to_minus_one[5]),
    .O(Mcompar_last_cmp_ne0000_lut[2])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<2>  (
    .CI(Mcompar_last_cmp_ne0000_cy[1]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[2]),
    .O(Mcompar_last_cmp_ne0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<3>  (
    .I0(cnt[6]),
    .I1(count_to_minus_one[6]),
    .I2(cnt[7]),
    .I3(count_to_minus_one[7]),
    .O(Mcompar_last_cmp_ne0000_lut[3])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<3>  (
    .CI(Mcompar_last_cmp_ne0000_cy[2]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[3]),
    .O(Mcompar_last_cmp_ne0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<4>  (
    .I0(cnt[8]),
    .I1(count_to_minus_one[8]),
    .I2(cnt[9]),
    .I3(count_to_minus_one[9]),
    .O(Mcompar_last_cmp_ne0000_lut[4])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<4>  (
    .CI(Mcompar_last_cmp_ne0000_cy[3]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[4]),
    .O(Mcompar_last_cmp_ne0000_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<5>  (
    .I0(cnt[10]),
    .I1(count_to_minus_one[10]),
    .I2(cnt[11]),
    .I3(count_to_minus_one[11]),
    .O(Mcompar_last_cmp_ne0000_lut[5])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<5>  (
    .CI(Mcompar_last_cmp_ne0000_cy[4]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[5]),
    .O(Mcompar_last_cmp_ne0000_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<6>  (
    .I0(cnt[12]),
    .I1(count_to_minus_one[12]),
    .I2(cnt[13]),
    .I3(count_to_minus_one[13]),
    .O(Mcompar_last_cmp_ne0000_lut[6])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<6>  (
    .CI(Mcompar_last_cmp_ne0000_cy[5]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[6]),
    .O(Mcompar_last_cmp_ne0000_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<7>  (
    .I0(cnt[14]),
    .I1(count_to_minus_one[14]),
    .I2(cnt[15]),
    .I3(count_to_minus_one[15]),
    .O(Mcompar_last_cmp_ne0000_lut[7])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<7>  (
    .CI(Mcompar_last_cmp_ne0000_cy[6]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[7]),
    .O(Mcompar_last_cmp_ne0000_cy[7])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<8>  (
    .I0(cnt[16]),
    .I1(count_to_minus_one[16]),
    .I2(cnt[17]),
    .I3(count_to_minus_one[17]),
    .O(Mcompar_last_cmp_ne0000_lut[8])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<8>  (
    .CI(Mcompar_last_cmp_ne0000_cy[7]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[8]),
    .O(Mcompar_last_cmp_ne0000_cy[8])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<9>  (
    .I0(cnt[18]),
    .I1(count_to_minus_one[18]),
    .I2(cnt[19]),
    .I3(count_to_minus_one[19]),
    .O(Mcompar_last_cmp_ne0000_lut[9])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<9>  (
    .CI(Mcompar_last_cmp_ne0000_cy[8]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[9]),
    .O(Mcompar_last_cmp_ne0000_cy[9])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<10>  (
    .I0(cnt[20]),
    .I1(count_to_minus_one[20]),
    .I2(cnt[21]),
    .I3(count_to_minus_one[21]),
    .O(Mcompar_last_cmp_ne0000_lut[10])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<10>  (
    .CI(Mcompar_last_cmp_ne0000_cy[9]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[10]),
    .O(Mcompar_last_cmp_ne0000_cy[10])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<11>  (
    .I0(cnt[22]),
    .I1(count_to_minus_one[22]),
    .I2(cnt[23]),
    .I3(count_to_minus_one[23]),
    .O(Mcompar_last_cmp_ne0000_lut[11])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<11>  (
    .CI(Mcompar_last_cmp_ne0000_cy[10]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[11]),
    .O(Mcompar_last_cmp_ne0000_cy[11])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<12>  (
    .I0(cnt[24]),
    .I1(count_to_minus_one[24]),
    .I2(cnt[25]),
    .I3(count_to_minus_one[25]),
    .O(Mcompar_last_cmp_ne0000_lut[12])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<12>  (
    .CI(Mcompar_last_cmp_ne0000_cy[11]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[12]),
    .O(Mcompar_last_cmp_ne0000_cy[12])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<13>  (
    .I0(cnt[26]),
    .I1(count_to_minus_one[26]),
    .I2(cnt[27]),
    .I3(count_to_minus_one[27]),
    .O(Mcompar_last_cmp_ne0000_lut[13])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<13>  (
    .CI(Mcompar_last_cmp_ne0000_cy[12]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[13]),
    .O(Mcompar_last_cmp_ne0000_cy[13])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<14>  (
    .I0(cnt[28]),
    .I1(count_to_minus_one[28]),
    .I2(cnt[29]),
    .I3(count_to_minus_one[29]),
    .O(Mcompar_last_cmp_ne0000_lut[14])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<14>  (
    .CI(Mcompar_last_cmp_ne0000_cy[13]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[14]),
    .O(Mcompar_last_cmp_ne0000_cy[14])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_last_cmp_ne0000_lut<15>  (
    .I0(cnt[30]),
    .I1(count_to_minus_one[30]),
    .I2(cnt[31]),
    .I3(count_to_minus_one[31]),
    .O(Mcompar_last_cmp_ne0000_lut[15])
  );
  MUXCY   \Mcompar_last_cmp_ne0000_cy<15>  (
    .CI(Mcompar_last_cmp_ne0000_cy[14]),
    .DI(N1),
    .S(Mcompar_last_cmp_ne0000_lut[15]),
    .O(Mcompar_last_cmp_ne0000_cy[15])
  );
  pulsator   microsecond (
    .clk(clk),
    .start(start),
    .rst(rst),
    .last(last_2287),
    .pulse(pulse)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_done_mux00001 (
    .I0(cnt_en_2156),
    .I1(start),
    .O(count_done_mux0000)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  count_done_not00011 (
    .I0(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I1(cnt_en_2156),
    .I2(start),
    .O(count_done_not0001)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  cnt_en_not00011 (
    .I0(start),
    .I1(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I2(cnt_en_2156),
    .O(cnt_en_not0001)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  cnt_not00011 (
    .I0(cnt_en_2156),
    .I1(pulse),
    .I2(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I3(start),
    .O(cnt_not0001)
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  last_and0000 (
    .I0(Mcompar_cnt_cmp_eq0000_cy[15]),
    .I1(start),
    .I2(N0),
    .I3(Mcompar_last_cmp_ne0000_cy[15]),
    .O(last_and0000_2288)
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<1>_INV_0  (
    .I(count_to[1]),
    .O(Msub_count_to_minus_one_sub0000_lut[1])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<2>_INV_0  (
    .I(count_to[2]),
    .O(Msub_count_to_minus_one_sub0000_lut[2])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<3>_INV_0  (
    .I(count_to[3]),
    .O(Msub_count_to_minus_one_sub0000_lut[3])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<4>_INV_0  (
    .I(count_to[4]),
    .O(Msub_count_to_minus_one_sub0000_lut[4])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<5>_INV_0  (
    .I(count_to[5]),
    .O(Msub_count_to_minus_one_sub0000_lut[5])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<6>_INV_0  (
    .I(count_to[6]),
    .O(Msub_count_to_minus_one_sub0000_lut[6])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<7>_INV_0  (
    .I(count_to[7]),
    .O(Msub_count_to_minus_one_sub0000_lut[7])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<8>_INV_0  (
    .I(count_to[8]),
    .O(Msub_count_to_minus_one_sub0000_lut[8])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<9>_INV_0  (
    .I(count_to[9]),
    .O(Msub_count_to_minus_one_sub0000_lut[9])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<10>_INV_0  (
    .I(count_to[10]),
    .O(Msub_count_to_minus_one_sub0000_lut[10])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<11>_INV_0  (
    .I(count_to[11]),
    .O(Msub_count_to_minus_one_sub0000_lut[11])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<12>_INV_0  (
    .I(count_to[12]),
    .O(Msub_count_to_minus_one_sub0000_lut[12])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<13>_INV_0  (
    .I(count_to[13]),
    .O(Msub_count_to_minus_one_sub0000_lut[13])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<14>_INV_0  (
    .I(count_to[14]),
    .O(Msub_count_to_minus_one_sub0000_lut[14])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<15>_INV_0  (
    .I(count_to[15]),
    .O(Msub_count_to_minus_one_sub0000_lut[15])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<16>_INV_0  (
    .I(count_to[16]),
    .O(Msub_count_to_minus_one_sub0000_lut[16])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<17>_INV_0  (
    .I(count_to[17]),
    .O(Msub_count_to_minus_one_sub0000_lut[17])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<18>_INV_0  (
    .I(count_to[18]),
    .O(Msub_count_to_minus_one_sub0000_lut[18])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<19>_INV_0  (
    .I(count_to[19]),
    .O(Msub_count_to_minus_one_sub0000_lut[19])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<20>_INV_0  (
    .I(count_to[20]),
    .O(Msub_count_to_minus_one_sub0000_lut[20])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<21>_INV_0  (
    .I(count_to[21]),
    .O(Msub_count_to_minus_one_sub0000_lut[21])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<22>_INV_0  (
    .I(count_to[22]),
    .O(Msub_count_to_minus_one_sub0000_lut[22])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<23>_INV_0  (
    .I(count_to[23]),
    .O(Msub_count_to_minus_one_sub0000_lut[23])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<24>_INV_0  (
    .I(count_to[24]),
    .O(Msub_count_to_minus_one_sub0000_lut[24])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<25>_INV_0  (
    .I(count_to[25]),
    .O(Msub_count_to_minus_one_sub0000_lut[25])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<26>_INV_0  (
    .I(count_to[26]),
    .O(Msub_count_to_minus_one_sub0000_lut[26])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<27>_INV_0  (
    .I(count_to[27]),
    .O(Msub_count_to_minus_one_sub0000_lut[27])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<28>_INV_0  (
    .I(count_to[28]),
    .O(Msub_count_to_minus_one_sub0000_lut[28])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<29>_INV_0  (
    .I(count_to[29]),
    .O(Msub_count_to_minus_one_sub0000_lut[29])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<30>_INV_0  (
    .I(count_to[30]),
    .O(Msub_count_to_minus_one_sub0000_lut[30])
  );
  INV   \Msub_count_to_minus_one_sub0000_lut<31>_INV_0  (
    .I(count_to[31]),
    .O(Msub_count_to_minus_one_sub0000_lut[31])
  );
  INV   last_mux00001_INV_0 (
    .I(Mcompar_cnt_cmp_eq0000_cy[15]),
    .O(last_mux0000)
  );
  INV   start_inv1_INV_0 (
    .I(start),
    .O(start_inv)
  );
  LUT2_L #(
    .INIT ( 4'hD ))
  last_and0000_SW0 (
    .I0(cnt_en_2156),
    .I1(rst),
    .LO(N0)
  );
endmodule

module jitter_timer_jitter_timer (
  clk, rled, soc, time_out_end, time_to_soc, time_valid, rst, preq, send_done, relative_time, max_jitter
);
  input clk;
  output rled;
  input soc;
  output time_out_end;
  output time_to_soc;
  input time_valid;
  input rst;
  input preq;
  input send_done;
  input [63 : 0] relative_time;
  input [31 : 0] max_jitter;
  wire \Mcount_time_out_counter_cy<0>_rt_2788 ;
  wire Mcount_time_out_counter_eqn_0;
  wire Mcount_time_out_counter_eqn_1;
  wire Mcount_time_out_counter_eqn_10;
  wire Mcount_time_out_counter_eqn_11;
  wire Mcount_time_out_counter_eqn_12;
  wire Mcount_time_out_counter_eqn_13;
  wire Mcount_time_out_counter_eqn_14;
  wire Mcount_time_out_counter_eqn_15;
  wire Mcount_time_out_counter_eqn_16;
  wire Mcount_time_out_counter_eqn_17;
  wire Mcount_time_out_counter_eqn_18;
  wire Mcount_time_out_counter_eqn_19;
  wire Mcount_time_out_counter_eqn_2;
  wire Mcount_time_out_counter_eqn_20;
  wire Mcount_time_out_counter_eqn_21;
  wire Mcount_time_out_counter_eqn_22;
  wire Mcount_time_out_counter_eqn_23;
  wire Mcount_time_out_counter_eqn_24;
  wire Mcount_time_out_counter_eqn_25;
  wire Mcount_time_out_counter_eqn_26;
  wire Mcount_time_out_counter_eqn_27;
  wire Mcount_time_out_counter_eqn_28;
  wire Mcount_time_out_counter_eqn_29;
  wire Mcount_time_out_counter_eqn_3;
  wire Mcount_time_out_counter_eqn_30;
  wire Mcount_time_out_counter_eqn_31;
  wire Mcount_time_out_counter_eqn_4;
  wire Mcount_time_out_counter_eqn_5;
  wire Mcount_time_out_counter_eqn_6;
  wire Mcount_time_out_counter_eqn_7;
  wire Mcount_time_out_counter_eqn_8;
  wire Mcount_time_out_counter_eqn_9;
  wire N1;
  wire _and0000;
  wire _or0000;
  wire cnt_done;
  wire preq_prev_3303;
  wire preq_was_3304;
  wire preq_was_mux0000;
  wire preq_was_not0001;
  wire rst_cnt_3372;
  wire rst_cnt_done;
  wire rst_cnt_mux0000;
  wire start_cnt_3377;
  wire start_cnt_mux0000;
  wire state_1_1_3381;
  wire time_out_counter_not0001;
  wire time_out_counter_or0000;
  wire time_to_soc_mux0000;
  wire time_to_soc_not0001;
  wire [31 : 0] Mcompar_state_cmp_eq0004_cy;
  wire [31 : 0] Mcompar_state_cmp_eq0004_lut;
  wire [30 : 0] Mcount_time_out_counter_cy;
  wire [31 : 1] Mcount_time_out_counter_lut;
  wire [62 : 0] Msub_cycle_time_sub0000_cy;
  wire [63 : 0] Msub_cycle_time_sub0000_lut;
  wire [31 : 0] Result;
  wire [31 : 0] cnt;
  wire [31 : 0] cnt_mux0000;
  wire [63 : 0] cycle_time;
  wire [63 : 0] cycle_time_prev;
  wire [63 : 0] cycle_time_sub0000;
  wire [0 : 0] state;
  wire [1 : 1] NlwRenamedSig_OI_state;
  wire [0 : 0] state_mux0000;
  wire [63 : 0] time_now;
  wire [31 : 0] time_out_counter;
  wire [6 : 0] time_out_counter_or0000_wg_cy;
  wire [7 : 0] time_out_counter_or0000_wg_lut;
  wire [6 : 0] time_out_end_wg_cy;
  wire [7 : 0] time_out_end_wg_lut;
  wire [63 : 0] time_prev;
  assign
    rled = NlwRenamedSig_OI_state[1];
  GND   XST_GND (
    .G(state[0])
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   time_to_soc_1474 (
    .C(clk),
    .CE(time_to_soc_not0001),
    .CLR(rst),
    .D(time_to_soc_mux0000),
    .Q(time_to_soc)
  );
  FDCE   preq_was (
    .C(clk),
    .CE(preq_was_not0001),
    .CLR(rst),
    .D(preq_was_mux0000),
    .Q(preq_was_3304)
  );
  FDC   state_1 (
    .C(clk),
    .CLR(rst),
    .D(state_mux0000[0]),
    .Q(NlwRenamedSig_OI_state[1])
  );
  FDC   cnt_0 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[0]),
    .Q(cnt[0])
  );
  FDC   cnt_1 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[1]),
    .Q(cnt[1])
  );
  FDC   cnt_2 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[2]),
    .Q(cnt[2])
  );
  FDC   cnt_3 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[3]),
    .Q(cnt[3])
  );
  FDC   cnt_4 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[4]),
    .Q(cnt[4])
  );
  FDC   cnt_5 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[5]),
    .Q(cnt[5])
  );
  FDC   cnt_6 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[6]),
    .Q(cnt[6])
  );
  FDC   cnt_7 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[7]),
    .Q(cnt[7])
  );
  FDC   cnt_8 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[8]),
    .Q(cnt[8])
  );
  FDC   cnt_9 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[9]),
    .Q(cnt[9])
  );
  FDC   cnt_10 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[10]),
    .Q(cnt[10])
  );
  FDC   cnt_11 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[11]),
    .Q(cnt[11])
  );
  FDC   cnt_12 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[12]),
    .Q(cnt[12])
  );
  FDC   cnt_13 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[13]),
    .Q(cnt[13])
  );
  FDC   cnt_14 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[14]),
    .Q(cnt[14])
  );
  FDC   cnt_15 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[15]),
    .Q(cnt[15])
  );
  FDC   cnt_16 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[16]),
    .Q(cnt[16])
  );
  FDC   cnt_17 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[17]),
    .Q(cnt[17])
  );
  FDC   cnt_18 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[18]),
    .Q(cnt[18])
  );
  FDC   cnt_19 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[19]),
    .Q(cnt[19])
  );
  FDC   cnt_20 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[20]),
    .Q(cnt[20])
  );
  FDC   cnt_21 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[21]),
    .Q(cnt[21])
  );
  FDC   cnt_22 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[22]),
    .Q(cnt[22])
  );
  FDC   cnt_23 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[23]),
    .Q(cnt[23])
  );
  FDC   cnt_24 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[24]),
    .Q(cnt[24])
  );
  FDC   cnt_25 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[25]),
    .Q(cnt[25])
  );
  FDC   cnt_26 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[26]),
    .Q(cnt[26])
  );
  FDC   cnt_27 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[27]),
    .Q(cnt[27])
  );
  FDC   cnt_28 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[28]),
    .Q(cnt[28])
  );
  FDC   cnt_29 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[29]),
    .Q(cnt[29])
  );
  FDC   cnt_30 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[30]),
    .Q(cnt[30])
  );
  FDC   cnt_31 (
    .C(clk),
    .CLR(rst),
    .D(cnt_mux0000[31]),
    .Q(cnt[31])
  );
  FDC   start_cnt (
    .C(clk),
    .CLR(rst),
    .D(start_cnt_mux0000),
    .Q(start_cnt_3377)
  );
  FDC   rst_cnt (
    .C(clk),
    .CLR(rst),
    .D(rst_cnt_mux0000),
    .Q(rst_cnt_3372)
  );
  FDCE   time_now_0 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[0]),
    .Q(time_now[0])
  );
  FDCE   time_now_1 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[1]),
    .Q(time_now[1])
  );
  FDCE   time_now_2 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[2]),
    .Q(time_now[2])
  );
  FDCE   time_now_3 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[3]),
    .Q(time_now[3])
  );
  FDCE   time_now_4 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[4]),
    .Q(time_now[4])
  );
  FDCE   time_now_5 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[5]),
    .Q(time_now[5])
  );
  FDCE   time_now_6 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[6]),
    .Q(time_now[6])
  );
  FDCE   time_now_7 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[7]),
    .Q(time_now[7])
  );
  FDCE   time_now_8 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[8]),
    .Q(time_now[8])
  );
  FDCE   time_now_9 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[9]),
    .Q(time_now[9])
  );
  FDCE   time_now_10 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[10]),
    .Q(time_now[10])
  );
  FDCE   time_now_11 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[11]),
    .Q(time_now[11])
  );
  FDCE   time_now_12 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[12]),
    .Q(time_now[12])
  );
  FDCE   time_now_13 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[13]),
    .Q(time_now[13])
  );
  FDCE   time_now_14 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[14]),
    .Q(time_now[14])
  );
  FDCE   time_now_15 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[15]),
    .Q(time_now[15])
  );
  FDCE   time_now_16 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[16]),
    .Q(time_now[16])
  );
  FDCE   time_now_17 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[17]),
    .Q(time_now[17])
  );
  FDCE   time_now_18 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[18]),
    .Q(time_now[18])
  );
  FDCE   time_now_19 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[19]),
    .Q(time_now[19])
  );
  FDCE   time_now_20 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[20]),
    .Q(time_now[20])
  );
  FDCE   time_now_21 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[21]),
    .Q(time_now[21])
  );
  FDCE   time_now_22 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[22]),
    .Q(time_now[22])
  );
  FDCE   time_now_23 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[23]),
    .Q(time_now[23])
  );
  FDCE   time_now_24 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[24]),
    .Q(time_now[24])
  );
  FDCE   time_now_25 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[25]),
    .Q(time_now[25])
  );
  FDCE   time_now_26 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[26]),
    .Q(time_now[26])
  );
  FDCE   time_now_27 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[27]),
    .Q(time_now[27])
  );
  FDCE   time_now_28 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[28]),
    .Q(time_now[28])
  );
  FDCE   time_now_29 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[29]),
    .Q(time_now[29])
  );
  FDCE   time_now_30 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[30]),
    .Q(time_now[30])
  );
  FDCE   time_now_31 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[31]),
    .Q(time_now[31])
  );
  FDCE   time_now_32 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[32]),
    .Q(time_now[32])
  );
  FDCE   time_now_33 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[33]),
    .Q(time_now[33])
  );
  FDCE   time_now_34 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[34]),
    .Q(time_now[34])
  );
  FDCE   time_now_35 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[35]),
    .Q(time_now[35])
  );
  FDCE   time_now_36 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[36]),
    .Q(time_now[36])
  );
  FDCE   time_now_37 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[37]),
    .Q(time_now[37])
  );
  FDCE   time_now_38 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[38]),
    .Q(time_now[38])
  );
  FDCE   time_now_39 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[39]),
    .Q(time_now[39])
  );
  FDCE   time_now_40 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[40]),
    .Q(time_now[40])
  );
  FDCE   time_now_41 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[41]),
    .Q(time_now[41])
  );
  FDCE   time_now_42 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[42]),
    .Q(time_now[42])
  );
  FDCE   time_now_43 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[43]),
    .Q(time_now[43])
  );
  FDCE   time_now_44 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[44]),
    .Q(time_now[44])
  );
  FDCE   time_now_45 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[45]),
    .Q(time_now[45])
  );
  FDCE   time_now_46 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[46]),
    .Q(time_now[46])
  );
  FDCE   time_now_47 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[47]),
    .Q(time_now[47])
  );
  FDCE   time_now_48 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[48]),
    .Q(time_now[48])
  );
  FDCE   time_now_49 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[49]),
    .Q(time_now[49])
  );
  FDCE   time_now_50 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[50]),
    .Q(time_now[50])
  );
  FDCE   time_now_51 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[51]),
    .Q(time_now[51])
  );
  FDCE   time_now_52 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[52]),
    .Q(time_now[52])
  );
  FDCE   time_now_53 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[53]),
    .Q(time_now[53])
  );
  FDCE   time_now_54 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[54]),
    .Q(time_now[54])
  );
  FDCE   time_now_55 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[55]),
    .Q(time_now[55])
  );
  FDCE   time_now_56 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[56]),
    .Q(time_now[56])
  );
  FDCE   time_now_57 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[57]),
    .Q(time_now[57])
  );
  FDCE   time_now_58 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[58]),
    .Q(time_now[58])
  );
  FDCE   time_now_59 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[59]),
    .Q(time_now[59])
  );
  FDCE   time_now_60 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[60]),
    .Q(time_now[60])
  );
  FDCE   time_now_61 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[61]),
    .Q(time_now[61])
  );
  FDCE   time_now_62 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[62]),
    .Q(time_now[62])
  );
  FDCE   time_now_63 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(relative_time[63]),
    .Q(time_now[63])
  );
  FDCE   preq_prev (
    .C(clk),
    .CE(soc),
    .CLR(rst),
    .D(preq_was_3304),
    .Q(preq_prev_3303)
  );
  FDCE   time_prev_0 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[0]),
    .Q(time_prev[0])
  );
  FDCE   time_prev_1 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[1]),
    .Q(time_prev[1])
  );
  FDCE   time_prev_2 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[2]),
    .Q(time_prev[2])
  );
  FDCE   time_prev_3 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[3]),
    .Q(time_prev[3])
  );
  FDCE   time_prev_4 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[4]),
    .Q(time_prev[4])
  );
  FDCE   time_prev_5 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[5]),
    .Q(time_prev[5])
  );
  FDCE   time_prev_6 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[6]),
    .Q(time_prev[6])
  );
  FDCE   time_prev_7 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[7]),
    .Q(time_prev[7])
  );
  FDCE   time_prev_8 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[8]),
    .Q(time_prev[8])
  );
  FDCE   time_prev_9 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[9]),
    .Q(time_prev[9])
  );
  FDCE   time_prev_10 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[10]),
    .Q(time_prev[10])
  );
  FDCE   time_prev_11 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[11]),
    .Q(time_prev[11])
  );
  FDCE   time_prev_12 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[12]),
    .Q(time_prev[12])
  );
  FDCE   time_prev_13 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[13]),
    .Q(time_prev[13])
  );
  FDCE   time_prev_14 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[14]),
    .Q(time_prev[14])
  );
  FDCE   time_prev_15 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[15]),
    .Q(time_prev[15])
  );
  FDCE   time_prev_16 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[16]),
    .Q(time_prev[16])
  );
  FDCE   time_prev_17 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[17]),
    .Q(time_prev[17])
  );
  FDCE   time_prev_18 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[18]),
    .Q(time_prev[18])
  );
  FDCE   time_prev_19 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[19]),
    .Q(time_prev[19])
  );
  FDCE   time_prev_20 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[20]),
    .Q(time_prev[20])
  );
  FDCE   time_prev_21 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[21]),
    .Q(time_prev[21])
  );
  FDCE   time_prev_22 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[22]),
    .Q(time_prev[22])
  );
  FDCE   time_prev_23 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[23]),
    .Q(time_prev[23])
  );
  FDCE   time_prev_24 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[24]),
    .Q(time_prev[24])
  );
  FDCE   time_prev_25 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[25]),
    .Q(time_prev[25])
  );
  FDCE   time_prev_26 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[26]),
    .Q(time_prev[26])
  );
  FDCE   time_prev_27 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[27]),
    .Q(time_prev[27])
  );
  FDCE   time_prev_28 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[28]),
    .Q(time_prev[28])
  );
  FDCE   time_prev_29 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[29]),
    .Q(time_prev[29])
  );
  FDCE   time_prev_30 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[30]),
    .Q(time_prev[30])
  );
  FDCE   time_prev_31 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[31]),
    .Q(time_prev[31])
  );
  FDCE   time_prev_32 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[32]),
    .Q(time_prev[32])
  );
  FDCE   time_prev_33 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[33]),
    .Q(time_prev[33])
  );
  FDCE   time_prev_34 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[34]),
    .Q(time_prev[34])
  );
  FDCE   time_prev_35 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[35]),
    .Q(time_prev[35])
  );
  FDCE   time_prev_36 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[36]),
    .Q(time_prev[36])
  );
  FDCE   time_prev_37 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[37]),
    .Q(time_prev[37])
  );
  FDCE   time_prev_38 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[38]),
    .Q(time_prev[38])
  );
  FDCE   time_prev_39 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[39]),
    .Q(time_prev[39])
  );
  FDCE   time_prev_40 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[40]),
    .Q(time_prev[40])
  );
  FDCE   time_prev_41 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[41]),
    .Q(time_prev[41])
  );
  FDCE   time_prev_42 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[42]),
    .Q(time_prev[42])
  );
  FDCE   time_prev_43 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[43]),
    .Q(time_prev[43])
  );
  FDCE   time_prev_44 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[44]),
    .Q(time_prev[44])
  );
  FDCE   time_prev_45 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[45]),
    .Q(time_prev[45])
  );
  FDCE   time_prev_46 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[46]),
    .Q(time_prev[46])
  );
  FDCE   time_prev_47 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[47]),
    .Q(time_prev[47])
  );
  FDCE   time_prev_48 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[48]),
    .Q(time_prev[48])
  );
  FDCE   time_prev_49 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[49]),
    .Q(time_prev[49])
  );
  FDCE   time_prev_50 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[50]),
    .Q(time_prev[50])
  );
  FDCE   time_prev_51 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[51]),
    .Q(time_prev[51])
  );
  FDCE   time_prev_52 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[52]),
    .Q(time_prev[52])
  );
  FDCE   time_prev_53 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[53]),
    .Q(time_prev[53])
  );
  FDCE   time_prev_54 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[54]),
    .Q(time_prev[54])
  );
  FDCE   time_prev_55 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[55]),
    .Q(time_prev[55])
  );
  FDCE   time_prev_56 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[56]),
    .Q(time_prev[56])
  );
  FDCE   time_prev_57 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[57]),
    .Q(time_prev[57])
  );
  FDCE   time_prev_58 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[58]),
    .Q(time_prev[58])
  );
  FDCE   time_prev_59 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[59]),
    .Q(time_prev[59])
  );
  FDCE   time_prev_60 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[60]),
    .Q(time_prev[60])
  );
  FDCE   time_prev_61 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[61]),
    .Q(time_prev[61])
  );
  FDCE   time_prev_62 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[62]),
    .Q(time_prev[62])
  );
  FDCE   time_prev_63 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(time_now[63]),
    .Q(time_prev[63])
  );
  FDC   cycle_time_0 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[0]),
    .Q(cycle_time[0])
  );
  FDC   cycle_time_1 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[1]),
    .Q(cycle_time[1])
  );
  FDC   cycle_time_2 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[2]),
    .Q(cycle_time[2])
  );
  FDC   cycle_time_3 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[3]),
    .Q(cycle_time[3])
  );
  FDC   cycle_time_4 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[4]),
    .Q(cycle_time[4])
  );
  FDC   cycle_time_5 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[5]),
    .Q(cycle_time[5])
  );
  FDC   cycle_time_6 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[6]),
    .Q(cycle_time[6])
  );
  FDC   cycle_time_7 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[7]),
    .Q(cycle_time[7])
  );
  FDC   cycle_time_8 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[8]),
    .Q(cycle_time[8])
  );
  FDC   cycle_time_9 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[9]),
    .Q(cycle_time[9])
  );
  FDC   cycle_time_10 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[10]),
    .Q(cycle_time[10])
  );
  FDC   cycle_time_11 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[11]),
    .Q(cycle_time[11])
  );
  FDC   cycle_time_12 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[12]),
    .Q(cycle_time[12])
  );
  FDC   cycle_time_13 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[13]),
    .Q(cycle_time[13])
  );
  FDC   cycle_time_14 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[14]),
    .Q(cycle_time[14])
  );
  FDC   cycle_time_15 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[15]),
    .Q(cycle_time[15])
  );
  FDC   cycle_time_16 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[16]),
    .Q(cycle_time[16])
  );
  FDC   cycle_time_17 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[17]),
    .Q(cycle_time[17])
  );
  FDC   cycle_time_18 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[18]),
    .Q(cycle_time[18])
  );
  FDC   cycle_time_19 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[19]),
    .Q(cycle_time[19])
  );
  FDC   cycle_time_20 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[20]),
    .Q(cycle_time[20])
  );
  FDC   cycle_time_21 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[21]),
    .Q(cycle_time[21])
  );
  FDC   cycle_time_22 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[22]),
    .Q(cycle_time[22])
  );
  FDC   cycle_time_23 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[23]),
    .Q(cycle_time[23])
  );
  FDC   cycle_time_24 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[24]),
    .Q(cycle_time[24])
  );
  FDC   cycle_time_25 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[25]),
    .Q(cycle_time[25])
  );
  FDC   cycle_time_26 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[26]),
    .Q(cycle_time[26])
  );
  FDC   cycle_time_27 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[27]),
    .Q(cycle_time[27])
  );
  FDC   cycle_time_28 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[28]),
    .Q(cycle_time[28])
  );
  FDC   cycle_time_29 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[29]),
    .Q(cycle_time[29])
  );
  FDC   cycle_time_30 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[30]),
    .Q(cycle_time[30])
  );
  FDC   cycle_time_31 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[31]),
    .Q(cycle_time[31])
  );
  FDC   cycle_time_32 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[32]),
    .Q(cycle_time[32])
  );
  FDC   cycle_time_33 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[33]),
    .Q(cycle_time[33])
  );
  FDC   cycle_time_34 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[34]),
    .Q(cycle_time[34])
  );
  FDC   cycle_time_35 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[35]),
    .Q(cycle_time[35])
  );
  FDC   cycle_time_36 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[36]),
    .Q(cycle_time[36])
  );
  FDC   cycle_time_37 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[37]),
    .Q(cycle_time[37])
  );
  FDC   cycle_time_38 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[38]),
    .Q(cycle_time[38])
  );
  FDC   cycle_time_39 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[39]),
    .Q(cycle_time[39])
  );
  FDC   cycle_time_40 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[40]),
    .Q(cycle_time[40])
  );
  FDC   cycle_time_41 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[41]),
    .Q(cycle_time[41])
  );
  FDC   cycle_time_42 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[42]),
    .Q(cycle_time[42])
  );
  FDC   cycle_time_43 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[43]),
    .Q(cycle_time[43])
  );
  FDC   cycle_time_44 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[44]),
    .Q(cycle_time[44])
  );
  FDC   cycle_time_45 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[45]),
    .Q(cycle_time[45])
  );
  FDC   cycle_time_46 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[46]),
    .Q(cycle_time[46])
  );
  FDC   cycle_time_47 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[47]),
    .Q(cycle_time[47])
  );
  FDC   cycle_time_48 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[48]),
    .Q(cycle_time[48])
  );
  FDC   cycle_time_49 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[49]),
    .Q(cycle_time[49])
  );
  FDC   cycle_time_50 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[50]),
    .Q(cycle_time[50])
  );
  FDC   cycle_time_51 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[51]),
    .Q(cycle_time[51])
  );
  FDC   cycle_time_52 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[52]),
    .Q(cycle_time[52])
  );
  FDC   cycle_time_53 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[53]),
    .Q(cycle_time[53])
  );
  FDC   cycle_time_54 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[54]),
    .Q(cycle_time[54])
  );
  FDC   cycle_time_55 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[55]),
    .Q(cycle_time[55])
  );
  FDC   cycle_time_56 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[56]),
    .Q(cycle_time[56])
  );
  FDC   cycle_time_57 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[57]),
    .Q(cycle_time[57])
  );
  FDC   cycle_time_58 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[58]),
    .Q(cycle_time[58])
  );
  FDC   cycle_time_59 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[59]),
    .Q(cycle_time[59])
  );
  FDC   cycle_time_60 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[60]),
    .Q(cycle_time[60])
  );
  FDC   cycle_time_61 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[61]),
    .Q(cycle_time[61])
  );
  FDC   cycle_time_62 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[62]),
    .Q(cycle_time[62])
  );
  FDC   cycle_time_63 (
    .C(clk),
    .CLR(rst),
    .D(cycle_time_sub0000[63]),
    .Q(cycle_time[63])
  );
  FDCE   cycle_time_prev_0 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[0]),
    .Q(cycle_time_prev[0])
  );
  FDCE   cycle_time_prev_1 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[1]),
    .Q(cycle_time_prev[1])
  );
  FDCE   cycle_time_prev_2 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[2]),
    .Q(cycle_time_prev[2])
  );
  FDCE   cycle_time_prev_3 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[3]),
    .Q(cycle_time_prev[3])
  );
  FDCE   cycle_time_prev_4 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[4]),
    .Q(cycle_time_prev[4])
  );
  FDCE   cycle_time_prev_5 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[5]),
    .Q(cycle_time_prev[5])
  );
  FDCE   cycle_time_prev_6 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[6]),
    .Q(cycle_time_prev[6])
  );
  FDCE   cycle_time_prev_7 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[7]),
    .Q(cycle_time_prev[7])
  );
  FDCE   cycle_time_prev_8 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[8]),
    .Q(cycle_time_prev[8])
  );
  FDCE   cycle_time_prev_9 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[9]),
    .Q(cycle_time_prev[9])
  );
  FDCE   cycle_time_prev_10 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[10]),
    .Q(cycle_time_prev[10])
  );
  FDCE   cycle_time_prev_11 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[11]),
    .Q(cycle_time_prev[11])
  );
  FDCE   cycle_time_prev_12 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[12]),
    .Q(cycle_time_prev[12])
  );
  FDCE   cycle_time_prev_13 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[13]),
    .Q(cycle_time_prev[13])
  );
  FDCE   cycle_time_prev_14 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[14]),
    .Q(cycle_time_prev[14])
  );
  FDCE   cycle_time_prev_15 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[15]),
    .Q(cycle_time_prev[15])
  );
  FDCE   cycle_time_prev_16 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[16]),
    .Q(cycle_time_prev[16])
  );
  FDCE   cycle_time_prev_17 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[17]),
    .Q(cycle_time_prev[17])
  );
  FDCE   cycle_time_prev_18 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[18]),
    .Q(cycle_time_prev[18])
  );
  FDCE   cycle_time_prev_19 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[19]),
    .Q(cycle_time_prev[19])
  );
  FDCE   cycle_time_prev_20 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[20]),
    .Q(cycle_time_prev[20])
  );
  FDCE   cycle_time_prev_21 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[21]),
    .Q(cycle_time_prev[21])
  );
  FDCE   cycle_time_prev_22 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[22]),
    .Q(cycle_time_prev[22])
  );
  FDCE   cycle_time_prev_23 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[23]),
    .Q(cycle_time_prev[23])
  );
  FDCE   cycle_time_prev_24 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[24]),
    .Q(cycle_time_prev[24])
  );
  FDCE   cycle_time_prev_25 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[25]),
    .Q(cycle_time_prev[25])
  );
  FDCE   cycle_time_prev_26 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[26]),
    .Q(cycle_time_prev[26])
  );
  FDCE   cycle_time_prev_27 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[27]),
    .Q(cycle_time_prev[27])
  );
  FDCE   cycle_time_prev_28 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[28]),
    .Q(cycle_time_prev[28])
  );
  FDCE   cycle_time_prev_29 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[29]),
    .Q(cycle_time_prev[29])
  );
  FDCE   cycle_time_prev_30 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[30]),
    .Q(cycle_time_prev[30])
  );
  FDCE   cycle_time_prev_31 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[31]),
    .Q(cycle_time_prev[31])
  );
  FDCE   cycle_time_prev_32 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[32]),
    .Q(cycle_time_prev[32])
  );
  FDCE   cycle_time_prev_33 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[33]),
    .Q(cycle_time_prev[33])
  );
  FDCE   cycle_time_prev_34 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[34]),
    .Q(cycle_time_prev[34])
  );
  FDCE   cycle_time_prev_35 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[35]),
    .Q(cycle_time_prev[35])
  );
  FDCE   cycle_time_prev_36 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[36]),
    .Q(cycle_time_prev[36])
  );
  FDCE   cycle_time_prev_37 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[37]),
    .Q(cycle_time_prev[37])
  );
  FDCE   cycle_time_prev_38 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[38]),
    .Q(cycle_time_prev[38])
  );
  FDCE   cycle_time_prev_39 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[39]),
    .Q(cycle_time_prev[39])
  );
  FDCE   cycle_time_prev_40 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[40]),
    .Q(cycle_time_prev[40])
  );
  FDCE   cycle_time_prev_41 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[41]),
    .Q(cycle_time_prev[41])
  );
  FDCE   cycle_time_prev_42 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[42]),
    .Q(cycle_time_prev[42])
  );
  FDCE   cycle_time_prev_43 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[43]),
    .Q(cycle_time_prev[43])
  );
  FDCE   cycle_time_prev_44 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[44]),
    .Q(cycle_time_prev[44])
  );
  FDCE   cycle_time_prev_45 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[45]),
    .Q(cycle_time_prev[45])
  );
  FDCE   cycle_time_prev_46 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[46]),
    .Q(cycle_time_prev[46])
  );
  FDCE   cycle_time_prev_47 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[47]),
    .Q(cycle_time_prev[47])
  );
  FDCE   cycle_time_prev_48 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[48]),
    .Q(cycle_time_prev[48])
  );
  FDCE   cycle_time_prev_49 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[49]),
    .Q(cycle_time_prev[49])
  );
  FDCE   cycle_time_prev_50 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[50]),
    .Q(cycle_time_prev[50])
  );
  FDCE   cycle_time_prev_51 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[51]),
    .Q(cycle_time_prev[51])
  );
  FDCE   cycle_time_prev_52 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[52]),
    .Q(cycle_time_prev[52])
  );
  FDCE   cycle_time_prev_53 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[53]),
    .Q(cycle_time_prev[53])
  );
  FDCE   cycle_time_prev_54 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[54]),
    .Q(cycle_time_prev[54])
  );
  FDCE   cycle_time_prev_55 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[55]),
    .Q(cycle_time_prev[55])
  );
  FDCE   cycle_time_prev_56 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[56]),
    .Q(cycle_time_prev[56])
  );
  FDCE   cycle_time_prev_57 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[57]),
    .Q(cycle_time_prev[57])
  );
  FDCE   cycle_time_prev_58 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[58]),
    .Q(cycle_time_prev[58])
  );
  FDCE   cycle_time_prev_59 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[59]),
    .Q(cycle_time_prev[59])
  );
  FDCE   cycle_time_prev_60 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[60]),
    .Q(cycle_time_prev[60])
  );
  FDCE   cycle_time_prev_61 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[61]),
    .Q(cycle_time_prev[61])
  );
  FDCE   cycle_time_prev_62 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[62]),
    .Q(cycle_time_prev[62])
  );
  FDCE   cycle_time_prev_63 (
    .C(clk),
    .CE(time_valid),
    .CLR(rst),
    .D(cycle_time[63]),
    .Q(cycle_time_prev[63])
  );
  FDCE   time_out_counter_0 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_0),
    .Q(time_out_counter[0])
  );
  FDCE   time_out_counter_1 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_1),
    .Q(time_out_counter[1])
  );
  FDCE   time_out_counter_2 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_2),
    .Q(time_out_counter[2])
  );
  FDCE   time_out_counter_3 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_3),
    .Q(time_out_counter[3])
  );
  FDCE   time_out_counter_4 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_4),
    .Q(time_out_counter[4])
  );
  FDCE   time_out_counter_5 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_5),
    .Q(time_out_counter[5])
  );
  FDCE   time_out_counter_6 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_6),
    .Q(time_out_counter[6])
  );
  FDCE   time_out_counter_7 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_7),
    .Q(time_out_counter[7])
  );
  FDCE   time_out_counter_8 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_8),
    .Q(time_out_counter[8])
  );
  FDCE   time_out_counter_9 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_9),
    .Q(time_out_counter[9])
  );
  FDCE   time_out_counter_10 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_10),
    .Q(time_out_counter[10])
  );
  FDCE   time_out_counter_11 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_11),
    .Q(time_out_counter[11])
  );
  FDCE   time_out_counter_12 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_12),
    .Q(time_out_counter[12])
  );
  FDCE   time_out_counter_13 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_13),
    .Q(time_out_counter[13])
  );
  FDCE   time_out_counter_14 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_14),
    .Q(time_out_counter[14])
  );
  FDCE   time_out_counter_15 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_15),
    .Q(time_out_counter[15])
  );
  FDCE   time_out_counter_16 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_16),
    .Q(time_out_counter[16])
  );
  FDCE   time_out_counter_17 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_17),
    .Q(time_out_counter[17])
  );
  FDCE   time_out_counter_18 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_18),
    .Q(time_out_counter[18])
  );
  FDCE   time_out_counter_19 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_19),
    .Q(time_out_counter[19])
  );
  FDCE   time_out_counter_20 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_20),
    .Q(time_out_counter[20])
  );
  FDCE   time_out_counter_21 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_21),
    .Q(time_out_counter[21])
  );
  FDCE   time_out_counter_22 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_22),
    .Q(time_out_counter[22])
  );
  FDCE   time_out_counter_23 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_23),
    .Q(time_out_counter[23])
  );
  FDCE   time_out_counter_24 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_24),
    .Q(time_out_counter[24])
  );
  FDCE   time_out_counter_25 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_25),
    .Q(time_out_counter[25])
  );
  FDCE   time_out_counter_26 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_26),
    .Q(time_out_counter[26])
  );
  FDCE   time_out_counter_27 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_27),
    .Q(time_out_counter[27])
  );
  FDCE   time_out_counter_28 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_28),
    .Q(time_out_counter[28])
  );
  FDCE   time_out_counter_29 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_29),
    .Q(time_out_counter[29])
  );
  FDCE   time_out_counter_30 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_30),
    .Q(time_out_counter[30])
  );
  FDCE   time_out_counter_31 (
    .C(clk),
    .CE(time_out_counter_not0001),
    .CLR(rst),
    .D(Mcount_time_out_counter_eqn_31),
    .Q(time_out_counter[31])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<0>  (
    .I0(time_prev[0]),
    .I1(time_now[0]),
    .O(Msub_cycle_time_sub0000_lut[0])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<0>  (
    .CI(N1),
    .DI(time_now[0]),
    .S(Msub_cycle_time_sub0000_lut[0]),
    .O(Msub_cycle_time_sub0000_cy[0])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<0>  (
    .CI(N1),
    .LI(Msub_cycle_time_sub0000_lut[0]),
    .O(cycle_time_sub0000[0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<1>  (
    .I0(time_prev[1]),
    .I1(time_now[1]),
    .O(Msub_cycle_time_sub0000_lut[1])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<1>  (
    .CI(Msub_cycle_time_sub0000_cy[0]),
    .DI(time_now[1]),
    .S(Msub_cycle_time_sub0000_lut[1]),
    .O(Msub_cycle_time_sub0000_cy[1])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<1>  (
    .CI(Msub_cycle_time_sub0000_cy[0]),
    .LI(Msub_cycle_time_sub0000_lut[1]),
    .O(cycle_time_sub0000[1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<2>  (
    .I0(time_prev[2]),
    .I1(time_now[2]),
    .O(Msub_cycle_time_sub0000_lut[2])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<2>  (
    .CI(Msub_cycle_time_sub0000_cy[1]),
    .DI(time_now[2]),
    .S(Msub_cycle_time_sub0000_lut[2]),
    .O(Msub_cycle_time_sub0000_cy[2])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<2>  (
    .CI(Msub_cycle_time_sub0000_cy[1]),
    .LI(Msub_cycle_time_sub0000_lut[2]),
    .O(cycle_time_sub0000[2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<3>  (
    .I0(time_prev[3]),
    .I1(time_now[3]),
    .O(Msub_cycle_time_sub0000_lut[3])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<3>  (
    .CI(Msub_cycle_time_sub0000_cy[2]),
    .DI(time_now[3]),
    .S(Msub_cycle_time_sub0000_lut[3]),
    .O(Msub_cycle_time_sub0000_cy[3])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<3>  (
    .CI(Msub_cycle_time_sub0000_cy[2]),
    .LI(Msub_cycle_time_sub0000_lut[3]),
    .O(cycle_time_sub0000[3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<4>  (
    .I0(time_prev[4]),
    .I1(time_now[4]),
    .O(Msub_cycle_time_sub0000_lut[4])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<4>  (
    .CI(Msub_cycle_time_sub0000_cy[3]),
    .DI(time_now[4]),
    .S(Msub_cycle_time_sub0000_lut[4]),
    .O(Msub_cycle_time_sub0000_cy[4])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<4>  (
    .CI(Msub_cycle_time_sub0000_cy[3]),
    .LI(Msub_cycle_time_sub0000_lut[4]),
    .O(cycle_time_sub0000[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<5>  (
    .I0(time_prev[5]),
    .I1(time_now[5]),
    .O(Msub_cycle_time_sub0000_lut[5])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<5>  (
    .CI(Msub_cycle_time_sub0000_cy[4]),
    .DI(time_now[5]),
    .S(Msub_cycle_time_sub0000_lut[5]),
    .O(Msub_cycle_time_sub0000_cy[5])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<5>  (
    .CI(Msub_cycle_time_sub0000_cy[4]),
    .LI(Msub_cycle_time_sub0000_lut[5]),
    .O(cycle_time_sub0000[5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<6>  (
    .I0(time_prev[6]),
    .I1(time_now[6]),
    .O(Msub_cycle_time_sub0000_lut[6])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<6>  (
    .CI(Msub_cycle_time_sub0000_cy[5]),
    .DI(time_now[6]),
    .S(Msub_cycle_time_sub0000_lut[6]),
    .O(Msub_cycle_time_sub0000_cy[6])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<6>  (
    .CI(Msub_cycle_time_sub0000_cy[5]),
    .LI(Msub_cycle_time_sub0000_lut[6]),
    .O(cycle_time_sub0000[6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<7>  (
    .I0(time_prev[7]),
    .I1(time_now[7]),
    .O(Msub_cycle_time_sub0000_lut[7])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<7>  (
    .CI(Msub_cycle_time_sub0000_cy[6]),
    .DI(time_now[7]),
    .S(Msub_cycle_time_sub0000_lut[7]),
    .O(Msub_cycle_time_sub0000_cy[7])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<7>  (
    .CI(Msub_cycle_time_sub0000_cy[6]),
    .LI(Msub_cycle_time_sub0000_lut[7]),
    .O(cycle_time_sub0000[7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<8>  (
    .I0(time_prev[8]),
    .I1(time_now[8]),
    .O(Msub_cycle_time_sub0000_lut[8])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<8>  (
    .CI(Msub_cycle_time_sub0000_cy[7]),
    .DI(time_now[8]),
    .S(Msub_cycle_time_sub0000_lut[8]),
    .O(Msub_cycle_time_sub0000_cy[8])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<8>  (
    .CI(Msub_cycle_time_sub0000_cy[7]),
    .LI(Msub_cycle_time_sub0000_lut[8]),
    .O(cycle_time_sub0000[8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<9>  (
    .I0(time_prev[9]),
    .I1(time_now[9]),
    .O(Msub_cycle_time_sub0000_lut[9])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<9>  (
    .CI(Msub_cycle_time_sub0000_cy[8]),
    .DI(time_now[9]),
    .S(Msub_cycle_time_sub0000_lut[9]),
    .O(Msub_cycle_time_sub0000_cy[9])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<9>  (
    .CI(Msub_cycle_time_sub0000_cy[8]),
    .LI(Msub_cycle_time_sub0000_lut[9]),
    .O(cycle_time_sub0000[9])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<10>  (
    .I0(time_now[10]),
    .I1(time_prev[10]),
    .O(Msub_cycle_time_sub0000_lut[10])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<10>  (
    .CI(Msub_cycle_time_sub0000_cy[9]),
    .DI(time_now[10]),
    .S(Msub_cycle_time_sub0000_lut[10]),
    .O(Msub_cycle_time_sub0000_cy[10])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<10>  (
    .CI(Msub_cycle_time_sub0000_cy[9]),
    .LI(Msub_cycle_time_sub0000_lut[10]),
    .O(cycle_time_sub0000[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<11>  (
    .I0(time_now[11]),
    .I1(time_prev[11]),
    .O(Msub_cycle_time_sub0000_lut[11])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<11>  (
    .CI(Msub_cycle_time_sub0000_cy[10]),
    .DI(time_now[11]),
    .S(Msub_cycle_time_sub0000_lut[11]),
    .O(Msub_cycle_time_sub0000_cy[11])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<11>  (
    .CI(Msub_cycle_time_sub0000_cy[10]),
    .LI(Msub_cycle_time_sub0000_lut[11]),
    .O(cycle_time_sub0000[11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<12>  (
    .I0(time_now[12]),
    .I1(time_prev[12]),
    .O(Msub_cycle_time_sub0000_lut[12])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<12>  (
    .CI(Msub_cycle_time_sub0000_cy[11]),
    .DI(time_now[12]),
    .S(Msub_cycle_time_sub0000_lut[12]),
    .O(Msub_cycle_time_sub0000_cy[12])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<12>  (
    .CI(Msub_cycle_time_sub0000_cy[11]),
    .LI(Msub_cycle_time_sub0000_lut[12]),
    .O(cycle_time_sub0000[12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<13>  (
    .I0(time_now[13]),
    .I1(time_prev[13]),
    .O(Msub_cycle_time_sub0000_lut[13])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<13>  (
    .CI(Msub_cycle_time_sub0000_cy[12]),
    .DI(time_now[13]),
    .S(Msub_cycle_time_sub0000_lut[13]),
    .O(Msub_cycle_time_sub0000_cy[13])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<13>  (
    .CI(Msub_cycle_time_sub0000_cy[12]),
    .LI(Msub_cycle_time_sub0000_lut[13]),
    .O(cycle_time_sub0000[13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<14>  (
    .I0(time_now[14]),
    .I1(time_prev[14]),
    .O(Msub_cycle_time_sub0000_lut[14])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<14>  (
    .CI(Msub_cycle_time_sub0000_cy[13]),
    .DI(time_now[14]),
    .S(Msub_cycle_time_sub0000_lut[14]),
    .O(Msub_cycle_time_sub0000_cy[14])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<14>  (
    .CI(Msub_cycle_time_sub0000_cy[13]),
    .LI(Msub_cycle_time_sub0000_lut[14]),
    .O(cycle_time_sub0000[14])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<15>  (
    .I0(time_now[15]),
    .I1(time_prev[15]),
    .O(Msub_cycle_time_sub0000_lut[15])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<15>  (
    .CI(Msub_cycle_time_sub0000_cy[14]),
    .DI(time_now[15]),
    .S(Msub_cycle_time_sub0000_lut[15]),
    .O(Msub_cycle_time_sub0000_cy[15])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<15>  (
    .CI(Msub_cycle_time_sub0000_cy[14]),
    .LI(Msub_cycle_time_sub0000_lut[15]),
    .O(cycle_time_sub0000[15])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<16>  (
    .I0(time_now[16]),
    .I1(time_prev[16]),
    .O(Msub_cycle_time_sub0000_lut[16])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<16>  (
    .CI(Msub_cycle_time_sub0000_cy[15]),
    .DI(time_now[16]),
    .S(Msub_cycle_time_sub0000_lut[16]),
    .O(Msub_cycle_time_sub0000_cy[16])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<16>  (
    .CI(Msub_cycle_time_sub0000_cy[15]),
    .LI(Msub_cycle_time_sub0000_lut[16]),
    .O(cycle_time_sub0000[16])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<17>  (
    .I0(time_now[17]),
    .I1(time_prev[17]),
    .O(Msub_cycle_time_sub0000_lut[17])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<17>  (
    .CI(Msub_cycle_time_sub0000_cy[16]),
    .DI(time_now[17]),
    .S(Msub_cycle_time_sub0000_lut[17]),
    .O(Msub_cycle_time_sub0000_cy[17])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<17>  (
    .CI(Msub_cycle_time_sub0000_cy[16]),
    .LI(Msub_cycle_time_sub0000_lut[17]),
    .O(cycle_time_sub0000[17])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<18>  (
    .I0(time_now[18]),
    .I1(time_prev[18]),
    .O(Msub_cycle_time_sub0000_lut[18])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<18>  (
    .CI(Msub_cycle_time_sub0000_cy[17]),
    .DI(time_now[18]),
    .S(Msub_cycle_time_sub0000_lut[18]),
    .O(Msub_cycle_time_sub0000_cy[18])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<18>  (
    .CI(Msub_cycle_time_sub0000_cy[17]),
    .LI(Msub_cycle_time_sub0000_lut[18]),
    .O(cycle_time_sub0000[18])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<19>  (
    .I0(time_now[19]),
    .I1(time_prev[19]),
    .O(Msub_cycle_time_sub0000_lut[19])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<19>  (
    .CI(Msub_cycle_time_sub0000_cy[18]),
    .DI(time_now[19]),
    .S(Msub_cycle_time_sub0000_lut[19]),
    .O(Msub_cycle_time_sub0000_cy[19])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<19>  (
    .CI(Msub_cycle_time_sub0000_cy[18]),
    .LI(Msub_cycle_time_sub0000_lut[19]),
    .O(cycle_time_sub0000[19])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<20>  (
    .I0(time_now[20]),
    .I1(time_prev[20]),
    .O(Msub_cycle_time_sub0000_lut[20])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<20>  (
    .CI(Msub_cycle_time_sub0000_cy[19]),
    .DI(time_now[20]),
    .S(Msub_cycle_time_sub0000_lut[20]),
    .O(Msub_cycle_time_sub0000_cy[20])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<20>  (
    .CI(Msub_cycle_time_sub0000_cy[19]),
    .LI(Msub_cycle_time_sub0000_lut[20]),
    .O(cycle_time_sub0000[20])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<21>  (
    .I0(time_now[21]),
    .I1(time_prev[21]),
    .O(Msub_cycle_time_sub0000_lut[21])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<21>  (
    .CI(Msub_cycle_time_sub0000_cy[20]),
    .DI(time_now[21]),
    .S(Msub_cycle_time_sub0000_lut[21]),
    .O(Msub_cycle_time_sub0000_cy[21])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<21>  (
    .CI(Msub_cycle_time_sub0000_cy[20]),
    .LI(Msub_cycle_time_sub0000_lut[21]),
    .O(cycle_time_sub0000[21])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<22>  (
    .I0(time_now[22]),
    .I1(time_prev[22]),
    .O(Msub_cycle_time_sub0000_lut[22])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<22>  (
    .CI(Msub_cycle_time_sub0000_cy[21]),
    .DI(time_now[22]),
    .S(Msub_cycle_time_sub0000_lut[22]),
    .O(Msub_cycle_time_sub0000_cy[22])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<22>  (
    .CI(Msub_cycle_time_sub0000_cy[21]),
    .LI(Msub_cycle_time_sub0000_lut[22]),
    .O(cycle_time_sub0000[22])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<23>  (
    .I0(time_now[23]),
    .I1(time_prev[23]),
    .O(Msub_cycle_time_sub0000_lut[23])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<23>  (
    .CI(Msub_cycle_time_sub0000_cy[22]),
    .DI(time_now[23]),
    .S(Msub_cycle_time_sub0000_lut[23]),
    .O(Msub_cycle_time_sub0000_cy[23])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<23>  (
    .CI(Msub_cycle_time_sub0000_cy[22]),
    .LI(Msub_cycle_time_sub0000_lut[23]),
    .O(cycle_time_sub0000[23])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<24>  (
    .I0(time_now[24]),
    .I1(time_prev[24]),
    .O(Msub_cycle_time_sub0000_lut[24])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<24>  (
    .CI(Msub_cycle_time_sub0000_cy[23]),
    .DI(time_now[24]),
    .S(Msub_cycle_time_sub0000_lut[24]),
    .O(Msub_cycle_time_sub0000_cy[24])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<24>  (
    .CI(Msub_cycle_time_sub0000_cy[23]),
    .LI(Msub_cycle_time_sub0000_lut[24]),
    .O(cycle_time_sub0000[24])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<25>  (
    .I0(time_now[25]),
    .I1(time_prev[25]),
    .O(Msub_cycle_time_sub0000_lut[25])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<25>  (
    .CI(Msub_cycle_time_sub0000_cy[24]),
    .DI(time_now[25]),
    .S(Msub_cycle_time_sub0000_lut[25]),
    .O(Msub_cycle_time_sub0000_cy[25])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<25>  (
    .CI(Msub_cycle_time_sub0000_cy[24]),
    .LI(Msub_cycle_time_sub0000_lut[25]),
    .O(cycle_time_sub0000[25])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<26>  (
    .I0(time_now[26]),
    .I1(time_prev[26]),
    .O(Msub_cycle_time_sub0000_lut[26])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<26>  (
    .CI(Msub_cycle_time_sub0000_cy[25]),
    .DI(time_now[26]),
    .S(Msub_cycle_time_sub0000_lut[26]),
    .O(Msub_cycle_time_sub0000_cy[26])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<26>  (
    .CI(Msub_cycle_time_sub0000_cy[25]),
    .LI(Msub_cycle_time_sub0000_lut[26]),
    .O(cycle_time_sub0000[26])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<27>  (
    .I0(time_now[27]),
    .I1(time_prev[27]),
    .O(Msub_cycle_time_sub0000_lut[27])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<27>  (
    .CI(Msub_cycle_time_sub0000_cy[26]),
    .DI(time_now[27]),
    .S(Msub_cycle_time_sub0000_lut[27]),
    .O(Msub_cycle_time_sub0000_cy[27])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<27>  (
    .CI(Msub_cycle_time_sub0000_cy[26]),
    .LI(Msub_cycle_time_sub0000_lut[27]),
    .O(cycle_time_sub0000[27])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<28>  (
    .I0(time_now[28]),
    .I1(time_prev[28]),
    .O(Msub_cycle_time_sub0000_lut[28])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<28>  (
    .CI(Msub_cycle_time_sub0000_cy[27]),
    .DI(time_now[28]),
    .S(Msub_cycle_time_sub0000_lut[28]),
    .O(Msub_cycle_time_sub0000_cy[28])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<28>  (
    .CI(Msub_cycle_time_sub0000_cy[27]),
    .LI(Msub_cycle_time_sub0000_lut[28]),
    .O(cycle_time_sub0000[28])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<29>  (
    .I0(time_now[29]),
    .I1(time_prev[29]),
    .O(Msub_cycle_time_sub0000_lut[29])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<29>  (
    .CI(Msub_cycle_time_sub0000_cy[28]),
    .DI(time_now[29]),
    .S(Msub_cycle_time_sub0000_lut[29]),
    .O(Msub_cycle_time_sub0000_cy[29])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<29>  (
    .CI(Msub_cycle_time_sub0000_cy[28]),
    .LI(Msub_cycle_time_sub0000_lut[29]),
    .O(cycle_time_sub0000[29])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<30>  (
    .I0(time_now[30]),
    .I1(time_prev[30]),
    .O(Msub_cycle_time_sub0000_lut[30])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<30>  (
    .CI(Msub_cycle_time_sub0000_cy[29]),
    .DI(time_now[30]),
    .S(Msub_cycle_time_sub0000_lut[30]),
    .O(Msub_cycle_time_sub0000_cy[30])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<30>  (
    .CI(Msub_cycle_time_sub0000_cy[29]),
    .LI(Msub_cycle_time_sub0000_lut[30]),
    .O(cycle_time_sub0000[30])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<31>  (
    .I0(time_now[31]),
    .I1(time_prev[31]),
    .O(Msub_cycle_time_sub0000_lut[31])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<31>  (
    .CI(Msub_cycle_time_sub0000_cy[30]),
    .DI(time_now[31]),
    .S(Msub_cycle_time_sub0000_lut[31]),
    .O(Msub_cycle_time_sub0000_cy[31])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<31>  (
    .CI(Msub_cycle_time_sub0000_cy[30]),
    .LI(Msub_cycle_time_sub0000_lut[31]),
    .O(cycle_time_sub0000[31])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<32>  (
    .I0(time_now[32]),
    .I1(time_prev[32]),
    .O(Msub_cycle_time_sub0000_lut[32])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<32>  (
    .CI(Msub_cycle_time_sub0000_cy[31]),
    .DI(time_now[32]),
    .S(Msub_cycle_time_sub0000_lut[32]),
    .O(Msub_cycle_time_sub0000_cy[32])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<32>  (
    .CI(Msub_cycle_time_sub0000_cy[31]),
    .LI(Msub_cycle_time_sub0000_lut[32]),
    .O(cycle_time_sub0000[32])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<33>  (
    .I0(time_now[33]),
    .I1(time_prev[33]),
    .O(Msub_cycle_time_sub0000_lut[33])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<33>  (
    .CI(Msub_cycle_time_sub0000_cy[32]),
    .DI(time_now[33]),
    .S(Msub_cycle_time_sub0000_lut[33]),
    .O(Msub_cycle_time_sub0000_cy[33])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<33>  (
    .CI(Msub_cycle_time_sub0000_cy[32]),
    .LI(Msub_cycle_time_sub0000_lut[33]),
    .O(cycle_time_sub0000[33])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<34>  (
    .I0(time_now[34]),
    .I1(time_prev[34]),
    .O(Msub_cycle_time_sub0000_lut[34])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<34>  (
    .CI(Msub_cycle_time_sub0000_cy[33]),
    .DI(time_now[34]),
    .S(Msub_cycle_time_sub0000_lut[34]),
    .O(Msub_cycle_time_sub0000_cy[34])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<34>  (
    .CI(Msub_cycle_time_sub0000_cy[33]),
    .LI(Msub_cycle_time_sub0000_lut[34]),
    .O(cycle_time_sub0000[34])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<35>  (
    .I0(time_now[35]),
    .I1(time_prev[35]),
    .O(Msub_cycle_time_sub0000_lut[35])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<35>  (
    .CI(Msub_cycle_time_sub0000_cy[34]),
    .DI(time_now[35]),
    .S(Msub_cycle_time_sub0000_lut[35]),
    .O(Msub_cycle_time_sub0000_cy[35])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<35>  (
    .CI(Msub_cycle_time_sub0000_cy[34]),
    .LI(Msub_cycle_time_sub0000_lut[35]),
    .O(cycle_time_sub0000[35])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<36>  (
    .I0(time_now[36]),
    .I1(time_prev[36]),
    .O(Msub_cycle_time_sub0000_lut[36])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<36>  (
    .CI(Msub_cycle_time_sub0000_cy[35]),
    .DI(time_now[36]),
    .S(Msub_cycle_time_sub0000_lut[36]),
    .O(Msub_cycle_time_sub0000_cy[36])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<36>  (
    .CI(Msub_cycle_time_sub0000_cy[35]),
    .LI(Msub_cycle_time_sub0000_lut[36]),
    .O(cycle_time_sub0000[36])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<37>  (
    .I0(time_now[37]),
    .I1(time_prev[37]),
    .O(Msub_cycle_time_sub0000_lut[37])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<37>  (
    .CI(Msub_cycle_time_sub0000_cy[36]),
    .DI(time_now[37]),
    .S(Msub_cycle_time_sub0000_lut[37]),
    .O(Msub_cycle_time_sub0000_cy[37])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<37>  (
    .CI(Msub_cycle_time_sub0000_cy[36]),
    .LI(Msub_cycle_time_sub0000_lut[37]),
    .O(cycle_time_sub0000[37])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<38>  (
    .I0(time_now[38]),
    .I1(time_prev[38]),
    .O(Msub_cycle_time_sub0000_lut[38])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<38>  (
    .CI(Msub_cycle_time_sub0000_cy[37]),
    .DI(time_now[38]),
    .S(Msub_cycle_time_sub0000_lut[38]),
    .O(Msub_cycle_time_sub0000_cy[38])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<38>  (
    .CI(Msub_cycle_time_sub0000_cy[37]),
    .LI(Msub_cycle_time_sub0000_lut[38]),
    .O(cycle_time_sub0000[38])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<39>  (
    .I0(time_now[39]),
    .I1(time_prev[39]),
    .O(Msub_cycle_time_sub0000_lut[39])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<39>  (
    .CI(Msub_cycle_time_sub0000_cy[38]),
    .DI(time_now[39]),
    .S(Msub_cycle_time_sub0000_lut[39]),
    .O(Msub_cycle_time_sub0000_cy[39])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<39>  (
    .CI(Msub_cycle_time_sub0000_cy[38]),
    .LI(Msub_cycle_time_sub0000_lut[39]),
    .O(cycle_time_sub0000[39])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<40>  (
    .I0(time_now[40]),
    .I1(time_prev[40]),
    .O(Msub_cycle_time_sub0000_lut[40])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<40>  (
    .CI(Msub_cycle_time_sub0000_cy[39]),
    .DI(time_now[40]),
    .S(Msub_cycle_time_sub0000_lut[40]),
    .O(Msub_cycle_time_sub0000_cy[40])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<40>  (
    .CI(Msub_cycle_time_sub0000_cy[39]),
    .LI(Msub_cycle_time_sub0000_lut[40]),
    .O(cycle_time_sub0000[40])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<41>  (
    .I0(time_now[41]),
    .I1(time_prev[41]),
    .O(Msub_cycle_time_sub0000_lut[41])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<41>  (
    .CI(Msub_cycle_time_sub0000_cy[40]),
    .DI(time_now[41]),
    .S(Msub_cycle_time_sub0000_lut[41]),
    .O(Msub_cycle_time_sub0000_cy[41])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<41>  (
    .CI(Msub_cycle_time_sub0000_cy[40]),
    .LI(Msub_cycle_time_sub0000_lut[41]),
    .O(cycle_time_sub0000[41])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<42>  (
    .I0(time_now[42]),
    .I1(time_prev[42]),
    .O(Msub_cycle_time_sub0000_lut[42])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<42>  (
    .CI(Msub_cycle_time_sub0000_cy[41]),
    .DI(time_now[42]),
    .S(Msub_cycle_time_sub0000_lut[42]),
    .O(Msub_cycle_time_sub0000_cy[42])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<42>  (
    .CI(Msub_cycle_time_sub0000_cy[41]),
    .LI(Msub_cycle_time_sub0000_lut[42]),
    .O(cycle_time_sub0000[42])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<43>  (
    .I0(time_now[43]),
    .I1(time_prev[43]),
    .O(Msub_cycle_time_sub0000_lut[43])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<43>  (
    .CI(Msub_cycle_time_sub0000_cy[42]),
    .DI(time_now[43]),
    .S(Msub_cycle_time_sub0000_lut[43]),
    .O(Msub_cycle_time_sub0000_cy[43])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<43>  (
    .CI(Msub_cycle_time_sub0000_cy[42]),
    .LI(Msub_cycle_time_sub0000_lut[43]),
    .O(cycle_time_sub0000[43])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<44>  (
    .I0(time_now[44]),
    .I1(time_prev[44]),
    .O(Msub_cycle_time_sub0000_lut[44])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<44>  (
    .CI(Msub_cycle_time_sub0000_cy[43]),
    .DI(time_now[44]),
    .S(Msub_cycle_time_sub0000_lut[44]),
    .O(Msub_cycle_time_sub0000_cy[44])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<44>  (
    .CI(Msub_cycle_time_sub0000_cy[43]),
    .LI(Msub_cycle_time_sub0000_lut[44]),
    .O(cycle_time_sub0000[44])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<45>  (
    .I0(time_now[45]),
    .I1(time_prev[45]),
    .O(Msub_cycle_time_sub0000_lut[45])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<45>  (
    .CI(Msub_cycle_time_sub0000_cy[44]),
    .DI(time_now[45]),
    .S(Msub_cycle_time_sub0000_lut[45]),
    .O(Msub_cycle_time_sub0000_cy[45])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<45>  (
    .CI(Msub_cycle_time_sub0000_cy[44]),
    .LI(Msub_cycle_time_sub0000_lut[45]),
    .O(cycle_time_sub0000[45])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<46>  (
    .I0(time_now[46]),
    .I1(time_prev[46]),
    .O(Msub_cycle_time_sub0000_lut[46])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<46>  (
    .CI(Msub_cycle_time_sub0000_cy[45]),
    .DI(time_now[46]),
    .S(Msub_cycle_time_sub0000_lut[46]),
    .O(Msub_cycle_time_sub0000_cy[46])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<46>  (
    .CI(Msub_cycle_time_sub0000_cy[45]),
    .LI(Msub_cycle_time_sub0000_lut[46]),
    .O(cycle_time_sub0000[46])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<47>  (
    .I0(time_now[47]),
    .I1(time_prev[47]),
    .O(Msub_cycle_time_sub0000_lut[47])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<47>  (
    .CI(Msub_cycle_time_sub0000_cy[46]),
    .DI(time_now[47]),
    .S(Msub_cycle_time_sub0000_lut[47]),
    .O(Msub_cycle_time_sub0000_cy[47])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<47>  (
    .CI(Msub_cycle_time_sub0000_cy[46]),
    .LI(Msub_cycle_time_sub0000_lut[47]),
    .O(cycle_time_sub0000[47])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<48>  (
    .I0(time_now[48]),
    .I1(time_prev[48]),
    .O(Msub_cycle_time_sub0000_lut[48])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<48>  (
    .CI(Msub_cycle_time_sub0000_cy[47]),
    .DI(time_now[48]),
    .S(Msub_cycle_time_sub0000_lut[48]),
    .O(Msub_cycle_time_sub0000_cy[48])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<48>  (
    .CI(Msub_cycle_time_sub0000_cy[47]),
    .LI(Msub_cycle_time_sub0000_lut[48]),
    .O(cycle_time_sub0000[48])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<49>  (
    .I0(time_now[49]),
    .I1(time_prev[49]),
    .O(Msub_cycle_time_sub0000_lut[49])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<49>  (
    .CI(Msub_cycle_time_sub0000_cy[48]),
    .DI(time_now[49]),
    .S(Msub_cycle_time_sub0000_lut[49]),
    .O(Msub_cycle_time_sub0000_cy[49])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<49>  (
    .CI(Msub_cycle_time_sub0000_cy[48]),
    .LI(Msub_cycle_time_sub0000_lut[49]),
    .O(cycle_time_sub0000[49])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<50>  (
    .I0(time_now[50]),
    .I1(time_prev[50]),
    .O(Msub_cycle_time_sub0000_lut[50])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<50>  (
    .CI(Msub_cycle_time_sub0000_cy[49]),
    .DI(time_now[50]),
    .S(Msub_cycle_time_sub0000_lut[50]),
    .O(Msub_cycle_time_sub0000_cy[50])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<50>  (
    .CI(Msub_cycle_time_sub0000_cy[49]),
    .LI(Msub_cycle_time_sub0000_lut[50]),
    .O(cycle_time_sub0000[50])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<51>  (
    .I0(time_now[51]),
    .I1(time_prev[51]),
    .O(Msub_cycle_time_sub0000_lut[51])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<51>  (
    .CI(Msub_cycle_time_sub0000_cy[50]),
    .DI(time_now[51]),
    .S(Msub_cycle_time_sub0000_lut[51]),
    .O(Msub_cycle_time_sub0000_cy[51])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<51>  (
    .CI(Msub_cycle_time_sub0000_cy[50]),
    .LI(Msub_cycle_time_sub0000_lut[51]),
    .O(cycle_time_sub0000[51])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<52>  (
    .I0(time_now[52]),
    .I1(time_prev[52]),
    .O(Msub_cycle_time_sub0000_lut[52])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<52>  (
    .CI(Msub_cycle_time_sub0000_cy[51]),
    .DI(time_now[52]),
    .S(Msub_cycle_time_sub0000_lut[52]),
    .O(Msub_cycle_time_sub0000_cy[52])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<52>  (
    .CI(Msub_cycle_time_sub0000_cy[51]),
    .LI(Msub_cycle_time_sub0000_lut[52]),
    .O(cycle_time_sub0000[52])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<53>  (
    .I0(time_now[53]),
    .I1(time_prev[53]),
    .O(Msub_cycle_time_sub0000_lut[53])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<53>  (
    .CI(Msub_cycle_time_sub0000_cy[52]),
    .DI(time_now[53]),
    .S(Msub_cycle_time_sub0000_lut[53]),
    .O(Msub_cycle_time_sub0000_cy[53])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<53>  (
    .CI(Msub_cycle_time_sub0000_cy[52]),
    .LI(Msub_cycle_time_sub0000_lut[53]),
    .O(cycle_time_sub0000[53])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<54>  (
    .I0(time_now[54]),
    .I1(time_prev[54]),
    .O(Msub_cycle_time_sub0000_lut[54])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<54>  (
    .CI(Msub_cycle_time_sub0000_cy[53]),
    .DI(time_now[54]),
    .S(Msub_cycle_time_sub0000_lut[54]),
    .O(Msub_cycle_time_sub0000_cy[54])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<54>  (
    .CI(Msub_cycle_time_sub0000_cy[53]),
    .LI(Msub_cycle_time_sub0000_lut[54]),
    .O(cycle_time_sub0000[54])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<55>  (
    .I0(time_now[55]),
    .I1(time_prev[55]),
    .O(Msub_cycle_time_sub0000_lut[55])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<55>  (
    .CI(Msub_cycle_time_sub0000_cy[54]),
    .DI(time_now[55]),
    .S(Msub_cycle_time_sub0000_lut[55]),
    .O(Msub_cycle_time_sub0000_cy[55])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<55>  (
    .CI(Msub_cycle_time_sub0000_cy[54]),
    .LI(Msub_cycle_time_sub0000_lut[55]),
    .O(cycle_time_sub0000[55])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<56>  (
    .I0(time_now[56]),
    .I1(time_prev[56]),
    .O(Msub_cycle_time_sub0000_lut[56])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<56>  (
    .CI(Msub_cycle_time_sub0000_cy[55]),
    .DI(time_now[56]),
    .S(Msub_cycle_time_sub0000_lut[56]),
    .O(Msub_cycle_time_sub0000_cy[56])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<56>  (
    .CI(Msub_cycle_time_sub0000_cy[55]),
    .LI(Msub_cycle_time_sub0000_lut[56]),
    .O(cycle_time_sub0000[56])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<57>  (
    .I0(time_now[57]),
    .I1(time_prev[57]),
    .O(Msub_cycle_time_sub0000_lut[57])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<57>  (
    .CI(Msub_cycle_time_sub0000_cy[56]),
    .DI(time_now[57]),
    .S(Msub_cycle_time_sub0000_lut[57]),
    .O(Msub_cycle_time_sub0000_cy[57])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<57>  (
    .CI(Msub_cycle_time_sub0000_cy[56]),
    .LI(Msub_cycle_time_sub0000_lut[57]),
    .O(cycle_time_sub0000[57])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<58>  (
    .I0(time_now[58]),
    .I1(time_prev[58]),
    .O(Msub_cycle_time_sub0000_lut[58])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<58>  (
    .CI(Msub_cycle_time_sub0000_cy[57]),
    .DI(time_now[58]),
    .S(Msub_cycle_time_sub0000_lut[58]),
    .O(Msub_cycle_time_sub0000_cy[58])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<58>  (
    .CI(Msub_cycle_time_sub0000_cy[57]),
    .LI(Msub_cycle_time_sub0000_lut[58]),
    .O(cycle_time_sub0000[58])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<59>  (
    .I0(time_now[59]),
    .I1(time_prev[59]),
    .O(Msub_cycle_time_sub0000_lut[59])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<59>  (
    .CI(Msub_cycle_time_sub0000_cy[58]),
    .DI(time_now[59]),
    .S(Msub_cycle_time_sub0000_lut[59]),
    .O(Msub_cycle_time_sub0000_cy[59])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<59>  (
    .CI(Msub_cycle_time_sub0000_cy[58]),
    .LI(Msub_cycle_time_sub0000_lut[59]),
    .O(cycle_time_sub0000[59])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<60>  (
    .I0(time_now[60]),
    .I1(time_prev[60]),
    .O(Msub_cycle_time_sub0000_lut[60])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<60>  (
    .CI(Msub_cycle_time_sub0000_cy[59]),
    .DI(time_now[60]),
    .S(Msub_cycle_time_sub0000_lut[60]),
    .O(Msub_cycle_time_sub0000_cy[60])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<60>  (
    .CI(Msub_cycle_time_sub0000_cy[59]),
    .LI(Msub_cycle_time_sub0000_lut[60]),
    .O(cycle_time_sub0000[60])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<61>  (
    .I0(time_now[61]),
    .I1(time_prev[61]),
    .O(Msub_cycle_time_sub0000_lut[61])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<61>  (
    .CI(Msub_cycle_time_sub0000_cy[60]),
    .DI(time_now[61]),
    .S(Msub_cycle_time_sub0000_lut[61]),
    .O(Msub_cycle_time_sub0000_cy[61])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<61>  (
    .CI(Msub_cycle_time_sub0000_cy[60]),
    .LI(Msub_cycle_time_sub0000_lut[61]),
    .O(cycle_time_sub0000[61])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<62>  (
    .I0(time_now[62]),
    .I1(time_prev[62]),
    .O(Msub_cycle_time_sub0000_lut[62])
  );
  MUXCY   \Msub_cycle_time_sub0000_cy<62>  (
    .CI(Msub_cycle_time_sub0000_cy[61]),
    .DI(time_now[62]),
    .S(Msub_cycle_time_sub0000_lut[62]),
    .O(Msub_cycle_time_sub0000_cy[62])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<62>  (
    .CI(Msub_cycle_time_sub0000_cy[61]),
    .LI(Msub_cycle_time_sub0000_lut[62]),
    .O(cycle_time_sub0000[62])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_cycle_time_sub0000_lut<63>  (
    .I0(time_now[63]),
    .I1(time_prev[63]),
    .O(Msub_cycle_time_sub0000_lut[63])
  );
  XORCY   \Msub_cycle_time_sub0000_xor<63>  (
    .CI(Msub_cycle_time_sub0000_cy[62]),
    .LI(Msub_cycle_time_sub0000_lut[63]),
    .O(cycle_time_sub0000[63])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<0>  (
    .I0(cycle_time[0]),
    .I1(cycle_time_prev[0]),
    .I2(cycle_time[1]),
    .I3(cycle_time_prev[1]),
    .O(Mcompar_state_cmp_eq0004_lut[0])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<0>  (
    .CI(N1),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[0]),
    .O(Mcompar_state_cmp_eq0004_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<1>  (
    .I0(cycle_time[2]),
    .I1(cycle_time_prev[2]),
    .I2(cycle_time[3]),
    .I3(cycle_time_prev[3]),
    .O(Mcompar_state_cmp_eq0004_lut[1])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<1>  (
    .CI(Mcompar_state_cmp_eq0004_cy[0]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[1]),
    .O(Mcompar_state_cmp_eq0004_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<2>  (
    .I0(cycle_time[4]),
    .I1(cycle_time_prev[4]),
    .I2(cycle_time[5]),
    .I3(cycle_time_prev[5]),
    .O(Mcompar_state_cmp_eq0004_lut[2])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<2>  (
    .CI(Mcompar_state_cmp_eq0004_cy[1]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[2]),
    .O(Mcompar_state_cmp_eq0004_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<3>  (
    .I0(cycle_time[6]),
    .I1(cycle_time_prev[6]),
    .I2(cycle_time[7]),
    .I3(cycle_time_prev[7]),
    .O(Mcompar_state_cmp_eq0004_lut[3])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<3>  (
    .CI(Mcompar_state_cmp_eq0004_cy[2]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[3]),
    .O(Mcompar_state_cmp_eq0004_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<4>  (
    .I0(cycle_time[8]),
    .I1(cycle_time_prev[8]),
    .I2(cycle_time[9]),
    .I3(cycle_time_prev[9]),
    .O(Mcompar_state_cmp_eq0004_lut[4])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<4>  (
    .CI(Mcompar_state_cmp_eq0004_cy[3]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[4]),
    .O(Mcompar_state_cmp_eq0004_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<5>  (
    .I0(cycle_time[10]),
    .I1(cycle_time_prev[10]),
    .I2(cycle_time[11]),
    .I3(cycle_time_prev[11]),
    .O(Mcompar_state_cmp_eq0004_lut[5])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<5>  (
    .CI(Mcompar_state_cmp_eq0004_cy[4]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[5]),
    .O(Mcompar_state_cmp_eq0004_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<6>  (
    .I0(cycle_time[12]),
    .I1(cycle_time_prev[12]),
    .I2(cycle_time[13]),
    .I3(cycle_time_prev[13]),
    .O(Mcompar_state_cmp_eq0004_lut[6])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<6>  (
    .CI(Mcompar_state_cmp_eq0004_cy[5]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[6]),
    .O(Mcompar_state_cmp_eq0004_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<7>  (
    .I0(cycle_time[14]),
    .I1(cycle_time_prev[14]),
    .I2(cycle_time[15]),
    .I3(cycle_time_prev[15]),
    .O(Mcompar_state_cmp_eq0004_lut[7])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<7>  (
    .CI(Mcompar_state_cmp_eq0004_cy[6]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[7]),
    .O(Mcompar_state_cmp_eq0004_cy[7])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<8>  (
    .I0(cycle_time[16]),
    .I1(cycle_time_prev[16]),
    .I2(cycle_time[17]),
    .I3(cycle_time_prev[17]),
    .O(Mcompar_state_cmp_eq0004_lut[8])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<8>  (
    .CI(Mcompar_state_cmp_eq0004_cy[7]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[8]),
    .O(Mcompar_state_cmp_eq0004_cy[8])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<9>  (
    .I0(cycle_time[18]),
    .I1(cycle_time_prev[18]),
    .I2(cycle_time[19]),
    .I3(cycle_time_prev[19]),
    .O(Mcompar_state_cmp_eq0004_lut[9])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<9>  (
    .CI(Mcompar_state_cmp_eq0004_cy[8]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[9]),
    .O(Mcompar_state_cmp_eq0004_cy[9])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<10>  (
    .I0(cycle_time[20]),
    .I1(cycle_time_prev[20]),
    .I2(cycle_time[21]),
    .I3(cycle_time_prev[21]),
    .O(Mcompar_state_cmp_eq0004_lut[10])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<10>  (
    .CI(Mcompar_state_cmp_eq0004_cy[9]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[10]),
    .O(Mcompar_state_cmp_eq0004_cy[10])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<11>  (
    .I0(cycle_time[22]),
    .I1(cycle_time_prev[22]),
    .I2(cycle_time[23]),
    .I3(cycle_time_prev[23]),
    .O(Mcompar_state_cmp_eq0004_lut[11])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<11>  (
    .CI(Mcompar_state_cmp_eq0004_cy[10]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[11]),
    .O(Mcompar_state_cmp_eq0004_cy[11])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<12>  (
    .I0(cycle_time[24]),
    .I1(cycle_time_prev[24]),
    .I2(cycle_time[25]),
    .I3(cycle_time_prev[25]),
    .O(Mcompar_state_cmp_eq0004_lut[12])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<12>  (
    .CI(Mcompar_state_cmp_eq0004_cy[11]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[12]),
    .O(Mcompar_state_cmp_eq0004_cy[12])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<13>  (
    .I0(cycle_time[26]),
    .I1(cycle_time_prev[26]),
    .I2(cycle_time[27]),
    .I3(cycle_time_prev[27]),
    .O(Mcompar_state_cmp_eq0004_lut[13])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<13>  (
    .CI(Mcompar_state_cmp_eq0004_cy[12]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[13]),
    .O(Mcompar_state_cmp_eq0004_cy[13])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<14>  (
    .I0(cycle_time[28]),
    .I1(cycle_time_prev[28]),
    .I2(cycle_time[29]),
    .I3(cycle_time_prev[29]),
    .O(Mcompar_state_cmp_eq0004_lut[14])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<14>  (
    .CI(Mcompar_state_cmp_eq0004_cy[13]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[14]),
    .O(Mcompar_state_cmp_eq0004_cy[14])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<15>  (
    .I0(cycle_time[30]),
    .I1(cycle_time_prev[30]),
    .I2(cycle_time[31]),
    .I3(cycle_time_prev[31]),
    .O(Mcompar_state_cmp_eq0004_lut[15])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<15>  (
    .CI(Mcompar_state_cmp_eq0004_cy[14]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[15]),
    .O(Mcompar_state_cmp_eq0004_cy[15])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<16>  (
    .I0(cycle_time[32]),
    .I1(cycle_time_prev[32]),
    .I2(cycle_time[33]),
    .I3(cycle_time_prev[33]),
    .O(Mcompar_state_cmp_eq0004_lut[16])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<16>  (
    .CI(Mcompar_state_cmp_eq0004_cy[15]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[16]),
    .O(Mcompar_state_cmp_eq0004_cy[16])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<17>  (
    .I0(cycle_time[34]),
    .I1(cycle_time_prev[34]),
    .I2(cycle_time[35]),
    .I3(cycle_time_prev[35]),
    .O(Mcompar_state_cmp_eq0004_lut[17])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<17>  (
    .CI(Mcompar_state_cmp_eq0004_cy[16]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[17]),
    .O(Mcompar_state_cmp_eq0004_cy[17])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<18>  (
    .I0(cycle_time[36]),
    .I1(cycle_time_prev[36]),
    .I2(cycle_time[37]),
    .I3(cycle_time_prev[37]),
    .O(Mcompar_state_cmp_eq0004_lut[18])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<18>  (
    .CI(Mcompar_state_cmp_eq0004_cy[17]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[18]),
    .O(Mcompar_state_cmp_eq0004_cy[18])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<19>  (
    .I0(cycle_time[38]),
    .I1(cycle_time_prev[38]),
    .I2(cycle_time[39]),
    .I3(cycle_time_prev[39]),
    .O(Mcompar_state_cmp_eq0004_lut[19])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<19>  (
    .CI(Mcompar_state_cmp_eq0004_cy[18]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[19]),
    .O(Mcompar_state_cmp_eq0004_cy[19])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<20>  (
    .I0(cycle_time[40]),
    .I1(cycle_time_prev[40]),
    .I2(cycle_time[41]),
    .I3(cycle_time_prev[41]),
    .O(Mcompar_state_cmp_eq0004_lut[20])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<20>  (
    .CI(Mcompar_state_cmp_eq0004_cy[19]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[20]),
    .O(Mcompar_state_cmp_eq0004_cy[20])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<21>  (
    .I0(cycle_time[42]),
    .I1(cycle_time_prev[42]),
    .I2(cycle_time[43]),
    .I3(cycle_time_prev[43]),
    .O(Mcompar_state_cmp_eq0004_lut[21])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<21>  (
    .CI(Mcompar_state_cmp_eq0004_cy[20]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[21]),
    .O(Mcompar_state_cmp_eq0004_cy[21])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<22>  (
    .I0(cycle_time[44]),
    .I1(cycle_time_prev[44]),
    .I2(cycle_time[45]),
    .I3(cycle_time_prev[45]),
    .O(Mcompar_state_cmp_eq0004_lut[22])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<22>  (
    .CI(Mcompar_state_cmp_eq0004_cy[21]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[22]),
    .O(Mcompar_state_cmp_eq0004_cy[22])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<23>  (
    .I0(cycle_time[46]),
    .I1(cycle_time_prev[46]),
    .I2(cycle_time[47]),
    .I3(cycle_time_prev[47]),
    .O(Mcompar_state_cmp_eq0004_lut[23])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<23>  (
    .CI(Mcompar_state_cmp_eq0004_cy[22]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[23]),
    .O(Mcompar_state_cmp_eq0004_cy[23])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<24>  (
    .I0(cycle_time[48]),
    .I1(cycle_time_prev[48]),
    .I2(cycle_time[49]),
    .I3(cycle_time_prev[49]),
    .O(Mcompar_state_cmp_eq0004_lut[24])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<24>  (
    .CI(Mcompar_state_cmp_eq0004_cy[23]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[24]),
    .O(Mcompar_state_cmp_eq0004_cy[24])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<25>  (
    .I0(cycle_time[50]),
    .I1(cycle_time_prev[50]),
    .I2(cycle_time[51]),
    .I3(cycle_time_prev[51]),
    .O(Mcompar_state_cmp_eq0004_lut[25])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<25>  (
    .CI(Mcompar_state_cmp_eq0004_cy[24]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[25]),
    .O(Mcompar_state_cmp_eq0004_cy[25])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<26>  (
    .I0(cycle_time[52]),
    .I1(cycle_time_prev[52]),
    .I2(cycle_time[53]),
    .I3(cycle_time_prev[53]),
    .O(Mcompar_state_cmp_eq0004_lut[26])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<26>  (
    .CI(Mcompar_state_cmp_eq0004_cy[25]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[26]),
    .O(Mcompar_state_cmp_eq0004_cy[26])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<27>  (
    .I0(cycle_time[54]),
    .I1(cycle_time_prev[54]),
    .I2(cycle_time[55]),
    .I3(cycle_time_prev[55]),
    .O(Mcompar_state_cmp_eq0004_lut[27])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<27>  (
    .CI(Mcompar_state_cmp_eq0004_cy[26]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[27]),
    .O(Mcompar_state_cmp_eq0004_cy[27])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<28>  (
    .I0(cycle_time[56]),
    .I1(cycle_time_prev[56]),
    .I2(cycle_time[57]),
    .I3(cycle_time_prev[57]),
    .O(Mcompar_state_cmp_eq0004_lut[28])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<28>  (
    .CI(Mcompar_state_cmp_eq0004_cy[27]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[28]),
    .O(Mcompar_state_cmp_eq0004_cy[28])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<29>  (
    .I0(cycle_time[58]),
    .I1(cycle_time_prev[58]),
    .I2(cycle_time[59]),
    .I3(cycle_time_prev[59]),
    .O(Mcompar_state_cmp_eq0004_lut[29])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<29>  (
    .CI(Mcompar_state_cmp_eq0004_cy[28]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[29]),
    .O(Mcompar_state_cmp_eq0004_cy[29])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<30>  (
    .I0(cycle_time[60]),
    .I1(cycle_time_prev[60]),
    .I2(cycle_time[61]),
    .I3(cycle_time_prev[61]),
    .O(Mcompar_state_cmp_eq0004_lut[30])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<30>  (
    .CI(Mcompar_state_cmp_eq0004_cy[29]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[30]),
    .O(Mcompar_state_cmp_eq0004_cy[30])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0004_lut<31>  (
    .I0(cycle_time[62]),
    .I1(cycle_time_prev[62]),
    .I2(cycle_time[63]),
    .I3(cycle_time_prev[63]),
    .O(Mcompar_state_cmp_eq0004_lut[31])
  );
  MUXCY   \Mcompar_state_cmp_eq0004_cy<31>  (
    .CI(Mcompar_state_cmp_eq0004_cy[30]),
    .DI(state[0]),
    .S(Mcompar_state_cmp_eq0004_lut[31]),
    .O(Mcompar_state_cmp_eq0004_cy[31])
  );
  MUXCY   \Mcount_time_out_counter_cy<0>  (
    .CI(N1),
    .DI(state[0]),
    .S(\Mcount_time_out_counter_cy<0>_rt_2788 ),
    .O(Mcount_time_out_counter_cy[0])
  );
  XORCY   \Mcount_time_out_counter_xor<0>  (
    .CI(N1),
    .LI(\Mcount_time_out_counter_cy<0>_rt_2788 ),
    .O(Result[0])
  );
  MUXCY   \Mcount_time_out_counter_cy<1>  (
    .CI(Mcount_time_out_counter_cy[0]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[1]),
    .O(Mcount_time_out_counter_cy[1])
  );
  XORCY   \Mcount_time_out_counter_xor<1>  (
    .CI(Mcount_time_out_counter_cy[0]),
    .LI(Mcount_time_out_counter_lut[1]),
    .O(Result[1])
  );
  MUXCY   \Mcount_time_out_counter_cy<2>  (
    .CI(Mcount_time_out_counter_cy[1]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[2]),
    .O(Mcount_time_out_counter_cy[2])
  );
  XORCY   \Mcount_time_out_counter_xor<2>  (
    .CI(Mcount_time_out_counter_cy[1]),
    .LI(Mcount_time_out_counter_lut[2]),
    .O(Result[2])
  );
  MUXCY   \Mcount_time_out_counter_cy<3>  (
    .CI(Mcount_time_out_counter_cy[2]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[3]),
    .O(Mcount_time_out_counter_cy[3])
  );
  XORCY   \Mcount_time_out_counter_xor<3>  (
    .CI(Mcount_time_out_counter_cy[2]),
    .LI(Mcount_time_out_counter_lut[3]),
    .O(Result[3])
  );
  MUXCY   \Mcount_time_out_counter_cy<4>  (
    .CI(Mcount_time_out_counter_cy[3]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[4]),
    .O(Mcount_time_out_counter_cy[4])
  );
  XORCY   \Mcount_time_out_counter_xor<4>  (
    .CI(Mcount_time_out_counter_cy[3]),
    .LI(Mcount_time_out_counter_lut[4]),
    .O(Result[4])
  );
  MUXCY   \Mcount_time_out_counter_cy<5>  (
    .CI(Mcount_time_out_counter_cy[4]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[5]),
    .O(Mcount_time_out_counter_cy[5])
  );
  XORCY   \Mcount_time_out_counter_xor<5>  (
    .CI(Mcount_time_out_counter_cy[4]),
    .LI(Mcount_time_out_counter_lut[5]),
    .O(Result[5])
  );
  MUXCY   \Mcount_time_out_counter_cy<6>  (
    .CI(Mcount_time_out_counter_cy[5]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[6]),
    .O(Mcount_time_out_counter_cy[6])
  );
  XORCY   \Mcount_time_out_counter_xor<6>  (
    .CI(Mcount_time_out_counter_cy[5]),
    .LI(Mcount_time_out_counter_lut[6]),
    .O(Result[6])
  );
  MUXCY   \Mcount_time_out_counter_cy<7>  (
    .CI(Mcount_time_out_counter_cy[6]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[7]),
    .O(Mcount_time_out_counter_cy[7])
  );
  XORCY   \Mcount_time_out_counter_xor<7>  (
    .CI(Mcount_time_out_counter_cy[6]),
    .LI(Mcount_time_out_counter_lut[7]),
    .O(Result[7])
  );
  MUXCY   \Mcount_time_out_counter_cy<8>  (
    .CI(Mcount_time_out_counter_cy[7]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[8]),
    .O(Mcount_time_out_counter_cy[8])
  );
  XORCY   \Mcount_time_out_counter_xor<8>  (
    .CI(Mcount_time_out_counter_cy[7]),
    .LI(Mcount_time_out_counter_lut[8]),
    .O(Result[8])
  );
  MUXCY   \Mcount_time_out_counter_cy<9>  (
    .CI(Mcount_time_out_counter_cy[8]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[9]),
    .O(Mcount_time_out_counter_cy[9])
  );
  XORCY   \Mcount_time_out_counter_xor<9>  (
    .CI(Mcount_time_out_counter_cy[8]),
    .LI(Mcount_time_out_counter_lut[9]),
    .O(Result[9])
  );
  MUXCY   \Mcount_time_out_counter_cy<10>  (
    .CI(Mcount_time_out_counter_cy[9]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[10]),
    .O(Mcount_time_out_counter_cy[10])
  );
  XORCY   \Mcount_time_out_counter_xor<10>  (
    .CI(Mcount_time_out_counter_cy[9]),
    .LI(Mcount_time_out_counter_lut[10]),
    .O(Result[10])
  );
  MUXCY   \Mcount_time_out_counter_cy<11>  (
    .CI(Mcount_time_out_counter_cy[10]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[11]),
    .O(Mcount_time_out_counter_cy[11])
  );
  XORCY   \Mcount_time_out_counter_xor<11>  (
    .CI(Mcount_time_out_counter_cy[10]),
    .LI(Mcount_time_out_counter_lut[11]),
    .O(Result[11])
  );
  MUXCY   \Mcount_time_out_counter_cy<12>  (
    .CI(Mcount_time_out_counter_cy[11]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[12]),
    .O(Mcount_time_out_counter_cy[12])
  );
  XORCY   \Mcount_time_out_counter_xor<12>  (
    .CI(Mcount_time_out_counter_cy[11]),
    .LI(Mcount_time_out_counter_lut[12]),
    .O(Result[12])
  );
  MUXCY   \Mcount_time_out_counter_cy<13>  (
    .CI(Mcount_time_out_counter_cy[12]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[13]),
    .O(Mcount_time_out_counter_cy[13])
  );
  XORCY   \Mcount_time_out_counter_xor<13>  (
    .CI(Mcount_time_out_counter_cy[12]),
    .LI(Mcount_time_out_counter_lut[13]),
    .O(Result[13])
  );
  MUXCY   \Mcount_time_out_counter_cy<14>  (
    .CI(Mcount_time_out_counter_cy[13]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[14]),
    .O(Mcount_time_out_counter_cy[14])
  );
  XORCY   \Mcount_time_out_counter_xor<14>  (
    .CI(Mcount_time_out_counter_cy[13]),
    .LI(Mcount_time_out_counter_lut[14]),
    .O(Result[14])
  );
  MUXCY   \Mcount_time_out_counter_cy<15>  (
    .CI(Mcount_time_out_counter_cy[14]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[15]),
    .O(Mcount_time_out_counter_cy[15])
  );
  XORCY   \Mcount_time_out_counter_xor<15>  (
    .CI(Mcount_time_out_counter_cy[14]),
    .LI(Mcount_time_out_counter_lut[15]),
    .O(Result[15])
  );
  MUXCY   \Mcount_time_out_counter_cy<16>  (
    .CI(Mcount_time_out_counter_cy[15]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[16]),
    .O(Mcount_time_out_counter_cy[16])
  );
  XORCY   \Mcount_time_out_counter_xor<16>  (
    .CI(Mcount_time_out_counter_cy[15]),
    .LI(Mcount_time_out_counter_lut[16]),
    .O(Result[16])
  );
  MUXCY   \Mcount_time_out_counter_cy<17>  (
    .CI(Mcount_time_out_counter_cy[16]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[17]),
    .O(Mcount_time_out_counter_cy[17])
  );
  XORCY   \Mcount_time_out_counter_xor<17>  (
    .CI(Mcount_time_out_counter_cy[16]),
    .LI(Mcount_time_out_counter_lut[17]),
    .O(Result[17])
  );
  MUXCY   \Mcount_time_out_counter_cy<18>  (
    .CI(Mcount_time_out_counter_cy[17]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[18]),
    .O(Mcount_time_out_counter_cy[18])
  );
  XORCY   \Mcount_time_out_counter_xor<18>  (
    .CI(Mcount_time_out_counter_cy[17]),
    .LI(Mcount_time_out_counter_lut[18]),
    .O(Result[18])
  );
  MUXCY   \Mcount_time_out_counter_cy<19>  (
    .CI(Mcount_time_out_counter_cy[18]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[19]),
    .O(Mcount_time_out_counter_cy[19])
  );
  XORCY   \Mcount_time_out_counter_xor<19>  (
    .CI(Mcount_time_out_counter_cy[18]),
    .LI(Mcount_time_out_counter_lut[19]),
    .O(Result[19])
  );
  MUXCY   \Mcount_time_out_counter_cy<20>  (
    .CI(Mcount_time_out_counter_cy[19]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[20]),
    .O(Mcount_time_out_counter_cy[20])
  );
  XORCY   \Mcount_time_out_counter_xor<20>  (
    .CI(Mcount_time_out_counter_cy[19]),
    .LI(Mcount_time_out_counter_lut[20]),
    .O(Result[20])
  );
  MUXCY   \Mcount_time_out_counter_cy<21>  (
    .CI(Mcount_time_out_counter_cy[20]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[21]),
    .O(Mcount_time_out_counter_cy[21])
  );
  XORCY   \Mcount_time_out_counter_xor<21>  (
    .CI(Mcount_time_out_counter_cy[20]),
    .LI(Mcount_time_out_counter_lut[21]),
    .O(Result[21])
  );
  MUXCY   \Mcount_time_out_counter_cy<22>  (
    .CI(Mcount_time_out_counter_cy[21]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[22]),
    .O(Mcount_time_out_counter_cy[22])
  );
  XORCY   \Mcount_time_out_counter_xor<22>  (
    .CI(Mcount_time_out_counter_cy[21]),
    .LI(Mcount_time_out_counter_lut[22]),
    .O(Result[22])
  );
  MUXCY   \Mcount_time_out_counter_cy<23>  (
    .CI(Mcount_time_out_counter_cy[22]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[23]),
    .O(Mcount_time_out_counter_cy[23])
  );
  XORCY   \Mcount_time_out_counter_xor<23>  (
    .CI(Mcount_time_out_counter_cy[22]),
    .LI(Mcount_time_out_counter_lut[23]),
    .O(Result[23])
  );
  MUXCY   \Mcount_time_out_counter_cy<24>  (
    .CI(Mcount_time_out_counter_cy[23]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[24]),
    .O(Mcount_time_out_counter_cy[24])
  );
  XORCY   \Mcount_time_out_counter_xor<24>  (
    .CI(Mcount_time_out_counter_cy[23]),
    .LI(Mcount_time_out_counter_lut[24]),
    .O(Result[24])
  );
  MUXCY   \Mcount_time_out_counter_cy<25>  (
    .CI(Mcount_time_out_counter_cy[24]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[25]),
    .O(Mcount_time_out_counter_cy[25])
  );
  XORCY   \Mcount_time_out_counter_xor<25>  (
    .CI(Mcount_time_out_counter_cy[24]),
    .LI(Mcount_time_out_counter_lut[25]),
    .O(Result[25])
  );
  MUXCY   \Mcount_time_out_counter_cy<26>  (
    .CI(Mcount_time_out_counter_cy[25]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[26]),
    .O(Mcount_time_out_counter_cy[26])
  );
  XORCY   \Mcount_time_out_counter_xor<26>  (
    .CI(Mcount_time_out_counter_cy[25]),
    .LI(Mcount_time_out_counter_lut[26]),
    .O(Result[26])
  );
  MUXCY   \Mcount_time_out_counter_cy<27>  (
    .CI(Mcount_time_out_counter_cy[26]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[27]),
    .O(Mcount_time_out_counter_cy[27])
  );
  XORCY   \Mcount_time_out_counter_xor<27>  (
    .CI(Mcount_time_out_counter_cy[26]),
    .LI(Mcount_time_out_counter_lut[27]),
    .O(Result[27])
  );
  MUXCY   \Mcount_time_out_counter_cy<28>  (
    .CI(Mcount_time_out_counter_cy[27]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[28]),
    .O(Mcount_time_out_counter_cy[28])
  );
  XORCY   \Mcount_time_out_counter_xor<28>  (
    .CI(Mcount_time_out_counter_cy[27]),
    .LI(Mcount_time_out_counter_lut[28]),
    .O(Result[28])
  );
  MUXCY   \Mcount_time_out_counter_cy<29>  (
    .CI(Mcount_time_out_counter_cy[28]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[29]),
    .O(Mcount_time_out_counter_cy[29])
  );
  XORCY   \Mcount_time_out_counter_xor<29>  (
    .CI(Mcount_time_out_counter_cy[28]),
    .LI(Mcount_time_out_counter_lut[29]),
    .O(Result[29])
  );
  MUXCY   \Mcount_time_out_counter_cy<30>  (
    .CI(Mcount_time_out_counter_cy[29]),
    .DI(N1),
    .S(Mcount_time_out_counter_lut[30]),
    .O(Mcount_time_out_counter_cy[30])
  );
  XORCY   \Mcount_time_out_counter_xor<30>  (
    .CI(Mcount_time_out_counter_cy[29]),
    .LI(Mcount_time_out_counter_lut[30]),
    .O(Result[30])
  );
  XORCY   \Mcount_time_out_counter_xor<31>  (
    .CI(Mcount_time_out_counter_cy[30]),
    .LI(Mcount_time_out_counter_lut[31]),
    .O(Result[31])
  );
  counter_reset_counter   reset_counter (
    .clk(clk),
    .start(_and0000),
    .rst(_or0000),
    .count_done(rst_cnt_done),
    .count({cnt[30], cnt[29], cnt[28], cnt[27], cnt[26], cnt[25], cnt[24], cnt[23], cnt[22], cnt[21], cnt[20], cnt[19], cnt[18], cnt[17], cnt[16], 
cnt[15], cnt[14], cnt[13], cnt[12], cnt[11], cnt[10], cnt[9], cnt[8], cnt[7], cnt[6], cnt[5], cnt[4], cnt[3], cnt[2], cnt[1], cnt[0], state[0]})
  );
  counter_INST_1   counter (
    .clk(clk),
    .start(start_cnt_3377),
    .rst(_or0000),
    .count_done(cnt_done),
    .count({cnt[31], cnt[30], cnt[29], cnt[28], cnt[27], cnt[26], cnt[25], cnt[24], cnt[23], cnt[22], cnt[21], cnt[20], cnt[19], cnt[18], cnt[17], 
cnt[16], cnt[15], cnt[14], cnt[13], cnt[12], cnt[11], cnt[10], cnt[9], cnt[8], cnt[7], cnt[6], cnt[5], cnt[4], cnt[3], cnt[2], cnt[1], cnt[0]})
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<0>  (
    .I0(time_out_counter[8]),
    .I1(time_out_counter[9]),
    .I2(time_out_counter[7]),
    .I3(time_out_counter[10]),
    .O(time_out_end_wg_lut[0])
  );
  MUXCY   \time_out_end_wg_cy<0>  (
    .CI(N1),
    .DI(state[0]),
    .S(time_out_end_wg_lut[0]),
    .O(time_out_end_wg_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<1>  (
    .I0(time_out_counter[11]),
    .I1(time_out_counter[12]),
    .I2(time_out_counter[6]),
    .I3(time_out_counter[13]),
    .O(time_out_end_wg_lut[1])
  );
  MUXCY   \time_out_end_wg_cy<1>  (
    .CI(time_out_end_wg_cy[0]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[1]),
    .O(time_out_end_wg_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<2>  (
    .I0(time_out_counter[14]),
    .I1(time_out_counter[15]),
    .I2(time_out_counter[5]),
    .I3(time_out_counter[16]),
    .O(time_out_end_wg_lut[2])
  );
  MUXCY   \time_out_end_wg_cy<2>  (
    .CI(time_out_end_wg_cy[1]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[2]),
    .O(time_out_end_wg_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<3>  (
    .I0(time_out_counter[17]),
    .I1(time_out_counter[18]),
    .I2(time_out_counter[4]),
    .I3(time_out_counter[19]),
    .O(time_out_end_wg_lut[3])
  );
  MUXCY   \time_out_end_wg_cy<3>  (
    .CI(time_out_end_wg_cy[2]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[3]),
    .O(time_out_end_wg_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<4>  (
    .I0(time_out_counter[20]),
    .I1(time_out_counter[21]),
    .I2(time_out_counter[3]),
    .I3(time_out_counter[22]),
    .O(time_out_end_wg_lut[4])
  );
  MUXCY   \time_out_end_wg_cy<4>  (
    .CI(time_out_end_wg_cy[3]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[4]),
    .O(time_out_end_wg_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<5>  (
    .I0(time_out_counter[23]),
    .I1(time_out_counter[24]),
    .I2(time_out_counter[2]),
    .I3(time_out_counter[25]),
    .O(time_out_end_wg_lut[5])
  );
  MUXCY   \time_out_end_wg_cy<5>  (
    .CI(time_out_end_wg_cy[4]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[5]),
    .O(time_out_end_wg_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<6>  (
    .I0(time_out_counter[26]),
    .I1(time_out_counter[27]),
    .I2(time_out_counter[1]),
    .I3(time_out_counter[28]),
    .O(time_out_end_wg_lut[6])
  );
  MUXCY   \time_out_end_wg_cy<6>  (
    .CI(time_out_end_wg_cy[5]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[6]),
    .O(time_out_end_wg_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_end_wg_lut<7>  (
    .I0(time_out_counter[29]),
    .I1(time_out_counter[30]),
    .I2(time_out_counter[0]),
    .I3(time_out_counter[31]),
    .O(time_out_end_wg_lut[7])
  );
  MUXCY   \time_out_end_wg_cy<7>  (
    .CI(time_out_end_wg_cy[6]),
    .DI(state[0]),
    .S(time_out_end_wg_lut[7]),
    .O(time_out_end)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<0>  (
    .I0(time_out_counter[21]),
    .I1(time_out_counter[20]),
    .I2(time_out_counter[22]),
    .I3(time_out_counter[19]),
    .O(time_out_counter_or0000_wg_lut[0])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<0>  (
    .CI(state[0]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[0]),
    .O(time_out_counter_or0000_wg_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<1>  (
    .I0(time_out_counter[18]),
    .I1(time_out_counter[17]),
    .I2(time_out_counter[23]),
    .I3(time_out_counter[16]),
    .O(time_out_counter_or0000_wg_lut[1])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<1>  (
    .CI(time_out_counter_or0000_wg_cy[0]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[1]),
    .O(time_out_counter_or0000_wg_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<2>  (
    .I0(time_out_counter[15]),
    .I1(time_out_counter[14]),
    .I2(time_out_counter[24]),
    .I3(time_out_counter[13]),
    .O(time_out_counter_or0000_wg_lut[2])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<2>  (
    .CI(time_out_counter_or0000_wg_cy[1]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[2]),
    .O(time_out_counter_or0000_wg_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<3>  (
    .I0(time_out_counter[12]),
    .I1(time_out_counter[11]),
    .I2(time_out_counter[25]),
    .I3(time_out_counter[10]),
    .O(time_out_counter_or0000_wg_lut[3])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<3>  (
    .CI(time_out_counter_or0000_wg_cy[2]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[3]),
    .O(time_out_counter_or0000_wg_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<4>  (
    .I0(time_out_counter[9]),
    .I1(time_out_counter[8]),
    .I2(time_out_counter[26]),
    .I3(time_out_counter[7]),
    .O(time_out_counter_or0000_wg_lut[4])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<4>  (
    .CI(time_out_counter_or0000_wg_cy[3]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[4]),
    .O(time_out_counter_or0000_wg_cy[4])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<5>  (
    .I0(time_out_counter[6]),
    .I1(time_out_counter[5]),
    .I2(time_out_counter[27]),
    .I3(time_out_counter[4]),
    .O(time_out_counter_or0000_wg_lut[5])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<5>  (
    .CI(time_out_counter_or0000_wg_cy[4]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[5]),
    .O(time_out_counter_or0000_wg_cy[5])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<6>  (
    .I0(time_out_counter[3]),
    .I1(time_out_counter[2]),
    .I2(time_out_counter[28]),
    .I3(time_out_counter[1]),
    .O(time_out_counter_or0000_wg_lut[6])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<6>  (
    .CI(time_out_counter_or0000_wg_cy[5]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[6]),
    .O(time_out_counter_or0000_wg_cy[6])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \time_out_counter_or0000_wg_lut<7>  (
    .I0(time_out_counter[0]),
    .I1(time_out_counter[31]),
    .I2(time_out_counter[29]),
    .I3(time_out_counter[30]),
    .O(time_out_counter_or0000_wg_lut[7])
  );
  MUXCY   \time_out_counter_or0000_wg_cy<7>  (
    .CI(time_out_counter_or0000_wg_cy[6]),
    .DI(N1),
    .S(time_out_counter_or0000_wg_lut[7]),
    .O(time_out_counter_or0000)
  );
  LUT3 #(
    .INIT ( 8'hC8 ))
  rst_cnt_mux00001 (
    .I0(rst_cnt_3372),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(rst_cnt_mux0000)
  );
  LUT3 #(
    .INIT ( 8'h5D ))
  \cnt_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_state[1]),
    .I1(cycle_time[4]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[4])
  );
  LUT3 #(
    .INIT ( 8'h5D ))
  \cnt_mux0000<2>1  (
    .I0(NlwRenamedSig_OI_state[1]),
    .I1(cycle_time[2]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  preq_was_not00011 (
    .I0(preq),
    .I1(soc),
    .O(preq_was_not0001)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  time_to_soc_not00011 (
    .I0(cnt_done),
    .I1(send_done),
    .I2(rst_cnt_done),
    .O(time_to_soc_not0001)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  time_to_soc_mux00001 (
    .I0(cnt_done),
    .I1(rst_cnt_done),
    .O(time_to_soc_mux0000)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  _or00001 (
    .I0(rst),
    .I1(rst_cnt_3372),
    .O(_or0000)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  time_out_counter_not00011 (
    .I0(send_done),
    .I1(time_out_counter_or0000),
    .O(time_out_counter_not0001)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \state_mux0000<0>1  (
    .I0(Mcompar_state_cmp_eq0004_cy[31]),
    .I1(preq_prev_3303),
    .I2(NlwRenamedSig_OI_state[1]),
    .I3(rst_cnt_done),
    .O(state_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  _and00001 (
    .I0(state_1_1_3381),
    .I1(soc),
    .O(_and0000)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_time_out_counter_cy<0>_rt  (
    .I0(time_out_counter[0]),
    .O(\Mcount_time_out_counter_cy<0>_rt_2788 )
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_210 (
    .I0(send_done),
    .I1(Result[2]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_2)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_110 (
    .I0(send_done),
    .I1(Result[1]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_1)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_01 (
    .I0(send_done),
    .I1(Result[0]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_0)
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  Mcount_time_out_counter_eqn_41 (
    .I0(send_done),
    .I1(time_out_counter_or0000),
    .I2(Result[4]),
    .O(Mcount_time_out_counter_eqn_4)
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  Mcount_time_out_counter_eqn_32 (
    .I0(send_done),
    .I1(time_out_counter_or0000),
    .I2(Result[3]),
    .O(Mcount_time_out_counter_eqn_3)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_51 (
    .I0(send_done),
    .I1(Result[5]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_5)
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  Mcount_time_out_counter_eqn_61 (
    .I0(send_done),
    .I1(time_out_counter_or0000),
    .I2(Result[6]),
    .O(Mcount_time_out_counter_eqn_6)
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<9>1  (
    .I0(cycle_time[9]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[9])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<8>1  (
    .I0(cycle_time[8]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[8])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<7>1  (
    .I0(cycle_time[7]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[7])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<6>1  (
    .I0(cycle_time[6]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<5>1  (
    .I0(cycle_time[5]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<3>1  (
    .I0(cycle_time[3]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<31>1  (
    .I0(cycle_time[31]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[31])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<30>1  (
    .I0(cycle_time[30]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[30])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<29>1  (
    .I0(cycle_time[29]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[29])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<28>1  (
    .I0(cycle_time[28]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[28])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<27>1  (
    .I0(cycle_time[27]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[27])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<26>1  (
    .I0(cycle_time[26]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[26])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<25>1  (
    .I0(cycle_time[25]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[25])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<24>1  (
    .I0(cycle_time[24]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[24])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<23>1  (
    .I0(cycle_time[23]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[23])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<22>1  (
    .I0(cycle_time[22]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[22])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<21>1  (
    .I0(cycle_time[21]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[21])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<20>1  (
    .I0(cycle_time[20]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[20])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<1>1  (
    .I0(cycle_time[1]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<19>1  (
    .I0(cycle_time[19]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[19])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<18>1  (
    .I0(cycle_time[18]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[18])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<17>1  (
    .I0(cycle_time[17]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[17])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<16>1  (
    .I0(cycle_time[16]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[16])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<15>1  (
    .I0(cycle_time[15]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[15])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<14>1  (
    .I0(cycle_time[14]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[14])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<13>1  (
    .I0(cycle_time[13]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[13])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<12>1  (
    .I0(cycle_time[12]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[12])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<11>1  (
    .I0(cycle_time[11]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[11])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<10>1  (
    .I0(cycle_time[10]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[10])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cnt_mux0000<0>1  (
    .I0(cycle_time[0]),
    .I1(NlwRenamedSig_OI_state[1]),
    .I2(rst_cnt_done),
    .O(cnt_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  start_cnt_mux00001 (
    .I0(NlwRenamedSig_OI_state[1]),
    .I1(cnt_done),
    .I2(rst_cnt_done),
    .I3(soc),
    .O(start_cnt_mux0000)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_71 (
    .I0(send_done),
    .I1(Result[7]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_7)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_81 (
    .I0(send_done),
    .I1(Result[8]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_8)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_91 (
    .I0(send_done),
    .I1(Result[9]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_9)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_101 (
    .I0(send_done),
    .I1(Result[10]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_10)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_111 (
    .I0(send_done),
    .I1(Result[11]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_11)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_121 (
    .I0(send_done),
    .I1(Result[12]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_12)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_131 (
    .I0(send_done),
    .I1(Result[13]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_13)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_141 (
    .I0(send_done),
    .I1(Result[14]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_14)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_151 (
    .I0(send_done),
    .I1(Result[15]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_15)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_161 (
    .I0(send_done),
    .I1(Result[16]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_16)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_171 (
    .I0(send_done),
    .I1(Result[17]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_17)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_181 (
    .I0(send_done),
    .I1(Result[18]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_18)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_191 (
    .I0(send_done),
    .I1(Result[19]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_19)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_251 (
    .I0(send_done),
    .I1(Result[25]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_25)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_241 (
    .I0(send_done),
    .I1(Result[24]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_24)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_231 (
    .I0(send_done),
    .I1(Result[23]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_23)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_221 (
    .I0(send_done),
    .I1(Result[22]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_22)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_211 (
    .I0(send_done),
    .I1(Result[21]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_21)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_201 (
    .I0(send_done),
    .I1(Result[20]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_20)
  );
  FDC   state_1_1 (
    .C(clk),
    .CLR(rst),
    .D(state_mux0000[0]),
    .Q(state_1_1_3381)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_261 (
    .I0(send_done),
    .I1(Result[26]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_26)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_271 (
    .I0(send_done),
    .I1(Result[27]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_27)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_281 (
    .I0(send_done),
    .I1(Result[28]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_28)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_291 (
    .I0(send_done),
    .I1(Result[29]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_29)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_301 (
    .I0(send_done),
    .I1(Result[30]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_30)
  );
  LUT3 #(
    .INIT ( 8'hC4 ))
  Mcount_time_out_counter_eqn_311 (
    .I0(send_done),
    .I1(Result[31]),
    .I2(time_out_counter_or0000),
    .O(Mcount_time_out_counter_eqn_31)
  );
  INV   \Mcount_time_out_counter_lut<1>_INV_0  (
    .I(time_out_counter[1]),
    .O(Mcount_time_out_counter_lut[1])
  );
  INV   \Mcount_time_out_counter_lut<2>_INV_0  (
    .I(time_out_counter[2]),
    .O(Mcount_time_out_counter_lut[2])
  );
  INV   \Mcount_time_out_counter_lut<3>_INV_0  (
    .I(time_out_counter[3]),
    .O(Mcount_time_out_counter_lut[3])
  );
  INV   \Mcount_time_out_counter_lut<4>_INV_0  (
    .I(time_out_counter[4]),
    .O(Mcount_time_out_counter_lut[4])
  );
  INV   \Mcount_time_out_counter_lut<5>_INV_0  (
    .I(time_out_counter[5]),
    .O(Mcount_time_out_counter_lut[5])
  );
  INV   \Mcount_time_out_counter_lut<6>_INV_0  (
    .I(time_out_counter[6]),
    .O(Mcount_time_out_counter_lut[6])
  );
  INV   \Mcount_time_out_counter_lut<7>_INV_0  (
    .I(time_out_counter[7]),
    .O(Mcount_time_out_counter_lut[7])
  );
  INV   \Mcount_time_out_counter_lut<8>_INV_0  (
    .I(time_out_counter[8]),
    .O(Mcount_time_out_counter_lut[8])
  );
  INV   \Mcount_time_out_counter_lut<9>_INV_0  (
    .I(time_out_counter[9]),
    .O(Mcount_time_out_counter_lut[9])
  );
  INV   \Mcount_time_out_counter_lut<10>_INV_0  (
    .I(time_out_counter[10]),
    .O(Mcount_time_out_counter_lut[10])
  );
  INV   \Mcount_time_out_counter_lut<11>_INV_0  (
    .I(time_out_counter[11]),
    .O(Mcount_time_out_counter_lut[11])
  );
  INV   \Mcount_time_out_counter_lut<12>_INV_0  (
    .I(time_out_counter[12]),
    .O(Mcount_time_out_counter_lut[12])
  );
  INV   \Mcount_time_out_counter_lut<13>_INV_0  (
    .I(time_out_counter[13]),
    .O(Mcount_time_out_counter_lut[13])
  );
  INV   \Mcount_time_out_counter_lut<14>_INV_0  (
    .I(time_out_counter[14]),
    .O(Mcount_time_out_counter_lut[14])
  );
  INV   \Mcount_time_out_counter_lut<15>_INV_0  (
    .I(time_out_counter[15]),
    .O(Mcount_time_out_counter_lut[15])
  );
  INV   \Mcount_time_out_counter_lut<16>_INV_0  (
    .I(time_out_counter[16]),
    .O(Mcount_time_out_counter_lut[16])
  );
  INV   \Mcount_time_out_counter_lut<17>_INV_0  (
    .I(time_out_counter[17]),
    .O(Mcount_time_out_counter_lut[17])
  );
  INV   \Mcount_time_out_counter_lut<18>_INV_0  (
    .I(time_out_counter[18]),
    .O(Mcount_time_out_counter_lut[18])
  );
  INV   \Mcount_time_out_counter_lut<19>_INV_0  (
    .I(time_out_counter[19]),
    .O(Mcount_time_out_counter_lut[19])
  );
  INV   \Mcount_time_out_counter_lut<20>_INV_0  (
    .I(time_out_counter[20]),
    .O(Mcount_time_out_counter_lut[20])
  );
  INV   \Mcount_time_out_counter_lut<21>_INV_0  (
    .I(time_out_counter[21]),
    .O(Mcount_time_out_counter_lut[21])
  );
  INV   \Mcount_time_out_counter_lut<22>_INV_0  (
    .I(time_out_counter[22]),
    .O(Mcount_time_out_counter_lut[22])
  );
  INV   \Mcount_time_out_counter_lut<23>_INV_0  (
    .I(time_out_counter[23]),
    .O(Mcount_time_out_counter_lut[23])
  );
  INV   \Mcount_time_out_counter_lut<24>_INV_0  (
    .I(time_out_counter[24]),
    .O(Mcount_time_out_counter_lut[24])
  );
  INV   \Mcount_time_out_counter_lut<25>_INV_0  (
    .I(time_out_counter[25]),
    .O(Mcount_time_out_counter_lut[25])
  );
  INV   \Mcount_time_out_counter_lut<26>_INV_0  (
    .I(time_out_counter[26]),
    .O(Mcount_time_out_counter_lut[26])
  );
  INV   \Mcount_time_out_counter_lut<27>_INV_0  (
    .I(time_out_counter[27]),
    .O(Mcount_time_out_counter_lut[27])
  );
  INV   \Mcount_time_out_counter_lut<28>_INV_0  (
    .I(time_out_counter[28]),
    .O(Mcount_time_out_counter_lut[28])
  );
  INV   \Mcount_time_out_counter_lut<29>_INV_0  (
    .I(time_out_counter[29]),
    .O(Mcount_time_out_counter_lut[29])
  );
  INV   \Mcount_time_out_counter_lut<30>_INV_0  (
    .I(time_out_counter[30]),
    .O(Mcount_time_out_counter_lut[30])
  );
  INV   \Mcount_time_out_counter_lut<31>_INV_0  (
    .I(time_out_counter[31]),
    .O(Mcount_time_out_counter_lut[31])
  );
  INV   preq_was_mux00001_INV_0 (
    .I(soc),
    .O(preq_was_mux0000)
  );
endmodule

module rmii_recv_byte_INST_4 (
  clk, rst, busy, fast_eth, rmii_clk, rm_crs_dv, rdy, data, rm_rx_data
);
  input clk;
  input rst;
  output busy;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [7 : 0] data;
  input [1 : 0] rm_rx_data;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_1694 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_1696 ;
  wire N10;
  wire N111;
  wire N12;
  wire N121;
  wire N20;
  wire N22;
  wire N23;
  wire N24;
  wire N25;
  wire N26;
  wire NlwRenamedSig_OI_busy;
  wire busy_mux0000;
  wire busy_not0001_1709;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001;
  wire rx_data_cmp_eq0000;
  wire rx_data_cmp_eq000018_1736;
  wire rx_data_cmp_eq00007_1737;
  wire \rx_data_mux0000<0>1_1739 ;
  wire \rx_data_mux0000<0>2_1740 ;
  wire \rx_data_mux0000<2>1_1743 ;
  wire \rx_data_mux0000<2>2_1744 ;
  wire rx_data_not0002;
  wire s_rm_crs_dv_1751;
  wire s_rmii_clk_1754;
  wire wait_cnt_not0003;
  wire [7 : 0] rx_data;
  wire [7 : 0] rx_data_mux0000;
  wire [1 : 0] s_rm_rx_data;
  wire [4 : 0] wait_cnt;
  assign
    busy = NlwRenamedSig_OI_busy,
    rdy = NlwRenamedSig_OI_rdy;
  FDC   s_rm_crs_dv (
    .C(clk),
    .CLR(rst),
    .D(rm_crs_dv),
    .Q(s_rm_crs_dv_1751)
  );
  FDC   s_rmii_clk (
    .C(clk),
    .CLR(rst),
    .D(rmii_clk),
    .Q(s_rmii_clk_1754)
  );
  FDC   s_rm_rx_data_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[0]),
    .Q(s_rm_rx_data[0])
  );
  FDC   s_rm_rx_data_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[1]),
    .Q(s_rm_rx_data[1])
  );
  FDCE   rx_data_0 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[0]),
    .Q(rx_data[0])
  );
  FDCE   rx_data_1 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[1]),
    .Q(rx_data[1])
  );
  FDCE   rx_data_2 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[2]),
    .Q(rx_data[2])
  );
  FDCE   rx_data_3 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[3]),
    .Q(rx_data[3])
  );
  FDCE   rx_data_4 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[4]),
    .Q(rx_data[4])
  );
  FDCE   rx_data_5 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[5]),
    .Q(rx_data[5])
  );
  FDCE   rx_data_6 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[6]),
    .Q(rx_data[6])
  );
  FDCE   rx_data_7 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[7]),
    .Q(rx_data[7])
  );
  FDCE   rdy_1372 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(rdy_mux0000),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   busy_1373 (
    .C(clk),
    .CE(busy_not0001_1709),
    .CLR(rst),
    .D(busy_mux0000),
    .Q(NlwRenamedSig_OI_busy)
  );
  FDCE   data_0 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[2]),
    .Q(data[0])
  );
  FDCE   data_1 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[3]),
    .Q(data[1])
  );
  FDCE   data_2 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[4]),
    .Q(data[2])
  );
  FDCE   data_3 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[5]),
    .Q(data[3])
  );
  FDCE   data_4 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[6]),
    .Q(data[4])
  );
  FDCE   data_5 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[7]),
    .Q(data[5])
  );
  FDCE   data_6 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[0]),
    .Q(data[6])
  );
  FDCE   data_7 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[1]),
    .Q(data[7])
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<1>11  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .O(Mcount_wait_cnt1)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  wait_cnt_not00031 (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(wait_cnt_not0003)
  );
  LUT4 #(
    .INIT ( 16'h1014 ))
  busy_not0001 (
    .I0(N24),
    .I1(s_rm_crs_dv_1751),
    .I2(NlwRenamedSig_OI_busy),
    .I3(N121),
    .O(busy_not0001_1709)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  rx_data_cmp_eq000019 (
    .I0(N22),
    .I1(rx_data_cmp_eq000018_1736),
    .O(rx_data_cmp_eq0000)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \rx_data_mux0000<0>111  (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .O(N12)
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[7]),
    .I2(s_rm_crs_dv_1751),
    .I3(N12),
    .O(rx_data_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[6]),
    .I2(s_rm_crs_dv_1751),
    .I3(N12),
    .O(rx_data_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[5]),
    .I2(s_rm_crs_dv_1751),
    .I3(N12),
    .O(rx_data_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<1>2  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[3]),
    .I2(s_rm_crs_dv_1751),
    .I3(N12),
    .O(rx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<7>1  (
    .I0(s_rm_crs_dv_1751),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[1]),
    .O(rx_data_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<6>1  (
    .I0(s_rm_crs_dv_1751),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[0]),
    .O(rx_data_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  rx_data_not00021 (
    .I0(s_rmii_clk_1754),
    .I1(N25),
    .I2(wait_cnt[4]),
    .I3(s_rm_crs_dv_1751),
    .O(rx_data_not0002)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  busy_not0001_SW0 (
    .I0(rx_data_cmp_eq00007_1737),
    .I1(N23),
    .I2(s_rmii_clk_1754),
    .O(N121)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  rdy_not00011 (
    .I0(N20),
    .I1(s_rmii_clk_1754),
    .I2(N10),
    .I3(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<4>12  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(Mcount_wait_cnt4)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_mux00001 (
    .I0(s_rmii_clk_1754),
    .I1(N111),
    .I2(N26),
    .I3(wait_cnt[4]),
    .O(rdy_mux0000)
  );
  INV   busy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_busy),
    .O(busy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_1694 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_1694 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<2>1  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1751),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<2>1_1743 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<2>2  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1751),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<2>2_1744 )
  );
  MUXF5   \rx_data_mux0000<2>_f5  (
    .I0(\rx_data_mux0000<2>2_1744 ),
    .I1(\rx_data_mux0000<2>1_1743 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<0>1  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1751),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<0>1_1739 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<0>2  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1751),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<0>2_1740 )
  );
  MUXF5   \rx_data_mux0000<0>_f5  (
    .I0(\rx_data_mux0000<0>2_1740 ),
    .I1(\rx_data_mux0000<0>1_1739 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_1696 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_1696 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  rx_data_cmp_eq00007 (
    .I0(rx_data[6]),
    .I1(rx_data[7]),
    .I2(rx_data[4]),
    .I3(rx_data[5]),
    .LO(N22),
    .O(rx_data_cmp_eq00007_1737)
  );
  LUT4_D #(
    .INIT ( 16'h0020 ))
  rx_data_cmp_eq000018 (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .I2(rx_data[2]),
    .I3(rx_data[3]),
    .LO(N23),
    .O(rx_data_cmp_eq000018_1736)
  );
  LUT2_D #(
    .INIT ( 4'hE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .LO(N24),
    .O(N10)
  );
  LUT4_D #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<3>111  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(wait_cnt[0]),
    .LO(N25),
    .O(N111)
  );
  LUT4_D #(
    .INIT ( 16'h8000 ))
  rdy_mux000011 (
    .I0(s_rm_crs_dv_1751),
    .I1(NlwRenamedSig_OI_busy),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .LO(N26),
    .O(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module soc_pdo_recv_INST_1 (
  head_o, clk, soc, rst, rm_clk, rm_crs_dv, rm_rx
);
  output head_o;
  input clk;
  output soc;
  input rst;
  input rm_clk;
  input rm_crs_dv;
  input [1 : 0] rm_rx;
  wire \Madd_state_m_addsub0000_cy<10>_rt_1763 ;
  wire \Madd_state_m_addsub0000_cy<1>_rt_1765 ;
  wire \Madd_state_m_addsub0000_cy<2>_rt_1767 ;
  wire \Madd_state_m_addsub0000_cy<3>_rt_1769 ;
  wire \Madd_state_m_addsub0000_cy<4>_rt_1771 ;
  wire \Madd_state_m_addsub0000_cy<5>_rt_1773 ;
  wire \Madd_state_m_addsub0000_cy<6>_rt_1775 ;
  wire \Madd_state_m_addsub0000_cy<7>_rt_1777 ;
  wire \Madd_state_m_addsub0000_cy<8>_rt_1779 ;
  wire \Madd_state_m_addsub0000_cy<9>_rt_1781 ;
  wire \Madd_state_m_addsub0000_xor<11>_rt_1783 ;
  wire N0;
  wire N1;
  wire N10;
  wire N12;
  wire N4;
  wire N6;
  wire N8;
  wire \cmp_data[0] ;
  wire \cmp_data[5] ;
  wire \cmp_data[7] ;
  wire \cmp_data[8] ;
  wire cmp_data_and0000;
  wire \cmp_data_mux0000[0] ;
  wire \cmp_data_mux0000[1] ;
  wire \cmp_data_mux0000<1>1 ;
  wire \cmp_data_mux0000[3] ;
  wire \cmp_data_mux0000[8] ;
  wire fault_1802;
  wire fault_not0001;
  wire fault_not000145_1804;
  wire fault_not000172_1805;
  wire head_1806;
  wire head_not0001;
  wire NlwRenamedSig_OI_head_o;
  wire head_o_mux0000;
  wire head_o_not0001;
  wire rx_busy;
  wire rx_rdy;
  wire NlwRenamedSig_OI_soc;
  wire soc_cmp_eq0000_1827;
  wire soc_cmp_eq0000111_1828;
  wire soc_cmp_eq0000124_1829;
  wire soc_mux0000;
  wire soc_not0001_1831;
  wire state_m_and0000;
  wire state_m_not0001;
  wire [10 : 0] Madd_state_m_addsub0000_cy;
  wire [0 : 0] Madd_state_m_addsub0000_lut;
  wire [7 : 0] rx_data;
  wire [11 : 0] state_m;
  wire [11 : 0] state_m_addsub0000;
  wire [11 : 0] state_m_mux0000;
  assign
    head_o = NlwRenamedSig_OI_head_o,
    soc = NlwRenamedSig_OI_soc;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   soc_1316 (
    .C(clk),
    .CE(soc_not0001_1831),
    .CLR(rst),
    .D(soc_mux0000),
    .Q(NlwRenamedSig_OI_soc)
  );
  FDCE   head_o_1317 (
    .C(clk),
    .CE(head_o_not0001),
    .CLR(rst),
    .D(head_o_mux0000),
    .Q(NlwRenamedSig_OI_head_o)
  );
  FDCE   fault (
    .C(clk),
    .CE(fault_not0001),
    .CLR(rst),
    .D(rx_busy),
    .Q(fault_1802)
  );
  FDCE   head (
    .C(clk),
    .CE(head_not0001),
    .CLR(rst),
    .D(rx_busy),
    .Q(head_1806)
  );
  MUXCY   \Madd_state_m_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_state_m_addsub0000_lut[0]),
    .O(Madd_state_m_addsub0000_cy[0])
  );
  XORCY   \Madd_state_m_addsub0000_xor<0>  (
    .CI(N0),
    .LI(Madd_state_m_addsub0000_lut[0]),
    .O(state_m_addsub0000[0])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<1>  (
    .CI(Madd_state_m_addsub0000_cy[0]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<1>_rt_1765 ),
    .O(Madd_state_m_addsub0000_cy[1])
  );
  XORCY   \Madd_state_m_addsub0000_xor<1>  (
    .CI(Madd_state_m_addsub0000_cy[0]),
    .LI(\Madd_state_m_addsub0000_cy<1>_rt_1765 ),
    .O(state_m_addsub0000[1])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<2>  (
    .CI(Madd_state_m_addsub0000_cy[1]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<2>_rt_1767 ),
    .O(Madd_state_m_addsub0000_cy[2])
  );
  XORCY   \Madd_state_m_addsub0000_xor<2>  (
    .CI(Madd_state_m_addsub0000_cy[1]),
    .LI(\Madd_state_m_addsub0000_cy<2>_rt_1767 ),
    .O(state_m_addsub0000[2])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<3>  (
    .CI(Madd_state_m_addsub0000_cy[2]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<3>_rt_1769 ),
    .O(Madd_state_m_addsub0000_cy[3])
  );
  XORCY   \Madd_state_m_addsub0000_xor<3>  (
    .CI(Madd_state_m_addsub0000_cy[2]),
    .LI(\Madd_state_m_addsub0000_cy<3>_rt_1769 ),
    .O(state_m_addsub0000[3])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<4>  (
    .CI(Madd_state_m_addsub0000_cy[3]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<4>_rt_1771 ),
    .O(Madd_state_m_addsub0000_cy[4])
  );
  XORCY   \Madd_state_m_addsub0000_xor<4>  (
    .CI(Madd_state_m_addsub0000_cy[3]),
    .LI(\Madd_state_m_addsub0000_cy<4>_rt_1771 ),
    .O(state_m_addsub0000[4])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<5>  (
    .CI(Madd_state_m_addsub0000_cy[4]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<5>_rt_1773 ),
    .O(Madd_state_m_addsub0000_cy[5])
  );
  XORCY   \Madd_state_m_addsub0000_xor<5>  (
    .CI(Madd_state_m_addsub0000_cy[4]),
    .LI(\Madd_state_m_addsub0000_cy<5>_rt_1773 ),
    .O(state_m_addsub0000[5])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<6>  (
    .CI(Madd_state_m_addsub0000_cy[5]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<6>_rt_1775 ),
    .O(Madd_state_m_addsub0000_cy[6])
  );
  XORCY   \Madd_state_m_addsub0000_xor<6>  (
    .CI(Madd_state_m_addsub0000_cy[5]),
    .LI(\Madd_state_m_addsub0000_cy<6>_rt_1775 ),
    .O(state_m_addsub0000[6])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<7>  (
    .CI(Madd_state_m_addsub0000_cy[6]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<7>_rt_1777 ),
    .O(Madd_state_m_addsub0000_cy[7])
  );
  XORCY   \Madd_state_m_addsub0000_xor<7>  (
    .CI(Madd_state_m_addsub0000_cy[6]),
    .LI(\Madd_state_m_addsub0000_cy<7>_rt_1777 ),
    .O(state_m_addsub0000[7])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<8>  (
    .CI(Madd_state_m_addsub0000_cy[7]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<8>_rt_1779 ),
    .O(Madd_state_m_addsub0000_cy[8])
  );
  XORCY   \Madd_state_m_addsub0000_xor<8>  (
    .CI(Madd_state_m_addsub0000_cy[7]),
    .LI(\Madd_state_m_addsub0000_cy<8>_rt_1779 ),
    .O(state_m_addsub0000[8])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<9>  (
    .CI(Madd_state_m_addsub0000_cy[8]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<9>_rt_1781 ),
    .O(Madd_state_m_addsub0000_cy[9])
  );
  XORCY   \Madd_state_m_addsub0000_xor<9>  (
    .CI(Madd_state_m_addsub0000_cy[8]),
    .LI(\Madd_state_m_addsub0000_cy<9>_rt_1781 ),
    .O(state_m_addsub0000[9])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<10>  (
    .CI(Madd_state_m_addsub0000_cy[9]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<10>_rt_1763 ),
    .O(Madd_state_m_addsub0000_cy[10])
  );
  XORCY   \Madd_state_m_addsub0000_xor<10>  (
    .CI(Madd_state_m_addsub0000_cy[9]),
    .LI(\Madd_state_m_addsub0000_cy<10>_rt_1763 ),
    .O(state_m_addsub0000[10])
  );
  XORCY   \Madd_state_m_addsub0000_xor<11>  (
    .CI(Madd_state_m_addsub0000_cy[10]),
    .LI(\Madd_state_m_addsub0000_xor<11>_rt_1783 ),
    .O(state_m_addsub0000[11])
  );
  FDCE   state_m_10 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[10]),
    .Q(state_m[10])
  );
  FDCE   state_m_9 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[9]),
    .Q(state_m[9])
  );
  FDCE   state_m_11 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[11]),
    .Q(state_m[11])
  );
  FDCE   state_m_7 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[7]),
    .Q(state_m[7])
  );
  FDCE   state_m_6 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[6]),
    .Q(state_m[6])
  );
  FDCE   state_m_8 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[8]),
    .Q(state_m[8])
  );
  FDCE   state_m_4 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[4]),
    .Q(state_m[4])
  );
  FDPE   state_m_3 (
    .C(clk),
    .CE(state_m_not0001),
    .D(state_m_mux0000[3]),
    .PRE(rst),
    .Q(state_m[3])
  );
  FDCE   state_m_5 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[5]),
    .Q(state_m[5])
  );
  FDCE   state_m_1 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[1]),
    .Q(state_m[1])
  );
  FDCE   state_m_0 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[0]),
    .Q(state_m[0])
  );
  FDCE   state_m_2 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[2]),
    .Q(state_m[2])
  );
  FDP   cmp_data_8 (
    .C(clk),
    .D(\cmp_data_mux0000[0] ),
    .PRE(rst),
    .Q(\cmp_data[8] )
  );
  FDC   cmp_data_7 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[1] ),
    .Q(\cmp_data[7] )
  );
  FDC   cmp_data_5 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[3] ),
    .Q(\cmp_data[5] )
  );
  FDC   cmp_data_0 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[8] ),
    .Q(\cmp_data[0] )
  );
  rmii_recv_byte_INST_4   rmii_recv_byte (
    .clk(clk),
    .rst(rst),
    .busy(rx_busy),
    .fast_eth(N1),
    .rmii_clk(rm_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(rx_rdy),
    .data({rx_data[7], rx_data[6], rx_data[5], rx_data[4], rx_data[3], rx_data[2], rx_data[1], rx_data[0]}),
    .rm_rx_data({rm_rx[1], rm_rx[0]})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<0>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[0]),
    .O(state_m_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  fault_not000111 (
    .I0(rx_rdy),
    .I1(head_1806),
    .O(state_m_and0000)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  head_o_not00011 (
    .I0(state_m_and0000),
    .I1(soc_cmp_eq0000_1827),
    .I2(rx_busy),
    .I3(NlwRenamedSig_OI_head_o),
    .O(head_o_not0001)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<1>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[1]),
    .O(state_m_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cmp_data_mux0000<3>1  (
    .I0(state_m[0]),
    .I1(cmp_data_and0000),
    .I2(state_m[1]),
    .O(\cmp_data_mux0000[3] )
  );
  LUT3 #(
    .INIT ( 8'h8F ))
  \cmp_data_mux0000<0>1  (
    .I0(state_m[0]),
    .I1(state_m[1]),
    .I2(cmp_data_and0000),
    .O(\cmp_data_mux0000[0] )
  );
  LUT3 #(
    .INIT ( 8'h60 ))
  \cmp_data_mux0000<8>1  (
    .I0(state_m[0]),
    .I1(state_m[1]),
    .I2(cmp_data_and0000),
    .O(\cmp_data_mux0000[8] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<2>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[2]),
    .O(state_m_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \state_m_mux0000<3>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[3]),
    .O(state_m_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<4>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[4]),
    .O(state_m_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<5>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[5]),
    .O(state_m_mux0000[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<6>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[6]),
    .O(state_m_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h6FF6 ))
  fault_not000145 (
    .I0(\cmp_data[5] ),
    .I1(rx_data[1]),
    .I2(\cmp_data[7] ),
    .I3(rx_data[3]),
    .O(fault_not000145_1804)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<7>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[7]),
    .O(state_m_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<8>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[8]),
    .O(state_m_mux0000[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<9>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[9]),
    .O(state_m_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  soc_cmp_eq0000111 (
    .I0(state_m[6]),
    .I1(state_m[5]),
    .I2(state_m[4]),
    .I3(state_m[11]),
    .O(soc_cmp_eq0000111_1828)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<10>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[10]),
    .O(state_m_mux0000[10])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<11>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[11]),
    .O(state_m_mux0000[11])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<1>_rt  (
    .I0(state_m[1]),
    .O(\Madd_state_m_addsub0000_cy<1>_rt_1765 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<2>_rt  (
    .I0(state_m[2]),
    .O(\Madd_state_m_addsub0000_cy<2>_rt_1767 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<3>_rt  (
    .I0(state_m[3]),
    .O(\Madd_state_m_addsub0000_cy<3>_rt_1769 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<4>_rt  (
    .I0(state_m[4]),
    .O(\Madd_state_m_addsub0000_cy<4>_rt_1771 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<5>_rt  (
    .I0(state_m[5]),
    .O(\Madd_state_m_addsub0000_cy<5>_rt_1773 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<6>_rt  (
    .I0(state_m[6]),
    .O(\Madd_state_m_addsub0000_cy<6>_rt_1775 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<7>_rt  (
    .I0(state_m[7]),
    .O(\Madd_state_m_addsub0000_cy<7>_rt_1777 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<8>_rt  (
    .I0(state_m[8]),
    .O(\Madd_state_m_addsub0000_cy<8>_rt_1779 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<9>_rt  (
    .I0(state_m[9]),
    .O(\Madd_state_m_addsub0000_cy<9>_rt_1781 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<10>_rt  (
    .I0(state_m[10]),
    .O(\Madd_state_m_addsub0000_cy<10>_rt_1763 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_xor<11>_rt  (
    .I0(state_m[11]),
    .O(\Madd_state_m_addsub0000_xor<11>_rt_1783 )
  );
  LUT4 #(
    .INIT ( 16'h08FF ))
  fault_not0001115 (
    .I0(state_m_and0000),
    .I1(N4),
    .I2(\cmp_data[8] ),
    .I3(rx_busy),
    .O(fault_not0001)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  soc_mux00002 (
    .I0(rx_busy),
    .I1(soc_cmp_eq0000_1827),
    .I2(state_m_and0000),
    .I3(fault_1802),
    .O(soc_mux0000)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  soc_cmp_eq0000_SW1 (
    .I0(state_m[2]),
    .I1(state_m[3]),
    .I2(state_m[1]),
    .O(N6)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  soc_cmp_eq0000 (
    .I0(state_m[0]),
    .I1(N12),
    .I2(soc_cmp_eq0000111_1828),
    .I3(N6),
    .O(soc_cmp_eq0000_1827)
  );
  LUT3 #(
    .INIT ( 8'h5D ))
  state_m_not00011 (
    .I0(rx_busy),
    .I1(rx_rdy),
    .I2(head_1806),
    .O(state_m_not0001)
  );
  LUT4 #(
    .INIT ( 16'h08FF ))
  head_not00011 (
    .I0(soc_cmp_eq0000_1827),
    .I1(rx_rdy),
    .I2(head_1806),
    .I3(rx_busy),
    .O(head_not0001)
  );
  LUT4 #(
    .INIT ( 16'hF1F0 ))
  soc_not0001 (
    .I0(fault_1802),
    .I1(head_1806),
    .I2(NlwRenamedSig_OI_soc),
    .I3(N8),
    .O(soc_not0001_1831)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  fault_not0001115_SW0_SW0 (
    .I0(fault_not000172_1805),
    .I1(rx_data[2]),
    .I2(rx_data[4]),
    .I3(rx_data[6]),
    .O(N10)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  cmp_data_and00001 (
    .I0(soc_cmp_eq0000111_1828),
    .I1(soc_cmp_eq0000124_1829),
    .I2(state_m[2]),
    .I3(state_m[3]),
    .O(cmp_data_and0000)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  soc_mux000011 (
    .I0(rx_busy),
    .I1(soc_cmp_eq0000_1827),
    .I2(rx_rdy),
    .I3(head_1806),
    .O(head_o_mux0000)
  );
  INV   \Madd_state_m_addsub0000_lut<0>_INV_0  (
    .I(state_m[0]),
    .O(Madd_state_m_addsub0000_lut[0])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \cmp_data_mux0000<1>11  (
    .I0(state_m[2]),
    .I1(soc_cmp_eq0000111_1828),
    .I2(soc_cmp_eq0000124_1829),
    .I3(state_m[1]),
    .O(\cmp_data_mux0000<1>1 )
  );
  MUXF5   \cmp_data_mux0000<1>1_f5  (
    .I0(\cmp_data_mux0000<1>1 ),
    .I1(N0),
    .S(state_m[3]),
    .O(\cmp_data_mux0000[1] )
  );
  LUT4_L #(
    .INIT ( 16'h6FF6 ))
  fault_not000172 (
    .I0(\cmp_data[5] ),
    .I1(rx_data[5]),
    .I2(\cmp_data[7] ),
    .I3(rx_data[7]),
    .LO(fault_not000172_1805)
  );
  LUT4_D #(
    .INIT ( 16'h0001 ))
  soc_cmp_eq0000124 (
    .I0(state_m[10]),
    .I1(state_m[9]),
    .I2(state_m[7]),
    .I3(state_m[8]),
    .LO(N12),
    .O(soc_cmp_eq0000124_1829)
  );
  LUT3_L #(
    .INIT ( 8'h80 ))
  soc_not0001_SW1 (
    .I0(rx_busy),
    .I1(rx_rdy),
    .I2(soc_cmp_eq0000_1827),
    .LO(N8)
  );
  LUT4_L #(
    .INIT ( 16'hFFBE ))
  fault_not0001115_SW0 (
    .I0(fault_not000145_1804),
    .I1(\cmp_data[0] ),
    .I2(rx_data[0]),
    .I3(N10),
    .LO(N4)
  );
endmodule

module rmii_recv_byte_INST_3 (
  clk, rst, busy, fast_eth, rmii_clk, rm_crs_dv, rdy, data, rm_rx_data
);
  input clk;
  input rst;
  output busy;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [7 : 0] data;
  input [1 : 0] rm_rx_data;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_1513 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_1515 ;
  wire N10;
  wire N111;
  wire N12;
  wire N121;
  wire N20;
  wire N22;
  wire N23;
  wire N24;
  wire N25;
  wire N26;
  wire NlwRenamedSig_OI_busy;
  wire busy_mux0000;
  wire busy_not0001_1528;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001;
  wire rx_data_cmp_eq0000;
  wire rx_data_cmp_eq000018_1555;
  wire rx_data_cmp_eq00007_1556;
  wire \rx_data_mux0000<0>1_1558 ;
  wire \rx_data_mux0000<0>2_1559 ;
  wire \rx_data_mux0000<2>1_1562 ;
  wire \rx_data_mux0000<2>2_1563 ;
  wire rx_data_not0002;
  wire s_rm_crs_dv_1570;
  wire s_rmii_clk_1573;
  wire wait_cnt_not0003;
  wire [7 : 0] rx_data;
  wire [7 : 0] rx_data_mux0000;
  wire [1 : 0] s_rm_rx_data;
  wire [4 : 0] wait_cnt;
  assign
    busy = NlwRenamedSig_OI_busy,
    rdy = NlwRenamedSig_OI_rdy;
  FDC   s_rm_crs_dv (
    .C(clk),
    .CLR(rst),
    .D(rm_crs_dv),
    .Q(s_rm_crs_dv_1570)
  );
  FDC   s_rmii_clk (
    .C(clk),
    .CLR(rst),
    .D(rmii_clk),
    .Q(s_rmii_clk_1573)
  );
  FDC   s_rm_rx_data_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[0]),
    .Q(s_rm_rx_data[0])
  );
  FDC   s_rm_rx_data_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[1]),
    .Q(s_rm_rx_data[1])
  );
  FDCE   rx_data_0 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[0]),
    .Q(rx_data[0])
  );
  FDCE   rx_data_1 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[1]),
    .Q(rx_data[1])
  );
  FDCE   rx_data_2 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[2]),
    .Q(rx_data[2])
  );
  FDCE   rx_data_3 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[3]),
    .Q(rx_data[3])
  );
  FDCE   rx_data_4 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[4]),
    .Q(rx_data[4])
  );
  FDCE   rx_data_5 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[5]),
    .Q(rx_data[5])
  );
  FDCE   rx_data_6 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[6]),
    .Q(rx_data[6])
  );
  FDCE   rx_data_7 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[7]),
    .Q(rx_data[7])
  );
  FDCE   rdy_1216 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(rdy_mux0000),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   busy_1217 (
    .C(clk),
    .CE(busy_not0001_1528),
    .CLR(rst),
    .D(busy_mux0000),
    .Q(NlwRenamedSig_OI_busy)
  );
  FDCE   data_0 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[2]),
    .Q(data[0])
  );
  FDCE   data_1 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[3]),
    .Q(data[1])
  );
  FDCE   data_2 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[4]),
    .Q(data[2])
  );
  FDCE   data_3 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[5]),
    .Q(data[3])
  );
  FDCE   data_4 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[6]),
    .Q(data[4])
  );
  FDCE   data_5 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[7]),
    .Q(data[5])
  );
  FDCE   data_6 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[0]),
    .Q(data[6])
  );
  FDCE   data_7 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[1]),
    .Q(data[7])
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<1>11  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .O(Mcount_wait_cnt1)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  wait_cnt_not00031 (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(wait_cnt_not0003)
  );
  LUT4 #(
    .INIT ( 16'h1014 ))
  busy_not0001 (
    .I0(N24),
    .I1(s_rm_crs_dv_1570),
    .I2(NlwRenamedSig_OI_busy),
    .I3(N121),
    .O(busy_not0001_1528)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  rx_data_cmp_eq000019 (
    .I0(N22),
    .I1(rx_data_cmp_eq000018_1555),
    .O(rx_data_cmp_eq0000)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \rx_data_mux0000<0>111  (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .O(N12)
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[7]),
    .I2(s_rm_crs_dv_1570),
    .I3(N12),
    .O(rx_data_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[6]),
    .I2(s_rm_crs_dv_1570),
    .I3(N12),
    .O(rx_data_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[5]),
    .I2(s_rm_crs_dv_1570),
    .I3(N12),
    .O(rx_data_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<1>2  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[3]),
    .I2(s_rm_crs_dv_1570),
    .I3(N12),
    .O(rx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<7>1  (
    .I0(s_rm_crs_dv_1570),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[1]),
    .O(rx_data_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<6>1  (
    .I0(s_rm_crs_dv_1570),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[0]),
    .O(rx_data_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  rx_data_not00021 (
    .I0(s_rmii_clk_1573),
    .I1(N25),
    .I2(wait_cnt[4]),
    .I3(s_rm_crs_dv_1570),
    .O(rx_data_not0002)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  busy_not0001_SW0 (
    .I0(rx_data_cmp_eq00007_1556),
    .I1(N23),
    .I2(s_rmii_clk_1573),
    .O(N121)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  rdy_not00011 (
    .I0(N20),
    .I1(s_rmii_clk_1573),
    .I2(N10),
    .I3(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<4>12  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(Mcount_wait_cnt4)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_mux00001 (
    .I0(s_rmii_clk_1573),
    .I1(N111),
    .I2(N26),
    .I3(wait_cnt[4]),
    .O(rdy_mux0000)
  );
  INV   busy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_busy),
    .O(busy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_1513 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_1513 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<2>1  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1570),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<2>1_1562 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<2>2  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1570),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<2>2_1563 )
  );
  MUXF5   \rx_data_mux0000<2>_f5  (
    .I0(\rx_data_mux0000<2>2_1563 ),
    .I1(\rx_data_mux0000<2>1_1562 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<0>1  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1570),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<0>1_1558 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<0>2  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1570),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<0>2_1559 )
  );
  MUXF5   \rx_data_mux0000<0>_f5  (
    .I0(\rx_data_mux0000<0>2_1559 ),
    .I1(\rx_data_mux0000<0>1_1558 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_1515 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_1515 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  rx_data_cmp_eq00007 (
    .I0(rx_data[6]),
    .I1(rx_data[7]),
    .I2(rx_data[4]),
    .I3(rx_data[5]),
    .LO(N22),
    .O(rx_data_cmp_eq00007_1556)
  );
  LUT4_D #(
    .INIT ( 16'h0020 ))
  rx_data_cmp_eq000018 (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .I2(rx_data[2]),
    .I3(rx_data[3]),
    .LO(N23),
    .O(rx_data_cmp_eq000018_1555)
  );
  LUT2_D #(
    .INIT ( 4'hE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .LO(N24),
    .O(N10)
  );
  LUT4_D #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<3>111  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(wait_cnt[0]),
    .LO(N25),
    .O(N111)
  );
  LUT4_D #(
    .INIT ( 16'h8000 ))
  rdy_mux000011 (
    .I0(s_rm_crs_dv_1570),
    .I1(NlwRenamedSig_OI_busy),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .LO(N26),
    .O(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module soc_pdo_recv (
  head_o, clk, soc, rst, rm_clk, rm_crs_dv, rm_rx
);
  output head_o;
  input clk;
  output soc;
  input rst;
  input rm_clk;
  input rm_crs_dv;
  input [1 : 0] rm_rx;
  wire \Madd_state_m_addsub0000_cy<10>_rt_1582 ;
  wire \Madd_state_m_addsub0000_cy<1>_rt_1584 ;
  wire \Madd_state_m_addsub0000_cy<2>_rt_1586 ;
  wire \Madd_state_m_addsub0000_cy<3>_rt_1588 ;
  wire \Madd_state_m_addsub0000_cy<4>_rt_1590 ;
  wire \Madd_state_m_addsub0000_cy<5>_rt_1592 ;
  wire \Madd_state_m_addsub0000_cy<6>_rt_1594 ;
  wire \Madd_state_m_addsub0000_cy<7>_rt_1596 ;
  wire \Madd_state_m_addsub0000_cy<8>_rt_1598 ;
  wire \Madd_state_m_addsub0000_cy<9>_rt_1600 ;
  wire \Madd_state_m_addsub0000_xor<11>_rt_1602 ;
  wire N0;
  wire N02;
  wire N1;
  wire N10;
  wire N4;
  wire N6;
  wire N8;
  wire \cmp_data[0] ;
  wire \cmp_data[5] ;
  wire \cmp_data[7] ;
  wire \cmp_data[8] ;
  wire cmp_data_and0000;
  wire \cmp_data_mux0000[0] ;
  wire \cmp_data_mux0000[1] ;
  wire \cmp_data_mux0000<1>1 ;
  wire \cmp_data_mux0000[3] ;
  wire \cmp_data_mux0000[8] ;
  wire fault_1621;
  wire fault_not0001;
  wire fault_not000145_1623;
  wire fault_not000172_1624;
  wire head_1625;
  wire head_not0001;
  wire rx_busy;
  wire rx_rdy;
  wire NlwRenamedSig_OI_soc;
  wire soc_cmp_eq0000_1643;
  wire soc_cmp_eq0000111_1644;
  wire soc_cmp_eq0000124_1645;
  wire soc_mux0000;
  wire soc_not0001_1647;
  wire state_m_and0000;
  wire state_m_not0001;
  wire [10 : 0] Madd_state_m_addsub0000_cy;
  wire [0 : 0] Madd_state_m_addsub0000_lut;
  wire [7 : 0] rx_data;
  wire [11 : 0] state_m;
  wire [11 : 0] state_m_addsub0000;
  wire [11 : 0] state_m_mux0000;
  assign
    soc = NlwRenamedSig_OI_soc;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   soc_1161 (
    .C(clk),
    .CE(soc_not0001_1647),
    .CLR(rst),
    .D(soc_mux0000),
    .Q(NlwRenamedSig_OI_soc)
  );
  FDCE   fault (
    .C(clk),
    .CE(fault_not0001),
    .CLR(rst),
    .D(rx_busy),
    .Q(fault_1621)
  );
  FDCE   head (
    .C(clk),
    .CE(head_not0001),
    .CLR(rst),
    .D(rx_busy),
    .Q(head_1625)
  );
  MUXCY   \Madd_state_m_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_state_m_addsub0000_lut[0]),
    .O(Madd_state_m_addsub0000_cy[0])
  );
  XORCY   \Madd_state_m_addsub0000_xor<0>  (
    .CI(N0),
    .LI(Madd_state_m_addsub0000_lut[0]),
    .O(state_m_addsub0000[0])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<1>  (
    .CI(Madd_state_m_addsub0000_cy[0]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<1>_rt_1584 ),
    .O(Madd_state_m_addsub0000_cy[1])
  );
  XORCY   \Madd_state_m_addsub0000_xor<1>  (
    .CI(Madd_state_m_addsub0000_cy[0]),
    .LI(\Madd_state_m_addsub0000_cy<1>_rt_1584 ),
    .O(state_m_addsub0000[1])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<2>  (
    .CI(Madd_state_m_addsub0000_cy[1]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<2>_rt_1586 ),
    .O(Madd_state_m_addsub0000_cy[2])
  );
  XORCY   \Madd_state_m_addsub0000_xor<2>  (
    .CI(Madd_state_m_addsub0000_cy[1]),
    .LI(\Madd_state_m_addsub0000_cy<2>_rt_1586 ),
    .O(state_m_addsub0000[2])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<3>  (
    .CI(Madd_state_m_addsub0000_cy[2]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<3>_rt_1588 ),
    .O(Madd_state_m_addsub0000_cy[3])
  );
  XORCY   \Madd_state_m_addsub0000_xor<3>  (
    .CI(Madd_state_m_addsub0000_cy[2]),
    .LI(\Madd_state_m_addsub0000_cy<3>_rt_1588 ),
    .O(state_m_addsub0000[3])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<4>  (
    .CI(Madd_state_m_addsub0000_cy[3]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<4>_rt_1590 ),
    .O(Madd_state_m_addsub0000_cy[4])
  );
  XORCY   \Madd_state_m_addsub0000_xor<4>  (
    .CI(Madd_state_m_addsub0000_cy[3]),
    .LI(\Madd_state_m_addsub0000_cy<4>_rt_1590 ),
    .O(state_m_addsub0000[4])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<5>  (
    .CI(Madd_state_m_addsub0000_cy[4]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<5>_rt_1592 ),
    .O(Madd_state_m_addsub0000_cy[5])
  );
  XORCY   \Madd_state_m_addsub0000_xor<5>  (
    .CI(Madd_state_m_addsub0000_cy[4]),
    .LI(\Madd_state_m_addsub0000_cy<5>_rt_1592 ),
    .O(state_m_addsub0000[5])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<6>  (
    .CI(Madd_state_m_addsub0000_cy[5]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<6>_rt_1594 ),
    .O(Madd_state_m_addsub0000_cy[6])
  );
  XORCY   \Madd_state_m_addsub0000_xor<6>  (
    .CI(Madd_state_m_addsub0000_cy[5]),
    .LI(\Madd_state_m_addsub0000_cy<6>_rt_1594 ),
    .O(state_m_addsub0000[6])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<7>  (
    .CI(Madd_state_m_addsub0000_cy[6]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<7>_rt_1596 ),
    .O(Madd_state_m_addsub0000_cy[7])
  );
  XORCY   \Madd_state_m_addsub0000_xor<7>  (
    .CI(Madd_state_m_addsub0000_cy[6]),
    .LI(\Madd_state_m_addsub0000_cy<7>_rt_1596 ),
    .O(state_m_addsub0000[7])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<8>  (
    .CI(Madd_state_m_addsub0000_cy[7]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<8>_rt_1598 ),
    .O(Madd_state_m_addsub0000_cy[8])
  );
  XORCY   \Madd_state_m_addsub0000_xor<8>  (
    .CI(Madd_state_m_addsub0000_cy[7]),
    .LI(\Madd_state_m_addsub0000_cy<8>_rt_1598 ),
    .O(state_m_addsub0000[8])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<9>  (
    .CI(Madd_state_m_addsub0000_cy[8]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<9>_rt_1600 ),
    .O(Madd_state_m_addsub0000_cy[9])
  );
  XORCY   \Madd_state_m_addsub0000_xor<9>  (
    .CI(Madd_state_m_addsub0000_cy[8]),
    .LI(\Madd_state_m_addsub0000_cy<9>_rt_1600 ),
    .O(state_m_addsub0000[9])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<10>  (
    .CI(Madd_state_m_addsub0000_cy[9]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<10>_rt_1582 ),
    .O(Madd_state_m_addsub0000_cy[10])
  );
  XORCY   \Madd_state_m_addsub0000_xor<10>  (
    .CI(Madd_state_m_addsub0000_cy[9]),
    .LI(\Madd_state_m_addsub0000_cy<10>_rt_1582 ),
    .O(state_m_addsub0000[10])
  );
  XORCY   \Madd_state_m_addsub0000_xor<11>  (
    .CI(Madd_state_m_addsub0000_cy[10]),
    .LI(\Madd_state_m_addsub0000_xor<11>_rt_1602 ),
    .O(state_m_addsub0000[11])
  );
  FDCE   state_m_10 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[10]),
    .Q(state_m[10])
  );
  FDCE   state_m_9 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[9]),
    .Q(state_m[9])
  );
  FDCE   state_m_11 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[11]),
    .Q(state_m[11])
  );
  FDCE   state_m_7 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[7]),
    .Q(state_m[7])
  );
  FDCE   state_m_6 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[6]),
    .Q(state_m[6])
  );
  FDCE   state_m_8 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[8]),
    .Q(state_m[8])
  );
  FDCE   state_m_4 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[4]),
    .Q(state_m[4])
  );
  FDPE   state_m_3 (
    .C(clk),
    .CE(state_m_not0001),
    .D(state_m_mux0000[3]),
    .PRE(rst),
    .Q(state_m[3])
  );
  FDCE   state_m_5 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[5]),
    .Q(state_m[5])
  );
  FDCE   state_m_1 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[1]),
    .Q(state_m[1])
  );
  FDCE   state_m_0 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[0]),
    .Q(state_m[0])
  );
  FDCE   state_m_2 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[2]),
    .Q(state_m[2])
  );
  FDP   cmp_data_8 (
    .C(clk),
    .D(\cmp_data_mux0000[0] ),
    .PRE(rst),
    .Q(\cmp_data[8] )
  );
  FDC   cmp_data_7 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[1] ),
    .Q(\cmp_data[7] )
  );
  FDC   cmp_data_5 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[3] ),
    .Q(\cmp_data[5] )
  );
  FDC   cmp_data_0 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[8] ),
    .Q(\cmp_data[0] )
  );
  rmii_recv_byte_INST_3   rmii_recv_byte (
    .clk(clk),
    .rst(rst),
    .busy(rx_busy),
    .fast_eth(N1),
    .rmii_clk(rm_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(rx_rdy),
    .data({rx_data[7], rx_data[6], rx_data[5], rx_data[4], rx_data[3], rx_data[2], rx_data[1], rx_data[0]}),
    .rm_rx_data({rm_rx[1], rm_rx[0]})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<0>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[0]),
    .O(state_m_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  fault_not000111 (
    .I0(rx_rdy),
    .I1(head_1625),
    .O(state_m_and0000)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  soc_mux00001 (
    .I0(soc_cmp_eq0000_1643),
    .I1(rx_busy),
    .I2(state_m_and0000),
    .I3(fault_1621),
    .O(soc_mux0000)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  soc_not0001 (
    .I0(N10),
    .I1(rx_busy),
    .I2(N02),
    .I3(NlwRenamedSig_OI_soc),
    .O(soc_not0001_1647)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<1>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[1]),
    .O(state_m_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \cmp_data_mux0000<3>1  (
    .I0(state_m[0]),
    .I1(cmp_data_and0000),
    .I2(state_m[1]),
    .O(\cmp_data_mux0000[3] )
  );
  LUT3 #(
    .INIT ( 8'h8F ))
  \cmp_data_mux0000<0>1  (
    .I0(state_m[0]),
    .I1(state_m[1]),
    .I2(cmp_data_and0000),
    .O(\cmp_data_mux0000[0] )
  );
  LUT3 #(
    .INIT ( 8'h60 ))
  \cmp_data_mux0000<8>1  (
    .I0(state_m[0]),
    .I1(state_m[1]),
    .I2(cmp_data_and0000),
    .O(\cmp_data_mux0000[8] )
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  soc_cmp_eq0000111 (
    .I0(state_m[6]),
    .I1(state_m[5]),
    .I2(state_m[4]),
    .I3(state_m[11]),
    .O(soc_cmp_eq0000111_1644)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  soc_cmp_eq0000124 (
    .I0(state_m[10]),
    .I1(state_m[9]),
    .I2(state_m[7]),
    .I3(state_m[8]),
    .O(soc_cmp_eq0000124_1645)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<2>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[2]),
    .O(state_m_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \state_m_mux0000<3>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[3]),
    .O(state_m_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<4>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[4]),
    .O(state_m_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<5>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[5]),
    .O(state_m_mux0000[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<6>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[6]),
    .O(state_m_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h6FF6 ))
  fault_not000145 (
    .I0(\cmp_data[5] ),
    .I1(rx_data[1]),
    .I2(\cmp_data[7] ),
    .I3(rx_data[3]),
    .O(fault_not000145_1623)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<7>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[7]),
    .O(state_m_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<8>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[8]),
    .O(state_m_mux0000[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<9>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[9]),
    .O(state_m_mux0000[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<10>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[10]),
    .O(state_m_mux0000[10])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<11>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[11]),
    .O(state_m_mux0000[11])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<1>_rt  (
    .I0(state_m[1]),
    .O(\Madd_state_m_addsub0000_cy<1>_rt_1584 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<2>_rt  (
    .I0(state_m[2]),
    .O(\Madd_state_m_addsub0000_cy<2>_rt_1586 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<3>_rt  (
    .I0(state_m[3]),
    .O(\Madd_state_m_addsub0000_cy<3>_rt_1588 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<4>_rt  (
    .I0(state_m[4]),
    .O(\Madd_state_m_addsub0000_cy<4>_rt_1590 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<5>_rt  (
    .I0(state_m[5]),
    .O(\Madd_state_m_addsub0000_cy<5>_rt_1592 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<6>_rt  (
    .I0(state_m[6]),
    .O(\Madd_state_m_addsub0000_cy<6>_rt_1594 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<7>_rt  (
    .I0(state_m[7]),
    .O(\Madd_state_m_addsub0000_cy<7>_rt_1596 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<8>_rt  (
    .I0(state_m[8]),
    .O(\Madd_state_m_addsub0000_cy<8>_rt_1598 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<9>_rt  (
    .I0(state_m[9]),
    .O(\Madd_state_m_addsub0000_cy<9>_rt_1600 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<10>_rt  (
    .I0(state_m[10]),
    .O(\Madd_state_m_addsub0000_cy<10>_rt_1582 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_xor<11>_rt  (
    .I0(state_m[11]),
    .O(\Madd_state_m_addsub0000_xor<11>_rt_1602 )
  );
  LUT4 #(
    .INIT ( 16'h08FF ))
  fault_not0001115 (
    .I0(state_m_and0000),
    .I1(N4),
    .I2(\cmp_data[8] ),
    .I3(rx_busy),
    .O(fault_not0001)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  soc_cmp_eq0000_SW1 (
    .I0(state_m[2]),
    .I1(state_m[3]),
    .I2(state_m[1]),
    .O(N6)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  soc_not0001_SW0 (
    .I0(rx_rdy),
    .I1(head_1625),
    .I2(fault_1621),
    .O(N02)
  );
  LUT3 #(
    .INIT ( 8'h5D ))
  state_m_not00011 (
    .I0(rx_busy),
    .I1(rx_rdy),
    .I2(head_1625),
    .O(state_m_not0001)
  );
  LUT4 #(
    .INIT ( 16'h08FF ))
  head_not00011 (
    .I0(soc_cmp_eq0000_1643),
    .I1(rx_rdy),
    .I2(head_1625),
    .I3(rx_busy),
    .O(head_not0001)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  fault_not0001115_SW0_SW0 (
    .I0(fault_not000172_1624),
    .I1(rx_data[2]),
    .I2(rx_data[4]),
    .I3(rx_data[6]),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  cmp_data_and00001 (
    .I0(soc_cmp_eq0000111_1644),
    .I1(soc_cmp_eq0000124_1645),
    .I2(state_m[2]),
    .I3(state_m[3]),
    .O(cmp_data_and0000)
  );
  INV   \Madd_state_m_addsub0000_lut<0>_INV_0  (
    .I(state_m[0]),
    .O(Madd_state_m_addsub0000_lut[0])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \cmp_data_mux0000<1>11  (
    .I0(state_m[2]),
    .I1(soc_cmp_eq0000111_1644),
    .I2(soc_cmp_eq0000124_1645),
    .I3(state_m[1]),
    .O(\cmp_data_mux0000<1>1 )
  );
  MUXF5   \cmp_data_mux0000<1>1_f5  (
    .I0(\cmp_data_mux0000<1>1 ),
    .I1(N0),
    .S(state_m[3]),
    .O(\cmp_data_mux0000[1] )
  );
  LUT4_L #(
    .INIT ( 16'h6FF6 ))
  fault_not000172 (
    .I0(\cmp_data[5] ),
    .I1(rx_data[5]),
    .I2(\cmp_data[7] ),
    .I3(rx_data[7]),
    .LO(fault_not000172_1624)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  soc_cmp_eq0000 (
    .I0(soc_cmp_eq0000111_1644),
    .I1(soc_cmp_eq0000124_1645),
    .I2(state_m[0]),
    .I3(N6),
    .LO(N10),
    .O(soc_cmp_eq0000_1643)
  );
  LUT4_L #(
    .INIT ( 16'hFFBE ))
  fault_not0001115_SW0 (
    .I0(fault_not000145_1623),
    .I1(\cmp_data[0] ),
    .I2(rx_data[0]),
    .I3(N8),
    .LO(N4)
  );
endmodule

module rmii_recv_byte_INST_2 (
  clk, rst, busy, fast_eth, rmii_clk, rm_crs_dv, rdy, data, rm_rx_data
);
  input clk;
  input rst;
  output busy;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [7 : 0] data;
  input [1 : 0] rm_rx_data;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_1330 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_1332 ;
  wire N10;
  wire N111;
  wire N12;
  wire N121;
  wire N20;
  wire N22;
  wire N23;
  wire N24;
  wire N25;
  wire N26;
  wire NlwRenamedSig_OI_busy;
  wire busy_mux0000;
  wire busy_not0001_1345;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001;
  wire rx_data_cmp_eq0000;
  wire rx_data_cmp_eq000018_1372;
  wire rx_data_cmp_eq00007_1373;
  wire \rx_data_mux0000<0>1_1375 ;
  wire \rx_data_mux0000<0>2_1376 ;
  wire \rx_data_mux0000<2>1_1379 ;
  wire \rx_data_mux0000<2>2_1380 ;
  wire rx_data_not0002;
  wire s_rm_crs_dv_1387;
  wire s_rmii_clk_1390;
  wire wait_cnt_not0003;
  wire [7 : 0] rx_data;
  wire [7 : 0] rx_data_mux0000;
  wire [1 : 0] s_rm_rx_data;
  wire [4 : 0] wait_cnt;
  assign
    busy = NlwRenamedSig_OI_busy,
    rdy = NlwRenamedSig_OI_rdy;
  FDC   s_rm_crs_dv (
    .C(clk),
    .CLR(rst),
    .D(rm_crs_dv),
    .Q(s_rm_crs_dv_1387)
  );
  FDC   s_rmii_clk (
    .C(clk),
    .CLR(rst),
    .D(rmii_clk),
    .Q(s_rmii_clk_1390)
  );
  FDC   s_rm_rx_data_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[0]),
    .Q(s_rm_rx_data[0])
  );
  FDC   s_rm_rx_data_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[1]),
    .Q(s_rm_rx_data[1])
  );
  FDCE   rx_data_0 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[0]),
    .Q(rx_data[0])
  );
  FDCE   rx_data_1 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[1]),
    .Q(rx_data[1])
  );
  FDCE   rx_data_2 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[2]),
    .Q(rx_data[2])
  );
  FDCE   rx_data_3 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[3]),
    .Q(rx_data[3])
  );
  FDCE   rx_data_4 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[4]),
    .Q(rx_data[4])
  );
  FDCE   rx_data_5 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[5]),
    .Q(rx_data[5])
  );
  FDCE   rx_data_6 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[6]),
    .Q(rx_data[6])
  );
  FDCE   rx_data_7 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[7]),
    .Q(rx_data[7])
  );
  FDCE   rdy_1059 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(rdy_mux0000),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   busy_1060 (
    .C(clk),
    .CE(busy_not0001_1345),
    .CLR(rst),
    .D(busy_mux0000),
    .Q(NlwRenamedSig_OI_busy)
  );
  FDCE   data_0 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[2]),
    .Q(data[0])
  );
  FDCE   data_1 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[3]),
    .Q(data[1])
  );
  FDCE   data_2 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[4]),
    .Q(data[2])
  );
  FDCE   data_3 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[5]),
    .Q(data[3])
  );
  FDCE   data_4 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[6]),
    .Q(data[4])
  );
  FDCE   data_5 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[7]),
    .Q(data[5])
  );
  FDCE   data_6 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[0]),
    .Q(data[6])
  );
  FDCE   data_7 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[1]),
    .Q(data[7])
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<1>11  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .O(Mcount_wait_cnt1)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  wait_cnt_not00031 (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(wait_cnt_not0003)
  );
  LUT4 #(
    .INIT ( 16'h1014 ))
  busy_not0001 (
    .I0(N24),
    .I1(s_rm_crs_dv_1387),
    .I2(NlwRenamedSig_OI_busy),
    .I3(N121),
    .O(busy_not0001_1345)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  rx_data_cmp_eq000019 (
    .I0(N22),
    .I1(rx_data_cmp_eq000018_1372),
    .O(rx_data_cmp_eq0000)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \rx_data_mux0000<0>111  (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .O(N12)
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[7]),
    .I2(s_rm_crs_dv_1387),
    .I3(N12),
    .O(rx_data_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[6]),
    .I2(s_rm_crs_dv_1387),
    .I3(N12),
    .O(rx_data_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[5]),
    .I2(s_rm_crs_dv_1387),
    .I3(N12),
    .O(rx_data_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<1>2  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[3]),
    .I2(s_rm_crs_dv_1387),
    .I3(N12),
    .O(rx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<7>1  (
    .I0(s_rm_crs_dv_1387),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[1]),
    .O(rx_data_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<6>1  (
    .I0(s_rm_crs_dv_1387),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[0]),
    .O(rx_data_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  rx_data_not00021 (
    .I0(s_rmii_clk_1390),
    .I1(N25),
    .I2(wait_cnt[4]),
    .I3(s_rm_crs_dv_1387),
    .O(rx_data_not0002)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  busy_not0001_SW0 (
    .I0(rx_data_cmp_eq00007_1373),
    .I1(N23),
    .I2(s_rmii_clk_1390),
    .O(N121)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  rdy_not00011 (
    .I0(N20),
    .I1(s_rmii_clk_1390),
    .I2(N10),
    .I3(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<4>12  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(Mcount_wait_cnt4)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_mux00001 (
    .I0(s_rmii_clk_1390),
    .I1(N111),
    .I2(N26),
    .I3(wait_cnt[4]),
    .O(rdy_mux0000)
  );
  INV   busy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_busy),
    .O(busy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_1330 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_1330 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<2>1  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1387),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<2>1_1379 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<2>2  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1387),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<2>2_1380 )
  );
  MUXF5   \rx_data_mux0000<2>_f5  (
    .I0(\rx_data_mux0000<2>2_1380 ),
    .I1(\rx_data_mux0000<2>1_1379 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<0>1  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1387),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<0>1_1375 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<0>2  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1387),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<0>2_1376 )
  );
  MUXF5   \rx_data_mux0000<0>_f5  (
    .I0(\rx_data_mux0000<0>2_1376 ),
    .I1(\rx_data_mux0000<0>1_1375 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_1332 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_1332 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  rx_data_cmp_eq00007 (
    .I0(rx_data[6]),
    .I1(rx_data[7]),
    .I2(rx_data[4]),
    .I3(rx_data[5]),
    .LO(N22),
    .O(rx_data_cmp_eq00007_1373)
  );
  LUT4_D #(
    .INIT ( 16'h0020 ))
  rx_data_cmp_eq000018 (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .I2(rx_data[2]),
    .I3(rx_data[3]),
    .LO(N23),
    .O(rx_data_cmp_eq000018_1372)
  );
  LUT2_D #(
    .INIT ( 4'hE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .LO(N24),
    .O(N10)
  );
  LUT4_D #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<3>111  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(wait_cnt[0]),
    .LO(N25),
    .O(N111)
  );
  LUT4_D #(
    .INIT ( 16'h8000 ))
  rdy_mux000011 (
    .I0(s_rm_crs_dv_1387),
    .I1(NlwRenamedSig_OI_busy),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .LO(N26),
    .O(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module powerlink_rhub_pdo_recv (
  clk, rst, pdo_st, rm_clk, rm_crs_dv, rm_rx, node
);
  input clk;
  input rst;
  output pdo_st;
  input rm_clk;
  input rm_crs_dv;
  input [1 : 0] rm_rx;
  input [7 : 0] node;
  wire \Madd_state_m_addsub0000_cy<10>_rt_1399 ;
  wire \Madd_state_m_addsub0000_cy<1>_rt_1401 ;
  wire \Madd_state_m_addsub0000_cy<2>_rt_1403 ;
  wire \Madd_state_m_addsub0000_cy<3>_rt_1405 ;
  wire \Madd_state_m_addsub0000_cy<4>_rt_1407 ;
  wire \Madd_state_m_addsub0000_cy<5>_rt_1409 ;
  wire \Madd_state_m_addsub0000_cy<6>_rt_1411 ;
  wire \Madd_state_m_addsub0000_cy<7>_rt_1413 ;
  wire \Madd_state_m_addsub0000_cy<8>_rt_1415 ;
  wire \Madd_state_m_addsub0000_cy<9>_rt_1417 ;
  wire \Madd_state_m_addsub0000_xor<11>_rt_1419 ;
  wire N0;
  wire N01;
  wire N02;
  wire N1;
  wire N12;
  wire N14;
  wire N16;
  wire N18;
  wire N2;
  wire N21;
  wire N4;
  wire N6;
  wire N8;
  wire \cmp_data[1] ;
  wire \cmp_data[5] ;
  wire \cmp_data[7] ;
  wire \cmp_data[8] ;
  wire \cmp_data_mux0000[0] ;
  wire \cmp_data_mux0000[1] ;
  wire \cmp_data_mux0000[3] ;
  wire \cmp_data_mux0000[7] ;
  wire fault_1442;
  wire fault_not0001;
  wire fault_not000114;
  wire fault_not0001141_1445;
  wire fault_not000162_1446;
  wire fault_not000195_1447;
  wire head_1448;
  wire head_not0001_1449;
  wire NlwRenamedSig_OI_pdo_st;
  wire pdo_st_mux0000;
  wire pdo_st_not0001;
  wire rx_busy;
  wire rx_rdy;
  wire state_m_not0001;
  wire [10 : 0] Madd_state_m_addsub0000_cy;
  wire [0 : 0] Madd_state_m_addsub0000_lut;
  wire [7 : 0] rx_data;
  wire [11 : 0] state_m;
  wire [11 : 0] state_m_addsub0000;
  wire [11 : 0] state_m_mux0000;
  assign
    pdo_st = NlwRenamedSig_OI_pdo_st;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   pdo_st_1004 (
    .C(clk),
    .CE(pdo_st_not0001),
    .CLR(rst),
    .D(pdo_st_mux0000),
    .Q(NlwRenamedSig_OI_pdo_st)
  );
  FDCE   fault (
    .C(clk),
    .CE(fault_not0001),
    .CLR(rst),
    .D(rx_busy),
    .Q(fault_1442)
  );
  FDCE   head (
    .C(clk),
    .CE(head_not0001_1449),
    .CLR(rst),
    .D(rx_busy),
    .Q(head_1448)
  );
  MUXCY   \Madd_state_m_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_state_m_addsub0000_lut[0]),
    .O(Madd_state_m_addsub0000_cy[0])
  );
  XORCY   \Madd_state_m_addsub0000_xor<0>  (
    .CI(N0),
    .LI(Madd_state_m_addsub0000_lut[0]),
    .O(state_m_addsub0000[0])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<1>  (
    .CI(Madd_state_m_addsub0000_cy[0]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<1>_rt_1401 ),
    .O(Madd_state_m_addsub0000_cy[1])
  );
  XORCY   \Madd_state_m_addsub0000_xor<1>  (
    .CI(Madd_state_m_addsub0000_cy[0]),
    .LI(\Madd_state_m_addsub0000_cy<1>_rt_1401 ),
    .O(state_m_addsub0000[1])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<2>  (
    .CI(Madd_state_m_addsub0000_cy[1]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<2>_rt_1403 ),
    .O(Madd_state_m_addsub0000_cy[2])
  );
  XORCY   \Madd_state_m_addsub0000_xor<2>  (
    .CI(Madd_state_m_addsub0000_cy[1]),
    .LI(\Madd_state_m_addsub0000_cy<2>_rt_1403 ),
    .O(state_m_addsub0000[2])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<3>  (
    .CI(Madd_state_m_addsub0000_cy[2]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<3>_rt_1405 ),
    .O(Madd_state_m_addsub0000_cy[3])
  );
  XORCY   \Madd_state_m_addsub0000_xor<3>  (
    .CI(Madd_state_m_addsub0000_cy[2]),
    .LI(\Madd_state_m_addsub0000_cy<3>_rt_1405 ),
    .O(state_m_addsub0000[3])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<4>  (
    .CI(Madd_state_m_addsub0000_cy[3]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<4>_rt_1407 ),
    .O(Madd_state_m_addsub0000_cy[4])
  );
  XORCY   \Madd_state_m_addsub0000_xor<4>  (
    .CI(Madd_state_m_addsub0000_cy[3]),
    .LI(\Madd_state_m_addsub0000_cy<4>_rt_1407 ),
    .O(state_m_addsub0000[4])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<5>  (
    .CI(Madd_state_m_addsub0000_cy[4]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<5>_rt_1409 ),
    .O(Madd_state_m_addsub0000_cy[5])
  );
  XORCY   \Madd_state_m_addsub0000_xor<5>  (
    .CI(Madd_state_m_addsub0000_cy[4]),
    .LI(\Madd_state_m_addsub0000_cy<5>_rt_1409 ),
    .O(state_m_addsub0000[5])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<6>  (
    .CI(Madd_state_m_addsub0000_cy[5]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<6>_rt_1411 ),
    .O(Madd_state_m_addsub0000_cy[6])
  );
  XORCY   \Madd_state_m_addsub0000_xor<6>  (
    .CI(Madd_state_m_addsub0000_cy[5]),
    .LI(\Madd_state_m_addsub0000_cy<6>_rt_1411 ),
    .O(state_m_addsub0000[6])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<7>  (
    .CI(Madd_state_m_addsub0000_cy[6]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<7>_rt_1413 ),
    .O(Madd_state_m_addsub0000_cy[7])
  );
  XORCY   \Madd_state_m_addsub0000_xor<7>  (
    .CI(Madd_state_m_addsub0000_cy[6]),
    .LI(\Madd_state_m_addsub0000_cy<7>_rt_1413 ),
    .O(state_m_addsub0000[7])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<8>  (
    .CI(Madd_state_m_addsub0000_cy[7]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<8>_rt_1415 ),
    .O(Madd_state_m_addsub0000_cy[8])
  );
  XORCY   \Madd_state_m_addsub0000_xor<8>  (
    .CI(Madd_state_m_addsub0000_cy[7]),
    .LI(\Madd_state_m_addsub0000_cy<8>_rt_1415 ),
    .O(state_m_addsub0000[8])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<9>  (
    .CI(Madd_state_m_addsub0000_cy[8]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<9>_rt_1417 ),
    .O(Madd_state_m_addsub0000_cy[9])
  );
  XORCY   \Madd_state_m_addsub0000_xor<9>  (
    .CI(Madd_state_m_addsub0000_cy[8]),
    .LI(\Madd_state_m_addsub0000_cy<9>_rt_1417 ),
    .O(state_m_addsub0000[9])
  );
  MUXCY   \Madd_state_m_addsub0000_cy<10>  (
    .CI(Madd_state_m_addsub0000_cy[9]),
    .DI(N0),
    .S(\Madd_state_m_addsub0000_cy<10>_rt_1399 ),
    .O(Madd_state_m_addsub0000_cy[10])
  );
  XORCY   \Madd_state_m_addsub0000_xor<10>  (
    .CI(Madd_state_m_addsub0000_cy[9]),
    .LI(\Madd_state_m_addsub0000_cy<10>_rt_1399 ),
    .O(state_m_addsub0000[10])
  );
  XORCY   \Madd_state_m_addsub0000_xor<11>  (
    .CI(Madd_state_m_addsub0000_cy[10]),
    .LI(\Madd_state_m_addsub0000_xor<11>_rt_1419 ),
    .O(state_m_addsub0000[11])
  );
  FDCE   state_m_10 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[10]),
    .Q(state_m[10])
  );
  FDCE   state_m_9 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[9]),
    .Q(state_m[9])
  );
  FDCE   state_m_11 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[11]),
    .Q(state_m[11])
  );
  FDCE   state_m_7 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[7]),
    .Q(state_m[7])
  );
  FDCE   state_m_6 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[6]),
    .Q(state_m[6])
  );
  FDCE   state_m_8 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[8]),
    .Q(state_m[8])
  );
  FDCE   state_m_4 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[4]),
    .Q(state_m[4])
  );
  FDPE   state_m_3 (
    .C(clk),
    .CE(state_m_not0001),
    .D(state_m_mux0000[3]),
    .PRE(rst),
    .Q(state_m[3])
  );
  FDCE   state_m_5 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[5]),
    .Q(state_m[5])
  );
  FDCE   state_m_1 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[1]),
    .Q(state_m[1])
  );
  FDCE   state_m_0 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[0]),
    .Q(state_m[0])
  );
  FDCE   state_m_2 (
    .C(clk),
    .CE(state_m_not0001),
    .CLR(rst),
    .D(state_m_mux0000[2]),
    .Q(state_m[2])
  );
  FDP   cmp_data_8 (
    .C(clk),
    .D(\cmp_data_mux0000[0] ),
    .PRE(rst),
    .Q(\cmp_data[8] )
  );
  FDC   cmp_data_7 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[1] ),
    .Q(\cmp_data[7] )
  );
  FDC   cmp_data_5 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[3] ),
    .Q(\cmp_data[5] )
  );
  FDC   cmp_data_1 (
    .C(clk),
    .CLR(rst),
    .D(\cmp_data_mux0000[7] ),
    .Q(\cmp_data[1] )
  );
  rmii_recv_byte_INST_2   rmii_recv_byte (
    .clk(clk),
    .rst(rst),
    .busy(rx_busy),
    .fast_eth(N1),
    .rmii_clk(rm_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(rx_rdy),
    .data({rx_data[7], rx_data[6], rx_data[5], rx_data[4], rx_data[3], rx_data[2], rx_data[1], rx_data[0]}),
    .rm_rx_data({rm_rx[1], rm_rx[0]})
  );
  LUT3 #(
    .INIT ( 8'h5D ))
  state_m_not00011 (
    .I0(rx_busy),
    .I1(rx_rdy),
    .I2(head_1448),
    .O(state_m_not0001)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \cmp_data_mux0000<1>_SW0  (
    .I0(state_m[4]),
    .I1(state_m[1]),
    .O(N02)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  \cmp_data_mux0000<1>  (
    .I0(N01),
    .I1(state_m[3]),
    .I2(state_m[2]),
    .I3(N02),
    .O(\cmp_data_mux0000[1] )
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  \cmp_data_mux0000<3>_SW0  (
    .I0(state_m[1]),
    .I1(state_m[2]),
    .I2(state_m[4]),
    .O(N21)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  \cmp_data_mux0000<3>  (
    .I0(state_m[0]),
    .I1(state_m[3]),
    .I2(N01),
    .I3(N21),
    .O(\cmp_data_mux0000[3] )
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  \cmp_data_mux0000<0>_SW0  (
    .I0(state_m[3]),
    .I1(state_m[2]),
    .I2(state_m[4]),
    .O(N4)
  );
  LUT4 #(
    .INIT ( 16'hF8FF ))
  \cmp_data_mux0000<0>  (
    .I0(state_m[1]),
    .I1(state_m[0]),
    .I2(N4),
    .I3(N01),
    .O(\cmp_data_mux0000[0] )
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  \cmp_data_mux0000<7>_SW0  (
    .I0(state_m[3]),
    .I1(state_m[2]),
    .I2(state_m[4]),
    .O(N6)
  );
  LUT4 #(
    .INIT ( 16'h0028 ))
  \cmp_data_mux0000<7>  (
    .I0(N01),
    .I1(state_m[0]),
    .I2(state_m[1]),
    .I3(N6),
    .O(\cmp_data_mux0000[7] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<0>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[0]),
    .O(state_m_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<1>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[1]),
    .O(state_m_mux0000[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<2>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[2]),
    .O(state_m_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \state_m_mux0000<3>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[3]),
    .O(state_m_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<4>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[4]),
    .O(state_m_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<5>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[5]),
    .O(state_m_mux0000[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<6>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[6]),
    .O(state_m_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  head_not0001_SW0 (
    .I0(head_1448),
    .I1(rx_rdy),
    .I2(state_m[4]),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h3B33 ))
  head_not0001 (
    .I0(state_m[0]),
    .I1(rx_busy),
    .I2(N8),
    .I3(N2),
    .O(head_not0001_1449)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  fault_not000195 (
    .I0(rx_rdy),
    .I1(head_1448),
    .I2(\cmp_data[8] ),
    .O(fault_not000195_1447)
  );
  LUT4 #(
    .INIT ( 16'hCF8F ))
  fault_not0001112 (
    .I0(fault_not000162_1446),
    .I1(fault_not000195_1447),
    .I2(rx_busy),
    .I3(fault_not000114),
    .O(fault_not0001)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<7>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[7]),
    .O(state_m_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<8>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[8]),
    .O(state_m_mux0000[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<9>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[9]),
    .O(state_m_mux0000[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<10>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[10]),
    .O(state_m_mux0000[10])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_m_mux0000<11>1  (
    .I0(rx_busy),
    .I1(state_m_addsub0000[11]),
    .O(state_m_mux0000[11])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  pdo_st_not00012 (
    .I0(NlwRenamedSig_OI_pdo_st),
    .I1(pdo_st_mux0000),
    .O(pdo_st_not0001)
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  head_not000121 (
    .I0(state_m[1]),
    .I1(state_m[3]),
    .I2(state_m[2]),
    .I3(N18),
    .O(N2)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  head_not00011_SW0 (
    .I0(state_m[6]),
    .I1(state_m[5]),
    .I2(state_m[11]),
    .I3(state_m[10]),
    .O(N12)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<1>_rt  (
    .I0(state_m[1]),
    .O(\Madd_state_m_addsub0000_cy<1>_rt_1401 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<2>_rt  (
    .I0(state_m[2]),
    .O(\Madd_state_m_addsub0000_cy<2>_rt_1403 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<3>_rt  (
    .I0(state_m[3]),
    .O(\Madd_state_m_addsub0000_cy<3>_rt_1405 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<4>_rt  (
    .I0(state_m[4]),
    .O(\Madd_state_m_addsub0000_cy<4>_rt_1407 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<5>_rt  (
    .I0(state_m[5]),
    .O(\Madd_state_m_addsub0000_cy<5>_rt_1409 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<6>_rt  (
    .I0(state_m[6]),
    .O(\Madd_state_m_addsub0000_cy<6>_rt_1411 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<7>_rt  (
    .I0(state_m[7]),
    .O(\Madd_state_m_addsub0000_cy<7>_rt_1413 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<8>_rt  (
    .I0(state_m[8]),
    .O(\Madd_state_m_addsub0000_cy<8>_rt_1415 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<9>_rt  (
    .I0(state_m[9]),
    .O(\Madd_state_m_addsub0000_cy<9>_rt_1417 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_cy<10>_rt  (
    .I0(state_m[10]),
    .O(\Madd_state_m_addsub0000_cy<10>_rt_1399 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_state_m_addsub0000_xor<11>_rt  (
    .I0(state_m[11]),
    .O(\Madd_state_m_addsub0000_xor<11>_rt_1419 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  pdo_st_not00011_SW0_SW0 (
    .I0(rx_busy),
    .I1(fault_1442),
    .O(N14)
  );
  LUT4 #(
    .INIT ( 16'h3233 ))
  pdo_st_not00011 (
    .I0(state_m[4]),
    .I1(N14),
    .I2(state_m[0]),
    .I3(N2),
    .O(pdo_st_mux0000)
  );
  LUT3 #(
    .INIT ( 8'h7E ))
  fault_not000162_SW0 (
    .I0(\cmp_data[7] ),
    .I1(rx_data[3]),
    .I2(rx_data[7]),
    .O(N16)
  );
  INV   \Madd_state_m_addsub0000_lut<0>_INV_0  (
    .I(state_m[0]),
    .O(Madd_state_m_addsub0000_lut[0])
  );
  LUT4 #(
    .INIT ( 16'hFFBE ))
  fault_not0001141 (
    .I0(rx_data[2]),
    .I1(rx_data[5]),
    .I2(\cmp_data[5] ),
    .I3(rx_data[4]),
    .O(fault_not0001141_1445)
  );
  MUXF5   fault_not000114_f5 (
    .I0(fault_not0001141_1445),
    .I1(N1),
    .S(rx_data[6]),
    .O(fault_not000114)
  );
  LUT4_D #(
    .INIT ( 16'h0001 ))
  head_not00011 (
    .I0(state_m[9]),
    .I1(state_m[8]),
    .I2(state_m[7]),
    .I3(N12),
    .LO(N18),
    .O(N01)
  );
  LUT4_L #(
    .INIT ( 16'hF7FE ))
  fault_not000162 (
    .I0(\cmp_data[1] ),
    .I1(rx_data[0]),
    .I2(N16),
    .I3(rx_data[1]),
    .LO(fault_not000162_1446)
  );
endmodule

module rmii_recv_byte_INST_1 (
  clk, rst, busy, fast_eth, rmii_clk, rm_crs_dv, rdy, data, rm_rx_data
);
  input clk;
  input rst;
  output busy;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [7 : 0] data;
  input [1 : 0] rm_rx_data;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_1126 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_1128 ;
  wire N10;
  wire N111;
  wire N12;
  wire N121;
  wire N20;
  wire N22;
  wire N23;
  wire N24;
  wire N25;
  wire N26;
  wire NlwRenamedSig_OI_busy;
  wire busy_mux0000;
  wire busy_not0001_1141;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001;
  wire rx_data_cmp_eq0000;
  wire rx_data_cmp_eq000018_1168;
  wire rx_data_cmp_eq00007_1169;
  wire \rx_data_mux0000<0>1_1171 ;
  wire \rx_data_mux0000<0>2_1172 ;
  wire \rx_data_mux0000<2>1_1175 ;
  wire \rx_data_mux0000<2>2_1176 ;
  wire rx_data_not0002;
  wire s_rm_crs_dv_1183;
  wire s_rmii_clk_1186;
  wire wait_cnt_not0003;
  wire [7 : 0] rx_data;
  wire [7 : 0] rx_data_mux0000;
  wire [1 : 0] s_rm_rx_data;
  wire [4 : 0] wait_cnt;
  assign
    busy = NlwRenamedSig_OI_busy,
    rdy = NlwRenamedSig_OI_rdy;
  FDC   s_rm_crs_dv (
    .C(clk),
    .CLR(rst),
    .D(rm_crs_dv),
    .Q(s_rm_crs_dv_1183)
  );
  FDC   s_rmii_clk (
    .C(clk),
    .CLR(rst),
    .D(rmii_clk),
    .Q(s_rmii_clk_1186)
  );
  FDC   s_rm_rx_data_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[0]),
    .Q(s_rm_rx_data[0])
  );
  FDC   s_rm_rx_data_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[1]),
    .Q(s_rm_rx_data[1])
  );
  FDCE   rx_data_0 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[0]),
    .Q(rx_data[0])
  );
  FDCE   rx_data_1 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[1]),
    .Q(rx_data[1])
  );
  FDCE   rx_data_2 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[2]),
    .Q(rx_data[2])
  );
  FDCE   rx_data_3 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[3]),
    .Q(rx_data[3])
  );
  FDCE   rx_data_4 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[4]),
    .Q(rx_data[4])
  );
  FDCE   rx_data_5 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[5]),
    .Q(rx_data[5])
  );
  FDCE   rx_data_6 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[6]),
    .Q(rx_data[6])
  );
  FDCE   rx_data_7 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[7]),
    .Q(rx_data[7])
  );
  FDCE   rdy_917 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(rdy_mux0000),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   busy_918 (
    .C(clk),
    .CE(busy_not0001_1141),
    .CLR(rst),
    .D(busy_mux0000),
    .Q(NlwRenamedSig_OI_busy)
  );
  FDCE   data_0 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[2]),
    .Q(data[0])
  );
  FDCE   data_1 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[3]),
    .Q(data[1])
  );
  FDCE   data_2 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[4]),
    .Q(data[2])
  );
  FDCE   data_3 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[5]),
    .Q(data[3])
  );
  FDCE   data_4 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[6]),
    .Q(data[4])
  );
  FDCE   data_5 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[7]),
    .Q(data[5])
  );
  FDCE   data_6 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[0]),
    .Q(data[6])
  );
  FDCE   data_7 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[1]),
    .Q(data[7])
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<1>11  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .O(Mcount_wait_cnt1)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  wait_cnt_not00031 (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(wait_cnt_not0003)
  );
  LUT4 #(
    .INIT ( 16'h1404 ))
  busy_not0001 (
    .I0(N24),
    .I1(NlwRenamedSig_OI_busy),
    .I2(s_rm_crs_dv_1183),
    .I3(N121),
    .O(busy_not0001_1141)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  rx_data_cmp_eq000019 (
    .I0(N22),
    .I1(rx_data_cmp_eq000018_1168),
    .O(rx_data_cmp_eq0000)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \rx_data_mux0000<0>111  (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .O(N12)
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[7]),
    .I2(s_rm_crs_dv_1183),
    .I3(N12),
    .O(rx_data_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[6]),
    .I2(s_rm_crs_dv_1183),
    .I3(N12),
    .O(rx_data_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[5]),
    .I2(s_rm_crs_dv_1183),
    .I3(N12),
    .O(rx_data_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<1>2  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[3]),
    .I2(s_rm_crs_dv_1183),
    .I3(N12),
    .O(rx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<7>1  (
    .I0(s_rm_crs_dv_1183),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[1]),
    .O(rx_data_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<6>1  (
    .I0(s_rm_crs_dv_1183),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[0]),
    .O(rx_data_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  rx_data_not00021 (
    .I0(s_rmii_clk_1186),
    .I1(N25),
    .I2(wait_cnt[4]),
    .I3(s_rm_crs_dv_1183),
    .O(rx_data_not0002)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  busy_not0001_SW0 (
    .I0(rx_data_cmp_eq00007_1169),
    .I1(N23),
    .I2(s_rmii_clk_1186),
    .O(N121)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  rdy_not00011 (
    .I0(N20),
    .I1(s_rmii_clk_1186),
    .I2(N10),
    .I3(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<4>12  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(Mcount_wait_cnt4)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_mux00001 (
    .I0(s_rmii_clk_1186),
    .I1(N111),
    .I2(N26),
    .I3(wait_cnt[4]),
    .O(rdy_mux0000)
  );
  INV   busy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_busy),
    .O(busy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_1126 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_1126 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<2>1  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1183),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<2>1_1175 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<2>2  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_1183),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<2>2_1176 )
  );
  MUXF5   \rx_data_mux0000<2>_f5  (
    .I0(\rx_data_mux0000<2>2_1176 ),
    .I1(\rx_data_mux0000<2>1_1175 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<0>1  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1183),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<0>1_1171 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<0>2  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_1183),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<0>2_1172 )
  );
  MUXF5   \rx_data_mux0000<0>_f5  (
    .I0(\rx_data_mux0000<0>2_1172 ),
    .I1(\rx_data_mux0000<0>1_1171 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_1128 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_1128 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  rx_data_cmp_eq00007 (
    .I0(rx_data[6]),
    .I1(rx_data[7]),
    .I2(rx_data[4]),
    .I3(rx_data[5]),
    .LO(N22),
    .O(rx_data_cmp_eq00007_1169)
  );
  LUT4_D #(
    .INIT ( 16'h0020 ))
  rx_data_cmp_eq000018 (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .I2(rx_data[2]),
    .I3(rx_data[3]),
    .LO(N23),
    .O(rx_data_cmp_eq000018_1168)
  );
  LUT2_D #(
    .INIT ( 4'hE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .LO(N24),
    .O(N10)
  );
  LUT4_D #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<3>111  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(wait_cnt[0]),
    .LO(N25),
    .O(N111)
  );
  LUT4_D #(
    .INIT ( 16'h8000 ))
  rdy_mux000011 (
    .I0(s_rm_crs_dv_1183),
    .I1(NlwRenamedSig_OI_busy),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .LO(N26),
    .O(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module rmii_recv_mem_INST_1 (
  clk, rst, we, fast_eth, rmii_clk, rm_crs_dv, rdy, addr, count, wdata, offset, rm_rx_data
);
  input clk;
  input rst;
  output we;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [9 : 0] addr;
  output [9 : 0] count;
  output [7 : 0] wdata;
  input [9 : 0] offset;
  input [1 : 0] rm_rx_data;
  wire Mcount_addr;
  wire Mcount_addr1;
  wire Mcount_addr2;
  wire Mcount_addr3;
  wire Mcount_addr4;
  wire Mcount_addr5;
  wire Mcount_addr6;
  wire Mcount_addr7;
  wire Mcount_addr8;
  wire Mcount_addr9;
  wire Mcount_recv_cnt;
  wire Mcount_recv_cnt1;
  wire Mcount_recv_cnt2;
  wire Mcount_recv_cnt3;
  wire Mcount_recv_cnt4;
  wire Mcount_recv_cnt5;
  wire Mcount_recv_cnt6;
  wire Mcount_recv_cnt7;
  wire Mcount_recv_cnt8;
  wire Mcount_recv_cnt9;
  wire addr_not0001;
  wire brdy;
  wire busy;
  wire count_not0001;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_not0001;
  wire s_busy_1303;
  wire we_mux0000;
  wire [8 : 0] Mcount_addr_cy;
  wire [9 : 0] Mcount_addr_lut;
  wire [8 : 0] Mcount_recv_cnt_cy;
  wire [9 : 0] Mcount_recv_cnt_lut;
  wire [0 : 0] Msub_addr_sub0000_cy;
  wire [9 : 0] NlwRenamedSig_OI_addr;
  wire [7 : 0] data;
  wire [9 : 0] recv_cnt;
  wire [7 : 0] wdata_mux0000;
  assign
    rdy = NlwRenamedSig_OI_rdy,
    addr[9] = NlwRenamedSig_OI_addr[9],
    addr[8] = NlwRenamedSig_OI_addr[8],
    addr[7] = NlwRenamedSig_OI_addr[7],
    addr[6] = NlwRenamedSig_OI_addr[6],
    addr[5] = NlwRenamedSig_OI_addr[5],
    addr[4] = NlwRenamedSig_OI_addr[4],
    addr[3] = NlwRenamedSig_OI_addr[3],
    addr[2] = NlwRenamedSig_OI_addr[2],
    addr[1] = NlwRenamedSig_OI_addr[1],
    addr[0] = NlwRenamedSig_OI_addr[0];
  GND   XST_GND (
    .G(Msub_addr_sub0000_cy[0])
  );
  FDCE   wdata_0 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[7]),
    .Q(wdata[0])
  );
  FDCE   wdata_1 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[6]),
    .Q(wdata[1])
  );
  FDCE   wdata_2 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[5]),
    .Q(wdata[2])
  );
  FDCE   wdata_3 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[4]),
    .Q(wdata[3])
  );
  FDCE   wdata_4 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[3]),
    .Q(wdata[4])
  );
  FDCE   wdata_5 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[2]),
    .Q(wdata[5])
  );
  FDCE   wdata_6 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[1]),
    .Q(wdata[6])
  );
  FDCE   wdata_7 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[0]),
    .Q(wdata[7])
  );
  FDC   we_833 (
    .C(clk),
    .CLR(rst),
    .D(we_mux0000),
    .Q(we)
  );
  FDCE   rdy_834 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(count_not0001),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDC   s_busy (
    .C(clk),
    .CLR(rst),
    .D(busy),
    .Q(s_busy_1303)
  );
  FDCE   count_0 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[0]),
    .Q(count[0])
  );
  FDCE   count_1 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[1]),
    .Q(count[1])
  );
  FDCE   count_2 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[2]),
    .Q(count[2])
  );
  FDCE   count_3 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[3]),
    .Q(count[3])
  );
  FDCE   count_4 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[4]),
    .Q(count[4])
  );
  FDCE   count_5 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[5]),
    .Q(count[5])
  );
  FDCE   count_6 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[6]),
    .Q(count[6])
  );
  FDCE   count_7 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[7]),
    .Q(count[7])
  );
  FDCE   count_8 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[8]),
    .Q(count[8])
  );
  FDCE   count_9 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[9]),
    .Q(count[9])
  );
  MUXCY   \Mcount_addr_cy<0>  (
    .CI(busy),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[0]),
    .O(Mcount_addr_cy[0])
  );
  XORCY   \Mcount_addr_xor<0>  (
    .CI(busy),
    .LI(Mcount_addr_lut[0]),
    .O(Mcount_addr)
  );
  MUXCY   \Mcount_addr_cy<1>  (
    .CI(Mcount_addr_cy[0]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[1]),
    .O(Mcount_addr_cy[1])
  );
  XORCY   \Mcount_addr_xor<1>  (
    .CI(Mcount_addr_cy[0]),
    .LI(Mcount_addr_lut[1]),
    .O(Mcount_addr1)
  );
  MUXCY   \Mcount_addr_cy<2>  (
    .CI(Mcount_addr_cy[1]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[2]),
    .O(Mcount_addr_cy[2])
  );
  XORCY   \Mcount_addr_xor<2>  (
    .CI(Mcount_addr_cy[1]),
    .LI(Mcount_addr_lut[2]),
    .O(Mcount_addr2)
  );
  MUXCY   \Mcount_addr_cy<3>  (
    .CI(Mcount_addr_cy[2]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[3]),
    .O(Mcount_addr_cy[3])
  );
  XORCY   \Mcount_addr_xor<3>  (
    .CI(Mcount_addr_cy[2]),
    .LI(Mcount_addr_lut[3]),
    .O(Mcount_addr3)
  );
  MUXCY   \Mcount_addr_cy<4>  (
    .CI(Mcount_addr_cy[3]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[4]),
    .O(Mcount_addr_cy[4])
  );
  XORCY   \Mcount_addr_xor<4>  (
    .CI(Mcount_addr_cy[3]),
    .LI(Mcount_addr_lut[4]),
    .O(Mcount_addr4)
  );
  MUXCY   \Mcount_addr_cy<5>  (
    .CI(Mcount_addr_cy[4]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[5]),
    .O(Mcount_addr_cy[5])
  );
  XORCY   \Mcount_addr_xor<5>  (
    .CI(Mcount_addr_cy[4]),
    .LI(Mcount_addr_lut[5]),
    .O(Mcount_addr5)
  );
  MUXCY   \Mcount_addr_cy<6>  (
    .CI(Mcount_addr_cy[5]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[6]),
    .O(Mcount_addr_cy[6])
  );
  XORCY   \Mcount_addr_xor<6>  (
    .CI(Mcount_addr_cy[5]),
    .LI(Mcount_addr_lut[6]),
    .O(Mcount_addr6)
  );
  MUXCY   \Mcount_addr_cy<7>  (
    .CI(Mcount_addr_cy[6]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[7]),
    .O(Mcount_addr_cy[7])
  );
  XORCY   \Mcount_addr_xor<7>  (
    .CI(Mcount_addr_cy[6]),
    .LI(Mcount_addr_lut[7]),
    .O(Mcount_addr7)
  );
  MUXCY   \Mcount_addr_cy<8>  (
    .CI(Mcount_addr_cy[7]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[8]),
    .O(Mcount_addr_cy[8])
  );
  XORCY   \Mcount_addr_xor<8>  (
    .CI(Mcount_addr_cy[7]),
    .LI(Mcount_addr_lut[8]),
    .O(Mcount_addr8)
  );
  XORCY   \Mcount_addr_xor<9>  (
    .CI(Mcount_addr_cy[8]),
    .LI(Mcount_addr_lut[9]),
    .O(Mcount_addr9)
  );
  MUXCY   \Mcount_recv_cnt_cy<0>  (
    .CI(busy),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[0]),
    .O(Mcount_recv_cnt_cy[0])
  );
  XORCY   \Mcount_recv_cnt_xor<0>  (
    .CI(busy),
    .LI(Mcount_recv_cnt_lut[0]),
    .O(Mcount_recv_cnt)
  );
  MUXCY   \Mcount_recv_cnt_cy<1>  (
    .CI(Mcount_recv_cnt_cy[0]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[1]),
    .O(Mcount_recv_cnt_cy[1])
  );
  XORCY   \Mcount_recv_cnt_xor<1>  (
    .CI(Mcount_recv_cnt_cy[0]),
    .LI(Mcount_recv_cnt_lut[1]),
    .O(Mcount_recv_cnt1)
  );
  MUXCY   \Mcount_recv_cnt_cy<2>  (
    .CI(Mcount_recv_cnt_cy[1]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[2]),
    .O(Mcount_recv_cnt_cy[2])
  );
  XORCY   \Mcount_recv_cnt_xor<2>  (
    .CI(Mcount_recv_cnt_cy[1]),
    .LI(Mcount_recv_cnt_lut[2]),
    .O(Mcount_recv_cnt2)
  );
  MUXCY   \Mcount_recv_cnt_cy<3>  (
    .CI(Mcount_recv_cnt_cy[2]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[3]),
    .O(Mcount_recv_cnt_cy[3])
  );
  XORCY   \Mcount_recv_cnt_xor<3>  (
    .CI(Mcount_recv_cnt_cy[2]),
    .LI(Mcount_recv_cnt_lut[3]),
    .O(Mcount_recv_cnt3)
  );
  MUXCY   \Mcount_recv_cnt_cy<4>  (
    .CI(Mcount_recv_cnt_cy[3]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[4]),
    .O(Mcount_recv_cnt_cy[4])
  );
  XORCY   \Mcount_recv_cnt_xor<4>  (
    .CI(Mcount_recv_cnt_cy[3]),
    .LI(Mcount_recv_cnt_lut[4]),
    .O(Mcount_recv_cnt4)
  );
  MUXCY   \Mcount_recv_cnt_cy<5>  (
    .CI(Mcount_recv_cnt_cy[4]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[5]),
    .O(Mcount_recv_cnt_cy[5])
  );
  XORCY   \Mcount_recv_cnt_xor<5>  (
    .CI(Mcount_recv_cnt_cy[4]),
    .LI(Mcount_recv_cnt_lut[5]),
    .O(Mcount_recv_cnt5)
  );
  MUXCY   \Mcount_recv_cnt_cy<6>  (
    .CI(Mcount_recv_cnt_cy[5]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[6]),
    .O(Mcount_recv_cnt_cy[6])
  );
  XORCY   \Mcount_recv_cnt_xor<6>  (
    .CI(Mcount_recv_cnt_cy[5]),
    .LI(Mcount_recv_cnt_lut[6]),
    .O(Mcount_recv_cnt6)
  );
  MUXCY   \Mcount_recv_cnt_cy<7>  (
    .CI(Mcount_recv_cnt_cy[6]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[7]),
    .O(Mcount_recv_cnt_cy[7])
  );
  XORCY   \Mcount_recv_cnt_xor<7>  (
    .CI(Mcount_recv_cnt_cy[6]),
    .LI(Mcount_recv_cnt_lut[7]),
    .O(Mcount_recv_cnt7)
  );
  MUXCY   \Mcount_recv_cnt_cy<8>  (
    .CI(Mcount_recv_cnt_cy[7]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[8]),
    .O(Mcount_recv_cnt_cy[8])
  );
  XORCY   \Mcount_recv_cnt_xor<8>  (
    .CI(Mcount_recv_cnt_cy[7]),
    .LI(Mcount_recv_cnt_lut[8]),
    .O(Mcount_recv_cnt8)
  );
  XORCY   \Mcount_recv_cnt_xor<9>  (
    .CI(Mcount_recv_cnt_cy[8]),
    .LI(Mcount_recv_cnt_lut[9]),
    .O(Mcount_recv_cnt9)
  );
  FDCE   addr_0 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr),
    .Q(NlwRenamedSig_OI_addr[0])
  );
  FDCE   addr_1 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr1),
    .Q(NlwRenamedSig_OI_addr[1])
  );
  FDCE   addr_2 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr2),
    .Q(NlwRenamedSig_OI_addr[2])
  );
  FDCE   addr_3 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr3),
    .Q(NlwRenamedSig_OI_addr[3])
  );
  FDCE   addr_4 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr4),
    .Q(NlwRenamedSig_OI_addr[4])
  );
  FDCE   addr_5 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr5),
    .Q(NlwRenamedSig_OI_addr[5])
  );
  FDCE   addr_6 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr6),
    .Q(NlwRenamedSig_OI_addr[6])
  );
  FDCE   addr_7 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr7),
    .Q(NlwRenamedSig_OI_addr[7])
  );
  FDCE   addr_8 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr8),
    .Q(NlwRenamedSig_OI_addr[8])
  );
  FDCE   addr_9 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr9),
    .Q(NlwRenamedSig_OI_addr[9])
  );
  FDCE   recv_cnt_0 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt),
    .Q(recv_cnt[0])
  );
  FDCE   recv_cnt_1 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt1),
    .Q(recv_cnt[1])
  );
  FDCE   recv_cnt_2 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt2),
    .Q(recv_cnt[2])
  );
  FDCE   recv_cnt_3 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt3),
    .Q(recv_cnt[3])
  );
  FDCE   recv_cnt_4 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt4),
    .Q(recv_cnt[4])
  );
  FDCE   recv_cnt_5 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt5),
    .Q(recv_cnt[5])
  );
  FDCE   recv_cnt_6 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt6),
    .Q(recv_cnt[6])
  );
  FDCE   recv_cnt_7 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt7),
    .Q(recv_cnt[7])
  );
  FDCE   recv_cnt_8 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt8),
    .Q(recv_cnt[8])
  );
  FDCE   recv_cnt_9 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt9),
    .Q(recv_cnt[9])
  );
  rmii_recv_byte_INST_1   rmii_recv_byte (
    .clk(clk),
    .rst(rst),
    .busy(busy),
    .fast_eth(fast_eth),
    .rmii_clk(rmii_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(brdy),
    .data({data[7], data[6], data[5], data[4], data[3], data[2], data[1], data[0]}),
    .rm_rx_data({rm_rx_data[1], rm_rx_data[0]})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  we_mux00001 (
    .I0(busy),
    .I1(brdy),
    .O(we_mux0000)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<7>1  (
    .I0(busy),
    .I1(data[0]),
    .O(wdata_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<6>1  (
    .I0(busy),
    .I1(data[1]),
    .O(wdata_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<5>1  (
    .I0(busy),
    .I1(data[2]),
    .O(wdata_mux0000[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<4>1  (
    .I0(busy),
    .I1(data[3]),
    .O(wdata_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<3>1  (
    .I0(busy),
    .I1(data[4]),
    .O(wdata_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<2>1  (
    .I0(busy),
    .I1(data[5]),
    .O(wdata_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<1>1  (
    .I0(busy),
    .I1(data[6]),
    .O(wdata_mux0000[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<0>1  (
    .I0(busy),
    .I1(data[7]),
    .O(wdata_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_not00011 (
    .I0(s_busy_1303),
    .I1(busy),
    .O(count_not0001)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  addr_not00011 (
    .I0(busy),
    .I1(brdy),
    .O(addr_not0001)
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  rdy_not00011 (
    .I0(s_busy_1303),
    .I1(busy),
    .I2(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_addr_lut<0>  (
    .I0(busy),
    .I1(NlwRenamedSig_OI_addr[0]),
    .O(Mcount_addr_lut[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<0>  (
    .I0(busy),
    .I1(recv_cnt[0]),
    .O(Mcount_recv_cnt_lut[0])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_addr_lut<1>  (
    .I0(busy),
    .I1(NlwRenamedSig_OI_addr[1]),
    .O(Mcount_addr_lut[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<1>  (
    .I0(busy),
    .I1(recv_cnt[1]),
    .O(Mcount_recv_cnt_lut[1])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_addr_lut<2>  (
    .I0(busy),
    .I1(NlwRenamedSig_OI_addr[2]),
    .O(Mcount_addr_lut[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<2>  (
    .I0(busy),
    .I1(recv_cnt[2]),
    .O(Mcount_recv_cnt_lut[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<3>  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(busy),
    .O(Mcount_addr_lut[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<3>  (
    .I0(busy),
    .I1(recv_cnt[3]),
    .O(Mcount_recv_cnt_lut[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<4>  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .I1(busy),
    .O(Mcount_addr_lut[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<4>  (
    .I0(busy),
    .I1(recv_cnt[4]),
    .O(Mcount_recv_cnt_lut[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<5>  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(busy),
    .O(Mcount_addr_lut[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<5>  (
    .I0(busy),
    .I1(recv_cnt[5]),
    .O(Mcount_recv_cnt_lut[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<6>  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(busy),
    .O(Mcount_addr_lut[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<6>  (
    .I0(busy),
    .I1(recv_cnt[6]),
    .O(Mcount_recv_cnt_lut[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<7>  (
    .I0(NlwRenamedSig_OI_addr[7]),
    .I1(busy),
    .O(Mcount_addr_lut[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<7>  (
    .I0(busy),
    .I1(recv_cnt[7]),
    .O(Mcount_recv_cnt_lut[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<8>  (
    .I0(NlwRenamedSig_OI_addr[8]),
    .I1(busy),
    .O(Mcount_addr_lut[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<8>  (
    .I0(busy),
    .I1(recv_cnt[8]),
    .O(Mcount_recv_cnt_lut[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<9>  (
    .I0(NlwRenamedSig_OI_addr[9]),
    .I1(busy),
    .O(Mcount_addr_lut[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<9>  (
    .I0(busy),
    .I1(recv_cnt[9]),
    .O(Mcount_recv_cnt_lut[9])
  );
endmodule

module rmii_send_byte_INST_1 (
  clk, start, rst, rm_tx_en, fast_eth, rmii_clk, rdy, rm_tx_data, data
);
  input clk;
  input start;
  input rst;
  output rm_tx_en;
  input fast_eth;
  input rmii_clk;
  output rdy;
  output [1 : 0] rm_tx_data;
  input [7 : 0] data;
  wire Mcount_bit_cnt;
  wire Mcount_bit_cnt1;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_904 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_906 ;
  wire N14;
  wire N16;
  wire N2;
  wire N20;
  wire N24;
  wire N25;
  wire N27;
  wire N28;
  wire N6;
  wire N61;
  wire N8;
  wire bit_cnt_not0001_920;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001_932;
  wire rm_tx_data_not0001_937;
  wire NlwRenamedSig_OI_rm_tx_en;
  wire rm_tx_en_not0001;
  wire rm_tx_en_not00011;
  wire wait_cnt_not0003_961;
  wire [1 : 0] bit_cnt;
  wire [1 : 0] rm_tx_data_mux0000;
  wire [5 : 0] tx_data;
  wire [7 : 2] tx_data_mux0000;
  wire [4 : 0] wait_cnt;
  assign
    rm_tx_en = NlwRenamedSig_OI_rm_tx_en,
    rdy = NlwRenamedSig_OI_rdy;
  FDCE   rm_tx_data_0 (
    .C(clk),
    .CE(rm_tx_data_not0001_937),
    .CLR(rst),
    .D(rm_tx_data_mux0000[0]),
    .Q(rm_tx_data[0])
  );
  FDCE   rm_tx_data_1 (
    .C(clk),
    .CE(rm_tx_data_not0001_937),
    .CLR(rst),
    .D(rm_tx_data_mux0000[1]),
    .Q(rm_tx_data[1])
  );
  FDCE   rm_tx_en_723 (
    .C(clk),
    .CE(rm_tx_en_not0001),
    .CLR(rst),
    .D(start),
    .Q(NlwRenamedSig_OI_rm_tx_en)
  );
  FDCE   tx_data_0 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(tx_data_mux0000[2]),
    .Q(tx_data[0])
  );
  FDCE   tx_data_1 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(tx_data_mux0000[3]),
    .Q(tx_data[1])
  );
  FDCE   tx_data_2 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(tx_data_mux0000[4]),
    .Q(tx_data[2])
  );
  FDCE   tx_data_3 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(tx_data_mux0000[5]),
    .Q(tx_data[3])
  );
  FDCE   tx_data_4 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(tx_data_mux0000[6]),
    .Q(tx_data[4])
  );
  FDCE   tx_data_5 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(tx_data_mux0000[7]),
    .Q(tx_data[5])
  );
  FDPE   rdy_730 (
    .C(clk),
    .CE(rdy_not0001_932),
    .D(rdy_mux0000),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003_961),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003_961),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003_961),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003_961),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003_961),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  FDCE   bit_cnt_0 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(Mcount_bit_cnt),
    .Q(bit_cnt[0])
  );
  FDCE   bit_cnt_1 (
    .C(clk),
    .CE(bit_cnt_not0001_920),
    .CLR(rst),
    .D(Mcount_bit_cnt1),
    .Q(bit_cnt[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \tx_data_mux0000<7>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(data[7]),
    .O(tx_data_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \tx_data_mux0000<6>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(data[6]),
    .O(tx_data_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_bit_cnt_xor<0>11  (
    .I0(bit_cnt[0]),
    .I1(NlwRenamedSig_OI_rdy),
    .O(Mcount_bit_cnt)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[5]),
    .I2(data[5]),
    .O(tx_data_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[4]),
    .I2(data[4]),
    .O(tx_data_mux0000[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[3]),
    .I2(data[3]),
    .O(tx_data_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<2>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[2]),
    .I2(data[2]),
    .O(tx_data_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  \Mcount_bit_cnt_xor<1>11  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(bit_cnt[0]),
    .I2(bit_cnt[1]),
    .O(Mcount_bit_cnt1)
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \rm_tx_data_mux0000<1>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[1]),
    .I2(data[1]),
    .I3(start),
    .O(rm_tx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \rm_tx_data_mux0000<0>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[0]),
    .I2(data[0]),
    .I3(start),
    .O(rm_tx_data_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  wait_cnt_not0003_SW0 (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[4]),
    .O(N61)
  );
  LUT4 #(
    .INIT ( 16'hFFFD ))
  wait_cnt_not0003 (
    .I0(N2),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(N61),
    .O(wait_cnt_not0003_961)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \Mcount_wait_cnt_xor<1>1_SW0  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[4]),
    .I2(N28),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h9989 ))
  \Mcount_wait_cnt_xor<1>1  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .I2(N8),
    .I3(wait_cnt[3]),
    .O(Mcount_wait_cnt1)
  );
  LUT4 #(
    .INIT ( 16'hC8EA ))
  rm_tx_data_not0001_SW0 (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(rmii_clk),
    .I2(NlwRenamedSig_OI_rm_tx_en),
    .I3(start),
    .O(N14)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<4>121  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(N6)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  rm_tx_data_not0001 (
    .I0(N14),
    .I1(wait_cnt[4]),
    .I2(N6),
    .O(rm_tx_data_not0001_937)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  bit_cnt_not0001 (
    .I0(N16),
    .I1(wait_cnt[4]),
    .I2(rmii_clk),
    .I3(N6),
    .O(bit_cnt_not0001_920)
  );
  LUT4 #(
    .INIT ( 16'hABA8 ))
  \Mcount_wait_cnt_xor<4>1  (
    .I0(wait_cnt[4]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(N20),
    .O(Mcount_wait_cnt4)
  );
  MUXF5   rdy_not0001 (
    .I0(N24),
    .I1(N25),
    .S(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001_932)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  rdy_not0001_F (
    .I0(bit_cnt[1]),
    .I1(bit_cnt[0]),
    .I2(N6),
    .I3(wait_cnt[4]),
    .O(N24)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_not0001_G (
    .I0(start),
    .I1(N6),
    .I2(rmii_clk),
    .I3(wait_cnt[4]),
    .O(N25)
  );
  INV   rdy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_rdy),
    .O(rdy_mux0000)
  );
  GND   XST_GND (
    .G(N27)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_904 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_904 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0C04 ))
  rm_tx_en_not000111 (
    .I0(start),
    .I1(NlwRenamedSig_OI_rdy),
    .I2(N6),
    .I3(rmii_clk),
    .O(rm_tx_en_not00011)
  );
  MUXF5   rm_tx_en_not00011_f5 (
    .I0(rm_tx_en_not00011),
    .I1(N27),
    .S(wait_cnt[4]),
    .O(rm_tx_en_not0001)
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_906 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_906 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT3_D #(
    .INIT ( 8'hFE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(bit_cnt[1]),
    .I2(bit_cnt[0]),
    .LO(N28),
    .O(N2)
  );
  LUT3_L #(
    .INIT ( 8'hE4 ))
  bit_cnt_not0001_SW0 (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(NlwRenamedSig_OI_rm_tx_en),
    .I2(start),
    .LO(N16)
  );
  LUT4_L #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<4>1_SW1  (
    .I0(wait_cnt[4]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(N2),
    .LO(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module rmii_send_mem_INST_1 (
  clk, start, rst, not_det, rm_tx_en, done, fast_eth, rmii_clk, rdy, addr, rm_tx_data, rdata, count
);
  input clk;
  input start;
  input rst;
  input not_det;
  output rm_tx_en;
  output done;
  input fast_eth;
  input rmii_clk;
  output rdy;
  output [9 : 0] addr;
  output [1 : 0] rm_tx_data;
  input [7 : 0] rdata;
  input [9 : 0] count;
  wire \Madd_addr_addsub0000_cy<1>_rt_964 ;
  wire \Madd_addr_addsub0000_cy<2>_rt_966 ;
  wire \Madd_addr_addsub0000_cy<3>_rt_968 ;
  wire \Madd_addr_addsub0000_cy<4>_rt_970 ;
  wire \Madd_addr_addsub0000_cy<5>_rt_972 ;
  wire \Madd_addr_addsub0000_cy<6>_rt_974 ;
  wire \Madd_addr_addsub0000_cy<7>_rt_976 ;
  wire \Madd_addr_addsub0000_cy<8>_rt_978 ;
  wire \Madd_addr_addsub0000_xor<9>_rt_980 ;
  wire \Madd_addr_lim_share0000_cy<1>_rt_983 ;
  wire \Madd_addr_lim_share0000_cy<2>_rt_985 ;
  wire \Madd_addr_lim_share0000_cy<3>_rt_987 ;
  wire \Madd_addr_lim_share0000_cy<4>_rt_989 ;
  wire \Madd_addr_lim_share0000_cy<5>_rt_991 ;
  wire \Madd_addr_lim_share0000_cy<6>_rt_993 ;
  wire \Madd_addr_lim_share0000_cy<7>_rt_995 ;
  wire \Madd_addr_lim_share0000_cy<8>_rt_997 ;
  wire N0;
  wire N01;
  wire N1;
  wire NlwRenamedSig_OI_done;
  wire done_mux0000;
  wire done_not0001_1085;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire send_buf_not0001;
  wire send_byte_start_1111;
  wire send_byte_start_not0001;
  wire send_rdy;
  wire state_FSM_FFd1_1115;
  wire \state_FSM_FFd1-In ;
  wire state_and0000;
  wire [8 : 0] Madd_addr_addsub0000_cy;
  wire [0 : 0] Madd_addr_addsub0000_lut;
  wire [8 : 0] Madd_addr_lim_share0000_cy;
  wire [0 : 0] Madd_addr_lim_share0000_lut;
  wire [4 : 0] Mcompar_state_cmp_eq0000_cy;
  wire [4 : 0] Mcompar_state_cmp_eq0000_lut;
  wire [9 : 0] NlwRenamedSig_OI_addr;
  wire [9 : 0] addr_addsub0000;
  wire [9 : 0] addr_lim;
  wire [9 : 0] addr_lim_mux0000;
  wire [9 : 0] addr_lim_share0000;
  wire [9 : 0] addr_mux0000;
  wire [7 : 0] send_buf;
  assign
    done = NlwRenamedSig_OI_done,
    rdy = NlwRenamedSig_OI_rdy,
    addr[9] = NlwRenamedSig_OI_addr[9],
    addr[8] = NlwRenamedSig_OI_addr[8],
    addr[7] = NlwRenamedSig_OI_addr[7],
    addr[6] = NlwRenamedSig_OI_addr[6],
    addr[5] = NlwRenamedSig_OI_addr[5],
    addr[4] = NlwRenamedSig_OI_addr[4],
    addr[3] = NlwRenamedSig_OI_addr[3],
    addr[2] = NlwRenamedSig_OI_addr[2],
    addr[1] = NlwRenamedSig_OI_addr[1],
    addr[0] = NlwRenamedSig_OI_addr[0];
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   addr_0 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[9]),
    .Q(NlwRenamedSig_OI_addr[0])
  );
  FDCE   addr_1 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[8]),
    .Q(NlwRenamedSig_OI_addr[1])
  );
  FDCE   addr_2 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[7]),
    .Q(NlwRenamedSig_OI_addr[2])
  );
  FDCE   addr_3 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[6]),
    .Q(NlwRenamedSig_OI_addr[3])
  );
  FDCE   addr_4 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[5]),
    .Q(NlwRenamedSig_OI_addr[4])
  );
  FDCE   addr_5 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[4]),
    .Q(NlwRenamedSig_OI_addr[5])
  );
  FDCE   addr_6 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[3]),
    .Q(NlwRenamedSig_OI_addr[6])
  );
  FDCE   addr_7 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[2]),
    .Q(NlwRenamedSig_OI_addr[7])
  );
  FDCE   addr_8 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[1]),
    .Q(NlwRenamedSig_OI_addr[8])
  );
  FDCE   addr_9 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[0]),
    .Q(NlwRenamedSig_OI_addr[9])
  );
  FDCE   send_byte_start (
    .C(clk),
    .CE(send_byte_start_not0001),
    .CLR(rst),
    .D(state_and0000),
    .Q(send_byte_start_1111)
  );
  FDPE   rdy_651 (
    .C(clk),
    .CE(state_and0000),
    .D(rdy_mux0000),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   send_buf_0 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[0]),
    .Q(send_buf[0])
  );
  FDCE   send_buf_1 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[1]),
    .Q(send_buf[1])
  );
  FDCE   send_buf_2 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[2]),
    .Q(send_buf[2])
  );
  FDCE   send_buf_3 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[3]),
    .Q(send_buf[3])
  );
  FDCE   send_buf_4 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[4]),
    .Q(send_buf[4])
  );
  FDCE   send_buf_5 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[5]),
    .Q(send_buf[5])
  );
  FDCE   send_buf_6 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[6]),
    .Q(send_buf[6])
  );
  FDCE   send_buf_7 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[7]),
    .Q(send_buf[7])
  );
  FDCE   addr_lim_0 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[0]),
    .Q(addr_lim[0])
  );
  FDCE   addr_lim_1 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[1]),
    .Q(addr_lim[1])
  );
  FDCE   addr_lim_2 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[2]),
    .Q(addr_lim[2])
  );
  FDCE   addr_lim_3 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[3]),
    .Q(addr_lim[3])
  );
  FDCE   addr_lim_4 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[4]),
    .Q(addr_lim[4])
  );
  FDCE   addr_lim_5 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[5]),
    .Q(addr_lim[5])
  );
  FDCE   addr_lim_6 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[6]),
    .Q(addr_lim[6])
  );
  FDCE   addr_lim_7 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[7]),
    .Q(addr_lim[7])
  );
  FDCE   addr_lim_8 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[8]),
    .Q(addr_lim[8])
  );
  FDCE   addr_lim_9 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[9]),
    .Q(addr_lim[9])
  );
  FDCE   done_670 (
    .C(clk),
    .CE(done_not0001_1085),
    .CLR(rst),
    .D(done_mux0000),
    .Q(NlwRenamedSig_OI_done)
  );
  MUXCY   \Madd_addr_lim_share0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_addr_lim_share0000_lut[0]),
    .O(Madd_addr_lim_share0000_cy[0])
  );
  XORCY   \Madd_addr_lim_share0000_xor<0>  (
    .CI(N0),
    .LI(Madd_addr_lim_share0000_lut[0]),
    .O(addr_lim_share0000[0])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<1>  (
    .CI(Madd_addr_lim_share0000_cy[0]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<1>_rt_983 ),
    .O(Madd_addr_lim_share0000_cy[1])
  );
  XORCY   \Madd_addr_lim_share0000_xor<1>  (
    .CI(Madd_addr_lim_share0000_cy[0]),
    .LI(\Madd_addr_lim_share0000_cy<1>_rt_983 ),
    .O(addr_lim_share0000[1])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<2>  (
    .CI(Madd_addr_lim_share0000_cy[1]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<2>_rt_985 ),
    .O(Madd_addr_lim_share0000_cy[2])
  );
  XORCY   \Madd_addr_lim_share0000_xor<2>  (
    .CI(Madd_addr_lim_share0000_cy[1]),
    .LI(\Madd_addr_lim_share0000_cy<2>_rt_985 ),
    .O(addr_lim_share0000[2])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<3>  (
    .CI(Madd_addr_lim_share0000_cy[2]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<3>_rt_987 ),
    .O(Madd_addr_lim_share0000_cy[3])
  );
  XORCY   \Madd_addr_lim_share0000_xor<3>  (
    .CI(Madd_addr_lim_share0000_cy[2]),
    .LI(\Madd_addr_lim_share0000_cy<3>_rt_987 ),
    .O(addr_lim_share0000[3])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<4>  (
    .CI(Madd_addr_lim_share0000_cy[3]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<4>_rt_989 ),
    .O(Madd_addr_lim_share0000_cy[4])
  );
  XORCY   \Madd_addr_lim_share0000_xor<4>  (
    .CI(Madd_addr_lim_share0000_cy[3]),
    .LI(\Madd_addr_lim_share0000_cy<4>_rt_989 ),
    .O(addr_lim_share0000[4])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<5>  (
    .CI(Madd_addr_lim_share0000_cy[4]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<5>_rt_991 ),
    .O(Madd_addr_lim_share0000_cy[5])
  );
  XORCY   \Madd_addr_lim_share0000_xor<5>  (
    .CI(Madd_addr_lim_share0000_cy[4]),
    .LI(\Madd_addr_lim_share0000_cy<5>_rt_991 ),
    .O(addr_lim_share0000[5])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<6>  (
    .CI(Madd_addr_lim_share0000_cy[5]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<6>_rt_993 ),
    .O(Madd_addr_lim_share0000_cy[6])
  );
  XORCY   \Madd_addr_lim_share0000_xor<6>  (
    .CI(Madd_addr_lim_share0000_cy[5]),
    .LI(\Madd_addr_lim_share0000_cy<6>_rt_993 ),
    .O(addr_lim_share0000[6])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<7>  (
    .CI(Madd_addr_lim_share0000_cy[6]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<7>_rt_995 ),
    .O(Madd_addr_lim_share0000_cy[7])
  );
  XORCY   \Madd_addr_lim_share0000_xor<7>  (
    .CI(Madd_addr_lim_share0000_cy[6]),
    .LI(\Madd_addr_lim_share0000_cy<7>_rt_995 ),
    .O(addr_lim_share0000[7])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<8>  (
    .CI(Madd_addr_lim_share0000_cy[7]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<8>_rt_997 ),
    .O(Madd_addr_lim_share0000_cy[8])
  );
  XORCY   \Madd_addr_lim_share0000_xor<8>  (
    .CI(Madd_addr_lim_share0000_cy[7]),
    .LI(\Madd_addr_lim_share0000_cy<8>_rt_997 ),
    .O(addr_lim_share0000[8])
  );
  XORCY   \Madd_addr_lim_share0000_xor<9>  (
    .CI(Madd_addr_lim_share0000_cy[8]),
    .LI(count[9]),
    .O(addr_lim_share0000[9])
  );
  MUXCY   \Madd_addr_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_addr_addsub0000_lut[0]),
    .O(Madd_addr_addsub0000_cy[0])
  );
  XORCY   \Madd_addr_addsub0000_xor<0>  (
    .CI(N0),
    .LI(Madd_addr_addsub0000_lut[0]),
    .O(addr_addsub0000[0])
  );
  MUXCY   \Madd_addr_addsub0000_cy<1>  (
    .CI(Madd_addr_addsub0000_cy[0]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<1>_rt_964 ),
    .O(Madd_addr_addsub0000_cy[1])
  );
  XORCY   \Madd_addr_addsub0000_xor<1>  (
    .CI(Madd_addr_addsub0000_cy[0]),
    .LI(\Madd_addr_addsub0000_cy<1>_rt_964 ),
    .O(addr_addsub0000[1])
  );
  MUXCY   \Madd_addr_addsub0000_cy<2>  (
    .CI(Madd_addr_addsub0000_cy[1]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<2>_rt_966 ),
    .O(Madd_addr_addsub0000_cy[2])
  );
  XORCY   \Madd_addr_addsub0000_xor<2>  (
    .CI(Madd_addr_addsub0000_cy[1]),
    .LI(\Madd_addr_addsub0000_cy<2>_rt_966 ),
    .O(addr_addsub0000[2])
  );
  MUXCY   \Madd_addr_addsub0000_cy<3>  (
    .CI(Madd_addr_addsub0000_cy[2]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<3>_rt_968 ),
    .O(Madd_addr_addsub0000_cy[3])
  );
  XORCY   \Madd_addr_addsub0000_xor<3>  (
    .CI(Madd_addr_addsub0000_cy[2]),
    .LI(\Madd_addr_addsub0000_cy<3>_rt_968 ),
    .O(addr_addsub0000[3])
  );
  MUXCY   \Madd_addr_addsub0000_cy<4>  (
    .CI(Madd_addr_addsub0000_cy[3]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<4>_rt_970 ),
    .O(Madd_addr_addsub0000_cy[4])
  );
  XORCY   \Madd_addr_addsub0000_xor<4>  (
    .CI(Madd_addr_addsub0000_cy[3]),
    .LI(\Madd_addr_addsub0000_cy<4>_rt_970 ),
    .O(addr_addsub0000[4])
  );
  MUXCY   \Madd_addr_addsub0000_cy<5>  (
    .CI(Madd_addr_addsub0000_cy[4]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<5>_rt_972 ),
    .O(Madd_addr_addsub0000_cy[5])
  );
  XORCY   \Madd_addr_addsub0000_xor<5>  (
    .CI(Madd_addr_addsub0000_cy[4]),
    .LI(\Madd_addr_addsub0000_cy<5>_rt_972 ),
    .O(addr_addsub0000[5])
  );
  MUXCY   \Madd_addr_addsub0000_cy<6>  (
    .CI(Madd_addr_addsub0000_cy[5]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<6>_rt_974 ),
    .O(Madd_addr_addsub0000_cy[6])
  );
  XORCY   \Madd_addr_addsub0000_xor<6>  (
    .CI(Madd_addr_addsub0000_cy[5]),
    .LI(\Madd_addr_addsub0000_cy<6>_rt_974 ),
    .O(addr_addsub0000[6])
  );
  MUXCY   \Madd_addr_addsub0000_cy<7>  (
    .CI(Madd_addr_addsub0000_cy[6]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<7>_rt_976 ),
    .O(Madd_addr_addsub0000_cy[7])
  );
  XORCY   \Madd_addr_addsub0000_xor<7>  (
    .CI(Madd_addr_addsub0000_cy[6]),
    .LI(\Madd_addr_addsub0000_cy<7>_rt_976 ),
    .O(addr_addsub0000[7])
  );
  MUXCY   \Madd_addr_addsub0000_cy<8>  (
    .CI(Madd_addr_addsub0000_cy[7]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<8>_rt_978 ),
    .O(Madd_addr_addsub0000_cy[8])
  );
  XORCY   \Madd_addr_addsub0000_xor<8>  (
    .CI(Madd_addr_addsub0000_cy[7]),
    .LI(\Madd_addr_addsub0000_cy<8>_rt_978 ),
    .O(addr_addsub0000[8])
  );
  XORCY   \Madd_addr_addsub0000_xor<9>  (
    .CI(Madd_addr_addsub0000_cy[8]),
    .LI(\Madd_addr_addsub0000_xor<9>_rt_980 ),
    .O(addr_addsub0000[9])
  );
  LUT4 #(
    .INIT ( 16'h8421 ))
  \Mcompar_state_cmp_eq0000_lut<0>  (
    .I0(addr_lim[1]),
    .I1(addr_lim[0]),
    .I2(NlwRenamedSig_OI_addr[1]),
    .I3(NlwRenamedSig_OI_addr[0]),
    .O(Mcompar_state_cmp_eq0000_lut[0])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[0]),
    .O(Mcompar_state_cmp_eq0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<1>  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(addr_lim[2]),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(addr_lim[3]),
    .O(Mcompar_state_cmp_eq0000_lut[1])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<1>  (
    .CI(Mcompar_state_cmp_eq0000_cy[0]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[1]),
    .O(Mcompar_state_cmp_eq0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<2>  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .I1(addr_lim[4]),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(addr_lim[5]),
    .O(Mcompar_state_cmp_eq0000_lut[2])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<2>  (
    .CI(Mcompar_state_cmp_eq0000_cy[1]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[2]),
    .O(Mcompar_state_cmp_eq0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<3>  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(addr_lim[6]),
    .I2(NlwRenamedSig_OI_addr[7]),
    .I3(addr_lim[7]),
    .O(Mcompar_state_cmp_eq0000_lut[3])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<3>  (
    .CI(Mcompar_state_cmp_eq0000_cy[2]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[3]),
    .O(Mcompar_state_cmp_eq0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<4>  (
    .I0(NlwRenamedSig_OI_addr[8]),
    .I1(addr_lim[8]),
    .I2(NlwRenamedSig_OI_addr[9]),
    .I3(addr_lim[9]),
    .O(Mcompar_state_cmp_eq0000_lut[4])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<4>  (
    .CI(Mcompar_state_cmp_eq0000_cy[3]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[4]),
    .O(Mcompar_state_cmp_eq0000_cy[4])
  );
  FDCE   state_FSM_FFd1 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(\state_FSM_FFd1-In ),
    .Q(state_FSM_FFd1_1115)
  );
  rmii_send_byte_INST_1   rmii_send_byte (
    .clk(clk),
    .start(send_byte_start_1111),
    .rst(rst),
    .rm_tx_en(rm_tx_en),
    .fast_eth(fast_eth),
    .rmii_clk(rmii_clk),
    .rdy(send_rdy),
    .rm_tx_data({rm_tx_data[1], rm_tx_data[0]}),
    .data({send_buf[7], send_buf[6], send_buf[5], send_buf[4], send_buf[3], send_buf[2], send_buf[1], send_buf[0]})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  state_and00001 (
    .I0(rmii_clk),
    .I1(send_rdy),
    .O(state_and0000)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  done_mux00001 (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(send_rdy),
    .I3(rmii_clk),
    .O(done_mux0000)
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<9>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[0]),
    .I3(NlwRenamedSig_OI_addr[0]),
    .O(addr_mux0000[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  done_not0001_SW0 (
    .I0(send_rdy),
    .I1(rmii_clk),
    .O(N01)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  done_not0001 (
    .I0(Mcompar_state_cmp_eq0000_cy[4]),
    .I1(state_FSM_FFd1_1115),
    .I2(N01),
    .I3(NlwRenamedSig_OI_done),
    .O(done_not0001_1085)
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<8>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[1]),
    .I3(NlwRenamedSig_OI_addr[1]),
    .O(addr_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<7>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[2]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .O(addr_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<6>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[3]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .O(addr_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<5>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[4]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .O(addr_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<4>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[5]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .O(addr_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<3>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[6]),
    .I3(NlwRenamedSig_OI_addr[6]),
    .O(addr_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \state_FSM_FFd1-In1  (
    .I0(state_FSM_FFd1_1115),
    .I1(start),
    .I2(Mcompar_state_cmp_eq0000_cy[4]),
    .O(\state_FSM_FFd1-In )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<6>1  (
    .I0(addr_lim[6]),
    .I1(addr_lim_share0000[6]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<5>1  (
    .I0(addr_lim[5]),
    .I1(addr_lim_share0000[5]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<4>1  (
    .I0(addr_lim[4]),
    .I1(addr_lim_share0000[4]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[4])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<3>1  (
    .I0(addr_lim[3]),
    .I1(addr_lim_share0000[3]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<2>1  (
    .I0(addr_lim[2]),
    .I1(addr_lim_share0000[2]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<1>1  (
    .I0(addr_lim[1]),
    .I1(addr_lim_share0000[1]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<0>1  (
    .I0(addr_lim[0]),
    .I1(addr_lim_share0000[0]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<7>1  (
    .I0(addr_lim[7]),
    .I1(addr_lim_share0000[7]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<2>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[7]),
    .I3(NlwRenamedSig_OI_addr[7]),
    .O(addr_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<8>1  (
    .I0(addr_lim[8]),
    .I1(addr_lim_share0000[8]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<1>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[8]),
    .I3(NlwRenamedSig_OI_addr[8]),
    .O(addr_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<9>1  (
    .I0(addr_lim[9]),
    .I1(addr_lim_share0000[9]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<0>1  (
    .I0(state_FSM_FFd1_1115),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[9]),
    .I3(NlwRenamedSig_OI_addr[9]),
    .O(addr_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  send_byte_start_not000131 (
    .I0(send_rdy),
    .I1(state_FSM_FFd1_1115),
    .I2(rmii_clk),
    .I3(Mcompar_state_cmp_eq0000_cy[4]),
    .O(send_buf_not0001)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<1>_rt  (
    .I0(count[1]),
    .O(\Madd_addr_lim_share0000_cy<1>_rt_983 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<2>_rt  (
    .I0(count[2]),
    .O(\Madd_addr_lim_share0000_cy<2>_rt_985 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<3>_rt  (
    .I0(count[3]),
    .O(\Madd_addr_lim_share0000_cy<3>_rt_987 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<4>_rt  (
    .I0(count[4]),
    .O(\Madd_addr_lim_share0000_cy<4>_rt_989 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<5>_rt  (
    .I0(count[5]),
    .O(\Madd_addr_lim_share0000_cy<5>_rt_991 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<6>_rt  (
    .I0(count[6]),
    .O(\Madd_addr_lim_share0000_cy<6>_rt_993 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<7>_rt  (
    .I0(count[7]),
    .O(\Madd_addr_lim_share0000_cy<7>_rt_995 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<8>_rt  (
    .I0(count[8]),
    .O(\Madd_addr_lim_share0000_cy<8>_rt_997 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<1>_rt  (
    .I0(NlwRenamedSig_OI_addr[1]),
    .O(\Madd_addr_addsub0000_cy<1>_rt_964 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<2>_rt  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .O(\Madd_addr_addsub0000_cy<2>_rt_966 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<3>_rt  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .O(\Madd_addr_addsub0000_cy<3>_rt_968 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<4>_rt  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .O(\Madd_addr_addsub0000_cy<4>_rt_970 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<5>_rt  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .O(\Madd_addr_addsub0000_cy<5>_rt_972 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<6>_rt  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .O(\Madd_addr_addsub0000_cy<6>_rt_974 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<7>_rt  (
    .I0(NlwRenamedSig_OI_addr[7]),
    .O(\Madd_addr_addsub0000_cy<7>_rt_976 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<8>_rt  (
    .I0(NlwRenamedSig_OI_addr[8]),
    .O(\Madd_addr_addsub0000_cy<8>_rt_978 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_xor<9>_rt  (
    .I0(NlwRenamedSig_OI_addr[9]),
    .O(\Madd_addr_addsub0000_xor<9>_rt_980 )
  );
  LUT4 #(
    .INIT ( 16'hAF8D ))
  rdy_mux00001 (
    .I0(state_FSM_FFd1_1115),
    .I1(NlwRenamedSig_OI_rdy),
    .I2(start),
    .I3(Mcompar_state_cmp_eq0000_cy[4]),
    .O(rdy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  send_byte_start_not00011 (
    .I0(Mcompar_state_cmp_eq0000_cy[4]),
    .I1(rmii_clk),
    .I2(send_rdy),
    .I3(state_FSM_FFd1_1115),
    .O(send_byte_start_not0001)
  );
  INV   \Madd_addr_lim_share0000_lut<0>_INV_0  (
    .I(count[0]),
    .O(Madd_addr_lim_share0000_lut[0])
  );
  INV   \Madd_addr_addsub0000_lut<0>_INV_0  (
    .I(NlwRenamedSig_OI_addr[0]),
    .O(Madd_addr_addsub0000_lut[0])
  );
endmodule

module relative_time_det (
  clk, soc, rst, relative_time_valid, we, head_done, relative_time, adress, data
);
  input clk;
  input soc;
  input rst;
  output relative_time_valid;
  input we;
  input head_done;
  output [63 : 0] relative_time;
  input [9 : 0] adress;
  input [7 : 0] data;
  wire N01;
  wire N02;
  wire N11;
  wire N16;
  wire N29;
  wire N30;
  wire N31;
  wire N32;
  wire N33;
  wire N34;
  wire N35;
  wire N36;
  wire N37;
  wire N38;
  wire N41;
  wire N5;
  wire N6;
  wire N9;
  wire \relative_time_mux0000<0>1_815 ;
  wire \relative_time_mux0000<0>11 ;
  wire \relative_time_mux0000<0>12 ;
  wire NlwRenamedSig_OI_relative_time_valid;
  wire relative_time_valid_mux0000_882;
  wire state_and0000_887;
  wire state_cmp_eq0008_888;
  wire \state_mux0000<0>1_890 ;
  wire \state_mux0000<0>2_891 ;
  wire [63 : 0] NlwRenamedSig_OI_relative_time;
  wire [63 : 0] relative_time_mux0000;
  wire [1 : 0] state;
  wire [1 : 0] state_mux0000;
  assign
    relative_time_valid = NlwRenamedSig_OI_relative_time_valid,
    relative_time[63] = NlwRenamedSig_OI_relative_time[63],
    relative_time[62] = NlwRenamedSig_OI_relative_time[62],
    relative_time[61] = NlwRenamedSig_OI_relative_time[61],
    relative_time[60] = NlwRenamedSig_OI_relative_time[60],
    relative_time[59] = NlwRenamedSig_OI_relative_time[59],
    relative_time[58] = NlwRenamedSig_OI_relative_time[58],
    relative_time[57] = NlwRenamedSig_OI_relative_time[57],
    relative_time[56] = NlwRenamedSig_OI_relative_time[56],
    relative_time[55] = NlwRenamedSig_OI_relative_time[55],
    relative_time[54] = NlwRenamedSig_OI_relative_time[54],
    relative_time[53] = NlwRenamedSig_OI_relative_time[53],
    relative_time[52] = NlwRenamedSig_OI_relative_time[52],
    relative_time[51] = NlwRenamedSig_OI_relative_time[51],
    relative_time[50] = NlwRenamedSig_OI_relative_time[50],
    relative_time[49] = NlwRenamedSig_OI_relative_time[49],
    relative_time[48] = NlwRenamedSig_OI_relative_time[48],
    relative_time[47] = NlwRenamedSig_OI_relative_time[47],
    relative_time[46] = NlwRenamedSig_OI_relative_time[46],
    relative_time[45] = NlwRenamedSig_OI_relative_time[45],
    relative_time[44] = NlwRenamedSig_OI_relative_time[44],
    relative_time[43] = NlwRenamedSig_OI_relative_time[43],
    relative_time[42] = NlwRenamedSig_OI_relative_time[42],
    relative_time[41] = NlwRenamedSig_OI_relative_time[41],
    relative_time[40] = NlwRenamedSig_OI_relative_time[40],
    relative_time[39] = NlwRenamedSig_OI_relative_time[39],
    relative_time[38] = NlwRenamedSig_OI_relative_time[38],
    relative_time[37] = NlwRenamedSig_OI_relative_time[37],
    relative_time[36] = NlwRenamedSig_OI_relative_time[36],
    relative_time[35] = NlwRenamedSig_OI_relative_time[35],
    relative_time[34] = NlwRenamedSig_OI_relative_time[34],
    relative_time[33] = NlwRenamedSig_OI_relative_time[33],
    relative_time[32] = NlwRenamedSig_OI_relative_time[32],
    relative_time[31] = NlwRenamedSig_OI_relative_time[31],
    relative_time[30] = NlwRenamedSig_OI_relative_time[30],
    relative_time[29] = NlwRenamedSig_OI_relative_time[29],
    relative_time[28] = NlwRenamedSig_OI_relative_time[28],
    relative_time[27] = NlwRenamedSig_OI_relative_time[27],
    relative_time[26] = NlwRenamedSig_OI_relative_time[26],
    relative_time[25] = NlwRenamedSig_OI_relative_time[25],
    relative_time[24] = NlwRenamedSig_OI_relative_time[24],
    relative_time[23] = NlwRenamedSig_OI_relative_time[23],
    relative_time[22] = NlwRenamedSig_OI_relative_time[22],
    relative_time[21] = NlwRenamedSig_OI_relative_time[21],
    relative_time[20] = NlwRenamedSig_OI_relative_time[20],
    relative_time[19] = NlwRenamedSig_OI_relative_time[19],
    relative_time[18] = NlwRenamedSig_OI_relative_time[18],
    relative_time[17] = NlwRenamedSig_OI_relative_time[17],
    relative_time[16] = NlwRenamedSig_OI_relative_time[16],
    relative_time[15] = NlwRenamedSig_OI_relative_time[15],
    relative_time[14] = NlwRenamedSig_OI_relative_time[14],
    relative_time[13] = NlwRenamedSig_OI_relative_time[13],
    relative_time[12] = NlwRenamedSig_OI_relative_time[12],
    relative_time[11] = NlwRenamedSig_OI_relative_time[11],
    relative_time[10] = NlwRenamedSig_OI_relative_time[10],
    relative_time[9] = NlwRenamedSig_OI_relative_time[9],
    relative_time[8] = NlwRenamedSig_OI_relative_time[8],
    relative_time[7] = NlwRenamedSig_OI_relative_time[7],
    relative_time[6] = NlwRenamedSig_OI_relative_time[6],
    relative_time[5] = NlwRenamedSig_OI_relative_time[5],
    relative_time[4] = NlwRenamedSig_OI_relative_time[4],
    relative_time[3] = NlwRenamedSig_OI_relative_time[3],
    relative_time[2] = NlwRenamedSig_OI_relative_time[2],
    relative_time[1] = NlwRenamedSig_OI_relative_time[1],
    relative_time[0] = NlwRenamedSig_OI_relative_time[0];
  FDC   relative_time_valid_479 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_valid_mux0000_882),
    .Q(NlwRenamedSig_OI_relative_time_valid)
  );
  FDC   state_0 (
    .C(clk),
    .CLR(rst),
    .D(state_mux0000[1]),
    .Q(state[0])
  );
  FDC   state_1 (
    .C(clk),
    .CLR(rst),
    .D(state_mux0000[0]),
    .Q(state[1])
  );
  FDC   relative_time_0 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[0]),
    .Q(NlwRenamedSig_OI_relative_time[0])
  );
  FDC   relative_time_1 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[1]),
    .Q(NlwRenamedSig_OI_relative_time[1])
  );
  FDC   relative_time_2 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[2]),
    .Q(NlwRenamedSig_OI_relative_time[2])
  );
  FDC   relative_time_3 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[3]),
    .Q(NlwRenamedSig_OI_relative_time[3])
  );
  FDC   relative_time_4 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[4]),
    .Q(NlwRenamedSig_OI_relative_time[4])
  );
  FDC   relative_time_5 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[5]),
    .Q(NlwRenamedSig_OI_relative_time[5])
  );
  FDC   relative_time_6 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[6]),
    .Q(NlwRenamedSig_OI_relative_time[6])
  );
  FDC   relative_time_7 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[7]),
    .Q(NlwRenamedSig_OI_relative_time[7])
  );
  FDC   relative_time_8 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[8]),
    .Q(NlwRenamedSig_OI_relative_time[8])
  );
  FDC   relative_time_9 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[9]),
    .Q(NlwRenamedSig_OI_relative_time[9])
  );
  FDC   relative_time_10 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[10]),
    .Q(NlwRenamedSig_OI_relative_time[10])
  );
  FDC   relative_time_11 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[11]),
    .Q(NlwRenamedSig_OI_relative_time[11])
  );
  FDC   relative_time_12 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[12]),
    .Q(NlwRenamedSig_OI_relative_time[12])
  );
  FDC   relative_time_13 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[13]),
    .Q(NlwRenamedSig_OI_relative_time[13])
  );
  FDC   relative_time_14 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[14]),
    .Q(NlwRenamedSig_OI_relative_time[14])
  );
  FDC   relative_time_15 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[15]),
    .Q(NlwRenamedSig_OI_relative_time[15])
  );
  FDC   relative_time_16 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[16]),
    .Q(NlwRenamedSig_OI_relative_time[16])
  );
  FDC   relative_time_17 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[17]),
    .Q(NlwRenamedSig_OI_relative_time[17])
  );
  FDC   relative_time_18 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[18]),
    .Q(NlwRenamedSig_OI_relative_time[18])
  );
  FDC   relative_time_19 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[19]),
    .Q(NlwRenamedSig_OI_relative_time[19])
  );
  FDC   relative_time_20 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[20]),
    .Q(NlwRenamedSig_OI_relative_time[20])
  );
  FDC   relative_time_21 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[21]),
    .Q(NlwRenamedSig_OI_relative_time[21])
  );
  FDC   relative_time_22 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[22]),
    .Q(NlwRenamedSig_OI_relative_time[22])
  );
  FDC   relative_time_23 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[23]),
    .Q(NlwRenamedSig_OI_relative_time[23])
  );
  FDC   relative_time_24 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[24]),
    .Q(NlwRenamedSig_OI_relative_time[24])
  );
  FDC   relative_time_25 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[25]),
    .Q(NlwRenamedSig_OI_relative_time[25])
  );
  FDC   relative_time_26 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[26]),
    .Q(NlwRenamedSig_OI_relative_time[26])
  );
  FDC   relative_time_27 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[27]),
    .Q(NlwRenamedSig_OI_relative_time[27])
  );
  FDC   relative_time_28 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[28]),
    .Q(NlwRenamedSig_OI_relative_time[28])
  );
  FDC   relative_time_29 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[29]),
    .Q(NlwRenamedSig_OI_relative_time[29])
  );
  FDC   relative_time_30 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[30]),
    .Q(NlwRenamedSig_OI_relative_time[30])
  );
  FDC   relative_time_31 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[31]),
    .Q(NlwRenamedSig_OI_relative_time[31])
  );
  FDC   relative_time_32 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[32]),
    .Q(NlwRenamedSig_OI_relative_time[32])
  );
  FDC   relative_time_33 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[33]),
    .Q(NlwRenamedSig_OI_relative_time[33])
  );
  FDC   relative_time_34 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[34]),
    .Q(NlwRenamedSig_OI_relative_time[34])
  );
  FDC   relative_time_35 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[35]),
    .Q(NlwRenamedSig_OI_relative_time[35])
  );
  FDC   relative_time_36 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[36]),
    .Q(NlwRenamedSig_OI_relative_time[36])
  );
  FDC   relative_time_37 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[37]),
    .Q(NlwRenamedSig_OI_relative_time[37])
  );
  FDC   relative_time_38 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[38]),
    .Q(NlwRenamedSig_OI_relative_time[38])
  );
  FDC   relative_time_39 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[39]),
    .Q(NlwRenamedSig_OI_relative_time[39])
  );
  FDC   relative_time_40 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[40]),
    .Q(NlwRenamedSig_OI_relative_time[40])
  );
  FDC   relative_time_41 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[41]),
    .Q(NlwRenamedSig_OI_relative_time[41])
  );
  FDC   relative_time_42 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[42]),
    .Q(NlwRenamedSig_OI_relative_time[42])
  );
  FDC   relative_time_43 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[43]),
    .Q(NlwRenamedSig_OI_relative_time[43])
  );
  FDC   relative_time_44 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[44]),
    .Q(NlwRenamedSig_OI_relative_time[44])
  );
  FDC   relative_time_45 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[45]),
    .Q(NlwRenamedSig_OI_relative_time[45])
  );
  FDC   relative_time_46 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[46]),
    .Q(NlwRenamedSig_OI_relative_time[46])
  );
  FDC   relative_time_47 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[47]),
    .Q(NlwRenamedSig_OI_relative_time[47])
  );
  FDC   relative_time_48 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[48]),
    .Q(NlwRenamedSig_OI_relative_time[48])
  );
  FDC   relative_time_49 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[49]),
    .Q(NlwRenamedSig_OI_relative_time[49])
  );
  FDC   relative_time_50 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[50]),
    .Q(NlwRenamedSig_OI_relative_time[50])
  );
  FDC   relative_time_51 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[51]),
    .Q(NlwRenamedSig_OI_relative_time[51])
  );
  FDC   relative_time_52 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[52]),
    .Q(NlwRenamedSig_OI_relative_time[52])
  );
  FDC   relative_time_53 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[53]),
    .Q(NlwRenamedSig_OI_relative_time[53])
  );
  FDC   relative_time_54 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[54]),
    .Q(NlwRenamedSig_OI_relative_time[54])
  );
  FDC   relative_time_55 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[55]),
    .Q(NlwRenamedSig_OI_relative_time[55])
  );
  FDC   relative_time_56 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[56]),
    .Q(NlwRenamedSig_OI_relative_time[56])
  );
  FDC   relative_time_57 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[57]),
    .Q(NlwRenamedSig_OI_relative_time[57])
  );
  FDC   relative_time_58 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[58]),
    .Q(NlwRenamedSig_OI_relative_time[58])
  );
  FDC   relative_time_59 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[59]),
    .Q(NlwRenamedSig_OI_relative_time[59])
  );
  FDC   relative_time_60 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[60]),
    .Q(NlwRenamedSig_OI_relative_time[60])
  );
  FDC   relative_time_61 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[61]),
    .Q(NlwRenamedSig_OI_relative_time[61])
  );
  FDC   relative_time_62 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[62]),
    .Q(NlwRenamedSig_OI_relative_time[62])
  );
  FDC   relative_time_63 (
    .C(clk),
    .CLR(rst),
    .D(relative_time_mux0000[63]),
    .Q(NlwRenamedSig_OI_relative_time[63])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \state_mux0000<1>_SW0  (
    .I0(soc),
    .I1(head_done),
    .O(N02)
  );
  LUT4 #(
    .INIT ( 16'h90D4 ))
  \state_mux0000<1>  (
    .I0(state[1]),
    .I1(state[0]),
    .I2(N02),
    .I3(state_and0000_887),
    .O(state_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  state_cmp_eq0008 (
    .I0(adress[2]),
    .I1(adress[3]),
    .I2(N5),
    .I3(N6),
    .O(state_cmp_eq0008_888)
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<9>1  (
    .I0(NlwRenamedSig_OI_relative_time[17]),
    .I1(NlwRenamedSig_OI_relative_time[9]),
    .I2(N41),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<8>1  (
    .I0(NlwRenamedSig_OI_relative_time[16]),
    .I1(NlwRenamedSig_OI_relative_time[8]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<7>1  (
    .I0(NlwRenamedSig_OI_relative_time[7]),
    .I1(NlwRenamedSig_OI_relative_time[15]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<6>1  (
    .I0(NlwRenamedSig_OI_relative_time[6]),
    .I1(NlwRenamedSig_OI_relative_time[14]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<63>1  (
    .I0(data[7]),
    .I1(NlwRenamedSig_OI_relative_time[63]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[63])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<62>1  (
    .I0(data[6]),
    .I1(NlwRenamedSig_OI_relative_time[62]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[62])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<61>1  (
    .I0(data[5]),
    .I1(NlwRenamedSig_OI_relative_time[61]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[61])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<60>1  (
    .I0(data[4]),
    .I1(NlwRenamedSig_OI_relative_time[60]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[60])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_relative_time[5]),
    .I1(NlwRenamedSig_OI_relative_time[13]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<59>1  (
    .I0(data[3]),
    .I1(NlwRenamedSig_OI_relative_time[59]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[59])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<58>1  (
    .I0(data[2]),
    .I1(NlwRenamedSig_OI_relative_time[58]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[58])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<57>1  (
    .I0(data[1]),
    .I1(NlwRenamedSig_OI_relative_time[57]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[57])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<56>1  (
    .I0(data[0]),
    .I1(NlwRenamedSig_OI_relative_time[56]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[56])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<55>1  (
    .I0(NlwRenamedSig_OI_relative_time[63]),
    .I1(NlwRenamedSig_OI_relative_time[55]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[55])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<54>1  (
    .I0(NlwRenamedSig_OI_relative_time[62]),
    .I1(NlwRenamedSig_OI_relative_time[54]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[54])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<53>1  (
    .I0(NlwRenamedSig_OI_relative_time[61]),
    .I1(NlwRenamedSig_OI_relative_time[53]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>12 ),
    .O(relative_time_mux0000[53])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<52>1  (
    .I0(NlwRenamedSig_OI_relative_time[60]),
    .I1(NlwRenamedSig_OI_relative_time[52]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[52])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<51>1  (
    .I0(NlwRenamedSig_OI_relative_time[59]),
    .I1(NlwRenamedSig_OI_relative_time[51]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[51])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<50>1  (
    .I0(NlwRenamedSig_OI_relative_time[58]),
    .I1(NlwRenamedSig_OI_relative_time[50]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[50])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_relative_time[4]),
    .I1(NlwRenamedSig_OI_relative_time[12]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<49>1  (
    .I0(NlwRenamedSig_OI_relative_time[57]),
    .I1(NlwRenamedSig_OI_relative_time[49]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[49])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<48>1  (
    .I0(NlwRenamedSig_OI_relative_time[56]),
    .I1(NlwRenamedSig_OI_relative_time[48]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[48])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<47>1  (
    .I0(NlwRenamedSig_OI_relative_time[55]),
    .I1(NlwRenamedSig_OI_relative_time[47]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[47])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<46>1  (
    .I0(NlwRenamedSig_OI_relative_time[54]),
    .I1(NlwRenamedSig_OI_relative_time[46]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[46])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<45>1  (
    .I0(NlwRenamedSig_OI_relative_time[53]),
    .I1(NlwRenamedSig_OI_relative_time[45]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[45])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<44>1  (
    .I0(NlwRenamedSig_OI_relative_time[52]),
    .I1(NlwRenamedSig_OI_relative_time[44]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[44])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<43>1  (
    .I0(NlwRenamedSig_OI_relative_time[51]),
    .I1(NlwRenamedSig_OI_relative_time[43]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[43])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<42>1  (
    .I0(NlwRenamedSig_OI_relative_time[50]),
    .I1(NlwRenamedSig_OI_relative_time[42]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[42])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<41>1  (
    .I0(NlwRenamedSig_OI_relative_time[49]),
    .I1(NlwRenamedSig_OI_relative_time[41]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[41])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<40>1  (
    .I0(NlwRenamedSig_OI_relative_time[48]),
    .I1(NlwRenamedSig_OI_relative_time[40]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[40])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_relative_time[3]),
    .I1(NlwRenamedSig_OI_relative_time[11]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<39>1  (
    .I0(NlwRenamedSig_OI_relative_time[47]),
    .I1(NlwRenamedSig_OI_relative_time[39]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>11 ),
    .O(relative_time_mux0000[39])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<38>1  (
    .I0(NlwRenamedSig_OI_relative_time[46]),
    .I1(NlwRenamedSig_OI_relative_time[38]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[38])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<37>1  (
    .I0(NlwRenamedSig_OI_relative_time[45]),
    .I1(NlwRenamedSig_OI_relative_time[37]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[37])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<36>1  (
    .I0(NlwRenamedSig_OI_relative_time[44]),
    .I1(NlwRenamedSig_OI_relative_time[36]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[36])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<35>1  (
    .I0(NlwRenamedSig_OI_relative_time[43]),
    .I1(NlwRenamedSig_OI_relative_time[35]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[35])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<34>1  (
    .I0(NlwRenamedSig_OI_relative_time[42]),
    .I1(NlwRenamedSig_OI_relative_time[34]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[34])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<33>1  (
    .I0(NlwRenamedSig_OI_relative_time[41]),
    .I1(NlwRenamedSig_OI_relative_time[33]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[33])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<32>1  (
    .I0(NlwRenamedSig_OI_relative_time[40]),
    .I1(NlwRenamedSig_OI_relative_time[32]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[32])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<31>1  (
    .I0(NlwRenamedSig_OI_relative_time[39]),
    .I1(NlwRenamedSig_OI_relative_time[31]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[31])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<30>1  (
    .I0(NlwRenamedSig_OI_relative_time[38]),
    .I1(NlwRenamedSig_OI_relative_time[30]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[30])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<2>1  (
    .I0(NlwRenamedSig_OI_relative_time[2]),
    .I1(NlwRenamedSig_OI_relative_time[10]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<29>1  (
    .I0(NlwRenamedSig_OI_relative_time[37]),
    .I1(NlwRenamedSig_OI_relative_time[29]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[29])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<28>1  (
    .I0(NlwRenamedSig_OI_relative_time[36]),
    .I1(NlwRenamedSig_OI_relative_time[28]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[28])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<27>1  (
    .I0(NlwRenamedSig_OI_relative_time[35]),
    .I1(NlwRenamedSig_OI_relative_time[27]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[27])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<26>1  (
    .I0(NlwRenamedSig_OI_relative_time[34]),
    .I1(NlwRenamedSig_OI_relative_time[26]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[26])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<25>1  (
    .I0(NlwRenamedSig_OI_relative_time[33]),
    .I1(NlwRenamedSig_OI_relative_time[25]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[25])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<24>1  (
    .I0(NlwRenamedSig_OI_relative_time[32]),
    .I1(NlwRenamedSig_OI_relative_time[24]),
    .I2(N11),
    .I3(\relative_time_mux0000<0>1_815 ),
    .O(relative_time_mux0000[24])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<23>1  (
    .I0(NlwRenamedSig_OI_relative_time[31]),
    .I1(NlwRenamedSig_OI_relative_time[23]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[23])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<22>1  (
    .I0(NlwRenamedSig_OI_relative_time[30]),
    .I1(NlwRenamedSig_OI_relative_time[22]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[22])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<21>1  (
    .I0(NlwRenamedSig_OI_relative_time[29]),
    .I1(NlwRenamedSig_OI_relative_time[21]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[21])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<20>1  (
    .I0(NlwRenamedSig_OI_relative_time[28]),
    .I1(NlwRenamedSig_OI_relative_time[20]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[20])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<1>1  (
    .I0(NlwRenamedSig_OI_relative_time[1]),
    .I1(NlwRenamedSig_OI_relative_time[9]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<19>1  (
    .I0(NlwRenamedSig_OI_relative_time[27]),
    .I1(NlwRenamedSig_OI_relative_time[19]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[19])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<18>1  (
    .I0(NlwRenamedSig_OI_relative_time[26]),
    .I1(NlwRenamedSig_OI_relative_time[18]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[18])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<17>1  (
    .I0(NlwRenamedSig_OI_relative_time[25]),
    .I1(NlwRenamedSig_OI_relative_time[17]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[17])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<16>1  (
    .I0(NlwRenamedSig_OI_relative_time[24]),
    .I1(NlwRenamedSig_OI_relative_time[16]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[16])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<15>1  (
    .I0(NlwRenamedSig_OI_relative_time[23]),
    .I1(NlwRenamedSig_OI_relative_time[15]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[15])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<14>1  (
    .I0(NlwRenamedSig_OI_relative_time[22]),
    .I1(NlwRenamedSig_OI_relative_time[14]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[14])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<13>1  (
    .I0(NlwRenamedSig_OI_relative_time[21]),
    .I1(NlwRenamedSig_OI_relative_time[13]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[13])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<12>1  (
    .I0(NlwRenamedSig_OI_relative_time[20]),
    .I1(NlwRenamedSig_OI_relative_time[12]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[12])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<11>1  (
    .I0(NlwRenamedSig_OI_relative_time[19]),
    .I1(NlwRenamedSig_OI_relative_time[11]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[11])
  );
  LUT4 #(
    .INIT ( 16'hECA0 ))
  \relative_time_mux0000<10>1  (
    .I0(NlwRenamedSig_OI_relative_time[18]),
    .I1(NlwRenamedSig_OI_relative_time[10]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[10])
  );
  LUT4 #(
    .INIT ( 16'hEAC0 ))
  \relative_time_mux0000<0>3  (
    .I0(NlwRenamedSig_OI_relative_time[0]),
    .I1(NlwRenamedSig_OI_relative_time[8]),
    .I2(N11),
    .I3(N01),
    .O(relative_time_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  state_and00001 (
    .I0(adress[9]),
    .I1(adress[8]),
    .I2(adress[7]),
    .I3(N9),
    .O(N6)
  );
  LUT4 #(
    .INIT ( 16'h0400 ))
  state_and0000 (
    .I0(adress[3]),
    .I1(we),
    .I2(N16),
    .I3(N6),
    .O(state_and0000_887)
  );
  MUXF5   relative_time_valid_mux0000 (
    .I0(N29),
    .I1(N30),
    .S(NlwRenamedSig_OI_relative_time_valid),
    .O(relative_time_valid_mux0000_882)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  relative_time_valid_mux0000_F (
    .I0(state_cmp_eq0008_888),
    .I1(we),
    .I2(state[1]),
    .I3(state[0]),
    .O(N29)
  );
  LUT4 #(
    .INIT ( 16'hF666 ))
  relative_time_valid_mux0000_G (
    .I0(state[1]),
    .I1(state[0]),
    .I2(soc),
    .I3(head_done),
    .O(N30)
  );
  MUXF5   \relative_time_mux0000<0>1  (
    .I0(N31),
    .I1(N32),
    .S(state[0]),
    .O(N01)
  );
  LUT4 #(
    .INIT ( 16'h7222 ))
  \relative_time_mux0000<0>1_F  (
    .I0(state[1]),
    .I1(we),
    .I2(soc),
    .I3(head_done),
    .O(N31)
  );
  LUT4 #(
    .INIT ( 16'hB111 ))
  \relative_time_mux0000<0>1_G  (
    .I0(state[1]),
    .I1(state_and0000_887),
    .I2(soc),
    .I3(head_done),
    .O(N32)
  );
  MUXF5   \relative_time_mux0000<0>1_1  (
    .I0(N33),
    .I1(N34),
    .S(state[0]),
    .O(\relative_time_mux0000<0>1_815 )
  );
  LUT4 #(
    .INIT ( 16'h7222 ))
  \relative_time_mux0000<0>1_1_F  (
    .I0(state[1]),
    .I1(we),
    .I2(soc),
    .I3(head_done),
    .O(N33)
  );
  LUT4 #(
    .INIT ( 16'hB111 ))
  \relative_time_mux0000<0>1_1_G  (
    .I0(state[1]),
    .I1(state_and0000_887),
    .I2(soc),
    .I3(head_done),
    .O(N34)
  );
  MUXF5   \relative_time_mux0000<0>1_2  (
    .I0(N35),
    .I1(N36),
    .S(state[0]),
    .O(\relative_time_mux0000<0>11 )
  );
  LUT4 #(
    .INIT ( 16'h7222 ))
  \relative_time_mux0000<0>1_2_F  (
    .I0(state[1]),
    .I1(we),
    .I2(soc),
    .I3(head_done),
    .O(N35)
  );
  LUT4 #(
    .INIT ( 16'hB111 ))
  \relative_time_mux0000<0>1_2_G  (
    .I0(state[1]),
    .I1(state_and0000_887),
    .I2(soc),
    .I3(head_done),
    .O(N36)
  );
  MUXF5   \relative_time_mux0000<0>1_3  (
    .I0(N37),
    .I1(N38),
    .S(state[0]),
    .O(\relative_time_mux0000<0>12 )
  );
  LUT4 #(
    .INIT ( 16'h7222 ))
  \relative_time_mux0000<0>1_3_F  (
    .I0(state[1]),
    .I1(we),
    .I2(soc),
    .I3(head_done),
    .O(N37)
  );
  LUT4 #(
    .INIT ( 16'hB111 ))
  \relative_time_mux0000<0>1_3_G  (
    .I0(state[1]),
    .I1(state_and0000_887),
    .I2(soc),
    .I3(head_done),
    .O(N38)
  );
  LUT4 #(
    .INIT ( 16'h202C ))
  \state_mux0000<0>1  (
    .I0(state_and0000_887),
    .I1(state[1]),
    .I2(state[0]),
    .I3(state_cmp_eq0008_888),
    .O(\state_mux0000<0>1_890 )
  );
  LUT3 #(
    .INIT ( 8'h62 ))
  \state_mux0000<0>2  (
    .I0(state[1]),
    .I1(state[0]),
    .I2(state_and0000_887),
    .O(\state_mux0000<0>2_891 )
  );
  MUXF5   \state_mux0000<0>_f5  (
    .I0(\state_mux0000<0>2_891 ),
    .I1(\state_mux0000<0>1_890 ),
    .S(we),
    .O(state_mux0000[0])
  );
  LUT2_L #(
    .INIT ( 4'h7 ))
  state_cmp_eq0008_SW0 (
    .I0(adress[1]),
    .I1(adress[0]),
    .LO(N5)
  );
  LUT4_D #(
    .INIT ( 16'h6420 ))
  \relative_time_mux0000<0>21  (
    .I0(state[1]),
    .I1(state[0]),
    .I2(we),
    .I3(state_and0000_887),
    .LO(N41),
    .O(N11)
  );
  LUT3_L #(
    .INIT ( 8'hFB ))
  state_and00001_SW0 (
    .I0(adress[6]),
    .I1(adress[5]),
    .I2(adress[4]),
    .LO(N9)
  );
  LUT3_L #(
    .INIT ( 8'hFB ))
  state_and0000_SW0_SW0 (
    .I0(adress[1]),
    .I1(adress[2]),
    .I2(adress[0]),
    .LO(N16)
  );
endmodule

module mem_2port_INST_2 (
  clk, we_a, we_b, en_a, en_b, clk_b, r_data_a, r_data_b, addr_a, addr_b, w_data_a, w_data_b
);
  input clk;
  input we_a;
  input we_b;
  input en_a;
  input en_b;
  input clk_b;
  output [7 : 0] r_data_a;
  output [7 : 0] r_data_b;
  input [9 : 0] addr_a;
  input [9 : 0] addr_b;
  input [7 : 0] w_data_a;
  input [7 : 0] w_data_b;
  wire N0;
  wire \NLW_Mram_mem_DOPA<0>_UNCONNECTED ;
  wire \NLW_Mram_mem_DOPB<0>_UNCONNECTED ;
  GND   XST_GND (
    .G(N0)
  );
  RAMB16_S9_S9 #(
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h000000000000000000000000000000000000000000000000D555555555555555 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "READ_FIRST" ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ))
  Mram_mem (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(en_a),
    .ENB(en_b),
    .SSRA(N0),
    .SSRB(N0),
    .WEA(we_a),
    .WEB(we_b),
    .ADDRA({N0, addr_a[9], addr_a[8], addr_a[7], addr_a[6], addr_a[5], addr_a[4], addr_a[3], addr_a[2], addr_a[1], addr_a[0]}),
    .ADDRB({N0, addr_b[9], addr_b[8], addr_b[7], addr_b[6], addr_b[5], addr_b[4], addr_b[3], addr_b[2], addr_b[1], addr_b[0]}),
    .DIA({w_data_a[7], w_data_a[6], w_data_a[5], w_data_a[4], w_data_a[3], w_data_a[2], w_data_a[1], w_data_a[0]}),
    .DIB({w_data_b[7], w_data_b[6], w_data_b[5], w_data_b[4], w_data_b[3], w_data_b[2], w_data_b[1], w_data_b[0]}),
    .DIPA({N0}),
    .DIPB({N0}),
    .DOA({r_data_a[7], r_data_a[6], r_data_a[5], r_data_a[4], r_data_a[3], r_data_a[2], r_data_a[1], r_data_a[0]}),
    .DOPA({\NLW_Mram_mem_DOPA<0>_UNCONNECTED }),
    .DOB({r_data_b[7], r_data_b[6], r_data_b[5], r_data_b[4], r_data_b[3], r_data_b[2], r_data_b[1], r_data_b[0]}),
    .DOPB({\NLW_Mram_mem_DOPB<0>_UNCONNECTED })
  );
endmodule

module mem_2port_INST_1 (
  clk, we_a, we_b, en_a, en_b, clk_b, r_data_a, r_data_b, addr_a, addr_b, w_data_a, w_data_b
);
  input clk;
  input we_a;
  input we_b;
  input en_a;
  input en_b;
  input clk_b;
  output [7 : 0] r_data_a;
  output [7 : 0] r_data_b;
  input [9 : 0] addr_a;
  input [9 : 0] addr_b;
  input [7 : 0] w_data_a;
  input [7 : 0] w_data_b;
  wire N0;
  wire \NLW_Mram_mem_DOPA<0>_UNCONNECTED ;
  wire \NLW_Mram_mem_DOPB<0>_UNCONNECTED ;
  GND   XST_GND (
    .G(N0)
  );
  RAMB16_S9_S9 #(
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h000000000000000000000000000000000000000000000000D555555555555555 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "READ_FIRST" ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ))
  Mram_mem (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(en_a),
    .ENB(en_b),
    .SSRA(N0),
    .SSRB(N0),
    .WEA(we_a),
    .WEB(we_b),
    .ADDRA({N0, addr_a[9], addr_a[8], addr_a[7], addr_a[6], addr_a[5], addr_a[4], addr_a[3], addr_a[2], addr_a[1], addr_a[0]}),
    .ADDRB({N0, addr_b[9], addr_b[8], addr_b[7], addr_b[6], addr_b[5], addr_b[4], addr_b[3], addr_b[2], addr_b[1], addr_b[0]}),
    .DIA({w_data_a[7], w_data_a[6], w_data_a[5], w_data_a[4], w_data_a[3], w_data_a[2], w_data_a[1], w_data_a[0]}),
    .DIB({w_data_b[7], w_data_b[6], w_data_b[5], w_data_b[4], w_data_b[3], w_data_b[2], w_data_b[1], w_data_b[0]}),
    .DIPA({N0}),
    .DIPB({N0}),
    .DOA({r_data_a[7], r_data_a[6], r_data_a[5], r_data_a[4], r_data_a[3], r_data_a[2], r_data_a[1], r_data_a[0]}),
    .DOPA({\NLW_Mram_mem_DOPA<0>_UNCONNECTED }),
    .DOB({r_data_b[7], r_data_b[6], r_data_b[5], r_data_b[4], r_data_b[3], r_data_b[2], r_data_b[1], r_data_b[0]}),
    .DOPB({\NLW_Mram_mem_DOPB<0>_UNCONNECTED })
  );
endmodule

module retr_soc (
  clk, rled, rst, soc_out_edge, rm_tx_en, soc_is_runnig, soc_edge, fast_eth, rmii_clk, rm_crs_dv, tt_soc, rm_tx_data, rm_rx_data
);
  input clk;
  output rled;
  input rst;
  output soc_out_edge;
  output rm_tx_en;
  output soc_is_runnig;
  output soc_edge;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output tt_soc;
  output [1 : 0] rm_tx_data;
  input [1 : 0] rm_rx_data;
  wire N1;
  wire N11;
  wire N12;
  wire N13;
  wire N131;
  wire N14;
  wire N15;
  wire N151;
  wire N17;
  wire N18;
  wire N19;
  wire N21;
  wire N23;
  wire N25;
  wire N29;
  wire N3;
  wire N30;
  wire N31;
  wire N32;
  wire N33;
  wire N34;
  wire N35;
  wire N36;
  wire N37;
  wire N4;
  wire N5;
  wire N7;
  wire N9;
  wire N91;
  wire buffer_is_full_0_mux0000;
  wire buffer_is_full_0_not0001;
  wire buffer_is_full_1_mux0000;
  wire buffer_is_full_1_not0001;
  wire buffer_not_empty_0_not0001;
  wire buffer_not_empty_1_not0001;
  wire comutate_in_1_3620;
  wire comutate_in_1_not0001;
  wire comutate_out_1_3622;
  wire comutate_out_1_not0001;
  wire count_buf_1_not0001;
  wire count_buf_2_not0001;
  wire head_done;
  wire preq;
  wire recv_rdy_dev;
  wire recv_we;
  wire recv_we2;
  wire recv_we_dev;
  wire relative_time_valid;
  wire retr_state_FSM_FFd1_3781;
  wire \retr_state_FSM_FFd1-In ;
  wire NlwRenamedSig_OI_rm_tx_en;
  wire soc;
  wire NlwRenamedSig_OI_soc_edge;
  wire soc_edge_not0001;
  wire soc_in_buffer_0_not0001;
  wire soc_in_buffer_1_not0001;
  wire NlwRenamedSig_OI_soc_is_runnig;
  wire soc_out;
  wire NlwRenamedSig_OI_soc_out_edge;
  wire soc_out_edge_not0001;
  wire time_out_end;
  wire \trans_count_dev_mux0000<0>13_3845 ;
  wire \trans_count_dev_mux0000<0>26_3846 ;
  wire \trans_count_dev_mux0000<0>92_3847 ;
  wire \trans_count_dev_mux0000<0>92_SW0 ;
  wire \trans_count_dev_mux0000<0>92_SW01_3849 ;
  wire \trans_count_dev_mux0000<1>0_3851 ;
  wire \trans_count_dev_mux0000<1>32_3852 ;
  wire \trans_count_dev_mux0000<1>32_SW0 ;
  wire \trans_count_dev_mux0000<1>32_SW01_3854 ;
  wire \trans_count_dev_mux0000<1>72_3855 ;
  wire \trans_count_dev_mux0000<1>72_SW0 ;
  wire \trans_count_dev_mux0000<1>72_SW01_3857 ;
  wire \trans_count_dev_mux0000<2>39_3859 ;
  wire \trans_count_dev_mux0000<3>20_3861 ;
  wire \trans_count_dev_mux0000<4>13_3863 ;
  wire \trans_count_dev_mux0000<4>40_3864 ;
  wire \trans_count_dev_mux0000<4>51_3865 ;
  wire \trans_count_dev_mux0000<5>17_3867 ;
  wire \trans_count_dev_mux0000<5>42_3868 ;
  wire \trans_count_dev_mux0000<5>45_3869 ;
  wire trans_done_dev;
  wire trans_rdy;
  wire trans_start_dev_3900;
  wire trans_start_dev_mux0000;
  wire trans_start_dev_mux000018_3902;
  wire trans_start_dev_mux000032_3903;
  wire trans_start_dev_mux00007_3904;
  wire NlwRenamedSig_OI_tt_soc;
  wire NLW_soc_detect_out_head_o_UNCONNECTED;
  wire \NLW_frame_buf_r_data_a<7>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<6>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<5>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<4>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<3>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<2>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<1>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<0>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<7>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<6>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<5>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<4>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<3>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<2>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<1>_UNCONNECTED ;
  wire \NLW_frame_buf2_r_data_a<0>_UNCONNECTED ;
  wire [1 : 0] buffer_is_full;
  wire [1 : 0] buffer_not_empty;
  wire [9 : 0] count_buf_1;
  wire [9 : 0] count_buf_2;
  wire [9 : 0] recv_addr2;
  wire [9 : 0] recv_addr;
  wire [9 : 0] recv_addr_dev;
  wire [9 : 0] recv_count_dev;
  wire [7 : 0] recv_data2;
  wire [7 : 0] recv_data;
  wire [7 : 0] recv_data_dev;
  wire [63 : 0] relative_time;
  wire [1 : 0] NlwRenamedSig_OI_rm_tx_data;
  wire [1 : 0] soc_in_buffer;
  wire [9 : 0] trans_addr2;
  wire [9 : 0] trans_addr;
  wire [9 : 0] trans_addr_dev;
  wire [9 : 0] trans_count_dev;
  wire [9 : 0] trans_count_dev_mux0000;
  wire [7 : 0] trans_data2;
  wire [7 : 0] trans_data;
  wire [7 : 0] trans_data_dev;
  assign
    soc_out_edge = NlwRenamedSig_OI_soc_out_edge,
    rm_tx_en = NlwRenamedSig_OI_rm_tx_en,
    soc_is_runnig = NlwRenamedSig_OI_soc_is_runnig,
    soc_edge = NlwRenamedSig_OI_soc_edge,
    tt_soc = NlwRenamedSig_OI_tt_soc,
    rm_tx_data[1] = NlwRenamedSig_OI_rm_tx_data[1],
    rm_tx_data[0] = NlwRenamedSig_OI_rm_tx_data[0];
  GND   XST_GND (
    .G(NlwRenamedSig_OI_soc_is_runnig)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   buffer_is_full_0 (
    .C(clk),
    .CE(buffer_is_full_0_not0001),
    .CLR(rst),
    .D(buffer_is_full_0_mux0000),
    .Q(buffer_is_full[0])
  );
  FDCE   buffer_is_full_1 (
    .C(clk),
    .CE(buffer_is_full_1_not0001),
    .CLR(rst),
    .D(buffer_is_full_1_mux0000),
    .Q(buffer_is_full[1])
  );
  FDCE   buffer_not_empty_1 (
    .C(clk),
    .CE(buffer_not_empty_1_not0001),
    .CLR(rst),
    .D(buffer_is_full_1_mux0000),
    .Q(buffer_not_empty[1])
  );
  FDCE   soc_in_buffer_1 (
    .C(clk),
    .CE(soc_in_buffer_1_not0001),
    .CLR(rst),
    .D(buffer_is_full_1_mux0000),
    .Q(soc_in_buffer[1])
  );
  FDCE   soc_in_buffer_0 (
    .C(clk),
    .CE(soc_in_buffer_0_not0001),
    .CLR(rst),
    .D(buffer_is_full_0_mux0000),
    .Q(soc_in_buffer[0])
  );
  FDC   trans_start_dev (
    .C(clk),
    .CLR(rst),
    .D(trans_start_dev_mux0000),
    .Q(trans_start_dev_3900)
  );
  FDCE   buffer_not_empty_0 (
    .C(clk),
    .CE(buffer_not_empty_0_not0001),
    .CLR(rst),
    .D(buffer_is_full_0_mux0000),
    .Q(buffer_not_empty[0])
  );
  FDC   trans_count_dev_0 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[9]),
    .Q(trans_count_dev[0])
  );
  FDC   trans_count_dev_1 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[8]),
    .Q(trans_count_dev[1])
  );
  FDC   trans_count_dev_2 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[7]),
    .Q(trans_count_dev[2])
  );
  FDC   trans_count_dev_3 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[6]),
    .Q(trans_count_dev[3])
  );
  FDC   trans_count_dev_4 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[5]),
    .Q(trans_count_dev[4])
  );
  FDC   trans_count_dev_5 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[4]),
    .Q(trans_count_dev[5])
  );
  FDC   trans_count_dev_6 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[3]),
    .Q(trans_count_dev[6])
  );
  FDC   trans_count_dev_7 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[2]),
    .Q(trans_count_dev[7])
  );
  FDC   trans_count_dev_8 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[1]),
    .Q(trans_count_dev[8])
  );
  FDC   trans_count_dev_9 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_dev_mux0000[0]),
    .Q(trans_count_dev[9])
  );
  FDPE   comutate_in_1 (
    .C(clk),
    .CE(recv_rdy_dev),
    .D(comutate_in_1_not0001),
    .PRE(rst),
    .Q(comutate_in_1_3620)
  );
  FDCE   soc_edge_448 (
    .C(clk),
    .CE(soc),
    .CLR(rst),
    .D(soc_edge_not0001),
    .Q(NlwRenamedSig_OI_soc_edge)
  );
  FDCE   count_buf_2_0 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[0]),
    .Q(count_buf_2[0])
  );
  FDCE   count_buf_2_1 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[1]),
    .Q(count_buf_2[1])
  );
  FDCE   count_buf_2_2 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[2]),
    .Q(count_buf_2[2])
  );
  FDCE   count_buf_2_3 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[3]),
    .Q(count_buf_2[3])
  );
  FDCE   count_buf_2_4 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[4]),
    .Q(count_buf_2[4])
  );
  FDCE   count_buf_2_5 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[5]),
    .Q(count_buf_2[5])
  );
  FDCE   count_buf_2_6 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[6]),
    .Q(count_buf_2[6])
  );
  FDCE   count_buf_2_7 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[7]),
    .Q(count_buf_2[7])
  );
  FDCE   count_buf_2_8 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[8]),
    .Q(count_buf_2[8])
  );
  FDCE   count_buf_2_9 (
    .C(clk),
    .CE(count_buf_2_not0001),
    .CLR(rst),
    .D(recv_count_dev[9]),
    .Q(count_buf_2[9])
  );
  FDCE   count_buf_1_0 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[0]),
    .Q(count_buf_1[0])
  );
  FDCE   count_buf_1_1 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[1]),
    .Q(count_buf_1[1])
  );
  FDCE   count_buf_1_2 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[2]),
    .Q(count_buf_1[2])
  );
  FDCE   count_buf_1_3 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[3]),
    .Q(count_buf_1[3])
  );
  FDCE   count_buf_1_4 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[4]),
    .Q(count_buf_1[4])
  );
  FDCE   count_buf_1_5 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[5]),
    .Q(count_buf_1[5])
  );
  FDCE   count_buf_1_6 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[6]),
    .Q(count_buf_1[6])
  );
  FDCE   count_buf_1_7 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[7]),
    .Q(count_buf_1[7])
  );
  FDCE   count_buf_1_8 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[8]),
    .Q(count_buf_1[8])
  );
  FDCE   count_buf_1_9 (
    .C(clk),
    .CE(count_buf_1_not0001),
    .CLR(rst),
    .D(recv_count_dev[9]),
    .Q(count_buf_1[9])
  );
  FDPE   comutate_out_1 (
    .C(clk),
    .CE(trans_done_dev),
    .D(comutate_out_1_not0001),
    .PRE(rst),
    .Q(comutate_out_1_3622)
  );
  FDCE   soc_out_edge_470 (
    .C(clk),
    .CE(soc_out),
    .CLR(rst),
    .D(soc_out_edge_not0001),
    .Q(NlwRenamedSig_OI_soc_out_edge)
  );
  FDC   retr_state_FSM_FFd1 (
    .C(clk),
    .CLR(rst),
    .D(\retr_state_FSM_FFd1-In ),
    .Q(retr_state_FSM_FFd1_3781)
  );
  mem_2port_INST_1   frame_buf2 (
    .clk(clk),
    .we_a(recv_we2),
    .we_b(NlwRenamedSig_OI_soc_is_runnig),
    .en_a(recv_we2),
    .en_b(N1),
    .clk_b(NlwRenamedSig_OI_soc_is_runnig),
    .r_data_a({\NLW_frame_buf2_r_data_a<7>_UNCONNECTED , \NLW_frame_buf2_r_data_a<6>_UNCONNECTED , \NLW_frame_buf2_r_data_a<5>_UNCONNECTED , 
\NLW_frame_buf2_r_data_a<4>_UNCONNECTED , \NLW_frame_buf2_r_data_a<3>_UNCONNECTED , \NLW_frame_buf2_r_data_a<2>_UNCONNECTED , 
\NLW_frame_buf2_r_data_a<1>_UNCONNECTED , \NLW_frame_buf2_r_data_a<0>_UNCONNECTED }),
    .r_data_b({trans_data2[7], trans_data2[6], trans_data2[5], trans_data2[4], trans_data2[3], trans_data2[2], trans_data2[1], trans_data2[0]}),
    .addr_a({recv_addr2[9], recv_addr2[8], recv_addr2[7], recv_addr2[6], recv_addr2[5], recv_addr2[4], recv_addr2[3], recv_addr2[2], recv_addr2[1], 
recv_addr2[0]}),
    .addr_b({trans_addr2[9], trans_addr2[8], trans_addr2[7], trans_addr2[6], trans_addr2[5], trans_addr2[4], trans_addr2[3], trans_addr2[2], 
trans_addr2[1], trans_addr2[0]}),
    .w_data_a({recv_data2[7], recv_data2[6], recv_data2[5], recv_data2[4], recv_data2[3], recv_data2[2], recv_data2[1], recv_data2[0]}),
    .w_data_b({NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig})
  );
  mem_2port_INST_2   frame_buf (
    .clk(clk),
    .we_a(recv_we),
    .we_b(NlwRenamedSig_OI_soc_is_runnig),
    .en_a(recv_we),
    .en_b(N1),
    .clk_b(NlwRenamedSig_OI_soc_is_runnig),
    .r_data_a({\NLW_frame_buf_r_data_a<7>_UNCONNECTED , \NLW_frame_buf_r_data_a<6>_UNCONNECTED , \NLW_frame_buf_r_data_a<5>_UNCONNECTED , 
\NLW_frame_buf_r_data_a<4>_UNCONNECTED , \NLW_frame_buf_r_data_a<3>_UNCONNECTED , \NLW_frame_buf_r_data_a<2>_UNCONNECTED , 
\NLW_frame_buf_r_data_a<1>_UNCONNECTED , \NLW_frame_buf_r_data_a<0>_UNCONNECTED }),
    .r_data_b({trans_data[7], trans_data[6], trans_data[5], trans_data[4], trans_data[3], trans_data[2], trans_data[1], trans_data[0]}),
    .addr_a({recv_addr[9], recv_addr[8], recv_addr[7], recv_addr[6], recv_addr[5], recv_addr[4], recv_addr[3], recv_addr[2], recv_addr[1], 
recv_addr[0]}),
    .addr_b({trans_addr[9], trans_addr[8], trans_addr[7], trans_addr[6], trans_addr[5], trans_addr[4], trans_addr[3], trans_addr[2], trans_addr[1], 
trans_addr[0]}),
    .w_data_a({recv_data[7], recv_data[6], recv_data[5], recv_data[4], recv_data[3], recv_data[2], recv_data[1], recv_data[0]}),
    .w_data_b({NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig})
  );
  relative_time_det   time_det (
    .clk(clk),
    .soc(soc),
    .rst(rst),
    .relative_time_valid(relative_time_valid),
    .we(recv_we_dev),
    .head_done(head_done),
    .relative_time({relative_time[63], relative_time[62], relative_time[61], relative_time[60], relative_time[59], relative_time[58], 
relative_time[57], relative_time[56], relative_time[55], relative_time[54], relative_time[53], relative_time[52], relative_time[51], relative_time[50]
, relative_time[49], relative_time[48], relative_time[47], relative_time[46], relative_time[45], relative_time[44], relative_time[43], 
relative_time[42], relative_time[41], relative_time[40], relative_time[39], relative_time[38], relative_time[37], relative_time[36], relative_time[35]
, relative_time[34], relative_time[33], relative_time[32], relative_time[31], relative_time[30], relative_time[29], relative_time[28], 
relative_time[27], relative_time[26], relative_time[25], relative_time[24], relative_time[23], relative_time[22], relative_time[21], relative_time[20]
, relative_time[19], relative_time[18], relative_time[17], relative_time[16], relative_time[15], relative_time[14], relative_time[13], 
relative_time[12], relative_time[11], relative_time[10], relative_time[9], relative_time[8], relative_time[7], relative_time[6], relative_time[5], 
relative_time[4], relative_time[3], relative_time[2], relative_time[1], relative_time[0]}),
    .adress({recv_addr_dev[9], recv_addr_dev[8], recv_addr_dev[7], recv_addr_dev[6], recv_addr_dev[5], recv_addr_dev[4], recv_addr_dev[3], 
recv_addr_dev[2], recv_addr_dev[1], recv_addr_dev[0]}),
    .data({recv_data_dev[7], recv_data_dev[6], recv_data_dev[5], recv_data_dev[4], recv_data_dev[3], recv_data_dev[2], recv_data_dev[1], 
recv_data_dev[0]})
  );
  rmii_send_mem_INST_1   transmitter (
    .clk(clk),
    .start(trans_start_dev_3900),
    .rst(rst),
    .not_det(N1),
    .rm_tx_en(NlwRenamedSig_OI_rm_tx_en),
    .done(trans_done_dev),
    .fast_eth(N1),
    .rmii_clk(rmii_clk),
    .rdy(trans_rdy),
    .addr({trans_addr_dev[9], trans_addr_dev[8], trans_addr_dev[7], trans_addr_dev[6], trans_addr_dev[5], trans_addr_dev[4], trans_addr_dev[3], 
trans_addr_dev[2], trans_addr_dev[1], trans_addr_dev[0]}),
    .rm_tx_data({NlwRenamedSig_OI_rm_tx_data[1], NlwRenamedSig_OI_rm_tx_data[0]}),
    .rdata({trans_data_dev[7], trans_data_dev[6], trans_data_dev[5], trans_data_dev[4], trans_data_dev[3], trans_data_dev[2], trans_data_dev[1], 
trans_data_dev[0]}),
    .count({trans_count_dev[9], trans_count_dev[8], trans_count_dev[7], trans_count_dev[6], trans_count_dev[5], trans_count_dev[4], trans_count_dev[3]
, trans_count_dev[2], trans_count_dev[1], trans_count_dev[0]})
  );
  rmii_recv_mem_INST_1   reciever (
    .clk(clk),
    .rst(rst),
    .we(recv_we_dev),
    .fast_eth(N1),
    .rmii_clk(rmii_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(recv_rdy_dev),
    .addr({recv_addr_dev[9], recv_addr_dev[8], recv_addr_dev[7], recv_addr_dev[6], recv_addr_dev[5], recv_addr_dev[4], recv_addr_dev[3], 
recv_addr_dev[2], recv_addr_dev[1], recv_addr_dev[0]}),
    .count({recv_count_dev[9], recv_count_dev[8], recv_count_dev[7], recv_count_dev[6], recv_count_dev[5], recv_count_dev[4], recv_count_dev[3], 
recv_count_dev[2], recv_count_dev[1], recv_count_dev[0]}),
    .wdata({recv_data_dev[7], recv_data_dev[6], recv_data_dev[5], recv_data_dev[4], recv_data_dev[3], recv_data_dev[2], recv_data_dev[1], 
recv_data_dev[0]}),
    .offset({NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, N1, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig}),
    .rm_rx_data({rm_rx_data[1], rm_rx_data[0]})
  );
  powerlink_rhub_pdo_recv   Label1 (
    .clk(clk),
    .rst(rst),
    .pdo_st(preq),
    .rm_clk(rmii_clk),
    .rm_crs_dv(rm_crs_dv),
    .rm_rx({rm_rx_data[1], rm_rx_data[0]}),
    .node({NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig})
  );
  soc_pdo_recv   soc_detect_out (
    .head_o(NLW_soc_detect_out_head_o_UNCONNECTED),
    .clk(clk),
    .soc(soc_out),
    .rst(rst),
    .rm_clk(rmii_clk),
    .rm_crs_dv(NlwRenamedSig_OI_rm_tx_en),
    .rm_rx({NlwRenamedSig_OI_rm_tx_data[1], NlwRenamedSig_OI_rm_tx_data[0]})
  );
  soc_pdo_recv_INST_1   soc_detect_in (
    .head_o(head_done),
    .clk(clk),
    .soc(soc),
    .rst(rst),
    .rm_clk(rmii_clk),
    .rm_crs_dv(rm_crs_dv),
    .rm_rx({rm_rx_data[1], rm_rx_data[0]})
  );
  jitter_timer_jitter_timer   jitter_timer (
    .clk(clk),
    .rled(rled),
    .soc(soc),
    .time_out_end(time_out_end),
    .time_to_soc(NlwRenamedSig_OI_tt_soc),
    .time_valid(relative_time_valid),
    .rst(rst),
    .preq(preq),
    .send_done(trans_done_dev),
    .relative_time({relative_time[63], relative_time[62], relative_time[61], relative_time[60], relative_time[59], relative_time[58], 
relative_time[57], relative_time[56], relative_time[55], relative_time[54], relative_time[53], relative_time[52], relative_time[51], relative_time[50]
, relative_time[49], relative_time[48], relative_time[47], relative_time[46], relative_time[45], relative_time[44], relative_time[43], 
relative_time[42], relative_time[41], relative_time[40], relative_time[39], relative_time[38], relative_time[37], relative_time[36], relative_time[35]
, relative_time[34], relative_time[33], relative_time[32], relative_time[31], relative_time[30], relative_time[29], relative_time[28], 
relative_time[27], relative_time[26], relative_time[25], relative_time[24], relative_time[23], relative_time[22], relative_time[21], relative_time[20]
, relative_time[19], relative_time[18], relative_time[17], relative_time[16], relative_time[15], relative_time[14], relative_time[13], 
relative_time[12], relative_time[11], relative_time[10], relative_time[9], relative_time[8], relative_time[7], relative_time[6], relative_time[5], 
relative_time[4], relative_time[3], relative_time[2], relative_time[1], relative_time[0]}),
    .max_jitter({NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig, N1, NlwRenamedSig_OI_soc_is_runnig, N1, 
NlwRenamedSig_OI_soc_is_runnig, NlwRenamedSig_OI_soc_is_runnig})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<7>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[7]),
    .O(recv_data[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<6>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[6]),
    .O(recv_data[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<5>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[5]),
    .O(recv_data[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<4>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[4]),
    .O(recv_data[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<3>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[3]),
    .O(recv_data[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<2>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[2]),
    .O(recv_data[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<1>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[1]),
    .O(recv_data[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_data<0>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_data_dev[0]),
    .O(recv_data[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<7>1  (
    .I0(recv_data_dev[7]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<6>1  (
    .I0(recv_data_dev[6]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<5>1  (
    .I0(recv_data_dev[5]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<4>1  (
    .I0(recv_data_dev[4]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<3>1  (
    .I0(recv_data_dev[3]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<2>1  (
    .I0(recv_data_dev[2]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<1>1  (
    .I0(recv_data_dev[1]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_data2<0>1  (
    .I0(recv_data_dev[0]),
    .I1(comutate_in_1_3620),
    .O(recv_data2[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<9>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[9]),
    .O(trans_addr[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<8>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[8]),
    .O(trans_addr[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<7>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[7]),
    .O(trans_addr[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<6>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[6]),
    .O(trans_addr[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<5>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[5]),
    .O(trans_addr[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<4>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[4]),
    .O(trans_addr[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<3>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[3]),
    .O(trans_addr[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<2>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[2]),
    .O(trans_addr[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<1>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[1]),
    .O(trans_addr[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_addr<0>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_addr_dev[0]),
    .O(trans_addr[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<9>1  (
    .I0(trans_addr_dev[9]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[9])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<8>1  (
    .I0(trans_addr_dev[8]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[8])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<7>1  (
    .I0(trans_addr_dev[7]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<6>1  (
    .I0(trans_addr_dev[6]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<5>1  (
    .I0(trans_addr_dev[5]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<4>1  (
    .I0(trans_addr_dev[4]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<3>1  (
    .I0(trans_addr_dev[3]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<2>1  (
    .I0(trans_addr_dev[2]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<1>1  (
    .I0(trans_addr_dev[1]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \trans_addr2<0>1  (
    .I0(trans_addr_dev[0]),
    .I1(comutate_out_1_3622),
    .O(trans_addr2[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<9>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[9]),
    .O(recv_addr[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<8>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[8]),
    .O(recv_addr[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<7>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[7]),
    .O(recv_addr[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<6>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[6]),
    .O(recv_addr[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<5>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[5]),
    .O(recv_addr[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<4>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[4]),
    .O(recv_addr[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<3>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[3]),
    .O(recv_addr[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<2>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[2]),
    .O(recv_addr[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<1>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[1]),
    .O(recv_addr[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \recv_addr<0>1  (
    .I0(comutate_in_1_3620),
    .I1(recv_addr_dev[0]),
    .O(recv_addr[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<9>1  (
    .I0(recv_addr_dev[9]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[9])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<8>1  (
    .I0(recv_addr_dev[8]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[8])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<7>1  (
    .I0(recv_addr_dev[7]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<6>1  (
    .I0(recv_addr_dev[6]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<5>1  (
    .I0(recv_addr_dev[5]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<4>1  (
    .I0(recv_addr_dev[4]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<3>1  (
    .I0(recv_addr_dev[3]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<2>1  (
    .I0(recv_addr_dev[2]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<1>1  (
    .I0(recv_addr_dev[1]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \recv_addr2<0>1  (
    .I0(recv_addr_dev[0]),
    .I1(comutate_in_1_3620),
    .O(recv_addr2[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_buf_2_not00011 (
    .I0(recv_rdy_dev),
    .I1(comutate_in_1_3620),
    .O(count_buf_2_not0001)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  count_buf_1_not00011 (
    .I0(comutate_in_1_3620),
    .I1(recv_rdy_dev),
    .O(count_buf_1_not0001)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  recv_we21 (
    .I0(recv_we_dev),
    .I1(comutate_in_1_3620),
    .O(recv_we2)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  recv_we1 (
    .I0(comutate_in_1_3620),
    .I1(recv_we_dev),
    .O(recv_we)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  buffer_is_full_1_mux00001 (
    .I0(trans_done_dev),
    .I1(comutate_out_1_3622),
    .O(buffer_is_full_1_mux0000)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  buffer_is_full_0_mux00001 (
    .I0(trans_done_dev),
    .I1(comutate_out_1_3622),
    .O(buffer_is_full_0_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h80FF ))
  soc_in_buffer_1_not00011 (
    .I0(comutate_in_1_3620),
    .I1(soc),
    .I2(head_done),
    .I3(buffer_is_full_1_mux0000),
    .O(soc_in_buffer_1_not0001)
  );
  LUT4 #(
    .INIT ( 16'h08FF ))
  soc_in_buffer_0_not00011 (
    .I0(head_done),
    .I1(soc),
    .I2(comutate_in_1_3620),
    .I3(buffer_is_full_0_mux0000),
    .O(soc_in_buffer_0_not0001)
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \trans_count_dev_mux0000<8>  (
    .I0(trans_start_dev_mux0000),
    .I1(N14),
    .I2(trans_count_dev[1]),
    .I3(N3),
    .O(trans_count_dev_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \trans_count_dev_mux0000<7>  (
    .I0(trans_start_dev_mux0000),
    .I1(N14),
    .I2(trans_count_dev[2]),
    .I3(N5),
    .O(trans_count_dev_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \trans_count_dev_mux0000<6>  (
    .I0(trans_start_dev_mux0000),
    .I1(N14),
    .I2(trans_count_dev[3]),
    .I3(N7),
    .O(trans_count_dev_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'h60 ))
  \trans_count_dev_mux0000<5>17  (
    .I0(count_buf_2[3]),
    .I1(count_buf_2[4]),
    .I2(N33),
    .O(\trans_count_dev_mux0000<5>17_3867 )
  );
  LUT3 #(
    .INIT ( 8'h60 ))
  \trans_count_dev_mux0000<5>42  (
    .I0(count_buf_1[3]),
    .I1(count_buf_1[4]),
    .I2(N34),
    .O(\trans_count_dev_mux0000<5>42_3868 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \trans_count_dev_mux0000<5>58  (
    .I0(trans_start_dev_mux0000),
    .I1(\trans_count_dev_mux0000<5>45_3869 ),
    .O(trans_count_dev_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \trans_count_dev_mux0000<2>21  (
    .I0(count_buf_1[5]),
    .I1(count_buf_1[6]),
    .I2(count_buf_1[4]),
    .I3(count_buf_1[3]),
    .O(N9)
  );
  LUT4 #(
    .INIT ( 16'hFF8C ))
  \retr_state_FSM_FFd1-In1  (
    .I0(rmii_clk),
    .I1(retr_state_FSM_FFd1_3781),
    .I2(trans_rdy),
    .I3(trans_start_dev_mux0000),
    .O(\retr_state_FSM_FFd1-In )
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \trans_count_dev_mux0000<4>40  (
    .I0(count_buf_2[3]),
    .I1(count_buf_2[5]),
    .I2(count_buf_2[4]),
    .O(\trans_count_dev_mux0000<4>40_3864 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \trans_count_dev_mux0000<4>60  (
    .I0(trans_start_dev_mux0000),
    .I1(\trans_count_dev_mux0000<4>13_3863 ),
    .I2(\trans_count_dev_mux0000<4>51_3865 ),
    .O(trans_count_dev_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hAE04 ))
  \trans_count_dev_mux0000<2>39  (
    .I0(count_buf_2[7]),
    .I1(count_buf_2[6]),
    .I2(N36),
    .I3(N4),
    .O(\trans_count_dev_mux0000<2>39_3859 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<7>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[7]),
    .I2(trans_data[7]),
    .O(trans_data_dev[7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<6>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[6]),
    .I2(trans_data[6]),
    .O(trans_data_dev[6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<5>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[5]),
    .I2(trans_data[5]),
    .O(trans_data_dev[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<4>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[4]),
    .I2(trans_data[4]),
    .O(trans_data_dev[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<3>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[3]),
    .I2(trans_data[3]),
    .O(trans_data_dev[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<2>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[2]),
    .I2(trans_data[2]),
    .O(trans_data_dev[2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<1>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[1]),
    .I2(trans_data[1]),
    .O(trans_data_dev[1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \trans_data_dev<0>1  (
    .I0(comutate_out_1_3622),
    .I1(trans_data2[0]),
    .I2(trans_data[0]),
    .O(trans_data_dev[0])
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \trans_count_dev_mux0000<2>16  (
    .I0(count_buf_2[3]),
    .I1(count_buf_2[4]),
    .I2(count_buf_2[5]),
    .I3(count_buf_2[6]),
    .O(N4)
  );
  LUT4 #(
    .INIT ( 16'hA200 ))
  trans_start_dev_mux00007 (
    .I0(buffer_not_empty[1]),
    .I1(soc_in_buffer[1]),
    .I2(NlwRenamedSig_OI_tt_soc),
    .I3(comutate_out_1_3622),
    .O(trans_start_dev_mux00007_3904)
  );
  LUT4 #(
    .INIT ( 16'h00A2 ))
  trans_start_dev_mux000018 (
    .I0(buffer_not_empty[0]),
    .I1(soc_in_buffer[0]),
    .I2(NlwRenamedSig_OI_tt_soc),
    .I3(comutate_out_1_3622),
    .O(trans_start_dev_mux000018_3902)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  trans_start_dev_mux000032 (
    .I0(retr_state_FSM_FFd1_3781),
    .I1(rmii_clk),
    .O(trans_start_dev_mux000032_3903)
  );
  LUT4 #(
    .INIT ( 16'hC800 ))
  trans_start_dev_mux000048 (
    .I0(trans_start_dev_mux000018_3902),
    .I1(trans_start_dev_mux000032_3903),
    .I2(trans_start_dev_mux00007_3904),
    .I3(time_out_end),
    .O(trans_start_dev_mux0000)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \trans_count_dev_mux0000<1>0  (
    .I0(N35),
    .I1(trans_count_dev[8]),
    .O(\trans_count_dev_mux0000<1>0_3851 )
  );
  LUT4 #(
    .INIT ( 16'hCC4C ))
  \trans_count_dev_mux0000<0>13  (
    .I0(count_buf_2[7]),
    .I1(count_buf_2[9]),
    .I2(count_buf_2[8]),
    .I3(N4),
    .O(\trans_count_dev_mux0000<0>13_3845 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \trans_count_dev_mux0000<1>75  (
    .I0(\trans_count_dev_mux0000<1>0_3851 ),
    .I1(trans_start_dev_mux0000),
    .I2(\trans_count_dev_mux0000<1>32_3852 ),
    .I3(\trans_count_dev_mux0000<1>72_3855 ),
    .O(trans_count_dev_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hFFF8 ))
  \trans_count_dev_mux0000<0>100_SW0  (
    .I0(trans_count_dev[9]),
    .I1(N14),
    .I2(trans_start_dev_mux0000),
    .I3(\trans_count_dev_mux0000<0>92_3847 ),
    .O(N91)
  );
  LUT4 #(
    .INIT ( 16'hFFA8 ))
  \trans_count_dev_mux0000<0>100  (
    .I0(N13),
    .I1(\trans_count_dev_mux0000<0>13_3845 ),
    .I2(\trans_count_dev_mux0000<0>26_3846 ),
    .I3(N91),
    .O(trans_count_dev_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \trans_count_dev_mux0000<2>64_SW0  (
    .I0(trans_count_dev[7]),
    .I1(N14),
    .I2(trans_start_dev_mux0000),
    .O(N11)
  );
  LUT4 #(
    .INIT ( 16'hFF82 ))
  \trans_count_dev_mux0000<3>54  (
    .I0(N13),
    .I1(N18),
    .I2(count_buf_2[6]),
    .I3(N131),
    .O(trans_count_dev_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  buffer_not_empty_1_not00011 (
    .I0(comutate_in_1_3620),
    .I1(head_done),
    .I2(trans_done_dev),
    .I3(comutate_out_1_3622),
    .O(buffer_not_empty_1_not0001)
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  buffer_not_empty_0_not00011 (
    .I0(trans_done_dev),
    .I1(comutate_out_1_3622),
    .I2(head_done),
    .I3(comutate_in_1_3620),
    .O(buffer_not_empty_0_not0001)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  buffer_is_full_1_not00011 (
    .I0(comutate_in_1_3620),
    .I1(recv_rdy_dev),
    .I2(trans_done_dev),
    .I3(comutate_out_1_3622),
    .O(buffer_is_full_1_not0001)
  );
  LUT4 #(
    .INIT ( 16'h22F2 ))
  buffer_is_full_0_not00011 (
    .I0(trans_done_dev),
    .I1(comutate_out_1_3622),
    .I2(recv_rdy_dev),
    .I3(comutate_in_1_3620),
    .O(buffer_is_full_0_not0001)
  );
  LUT4 #(
    .INIT ( 16'hF7FF ))
  \trans_count_dev_mux0000<0>26_SW0  (
    .I0(count_buf_2[6]),
    .I1(count_buf_2[7]),
    .I2(count_buf_2[9]),
    .I3(count_buf_2[8]),
    .O(N151)
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \trans_count_dev_mux0000<0>26  (
    .I0(count_buf_2[3]),
    .I1(count_buf_2[4]),
    .I2(count_buf_2[5]),
    .I3(N151),
    .O(\trans_count_dev_mux0000<0>26_3846 )
  );
  LUT4 #(
    .INIT ( 16'hAE04 ))
  \trans_count_dev_mux0000<2>20_SW0  (
    .I0(count_buf_1[7]),
    .I1(count_buf_1[6]),
    .I2(N37),
    .I3(N9),
    .O(N17)
  );
  LUT4 #(
    .INIT ( 16'h2888 ))
  \trans_count_dev_mux0000<4>13  (
    .I0(N12),
    .I1(count_buf_1[5]),
    .I2(count_buf_1[3]),
    .I3(count_buf_1[4]),
    .O(\trans_count_dev_mux0000<4>13_3863 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \trans_count_dev_mux0000<1>72  (
    .I0(buffer_is_full[1]),
    .I1(comutate_out_1_3622),
    .I2(retr_state_FSM_FFd1_3781),
    .I3(N21),
    .O(\trans_count_dev_mux0000<1>72_3855 )
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \trans_count_dev_mux0000<3>20  (
    .I0(buffer_is_full[1]),
    .I1(comutate_out_1_3622),
    .I2(retr_state_FSM_FFd1_3781),
    .I3(N25),
    .O(\trans_count_dev_mux0000<3>20_3861 )
  );
  MUXF5   \trans_count_dev_mux0000<9>  (
    .I0(N29),
    .I1(N30),
    .S(comutate_out_1_3622),
    .O(trans_count_dev_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \trans_count_dev_mux0000<9>_F  (
    .I0(retr_state_FSM_FFd1_3781),
    .I1(buffer_is_full[0]),
    .I2(trans_count_dev[0]),
    .I3(count_buf_2[0]),
    .O(N29)
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \trans_count_dev_mux0000<9>_G  (
    .I0(retr_state_FSM_FFd1_3781),
    .I1(buffer_is_full[1]),
    .I2(trans_count_dev[0]),
    .I3(count_buf_1[0]),
    .O(N30)
  );
  MUXF5   \trans_count_dev_mux0000<2>64  (
    .I0(N31),
    .I1(N32),
    .S(comutate_out_1_3622),
    .O(trans_count_dev_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \trans_count_dev_mux0000<2>64_F  (
    .I0(buffer_is_full[0]),
    .I1(retr_state_FSM_FFd1_3781),
    .I2(\trans_count_dev_mux0000<2>39_3859 ),
    .I3(N11),
    .O(N31)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \trans_count_dev_mux0000<2>64_G  (
    .I0(buffer_is_full[1]),
    .I1(retr_state_FSM_FFd1_3781),
    .I2(N17),
    .I3(N11),
    .O(N32)
  );
  INV   soc_out_edge_not00011_INV_0 (
    .I(NlwRenamedSig_OI_soc_out_edge),
    .O(soc_out_edge_not0001)
  );
  INV   soc_edge_not00011_INV_0 (
    .I(NlwRenamedSig_OI_soc_edge),
    .O(soc_edge_not0001)
  );
  INV   comutate_out_1_not00011_INV_0 (
    .I(comutate_out_1_3622),
    .O(comutate_out_1_not0001)
  );
  INV   comutate_in_1_not00011_INV_0 (
    .I(comutate_in_1_3620),
    .O(comutate_in_1_not0001)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  \trans_count_dev_mux0000<1>32_SW01  (
    .I0(count_buf_2[7]),
    .I1(count_buf_2[6]),
    .I2(N18),
    .I3(count_buf_2[8]),
    .O(\trans_count_dev_mux0000<1>32_SW0 )
  );
  LUT4 #(
    .INIT ( 16'h4464 ))
  \trans_count_dev_mux0000<1>32_SW02  (
    .I0(count_buf_2[7]),
    .I1(count_buf_2[8]),
    .I2(count_buf_2[6]),
    .I3(N18),
    .O(\trans_count_dev_mux0000<1>32_SW01_3854 )
  );
  MUXF5   \trans_count_dev_mux0000<1>32_SW0_f5  (
    .I0(\trans_count_dev_mux0000<1>32_SW01_3854 ),
    .I1(\trans_count_dev_mux0000<1>32_SW0 ),
    .S(N4),
    .O(N19)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  \trans_count_dev_mux0000<1>72_SW01  (
    .I0(count_buf_1[7]),
    .I1(count_buf_1[6]),
    .I2(N15),
    .I3(count_buf_1[8]),
    .O(\trans_count_dev_mux0000<1>72_SW0 )
  );
  LUT4 #(
    .INIT ( 16'h4464 ))
  \trans_count_dev_mux0000<1>72_SW02  (
    .I0(count_buf_1[7]),
    .I1(count_buf_1[8]),
    .I2(count_buf_1[6]),
    .I3(N15),
    .O(\trans_count_dev_mux0000<1>72_SW01_3857 )
  );
  MUXF5   \trans_count_dev_mux0000<1>72_SW0_f5  (
    .I0(\trans_count_dev_mux0000<1>72_SW01_3857 ),
    .I1(\trans_count_dev_mux0000<1>72_SW0 ),
    .S(N9),
    .O(N21)
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  \trans_count_dev_mux0000<0>92_SW01  (
    .I0(N9),
    .I1(count_buf_1[7]),
    .I2(count_buf_1[8]),
    .O(\trans_count_dev_mux0000<0>92_SW0 )
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  \trans_count_dev_mux0000<0>92_SW02  (
    .I0(count_buf_1[8]),
    .I1(count_buf_1[7]),
    .I2(count_buf_1[6]),
    .I3(N15),
    .O(\trans_count_dev_mux0000<0>92_SW01_3849 )
  );
  MUXF5   \trans_count_dev_mux0000<0>92_SW0_f5  (
    .I0(\trans_count_dev_mux0000<0>92_SW01_3849 ),
    .I1(\trans_count_dev_mux0000<0>92_SW0 ),
    .S(count_buf_1[9]),
    .O(N23)
  );
  LUT3_D #(
    .INIT ( 8'h08 ))
  \trans_count_dev_mux0000<0>61  (
    .I0(buffer_is_full[0]),
    .I1(retr_state_FSM_FFd1_3781),
    .I2(comutate_out_1_3622),
    .LO(N33),
    .O(N13)
  );
  LUT3_D #(
    .INIT ( 8'h80 ))
  \trans_count_dev_mux0000<0>51  (
    .I0(buffer_is_full[1]),
    .I1(retr_state_FSM_FFd1_3781),
    .I2(comutate_out_1_3622),
    .LO(N34),
    .O(N12)
  );
  LUT4_D #(
    .INIT ( 16'h028A ))
  \trans_count_dev_mux0000<0>71  (
    .I0(retr_state_FSM_FFd1_3781),
    .I1(comutate_out_1_3622),
    .I2(buffer_is_full[0]),
    .I3(buffer_is_full[1]),
    .LO(N35),
    .O(N14)
  );
  LUT4_L #(
    .INIT ( 16'hF888 ))
  \trans_count_dev_mux0000<8>_SW0  (
    .I0(N13),
    .I1(count_buf_2[1]),
    .I2(N12),
    .I3(count_buf_1[1]),
    .LO(N3)
  );
  LUT4_L #(
    .INIT ( 16'hF888 ))
  \trans_count_dev_mux0000<7>_SW0  (
    .I0(N13),
    .I1(count_buf_2[2]),
    .I2(N12),
    .I3(count_buf_1[2]),
    .LO(N5)
  );
  LUT4_L #(
    .INIT ( 16'h22F2 ))
  \trans_count_dev_mux0000<6>_SW0  (
    .I0(N12),
    .I1(count_buf_1[3]),
    .I2(N13),
    .I3(count_buf_2[3]),
    .LO(N7)
  );
  LUT4_L #(
    .INIT ( 16'hFFF8 ))
  \trans_count_dev_mux0000<5>45  (
    .I0(trans_count_dev[4]),
    .I1(N14),
    .I2(\trans_count_dev_mux0000<5>42_3868 ),
    .I3(\trans_count_dev_mux0000<5>17_3867 ),
    .LO(\trans_count_dev_mux0000<5>45_3869 )
  );
  LUT3_D #(
    .INIT ( 8'h7F ))
  \trans_count_dev_mux0000<3>111  (
    .I0(count_buf_2[5]),
    .I1(count_buf_2[4]),
    .I2(count_buf_2[3]),
    .LO(N36),
    .O(N18)
  );
  LUT4_L #(
    .INIT ( 16'hF888 ))
  \trans_count_dev_mux0000<4>51  (
    .I0(trans_count_dev[5]),
    .I1(N14),
    .I2(N13),
    .I3(\trans_count_dev_mux0000<4>40_3864 ),
    .LO(\trans_count_dev_mux0000<4>51_3865 )
  );
  LUT3_D #(
    .INIT ( 8'h7F ))
  \trans_count_dev_mux0000<0>81  (
    .I0(count_buf_1[5]),
    .I1(count_buf_1[4]),
    .I2(count_buf_1[3]),
    .LO(N37),
    .O(N15)
  );
  LUT4_L #(
    .INIT ( 16'hFFEA ))
  \trans_count_dev_mux0000<3>54_SW0  (
    .I0(\trans_count_dev_mux0000<3>20_3861 ),
    .I1(N14),
    .I2(trans_count_dev[6]),
    .I3(trans_start_dev_mux0000),
    .LO(N131)
  );
  LUT4_L #(
    .INIT ( 16'h0800 ))
  \trans_count_dev_mux0000<1>32  (
    .I0(buffer_is_full[0]),
    .I1(retr_state_FSM_FFd1_3781),
    .I2(comutate_out_1_3622),
    .I3(N19),
    .LO(\trans_count_dev_mux0000<1>32_3852 )
  );
  LUT4_L #(
    .INIT ( 16'h8000 ))
  \trans_count_dev_mux0000<0>92  (
    .I0(buffer_is_full[1]),
    .I1(comutate_out_1_3622),
    .I2(retr_state_FSM_FFd1_3781),
    .I3(N23),
    .LO(\trans_count_dev_mux0000<0>92_3847 )
  );
  LUT4_L #(
    .INIT ( 16'h9555 ))
  \trans_count_dev_mux0000<3>20_SW0  (
    .I0(count_buf_1[6]),
    .I1(count_buf_1[4]),
    .I2(count_buf_1[5]),
    .I3(count_buf_1[3]),
    .LO(N25)
  );
endmodule

module rmii_recv_byte_rmii_recv_byte (
  clk, rst, busy, fast_eth, rmii_clk, rm_crs_dv, rdy, data, rm_rx_data
);
  input clk;
  input rst;
  output busy;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [7 : 0] data;
  input [1 : 0] rm_rx_data;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_294 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_296 ;
  wire N10;
  wire N111;
  wire N12;
  wire N121;
  wire N20;
  wire N22;
  wire N23;
  wire N24;
  wire N25;
  wire N26;
  wire NlwRenamedSig_OI_busy;
  wire busy_mux0000;
  wire busy_not0001_309;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001;
  wire rx_data_cmp_eq0000;
  wire rx_data_cmp_eq000018_336;
  wire rx_data_cmp_eq00007_337;
  wire \rx_data_mux0000<0>1_339 ;
  wire \rx_data_mux0000<0>2_340 ;
  wire \rx_data_mux0000<2>1_343 ;
  wire \rx_data_mux0000<2>2_344 ;
  wire rx_data_not0002;
  wire s_rm_crs_dv_351;
  wire s_rmii_clk_354;
  wire wait_cnt_not0003;
  wire [7 : 0] rx_data;
  wire [7 : 0] rx_data_mux0000;
  wire [1 : 0] s_rm_rx_data;
  wire [4 : 0] wait_cnt;
  assign
    busy = NlwRenamedSig_OI_busy,
    rdy = NlwRenamedSig_OI_rdy;
  FDC   s_rm_crs_dv (
    .C(clk),
    .CLR(rst),
    .D(rm_crs_dv),
    .Q(s_rm_crs_dv_351)
  );
  FDC   s_rmii_clk (
    .C(clk),
    .CLR(rst),
    .D(rmii_clk),
    .Q(s_rmii_clk_354)
  );
  FDC   s_rm_rx_data_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[0]),
    .Q(s_rm_rx_data[0])
  );
  FDC   s_rm_rx_data_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_rx_data[1]),
    .Q(s_rm_rx_data[1])
  );
  FDCE   rx_data_0 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[0]),
    .Q(rx_data[0])
  );
  FDCE   rx_data_1 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[1]),
    .Q(rx_data[1])
  );
  FDCE   rx_data_2 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[2]),
    .Q(rx_data[2])
  );
  FDCE   rx_data_3 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[3]),
    .Q(rx_data[3])
  );
  FDCE   rx_data_4 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[4]),
    .Q(rx_data[4])
  );
  FDCE   rx_data_5 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[5]),
    .Q(rx_data[5])
  );
  FDCE   rx_data_6 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[6]),
    .Q(rx_data[6])
  );
  FDCE   rx_data_7 (
    .C(clk),
    .CE(rx_data_not0002),
    .CLR(rst),
    .D(rx_data_mux0000[7]),
    .Q(rx_data[7])
  );
  FDCE   rdy_309 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(rdy_mux0000),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   busy_310 (
    .C(clk),
    .CE(busy_not0001_309),
    .CLR(rst),
    .D(busy_mux0000),
    .Q(NlwRenamedSig_OI_busy)
  );
  FDCE   data_0 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[2]),
    .Q(data[0])
  );
  FDCE   data_1 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[3]),
    .Q(data[1])
  );
  FDCE   data_2 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[4]),
    .Q(data[2])
  );
  FDCE   data_3 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[5]),
    .Q(data[3])
  );
  FDCE   data_4 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[6]),
    .Q(data[4])
  );
  FDCE   data_5 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(rx_data[7]),
    .Q(data[5])
  );
  FDCE   data_6 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[0]),
    .Q(data[6])
  );
  FDCE   data_7 (
    .C(clk),
    .CE(rdy_mux0000),
    .CLR(rst),
    .D(s_rm_rx_data[1]),
    .Q(data[7])
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<1>11  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .O(Mcount_wait_cnt1)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  wait_cnt_not00031 (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(wait_cnt_not0003)
  );
  LUT4 #(
    .INIT ( 16'h1404 ))
  busy_not0001 (
    .I0(N24),
    .I1(NlwRenamedSig_OI_busy),
    .I2(s_rm_crs_dv_351),
    .I3(N121),
    .O(busy_not0001_309)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  rx_data_cmp_eq000019 (
    .I0(N22),
    .I1(rx_data_cmp_eq000018_336),
    .O(rx_data_cmp_eq0000)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \rx_data_mux0000<0>111  (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .O(N12)
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[7]),
    .I2(s_rm_crs_dv_351),
    .I3(N12),
    .O(rx_data_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[6]),
    .I2(s_rm_crs_dv_351),
    .I3(N12),
    .O(rx_data_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[5]),
    .I2(s_rm_crs_dv_351),
    .I3(N12),
    .O(rx_data_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hC040 ))
  \rx_data_mux0000<1>2  (
    .I0(NlwRenamedSig_OI_busy),
    .I1(rx_data[3]),
    .I2(s_rm_crs_dv_351),
    .I3(N12),
    .O(rx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<7>1  (
    .I0(s_rm_crs_dv_351),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[1]),
    .O(rx_data_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hAA08 ))
  \rx_data_mux0000<6>1  (
    .I0(s_rm_crs_dv_351),
    .I1(NlwRenamedSig_OI_busy),
    .I2(N12),
    .I3(s_rm_rx_data[0]),
    .O(rx_data_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h0203 ))
  rx_data_not00021 (
    .I0(s_rmii_clk_354),
    .I1(N25),
    .I2(wait_cnt[4]),
    .I3(s_rm_crs_dv_351),
    .O(rx_data_not0002)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  busy_not0001_SW0 (
    .I0(rx_data_cmp_eq00007_337),
    .I1(N23),
    .I2(s_rmii_clk_354),
    .O(N121)
  );
  LUT4 #(
    .INIT ( 16'hFF08 ))
  rdy_not00011 (
    .I0(N20),
    .I1(s_rmii_clk_354),
    .I2(N10),
    .I3(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcount_wait_cnt_xor<4>12  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .O(Mcount_wait_cnt4)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_mux00001 (
    .I0(s_rmii_clk_354),
    .I1(N111),
    .I2(N26),
    .I3(wait_cnt[4]),
    .O(rdy_mux0000)
  );
  INV   busy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_busy),
    .O(busy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_294 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_294 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<2>1  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_351),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<2>1_343 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<2>2  (
    .I0(rx_data[4]),
    .I1(s_rm_crs_dv_351),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<2>2_344 )
  );
  MUXF5   \rx_data_mux0000<2>_f5  (
    .I0(\rx_data_mux0000<2>2_344 ),
    .I1(\rx_data_mux0000<2>1_343 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[2])
  );
  LUT4 #(
    .INIT ( 16'h0888 ))
  \rx_data_mux0000<0>1  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_351),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .O(\rx_data_mux0000<0>1_339 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \rx_data_mux0000<0>2  (
    .I0(rx_data[2]),
    .I1(s_rm_crs_dv_351),
    .I2(rx_data_cmp_eq0000),
    .O(\rx_data_mux0000<0>2_340 )
  );
  MUXF5   \rx_data_mux0000<0>_f5  (
    .I0(\rx_data_mux0000<0>2_340 ),
    .I1(\rx_data_mux0000<0>1_339 ),
    .S(NlwRenamedSig_OI_busy),
    .O(rx_data_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_296 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_296 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT4_D #(
    .INIT ( 16'h0080 ))
  rx_data_cmp_eq00007 (
    .I0(rx_data[6]),
    .I1(rx_data[7]),
    .I2(rx_data[4]),
    .I3(rx_data[5]),
    .LO(N22),
    .O(rx_data_cmp_eq00007_337)
  );
  LUT4_D #(
    .INIT ( 16'h0020 ))
  rx_data_cmp_eq000018 (
    .I0(rx_data[0]),
    .I1(rx_data[1]),
    .I2(rx_data[2]),
    .I3(rx_data[3]),
    .LO(N23),
    .O(rx_data_cmp_eq000018_336)
  );
  LUT2_D #(
    .INIT ( 4'hE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(N111),
    .I1(wait_cnt[4]),
    .LO(N24),
    .O(N10)
  );
  LUT4_D #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<3>111  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(wait_cnt[0]),
    .LO(N25),
    .O(N111)
  );
  LUT4_D #(
    .INIT ( 16'h8000 ))
  rdy_mux000011 (
    .I0(s_rm_crs_dv_351),
    .I1(NlwRenamedSig_OI_busy),
    .I2(rx_data[0]),
    .I3(rx_data[1]),
    .LO(N26),
    .O(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module rmii_recv_mem (
  clk, rst, we, fast_eth, rmii_clk, rm_crs_dv, rdy, addr, count, wdata, offset, rm_rx_data
);
  input clk;
  input rst;
  output we;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output rdy;
  output [9 : 0] addr;
  output [9 : 0] count;
  output [7 : 0] wdata;
  input [9 : 0] offset;
  input [1 : 0] rm_rx_data;
  wire Mcount_addr;
  wire Mcount_addr1;
  wire Mcount_addr2;
  wire Mcount_addr3;
  wire Mcount_addr4;
  wire Mcount_addr5;
  wire Mcount_addr6;
  wire Mcount_addr7;
  wire Mcount_addr8;
  wire Mcount_addr9;
  wire Mcount_recv_cnt;
  wire Mcount_recv_cnt1;
  wire Mcount_recv_cnt2;
  wire Mcount_recv_cnt3;
  wire Mcount_recv_cnt4;
  wire Mcount_recv_cnt5;
  wire Mcount_recv_cnt6;
  wire Mcount_recv_cnt7;
  wire Mcount_recv_cnt8;
  wire Mcount_recv_cnt9;
  wire addr_not0001;
  wire brdy;
  wire busy;
  wire count_not0001;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_not0001;
  wire s_busy_471;
  wire we_mux0000;
  wire [8 : 0] Mcount_addr_cy;
  wire [9 : 0] Mcount_addr_lut;
  wire [8 : 0] Mcount_recv_cnt_cy;
  wire [9 : 0] Mcount_recv_cnt_lut;
  wire [0 : 0] Msub_addr_sub0000_cy;
  wire [9 : 0] NlwRenamedSig_OI_addr;
  wire [7 : 0] data;
  wire [9 : 0] recv_cnt;
  wire [7 : 0] wdata_mux0000;
  assign
    rdy = NlwRenamedSig_OI_rdy,
    addr[9] = NlwRenamedSig_OI_addr[9],
    addr[8] = NlwRenamedSig_OI_addr[8],
    addr[7] = NlwRenamedSig_OI_addr[7],
    addr[6] = NlwRenamedSig_OI_addr[6],
    addr[5] = NlwRenamedSig_OI_addr[5],
    addr[4] = NlwRenamedSig_OI_addr[4],
    addr[3] = NlwRenamedSig_OI_addr[3],
    addr[2] = NlwRenamedSig_OI_addr[2],
    addr[1] = NlwRenamedSig_OI_addr[1],
    addr[0] = NlwRenamedSig_OI_addr[0];
  GND   XST_GND (
    .G(Msub_addr_sub0000_cy[0])
  );
  FDCE   wdata_0 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[7]),
    .Q(wdata[0])
  );
  FDCE   wdata_1 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[6]),
    .Q(wdata[1])
  );
  FDCE   wdata_2 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[5]),
    .Q(wdata[2])
  );
  FDCE   wdata_3 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[4]),
    .Q(wdata[3])
  );
  FDCE   wdata_4 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[3]),
    .Q(wdata[4])
  );
  FDCE   wdata_5 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[2]),
    .Q(wdata[5])
  );
  FDCE   wdata_6 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[1]),
    .Q(wdata[6])
  );
  FDCE   wdata_7 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(wdata_mux0000[0]),
    .Q(wdata[7])
  );
  FDC   we_225 (
    .C(clk),
    .CLR(rst),
    .D(we_mux0000),
    .Q(we)
  );
  FDCE   rdy_226 (
    .C(clk),
    .CE(rdy_not0001),
    .CLR(rst),
    .D(count_not0001),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDC   s_busy (
    .C(clk),
    .CLR(rst),
    .D(busy),
    .Q(s_busy_471)
  );
  FDCE   count_0 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[0]),
    .Q(count[0])
  );
  FDCE   count_1 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[1]),
    .Q(count[1])
  );
  FDCE   count_2 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[2]),
    .Q(count[2])
  );
  FDCE   count_3 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[3]),
    .Q(count[3])
  );
  FDCE   count_4 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[4]),
    .Q(count[4])
  );
  FDCE   count_5 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[5]),
    .Q(count[5])
  );
  FDCE   count_6 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[6]),
    .Q(count[6])
  );
  FDCE   count_7 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[7]),
    .Q(count[7])
  );
  FDCE   count_8 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[8]),
    .Q(count[8])
  );
  FDCE   count_9 (
    .C(clk),
    .CE(count_not0001),
    .CLR(rst),
    .D(recv_cnt[9]),
    .Q(count[9])
  );
  MUXCY   \Mcount_addr_cy<0>  (
    .CI(busy),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[0]),
    .O(Mcount_addr_cy[0])
  );
  XORCY   \Mcount_addr_xor<0>  (
    .CI(busy),
    .LI(Mcount_addr_lut[0]),
    .O(Mcount_addr)
  );
  MUXCY   \Mcount_addr_cy<1>  (
    .CI(Mcount_addr_cy[0]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[1]),
    .O(Mcount_addr_cy[1])
  );
  XORCY   \Mcount_addr_xor<1>  (
    .CI(Mcount_addr_cy[0]),
    .LI(Mcount_addr_lut[1]),
    .O(Mcount_addr1)
  );
  MUXCY   \Mcount_addr_cy<2>  (
    .CI(Mcount_addr_cy[1]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[2]),
    .O(Mcount_addr_cy[2])
  );
  XORCY   \Mcount_addr_xor<2>  (
    .CI(Mcount_addr_cy[1]),
    .LI(Mcount_addr_lut[2]),
    .O(Mcount_addr2)
  );
  MUXCY   \Mcount_addr_cy<3>  (
    .CI(Mcount_addr_cy[2]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[3]),
    .O(Mcount_addr_cy[3])
  );
  XORCY   \Mcount_addr_xor<3>  (
    .CI(Mcount_addr_cy[2]),
    .LI(Mcount_addr_lut[3]),
    .O(Mcount_addr3)
  );
  MUXCY   \Mcount_addr_cy<4>  (
    .CI(Mcount_addr_cy[3]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[4]),
    .O(Mcount_addr_cy[4])
  );
  XORCY   \Mcount_addr_xor<4>  (
    .CI(Mcount_addr_cy[3]),
    .LI(Mcount_addr_lut[4]),
    .O(Mcount_addr4)
  );
  MUXCY   \Mcount_addr_cy<5>  (
    .CI(Mcount_addr_cy[4]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[5]),
    .O(Mcount_addr_cy[5])
  );
  XORCY   \Mcount_addr_xor<5>  (
    .CI(Mcount_addr_cy[4]),
    .LI(Mcount_addr_lut[5]),
    .O(Mcount_addr5)
  );
  MUXCY   \Mcount_addr_cy<6>  (
    .CI(Mcount_addr_cy[5]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[6]),
    .O(Mcount_addr_cy[6])
  );
  XORCY   \Mcount_addr_xor<6>  (
    .CI(Mcount_addr_cy[5]),
    .LI(Mcount_addr_lut[6]),
    .O(Mcount_addr6)
  );
  MUXCY   \Mcount_addr_cy<7>  (
    .CI(Mcount_addr_cy[6]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[7]),
    .O(Mcount_addr_cy[7])
  );
  XORCY   \Mcount_addr_xor<7>  (
    .CI(Mcount_addr_cy[6]),
    .LI(Mcount_addr_lut[7]),
    .O(Mcount_addr7)
  );
  MUXCY   \Mcount_addr_cy<8>  (
    .CI(Mcount_addr_cy[7]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_addr_lut[8]),
    .O(Mcount_addr_cy[8])
  );
  XORCY   \Mcount_addr_xor<8>  (
    .CI(Mcount_addr_cy[7]),
    .LI(Mcount_addr_lut[8]),
    .O(Mcount_addr8)
  );
  XORCY   \Mcount_addr_xor<9>  (
    .CI(Mcount_addr_cy[8]),
    .LI(Mcount_addr_lut[9]),
    .O(Mcount_addr9)
  );
  MUXCY   \Mcount_recv_cnt_cy<0>  (
    .CI(busy),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[0]),
    .O(Mcount_recv_cnt_cy[0])
  );
  XORCY   \Mcount_recv_cnt_xor<0>  (
    .CI(busy),
    .LI(Mcount_recv_cnt_lut[0]),
    .O(Mcount_recv_cnt)
  );
  MUXCY   \Mcount_recv_cnt_cy<1>  (
    .CI(Mcount_recv_cnt_cy[0]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[1]),
    .O(Mcount_recv_cnt_cy[1])
  );
  XORCY   \Mcount_recv_cnt_xor<1>  (
    .CI(Mcount_recv_cnt_cy[0]),
    .LI(Mcount_recv_cnt_lut[1]),
    .O(Mcount_recv_cnt1)
  );
  MUXCY   \Mcount_recv_cnt_cy<2>  (
    .CI(Mcount_recv_cnt_cy[1]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[2]),
    .O(Mcount_recv_cnt_cy[2])
  );
  XORCY   \Mcount_recv_cnt_xor<2>  (
    .CI(Mcount_recv_cnt_cy[1]),
    .LI(Mcount_recv_cnt_lut[2]),
    .O(Mcount_recv_cnt2)
  );
  MUXCY   \Mcount_recv_cnt_cy<3>  (
    .CI(Mcount_recv_cnt_cy[2]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[3]),
    .O(Mcount_recv_cnt_cy[3])
  );
  XORCY   \Mcount_recv_cnt_xor<3>  (
    .CI(Mcount_recv_cnt_cy[2]),
    .LI(Mcount_recv_cnt_lut[3]),
    .O(Mcount_recv_cnt3)
  );
  MUXCY   \Mcount_recv_cnt_cy<4>  (
    .CI(Mcount_recv_cnt_cy[3]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[4]),
    .O(Mcount_recv_cnt_cy[4])
  );
  XORCY   \Mcount_recv_cnt_xor<4>  (
    .CI(Mcount_recv_cnt_cy[3]),
    .LI(Mcount_recv_cnt_lut[4]),
    .O(Mcount_recv_cnt4)
  );
  MUXCY   \Mcount_recv_cnt_cy<5>  (
    .CI(Mcount_recv_cnt_cy[4]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[5]),
    .O(Mcount_recv_cnt_cy[5])
  );
  XORCY   \Mcount_recv_cnt_xor<5>  (
    .CI(Mcount_recv_cnt_cy[4]),
    .LI(Mcount_recv_cnt_lut[5]),
    .O(Mcount_recv_cnt5)
  );
  MUXCY   \Mcount_recv_cnt_cy<6>  (
    .CI(Mcount_recv_cnt_cy[5]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[6]),
    .O(Mcount_recv_cnt_cy[6])
  );
  XORCY   \Mcount_recv_cnt_xor<6>  (
    .CI(Mcount_recv_cnt_cy[5]),
    .LI(Mcount_recv_cnt_lut[6]),
    .O(Mcount_recv_cnt6)
  );
  MUXCY   \Mcount_recv_cnt_cy<7>  (
    .CI(Mcount_recv_cnt_cy[6]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[7]),
    .O(Mcount_recv_cnt_cy[7])
  );
  XORCY   \Mcount_recv_cnt_xor<7>  (
    .CI(Mcount_recv_cnt_cy[6]),
    .LI(Mcount_recv_cnt_lut[7]),
    .O(Mcount_recv_cnt7)
  );
  MUXCY   \Mcount_recv_cnt_cy<8>  (
    .CI(Mcount_recv_cnt_cy[7]),
    .DI(Msub_addr_sub0000_cy[0]),
    .S(Mcount_recv_cnt_lut[8]),
    .O(Mcount_recv_cnt_cy[8])
  );
  XORCY   \Mcount_recv_cnt_xor<8>  (
    .CI(Mcount_recv_cnt_cy[7]),
    .LI(Mcount_recv_cnt_lut[8]),
    .O(Mcount_recv_cnt8)
  );
  XORCY   \Mcount_recv_cnt_xor<9>  (
    .CI(Mcount_recv_cnt_cy[8]),
    .LI(Mcount_recv_cnt_lut[9]),
    .O(Mcount_recv_cnt9)
  );
  FDCE   addr_0 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr),
    .Q(NlwRenamedSig_OI_addr[0])
  );
  FDCE   addr_1 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr1),
    .Q(NlwRenamedSig_OI_addr[1])
  );
  FDCE   addr_2 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr2),
    .Q(NlwRenamedSig_OI_addr[2])
  );
  FDCE   addr_3 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr3),
    .Q(NlwRenamedSig_OI_addr[3])
  );
  FDCE   addr_4 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr4),
    .Q(NlwRenamedSig_OI_addr[4])
  );
  FDCE   addr_5 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr5),
    .Q(NlwRenamedSig_OI_addr[5])
  );
  FDCE   addr_6 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr6),
    .Q(NlwRenamedSig_OI_addr[6])
  );
  FDCE   addr_7 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr7),
    .Q(NlwRenamedSig_OI_addr[7])
  );
  FDCE   addr_8 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr8),
    .Q(NlwRenamedSig_OI_addr[8])
  );
  FDCE   addr_9 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_addr9),
    .Q(NlwRenamedSig_OI_addr[9])
  );
  FDCE   recv_cnt_0 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt),
    .Q(recv_cnt[0])
  );
  FDCE   recv_cnt_1 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt1),
    .Q(recv_cnt[1])
  );
  FDCE   recv_cnt_2 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt2),
    .Q(recv_cnt[2])
  );
  FDCE   recv_cnt_3 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt3),
    .Q(recv_cnt[3])
  );
  FDCE   recv_cnt_4 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt4),
    .Q(recv_cnt[4])
  );
  FDCE   recv_cnt_5 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt5),
    .Q(recv_cnt[5])
  );
  FDCE   recv_cnt_6 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt6),
    .Q(recv_cnt[6])
  );
  FDCE   recv_cnt_7 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt7),
    .Q(recv_cnt[7])
  );
  FDCE   recv_cnt_8 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt8),
    .Q(recv_cnt[8])
  );
  FDCE   recv_cnt_9 (
    .C(clk),
    .CE(addr_not0001),
    .CLR(rst),
    .D(Mcount_recv_cnt9),
    .Q(recv_cnt[9])
  );
  rmii_recv_byte_rmii_recv_byte   rmii_recv_byte (
    .clk(clk),
    .rst(rst),
    .busy(busy),
    .fast_eth(fast_eth),
    .rmii_clk(rmii_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(brdy),
    .data({data[7], data[6], data[5], data[4], data[3], data[2], data[1], data[0]}),
    .rm_rx_data({rm_rx_data[1], rm_rx_data[0]})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  we_mux00001 (
    .I0(busy),
    .I1(brdy),
    .O(we_mux0000)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<7>1  (
    .I0(busy),
    .I1(data[0]),
    .O(wdata_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<6>1  (
    .I0(busy),
    .I1(data[1]),
    .O(wdata_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<5>1  (
    .I0(busy),
    .I1(data[2]),
    .O(wdata_mux0000[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<4>1  (
    .I0(busy),
    .I1(data[3]),
    .O(wdata_mux0000[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<3>1  (
    .I0(busy),
    .I1(data[4]),
    .O(wdata_mux0000[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<2>1  (
    .I0(busy),
    .I1(data[5]),
    .O(wdata_mux0000[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<1>1  (
    .I0(busy),
    .I1(data[6]),
    .O(wdata_mux0000[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \wdata_mux0000<0>1  (
    .I0(busy),
    .I1(data[7]),
    .O(wdata_mux0000[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_not00011 (
    .I0(s_busy_471),
    .I1(busy),
    .O(count_not0001)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  addr_not00011 (
    .I0(busy),
    .I1(brdy),
    .O(addr_not0001)
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  rdy_not00011 (
    .I0(s_busy_471),
    .I1(busy),
    .I2(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_addr_lut<0>  (
    .I0(busy),
    .I1(NlwRenamedSig_OI_addr[0]),
    .O(Mcount_addr_lut[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<0>  (
    .I0(busy),
    .I1(recv_cnt[0]),
    .O(Mcount_recv_cnt_lut[0])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_addr_lut<1>  (
    .I0(busy),
    .I1(NlwRenamedSig_OI_addr[1]),
    .O(Mcount_addr_lut[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<1>  (
    .I0(busy),
    .I1(recv_cnt[1]),
    .O(Mcount_recv_cnt_lut[1])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_addr_lut<2>  (
    .I0(busy),
    .I1(NlwRenamedSig_OI_addr[2]),
    .O(Mcount_addr_lut[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<2>  (
    .I0(busy),
    .I1(recv_cnt[2]),
    .O(Mcount_recv_cnt_lut[2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<3>  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(busy),
    .O(Mcount_addr_lut[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<3>  (
    .I0(busy),
    .I1(recv_cnt[3]),
    .O(Mcount_recv_cnt_lut[3])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<4>  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .I1(busy),
    .O(Mcount_addr_lut[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<4>  (
    .I0(busy),
    .I1(recv_cnt[4]),
    .O(Mcount_recv_cnt_lut[4])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<5>  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(busy),
    .O(Mcount_addr_lut[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<5>  (
    .I0(busy),
    .I1(recv_cnt[5]),
    .O(Mcount_recv_cnt_lut[5])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<6>  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(busy),
    .O(Mcount_addr_lut[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<6>  (
    .I0(busy),
    .I1(recv_cnt[6]),
    .O(Mcount_recv_cnt_lut[6])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<7>  (
    .I0(NlwRenamedSig_OI_addr[7]),
    .I1(busy),
    .O(Mcount_addr_lut[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<7>  (
    .I0(busy),
    .I1(recv_cnt[7]),
    .O(Mcount_recv_cnt_lut[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<8>  (
    .I0(NlwRenamedSig_OI_addr[8]),
    .I1(busy),
    .O(Mcount_addr_lut[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<8>  (
    .I0(busy),
    .I1(recv_cnt[8]),
    .O(Mcount_recv_cnt_lut[8])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_addr_lut<9>  (
    .I0(NlwRenamedSig_OI_addr[9]),
    .I1(busy),
    .O(Mcount_addr_lut[9])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcount_recv_cnt_lut<9>  (
    .I0(busy),
    .I1(recv_cnt[9]),
    .O(Mcount_recv_cnt_lut[9])
  );
endmodule

module rmii_send_byte_rmii_send_byte (
  clk, start, rst, rm_tx_en, fast_eth, rmii_clk, rdy, rm_tx_data, data
);
  input clk;
  input start;
  input rst;
  output rm_tx_en;
  input fast_eth;
  input rmii_clk;
  output rdy;
  output [1 : 0] rm_tx_data;
  input [7 : 0] data;
  wire Mcount_bit_cnt;
  wire Mcount_bit_cnt1;
  wire Mcount_wait_cnt;
  wire Mcount_wait_cnt1;
  wire Mcount_wait_cnt2;
  wire Mcount_wait_cnt3;
  wire Mcount_wait_cnt4;
  wire \Mcount_wait_cnt_xor<0>1 ;
  wire \Mcount_wait_cnt_xor<0>11 ;
  wire \Mcount_wait_cnt_xor<2>1 ;
  wire \Mcount_wait_cnt_xor<2>11_76 ;
  wire \Mcount_wait_cnt_xor<3>1 ;
  wire \Mcount_wait_cnt_xor<3>11_78 ;
  wire N14;
  wire N16;
  wire N2;
  wire N20;
  wire N24;
  wire N25;
  wire N27;
  wire N28;
  wire N6;
  wire N61;
  wire N8;
  wire bit_cnt_not0001_92;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire rdy_not0001_104;
  wire rm_tx_data_not0001_109;
  wire NlwRenamedSig_OI_rm_tx_en;
  wire rm_tx_en_not0001;
  wire rm_tx_en_not00011;
  wire wait_cnt_not0003_133;
  wire [1 : 0] bit_cnt;
  wire [1 : 0] rm_tx_data_mux0000;
  wire [5 : 0] tx_data;
  wire [7 : 2] tx_data_mux0000;
  wire [4 : 0] wait_cnt;
  assign
    rm_tx_en = NlwRenamedSig_OI_rm_tx_en,
    rdy = NlwRenamedSig_OI_rdy;
  FDCE   rm_tx_data_0 (
    .C(clk),
    .CE(rm_tx_data_not0001_109),
    .CLR(rst),
    .D(rm_tx_data_mux0000[0]),
    .Q(rm_tx_data[0])
  );
  FDCE   rm_tx_data_1 (
    .C(clk),
    .CE(rm_tx_data_not0001_109),
    .CLR(rst),
    .D(rm_tx_data_mux0000[1]),
    .Q(rm_tx_data[1])
  );
  FDCE   rm_tx_en_118 (
    .C(clk),
    .CE(rm_tx_en_not0001),
    .CLR(rst),
    .D(start),
    .Q(NlwRenamedSig_OI_rm_tx_en)
  );
  FDCE   tx_data_0 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(tx_data_mux0000[2]),
    .Q(tx_data[0])
  );
  FDCE   tx_data_1 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(tx_data_mux0000[3]),
    .Q(tx_data[1])
  );
  FDCE   tx_data_2 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(tx_data_mux0000[4]),
    .Q(tx_data[2])
  );
  FDCE   tx_data_3 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(tx_data_mux0000[5]),
    .Q(tx_data[3])
  );
  FDCE   tx_data_4 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(tx_data_mux0000[6]),
    .Q(tx_data[4])
  );
  FDCE   tx_data_5 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(tx_data_mux0000[7]),
    .Q(tx_data[5])
  );
  FDPE   rdy_125 (
    .C(clk),
    .CE(rdy_not0001_104),
    .D(rdy_mux0000),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   wait_cnt_0 (
    .C(clk),
    .CE(wait_cnt_not0003_133),
    .CLR(rst),
    .D(Mcount_wait_cnt),
    .Q(wait_cnt[0])
  );
  FDCE   wait_cnt_1 (
    .C(clk),
    .CE(wait_cnt_not0003_133),
    .CLR(rst),
    .D(Mcount_wait_cnt1),
    .Q(wait_cnt[1])
  );
  FDCE   wait_cnt_2 (
    .C(clk),
    .CE(wait_cnt_not0003_133),
    .CLR(rst),
    .D(Mcount_wait_cnt2),
    .Q(wait_cnt[2])
  );
  FDCE   wait_cnt_3 (
    .C(clk),
    .CE(wait_cnt_not0003_133),
    .CLR(rst),
    .D(Mcount_wait_cnt3),
    .Q(wait_cnt[3])
  );
  FDCE   wait_cnt_4 (
    .C(clk),
    .CE(wait_cnt_not0003_133),
    .CLR(rst),
    .D(Mcount_wait_cnt4),
    .Q(wait_cnt[4])
  );
  FDCE   bit_cnt_0 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(Mcount_bit_cnt),
    .Q(bit_cnt[0])
  );
  FDCE   bit_cnt_1 (
    .C(clk),
    .CE(bit_cnt_not0001_92),
    .CLR(rst),
    .D(Mcount_bit_cnt1),
    .Q(bit_cnt[1])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \tx_data_mux0000<7>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(data[7]),
    .O(tx_data_mux0000[7])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \tx_data_mux0000<6>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(data[6]),
    .O(tx_data_mux0000[6])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Mcount_bit_cnt_xor<0>11  (
    .I0(bit_cnt[0]),
    .I1(NlwRenamedSig_OI_rdy),
    .O(Mcount_bit_cnt)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<5>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[5]),
    .I2(data[5]),
    .O(tx_data_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<4>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[4]),
    .I2(data[4]),
    .O(tx_data_mux0000[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<3>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[3]),
    .I2(data[3]),
    .O(tx_data_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \tx_data_mux0000<2>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[2]),
    .I2(data[2]),
    .O(tx_data_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'h14 ))
  \Mcount_bit_cnt_xor<1>11  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(bit_cnt[0]),
    .I2(bit_cnt[1]),
    .O(Mcount_bit_cnt1)
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \rm_tx_data_mux0000<1>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[1]),
    .I2(data[1]),
    .I3(start),
    .O(rm_tx_data_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \rm_tx_data_mux0000<0>1  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(tx_data[0]),
    .I2(data[0]),
    .I3(start),
    .O(rm_tx_data_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  wait_cnt_not0003_SW0 (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[4]),
    .O(N61)
  );
  LUT4 #(
    .INIT ( 16'hFFFD ))
  wait_cnt_not0003 (
    .I0(N2),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(N61),
    .O(wait_cnt_not0003_133)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \Mcount_wait_cnt_xor<1>1_SW0  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[4]),
    .I2(N28),
    .O(N8)
  );
  LUT4 #(
    .INIT ( 16'h9989 ))
  \Mcount_wait_cnt_xor<1>1  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[1]),
    .I2(N8),
    .I3(wait_cnt[3]),
    .O(Mcount_wait_cnt1)
  );
  LUT4 #(
    .INIT ( 16'hC8EA ))
  rm_tx_data_not0001_SW0 (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(rmii_clk),
    .I2(NlwRenamedSig_OI_rm_tx_en),
    .I3(start),
    .O(N14)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \Mcount_wait_cnt_xor<4>121  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(N6)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  rm_tx_data_not0001 (
    .I0(N14),
    .I1(wait_cnt[4]),
    .I2(N6),
    .O(rm_tx_data_not0001_109)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  bit_cnt_not0001 (
    .I0(N16),
    .I1(wait_cnt[4]),
    .I2(rmii_clk),
    .I3(N6),
    .O(bit_cnt_not0001_92)
  );
  LUT4 #(
    .INIT ( 16'hABA8 ))
  \Mcount_wait_cnt_xor<4>1  (
    .I0(wait_cnt[4]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(N20),
    .O(Mcount_wait_cnt4)
  );
  MUXF5   rdy_not0001 (
    .I0(N24),
    .I1(N25),
    .S(NlwRenamedSig_OI_rdy),
    .O(rdy_not0001_104)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  rdy_not0001_F (
    .I0(bit_cnt[1]),
    .I1(bit_cnt[0]),
    .I2(N6),
    .I3(wait_cnt[4]),
    .O(N24)
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  rdy_not0001_G (
    .I0(start),
    .I1(N6),
    .I2(rmii_clk),
    .I3(wait_cnt[4]),
    .O(N25)
  );
  INV   rdy_mux00001_INV_0 (
    .I(NlwRenamedSig_OI_rdy),
    .O(rdy_mux0000)
  );
  GND   XST_GND (
    .G(N27)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \Mcount_wait_cnt_xor<0>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[2]),
    .I3(wait_cnt[1]),
    .O(\Mcount_wait_cnt_xor<0>11 )
  );
  MUXF5   \Mcount_wait_cnt_xor<0>1_f5  (
    .I0(\Mcount_wait_cnt_xor<0>11 ),
    .I1(\Mcount_wait_cnt_xor<0>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt)
  );
  LUT3 #(
    .INIT ( 8'hC9 ))
  \Mcount_wait_cnt_xor<2>11  (
    .I0(wait_cnt[1]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<2>1 )
  );
  LUT4 #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<2>12  (
    .I0(wait_cnt[2]),
    .I1(wait_cnt[1]),
    .I2(wait_cnt[0]),
    .I3(wait_cnt[3]),
    .O(\Mcount_wait_cnt_xor<2>11_76 )
  );
  MUXF5   \Mcount_wait_cnt_xor<2>1_f5  (
    .I0(\Mcount_wait_cnt_xor<2>11_76 ),
    .I1(\Mcount_wait_cnt_xor<2>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt2)
  );
  LUT4 #(
    .INIT ( 16'h0C04 ))
  rm_tx_en_not000111 (
    .I0(start),
    .I1(NlwRenamedSig_OI_rdy),
    .I2(N6),
    .I3(rmii_clk),
    .O(rm_tx_en_not00011)
  );
  MUXF5   rm_tx_en_not00011_f5 (
    .I0(rm_tx_en_not00011),
    .I1(N27),
    .S(wait_cnt[4]),
    .O(rm_tx_en_not0001)
  );
  LUT4 #(
    .INIT ( 16'hAAA9 ))
  \Mcount_wait_cnt_xor<3>11  (
    .I0(wait_cnt[3]),
    .I1(wait_cnt[0]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>1 )
  );
  LUT4 #(
    .INIT ( 16'hCCC8 ))
  \Mcount_wait_cnt_xor<3>12  (
    .I0(wait_cnt[0]),
    .I1(wait_cnt[3]),
    .I2(wait_cnt[1]),
    .I3(wait_cnt[2]),
    .O(\Mcount_wait_cnt_xor<3>11_78 )
  );
  MUXF5   \Mcount_wait_cnt_xor<3>1_f5  (
    .I0(\Mcount_wait_cnt_xor<3>11_78 ),
    .I1(\Mcount_wait_cnt_xor<3>1 ),
    .S(wait_cnt[4]),
    .O(Mcount_wait_cnt3)
  );
  LUT3_D #(
    .INIT ( 8'hFE ))
  \Mcount_wait_cnt_xor<4>111  (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(bit_cnt[1]),
    .I2(bit_cnt[0]),
    .LO(N28),
    .O(N2)
  );
  LUT3_L #(
    .INIT ( 8'hE4 ))
  bit_cnt_not0001_SW0 (
    .I0(NlwRenamedSig_OI_rdy),
    .I1(NlwRenamedSig_OI_rm_tx_en),
    .I2(start),
    .LO(N16)
  );
  LUT4_L #(
    .INIT ( 16'hA9A8 ))
  \Mcount_wait_cnt_xor<4>1_SW1  (
    .I0(wait_cnt[4]),
    .I1(wait_cnt[2]),
    .I2(wait_cnt[3]),
    .I3(N2),
    .LO(N20)
  );
  INV   \Mcount_wait_cnt_xor<0>11_INV_0  (
    .I(wait_cnt[0]),
    .O(\Mcount_wait_cnt_xor<0>1 )
  );
endmodule

module rmii_send_mem (
  clk, start, rst, not_det, rm_tx_en, done, fast_eth, rmii_clk, rdy, addr, rm_tx_data, rdata, count
);
  input clk;
  input start;
  input rst;
  input not_det;
  output rm_tx_en;
  output done;
  input fast_eth;
  input rmii_clk;
  output rdy;
  output [9 : 0] addr;
  output [1 : 0] rm_tx_data;
  input [7 : 0] rdata;
  input [9 : 0] count;
  wire \Madd_addr_addsub0000_cy<1>_rt_136 ;
  wire \Madd_addr_addsub0000_cy<2>_rt_138 ;
  wire \Madd_addr_addsub0000_cy<3>_rt_140 ;
  wire \Madd_addr_addsub0000_cy<4>_rt_142 ;
  wire \Madd_addr_addsub0000_cy<5>_rt_144 ;
  wire \Madd_addr_addsub0000_cy<6>_rt_146 ;
  wire \Madd_addr_addsub0000_cy<7>_rt_148 ;
  wire \Madd_addr_addsub0000_cy<8>_rt_150 ;
  wire \Madd_addr_addsub0000_xor<9>_rt_152 ;
  wire \Madd_addr_lim_share0000_cy<1>_rt_155 ;
  wire \Madd_addr_lim_share0000_cy<2>_rt_157 ;
  wire \Madd_addr_lim_share0000_cy<3>_rt_159 ;
  wire \Madd_addr_lim_share0000_cy<4>_rt_161 ;
  wire \Madd_addr_lim_share0000_cy<5>_rt_163 ;
  wire \Madd_addr_lim_share0000_cy<6>_rt_165 ;
  wire \Madd_addr_lim_share0000_cy<7>_rt_167 ;
  wire \Madd_addr_lim_share0000_cy<8>_rt_169 ;
  wire N0;
  wire N1;
  wire NlwRenamedSig_OI_rdy;
  wire rdy_mux0000;
  wire send_buf_not0001;
  wire send_byte_start_279;
  wire send_byte_start_not0001;
  wire send_rdy;
  wire state_FSM_FFd1_283;
  wire \state_FSM_FFd1-In ;
  wire state_and0000;
  wire [8 : 0] Madd_addr_addsub0000_cy;
  wire [0 : 0] Madd_addr_addsub0000_lut;
  wire [8 : 0] Madd_addr_lim_share0000_cy;
  wire [0 : 0] Madd_addr_lim_share0000_lut;
  wire [4 : 0] Mcompar_state_cmp_eq0000_cy;
  wire [4 : 0] Mcompar_state_cmp_eq0000_lut;
  wire [9 : 0] NlwRenamedSig_OI_addr;
  wire [9 : 0] addr_addsub0000;
  wire [9 : 0] addr_lim;
  wire [9 : 0] addr_lim_mux0000;
  wire [9 : 0] addr_lim_share0000;
  wire [9 : 0] addr_mux0000;
  wire [7 : 0] send_buf;
  assign
    rdy = NlwRenamedSig_OI_rdy,
    addr[9] = NlwRenamedSig_OI_addr[9],
    addr[8] = NlwRenamedSig_OI_addr[8],
    addr[7] = NlwRenamedSig_OI_addr[7],
    addr[6] = NlwRenamedSig_OI_addr[6],
    addr[5] = NlwRenamedSig_OI_addr[5],
    addr[4] = NlwRenamedSig_OI_addr[4],
    addr[3] = NlwRenamedSig_OI_addr[3],
    addr[2] = NlwRenamedSig_OI_addr[2],
    addr[1] = NlwRenamedSig_OI_addr[1],
    addr[0] = NlwRenamedSig_OI_addr[0];
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDCE   addr_0 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[9]),
    .Q(NlwRenamedSig_OI_addr[0])
  );
  FDCE   addr_1 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[8]),
    .Q(NlwRenamedSig_OI_addr[1])
  );
  FDCE   addr_2 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[7]),
    .Q(NlwRenamedSig_OI_addr[2])
  );
  FDCE   addr_3 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[6]),
    .Q(NlwRenamedSig_OI_addr[3])
  );
  FDCE   addr_4 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[5]),
    .Q(NlwRenamedSig_OI_addr[4])
  );
  FDCE   addr_5 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[4]),
    .Q(NlwRenamedSig_OI_addr[5])
  );
  FDCE   addr_6 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[3]),
    .Q(NlwRenamedSig_OI_addr[6])
  );
  FDCE   addr_7 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[2]),
    .Q(NlwRenamedSig_OI_addr[7])
  );
  FDCE   addr_8 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[1]),
    .Q(NlwRenamedSig_OI_addr[8])
  );
  FDCE   addr_9 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_mux0000[0]),
    .Q(NlwRenamedSig_OI_addr[9])
  );
  FDCE   send_byte_start (
    .C(clk),
    .CE(send_byte_start_not0001),
    .CLR(rst),
    .D(state_and0000),
    .Q(send_byte_start_279)
  );
  FDPE   rdy_47 (
    .C(clk),
    .CE(state_and0000),
    .D(rdy_mux0000),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_rdy)
  );
  FDCE   send_buf_0 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[0]),
    .Q(send_buf[0])
  );
  FDCE   send_buf_1 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[1]),
    .Q(send_buf[1])
  );
  FDCE   send_buf_2 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[2]),
    .Q(send_buf[2])
  );
  FDCE   send_buf_3 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[3]),
    .Q(send_buf[3])
  );
  FDCE   send_buf_4 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[4]),
    .Q(send_buf[4])
  );
  FDCE   send_buf_5 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[5]),
    .Q(send_buf[5])
  );
  FDCE   send_buf_6 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[6]),
    .Q(send_buf[6])
  );
  FDCE   send_buf_7 (
    .C(clk),
    .CE(send_buf_not0001),
    .CLR(rst),
    .D(rdata[7]),
    .Q(send_buf[7])
  );
  FDCE   addr_lim_0 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[0]),
    .Q(addr_lim[0])
  );
  FDCE   addr_lim_1 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[1]),
    .Q(addr_lim[1])
  );
  FDCE   addr_lim_2 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[2]),
    .Q(addr_lim[2])
  );
  FDCE   addr_lim_3 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[3]),
    .Q(addr_lim[3])
  );
  FDCE   addr_lim_4 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[4]),
    .Q(addr_lim[4])
  );
  FDCE   addr_lim_5 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[5]),
    .Q(addr_lim[5])
  );
  FDCE   addr_lim_6 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[6]),
    .Q(addr_lim[6])
  );
  FDCE   addr_lim_7 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[7]),
    .Q(addr_lim[7])
  );
  FDCE   addr_lim_8 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[8]),
    .Q(addr_lim[8])
  );
  FDCE   addr_lim_9 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(addr_lim_mux0000[9]),
    .Q(addr_lim[9])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_addr_lim_share0000_lut[0]),
    .O(Madd_addr_lim_share0000_cy[0])
  );
  XORCY   \Madd_addr_lim_share0000_xor<0>  (
    .CI(N0),
    .LI(Madd_addr_lim_share0000_lut[0]),
    .O(addr_lim_share0000[0])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<1>  (
    .CI(Madd_addr_lim_share0000_cy[0]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<1>_rt_155 ),
    .O(Madd_addr_lim_share0000_cy[1])
  );
  XORCY   \Madd_addr_lim_share0000_xor<1>  (
    .CI(Madd_addr_lim_share0000_cy[0]),
    .LI(\Madd_addr_lim_share0000_cy<1>_rt_155 ),
    .O(addr_lim_share0000[1])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<2>  (
    .CI(Madd_addr_lim_share0000_cy[1]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<2>_rt_157 ),
    .O(Madd_addr_lim_share0000_cy[2])
  );
  XORCY   \Madd_addr_lim_share0000_xor<2>  (
    .CI(Madd_addr_lim_share0000_cy[1]),
    .LI(\Madd_addr_lim_share0000_cy<2>_rt_157 ),
    .O(addr_lim_share0000[2])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<3>  (
    .CI(Madd_addr_lim_share0000_cy[2]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<3>_rt_159 ),
    .O(Madd_addr_lim_share0000_cy[3])
  );
  XORCY   \Madd_addr_lim_share0000_xor<3>  (
    .CI(Madd_addr_lim_share0000_cy[2]),
    .LI(\Madd_addr_lim_share0000_cy<3>_rt_159 ),
    .O(addr_lim_share0000[3])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<4>  (
    .CI(Madd_addr_lim_share0000_cy[3]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<4>_rt_161 ),
    .O(Madd_addr_lim_share0000_cy[4])
  );
  XORCY   \Madd_addr_lim_share0000_xor<4>  (
    .CI(Madd_addr_lim_share0000_cy[3]),
    .LI(\Madd_addr_lim_share0000_cy<4>_rt_161 ),
    .O(addr_lim_share0000[4])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<5>  (
    .CI(Madd_addr_lim_share0000_cy[4]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<5>_rt_163 ),
    .O(Madd_addr_lim_share0000_cy[5])
  );
  XORCY   \Madd_addr_lim_share0000_xor<5>  (
    .CI(Madd_addr_lim_share0000_cy[4]),
    .LI(\Madd_addr_lim_share0000_cy<5>_rt_163 ),
    .O(addr_lim_share0000[5])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<6>  (
    .CI(Madd_addr_lim_share0000_cy[5]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<6>_rt_165 ),
    .O(Madd_addr_lim_share0000_cy[6])
  );
  XORCY   \Madd_addr_lim_share0000_xor<6>  (
    .CI(Madd_addr_lim_share0000_cy[5]),
    .LI(\Madd_addr_lim_share0000_cy<6>_rt_165 ),
    .O(addr_lim_share0000[6])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<7>  (
    .CI(Madd_addr_lim_share0000_cy[6]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<7>_rt_167 ),
    .O(Madd_addr_lim_share0000_cy[7])
  );
  XORCY   \Madd_addr_lim_share0000_xor<7>  (
    .CI(Madd_addr_lim_share0000_cy[6]),
    .LI(\Madd_addr_lim_share0000_cy<7>_rt_167 ),
    .O(addr_lim_share0000[7])
  );
  MUXCY   \Madd_addr_lim_share0000_cy<8>  (
    .CI(Madd_addr_lim_share0000_cy[7]),
    .DI(N0),
    .S(\Madd_addr_lim_share0000_cy<8>_rt_169 ),
    .O(Madd_addr_lim_share0000_cy[8])
  );
  XORCY   \Madd_addr_lim_share0000_xor<8>  (
    .CI(Madd_addr_lim_share0000_cy[7]),
    .LI(\Madd_addr_lim_share0000_cy<8>_rt_169 ),
    .O(addr_lim_share0000[8])
  );
  XORCY   \Madd_addr_lim_share0000_xor<9>  (
    .CI(Madd_addr_lim_share0000_cy[8]),
    .LI(count[9]),
    .O(addr_lim_share0000[9])
  );
  MUXCY   \Madd_addr_addsub0000_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(Madd_addr_addsub0000_lut[0]),
    .O(Madd_addr_addsub0000_cy[0])
  );
  XORCY   \Madd_addr_addsub0000_xor<0>  (
    .CI(N0),
    .LI(Madd_addr_addsub0000_lut[0]),
    .O(addr_addsub0000[0])
  );
  MUXCY   \Madd_addr_addsub0000_cy<1>  (
    .CI(Madd_addr_addsub0000_cy[0]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<1>_rt_136 ),
    .O(Madd_addr_addsub0000_cy[1])
  );
  XORCY   \Madd_addr_addsub0000_xor<1>  (
    .CI(Madd_addr_addsub0000_cy[0]),
    .LI(\Madd_addr_addsub0000_cy<1>_rt_136 ),
    .O(addr_addsub0000[1])
  );
  MUXCY   \Madd_addr_addsub0000_cy<2>  (
    .CI(Madd_addr_addsub0000_cy[1]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<2>_rt_138 ),
    .O(Madd_addr_addsub0000_cy[2])
  );
  XORCY   \Madd_addr_addsub0000_xor<2>  (
    .CI(Madd_addr_addsub0000_cy[1]),
    .LI(\Madd_addr_addsub0000_cy<2>_rt_138 ),
    .O(addr_addsub0000[2])
  );
  MUXCY   \Madd_addr_addsub0000_cy<3>  (
    .CI(Madd_addr_addsub0000_cy[2]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<3>_rt_140 ),
    .O(Madd_addr_addsub0000_cy[3])
  );
  XORCY   \Madd_addr_addsub0000_xor<3>  (
    .CI(Madd_addr_addsub0000_cy[2]),
    .LI(\Madd_addr_addsub0000_cy<3>_rt_140 ),
    .O(addr_addsub0000[3])
  );
  MUXCY   \Madd_addr_addsub0000_cy<4>  (
    .CI(Madd_addr_addsub0000_cy[3]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<4>_rt_142 ),
    .O(Madd_addr_addsub0000_cy[4])
  );
  XORCY   \Madd_addr_addsub0000_xor<4>  (
    .CI(Madd_addr_addsub0000_cy[3]),
    .LI(\Madd_addr_addsub0000_cy<4>_rt_142 ),
    .O(addr_addsub0000[4])
  );
  MUXCY   \Madd_addr_addsub0000_cy<5>  (
    .CI(Madd_addr_addsub0000_cy[4]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<5>_rt_144 ),
    .O(Madd_addr_addsub0000_cy[5])
  );
  XORCY   \Madd_addr_addsub0000_xor<5>  (
    .CI(Madd_addr_addsub0000_cy[4]),
    .LI(\Madd_addr_addsub0000_cy<5>_rt_144 ),
    .O(addr_addsub0000[5])
  );
  MUXCY   \Madd_addr_addsub0000_cy<6>  (
    .CI(Madd_addr_addsub0000_cy[5]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<6>_rt_146 ),
    .O(Madd_addr_addsub0000_cy[6])
  );
  XORCY   \Madd_addr_addsub0000_xor<6>  (
    .CI(Madd_addr_addsub0000_cy[5]),
    .LI(\Madd_addr_addsub0000_cy<6>_rt_146 ),
    .O(addr_addsub0000[6])
  );
  MUXCY   \Madd_addr_addsub0000_cy<7>  (
    .CI(Madd_addr_addsub0000_cy[6]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<7>_rt_148 ),
    .O(Madd_addr_addsub0000_cy[7])
  );
  XORCY   \Madd_addr_addsub0000_xor<7>  (
    .CI(Madd_addr_addsub0000_cy[6]),
    .LI(\Madd_addr_addsub0000_cy<7>_rt_148 ),
    .O(addr_addsub0000[7])
  );
  MUXCY   \Madd_addr_addsub0000_cy<8>  (
    .CI(Madd_addr_addsub0000_cy[7]),
    .DI(N0),
    .S(\Madd_addr_addsub0000_cy<8>_rt_150 ),
    .O(Madd_addr_addsub0000_cy[8])
  );
  XORCY   \Madd_addr_addsub0000_xor<8>  (
    .CI(Madd_addr_addsub0000_cy[7]),
    .LI(\Madd_addr_addsub0000_cy<8>_rt_150 ),
    .O(addr_addsub0000[8])
  );
  XORCY   \Madd_addr_addsub0000_xor<9>  (
    .CI(Madd_addr_addsub0000_cy[8]),
    .LI(\Madd_addr_addsub0000_xor<9>_rt_152 ),
    .O(addr_addsub0000[9])
  );
  LUT4 #(
    .INIT ( 16'h8421 ))
  \Mcompar_state_cmp_eq0000_lut<0>  (
    .I0(addr_lim[1]),
    .I1(addr_lim[0]),
    .I2(NlwRenamedSig_OI_addr[1]),
    .I3(NlwRenamedSig_OI_addr[0]),
    .O(Mcompar_state_cmp_eq0000_lut[0])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[0]),
    .O(Mcompar_state_cmp_eq0000_cy[0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<1>  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(addr_lim[2]),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(addr_lim[3]),
    .O(Mcompar_state_cmp_eq0000_lut[1])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<1>  (
    .CI(Mcompar_state_cmp_eq0000_cy[0]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[1]),
    .O(Mcompar_state_cmp_eq0000_cy[1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<2>  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .I1(addr_lim[4]),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(addr_lim[5]),
    .O(Mcompar_state_cmp_eq0000_lut[2])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<2>  (
    .CI(Mcompar_state_cmp_eq0000_cy[1]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[2]),
    .O(Mcompar_state_cmp_eq0000_cy[2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<3>  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(addr_lim[6]),
    .I2(NlwRenamedSig_OI_addr[7]),
    .I3(addr_lim[7]),
    .O(Mcompar_state_cmp_eq0000_lut[3])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<3>  (
    .CI(Mcompar_state_cmp_eq0000_cy[2]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[3]),
    .O(Mcompar_state_cmp_eq0000_cy[3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_state_cmp_eq0000_lut<4>  (
    .I0(NlwRenamedSig_OI_addr[8]),
    .I1(addr_lim[8]),
    .I2(NlwRenamedSig_OI_addr[9]),
    .I3(addr_lim[9]),
    .O(Mcompar_state_cmp_eq0000_lut[4])
  );
  MUXCY   \Mcompar_state_cmp_eq0000_cy<4>  (
    .CI(Mcompar_state_cmp_eq0000_cy[3]),
    .DI(N0),
    .S(Mcompar_state_cmp_eq0000_lut[4]),
    .O(Mcompar_state_cmp_eq0000_cy[4])
  );
  FDCE   state_FSM_FFd1 (
    .C(clk),
    .CE(state_and0000),
    .CLR(rst),
    .D(\state_FSM_FFd1-In ),
    .Q(state_FSM_FFd1_283)
  );
  rmii_send_byte_rmii_send_byte   rmii_send_byte (
    .clk(clk),
    .start(send_byte_start_279),
    .rst(rst),
    .rm_tx_en(rm_tx_en),
    .fast_eth(fast_eth),
    .rmii_clk(rmii_clk),
    .rdy(send_rdy),
    .rm_tx_data({rm_tx_data[1], rm_tx_data[0]}),
    .data({send_buf[7], send_buf[6], send_buf[5], send_buf[4], send_buf[3], send_buf[2], send_buf[1], send_buf[0]})
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  state_and00001 (
    .I0(rmii_clk),
    .I1(send_rdy),
    .O(state_and0000)
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<9>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[0]),
    .I3(NlwRenamedSig_OI_addr[0]),
    .O(addr_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<8>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[1]),
    .I3(NlwRenamedSig_OI_addr[1]),
    .O(addr_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<7>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[2]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .O(addr_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<6>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[3]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .O(addr_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<5>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[4]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .O(addr_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<4>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[5]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .O(addr_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<3>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[6]),
    .I3(NlwRenamedSig_OI_addr[6]),
    .O(addr_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \state_FSM_FFd1-In1  (
    .I0(state_FSM_FFd1_283),
    .I1(start),
    .I2(Mcompar_state_cmp_eq0000_cy[4]),
    .O(\state_FSM_FFd1-In )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<6>1  (
    .I0(addr_lim[6]),
    .I1(addr_lim_share0000[6]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[6])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<5>1  (
    .I0(addr_lim[5]),
    .I1(addr_lim_share0000[5]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[5])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<4>1  (
    .I0(addr_lim[4]),
    .I1(addr_lim_share0000[4]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[4])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<3>1  (
    .I0(addr_lim[3]),
    .I1(addr_lim_share0000[3]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[3])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<2>1  (
    .I0(addr_lim[2]),
    .I1(addr_lim_share0000[2]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<1>1  (
    .I0(addr_lim[1]),
    .I1(addr_lim_share0000[1]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<0>1  (
    .I0(addr_lim[0]),
    .I1(addr_lim_share0000[0]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[0])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<7>1  (
    .I0(addr_lim[7]),
    .I1(addr_lim_share0000[7]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<2>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[7]),
    .I3(NlwRenamedSig_OI_addr[7]),
    .O(addr_mux0000[2])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<8>1  (
    .I0(addr_lim[8]),
    .I1(addr_lim_share0000[8]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<1>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[8]),
    .I3(NlwRenamedSig_OI_addr[8]),
    .O(addr_mux0000[1])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \addr_lim_mux0000<9>1  (
    .I0(addr_lim[9]),
    .I1(addr_lim_share0000[9]),
    .I2(\state_FSM_FFd1-In ),
    .O(addr_lim_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \addr_mux0000<0>1  (
    .I0(state_FSM_FFd1_283),
    .I1(Mcompar_state_cmp_eq0000_cy[4]),
    .I2(addr_addsub0000[9]),
    .I3(NlwRenamedSig_OI_addr[9]),
    .O(addr_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'h0080 ))
  send_byte_start_not000131 (
    .I0(send_rdy),
    .I1(state_FSM_FFd1_283),
    .I2(rmii_clk),
    .I3(Mcompar_state_cmp_eq0000_cy[4]),
    .O(send_buf_not0001)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<1>_rt  (
    .I0(count[1]),
    .O(\Madd_addr_lim_share0000_cy<1>_rt_155 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<2>_rt  (
    .I0(count[2]),
    .O(\Madd_addr_lim_share0000_cy<2>_rt_157 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<3>_rt  (
    .I0(count[3]),
    .O(\Madd_addr_lim_share0000_cy<3>_rt_159 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<4>_rt  (
    .I0(count[4]),
    .O(\Madd_addr_lim_share0000_cy<4>_rt_161 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<5>_rt  (
    .I0(count[5]),
    .O(\Madd_addr_lim_share0000_cy<5>_rt_163 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<6>_rt  (
    .I0(count[6]),
    .O(\Madd_addr_lim_share0000_cy<6>_rt_165 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<7>_rt  (
    .I0(count[7]),
    .O(\Madd_addr_lim_share0000_cy<7>_rt_167 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_lim_share0000_cy<8>_rt  (
    .I0(count[8]),
    .O(\Madd_addr_lim_share0000_cy<8>_rt_169 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<1>_rt  (
    .I0(NlwRenamedSig_OI_addr[1]),
    .O(\Madd_addr_addsub0000_cy<1>_rt_136 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<2>_rt  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .O(\Madd_addr_addsub0000_cy<2>_rt_138 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<3>_rt  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .O(\Madd_addr_addsub0000_cy<3>_rt_140 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<4>_rt  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .O(\Madd_addr_addsub0000_cy<4>_rt_142 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<5>_rt  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .O(\Madd_addr_addsub0000_cy<5>_rt_144 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<6>_rt  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .O(\Madd_addr_addsub0000_cy<6>_rt_146 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<7>_rt  (
    .I0(NlwRenamedSig_OI_addr[7]),
    .O(\Madd_addr_addsub0000_cy<7>_rt_148 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_cy<8>_rt  (
    .I0(NlwRenamedSig_OI_addr[8]),
    .O(\Madd_addr_addsub0000_cy<8>_rt_150 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_addr_addsub0000_xor<9>_rt  (
    .I0(NlwRenamedSig_OI_addr[9]),
    .O(\Madd_addr_addsub0000_xor<9>_rt_152 )
  );
  LUT4 #(
    .INIT ( 16'hAF8D ))
  rdy_mux00001 (
    .I0(state_FSM_FFd1_283),
    .I1(NlwRenamedSig_OI_rdy),
    .I2(start),
    .I3(Mcompar_state_cmp_eq0000_cy[4]),
    .O(rdy_mux0000)
  );
  LUT4 #(
    .INIT ( 16'h6A2A ))
  send_byte_start_not00011 (
    .I0(Mcompar_state_cmp_eq0000_cy[4]),
    .I1(rmii_clk),
    .I2(send_rdy),
    .I3(state_FSM_FFd1_283),
    .O(send_byte_start_not0001)
  );
  INV   \Madd_addr_lim_share0000_lut<0>_INV_0  (
    .I(count[0]),
    .O(Madd_addr_lim_share0000_lut[0])
  );
  INV   \Madd_addr_addsub0000_lut<0>_INV_0  (
    .I(NlwRenamedSig_OI_addr[0]),
    .O(Madd_addr_addsub0000_lut[0])
  );
endmodule

module mem_2port (
  clk, we_a, we_b, en_a, en_b, clk_b, r_data_a, r_data_b, addr_a, addr_b, w_data_a, w_data_b
);
  input clk;
  input we_a;
  input we_b;
  input en_a;
  input en_b;
  input clk_b;
  output [7 : 0] r_data_a;
  output [7 : 0] r_data_b;
  input [9 : 0] addr_a;
  input [9 : 0] addr_b;
  input [7 : 0] w_data_a;
  input [7 : 0] w_data_b;
  wire N0;
  wire \NLW_Mram_mem_DOPA<0>_UNCONNECTED ;
  wire \NLW_Mram_mem_DOPB<0>_UNCONNECTED ;
  GND   XST_GND (
    .G(N0)
  );
  RAMB16_S9_S9 #(
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h000000000000000000000000000000000000000000000000D555555555555555 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .WRITE_MODE_A ( "READ_FIRST" ),
    .WRITE_MODE_B ( "READ_FIRST" ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ))
  Mram_mem (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(en_a),
    .ENB(en_b),
    .SSRA(N0),
    .SSRB(N0),
    .WEA(we_a),
    .WEB(we_b),
    .ADDRA({N0, addr_a[9], addr_a[8], addr_a[7], addr_a[6], addr_a[5], addr_a[4], addr_a[3], addr_a[2], addr_a[1], addr_a[0]}),
    .ADDRB({N0, addr_b[9], addr_b[8], addr_b[7], addr_b[6], addr_b[5], addr_b[4], addr_b[3], addr_b[2], addr_b[1], addr_b[0]}),
    .DIA({w_data_a[7], w_data_a[6], w_data_a[5], w_data_a[4], w_data_a[3], w_data_a[2], w_data_a[1], w_data_a[0]}),
    .DIB({w_data_b[7], w_data_b[6], w_data_b[5], w_data_b[4], w_data_b[3], w_data_b[2], w_data_b[1], w_data_b[0]}),
    .DIPA({N0}),
    .DIPB({N0}),
    .DOA({r_data_a[7], r_data_a[6], r_data_a[5], r_data_a[4], r_data_a[3], r_data_a[2], r_data_a[1], r_data_a[0]}),
    .DOPA({\NLW_Mram_mem_DOPA<0>_UNCONNECTED }),
    .DOB({r_data_b[7], r_data_b[6], r_data_b[5], r_data_b[4], r_data_b[3], r_data_b[2], r_data_b[1], r_data_b[0]}),
    .DOPB({\NLW_Mram_mem_DOPB<0>_UNCONNECTED })
  );
endmodule

module retr (
  clk, rst, rm_tx_en, fast_eth, rmii_clk, rm_crs_dv, rm_tx_data, rm_rx_data
);
  input clk;
  input rst;
  output rm_tx_en;
  input fast_eth;
  input rmii_clk;
  input rm_crs_dv;
  output [1 : 0] rm_tx_data;
  input [1 : 0] rm_rx_data;
  wire N0;
  wire N1;
  wire N13;
  wire recv_rdy;
  wire recv_we;
  wire retr_state_FSM_FFd1_524;
  wire \retr_state_FSM_FFd1-In ;
  wire \trans_count_mux0000<0>1187 ;
  wire \trans_count_mux0000<0>11871_556 ;
  wire \trans_count_mux0000<0>156 ;
  wire \trans_count_mux0000<0>1561_558 ;
  wire \trans_count_mux0000<0>1562_559 ;
  wire \trans_count_mux0000<1>11_561 ;
  wire \trans_count_mux0000<1>125_562 ;
  wire \trans_count_mux0000<1>_bdd2 ;
  wire \trans_count_mux0000<2>2 ;
  wire \trans_count_mux0000<3>137_567 ;
  wire \trans_count_mux0000<3>182 ;
  wire \trans_count_mux0000<3>1821_569 ;
  wire \trans_count_mux0000<4>11_571 ;
  wire \trans_count_mux0000<4>126_572 ;
  wire \trans_count_mux0000<5>1 ;
  wire \trans_count_mux0000<6>1 ;
  wire \trans_count_mux0000<6>11_577 ;
  wire \trans_count_mux0000<7>1 ;
  wire \trans_count_mux0000<7>11_580 ;
  wire \trans_count_mux0000<8>1 ;
  wire \trans_count_mux0000<8>11_583 ;
  wire trans_rdy;
  wire trans_start_594;
  wire trans_start_mux0000;
  wire NLW_transmitter_done_UNCONNECTED;
  wire \NLW_frame_buf_r_data_a<7>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<6>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<5>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<4>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<3>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<2>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<1>_UNCONNECTED ;
  wire \NLW_frame_buf_r_data_a<0>_UNCONNECTED ;
  wire [3 : 3] Madd_trans_count_addsub0000_cy;
  wire [9 : 4] Madd_trans_count_addsub0000_lut;
  wire [9 : 0] recv_addr;
  wire [2 : 0] recv_count;
  wire [7 : 0] recv_data;
  wire [9 : 0] trans_addr;
  wire [9 : 0] trans_count;
  wire [9 : 0] trans_count_mux0000;
  wire [7 : 0] trans_data;
  GND   XST_GND (
    .G(N0)
  );
  VCC   XST_VCC (
    .P(N1)
  );
  FDC   trans_count_0 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[9]),
    .Q(trans_count[0])
  );
  FDC   trans_count_1 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[8]),
    .Q(trans_count[1])
  );
  FDC   trans_count_2 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[7]),
    .Q(trans_count[2])
  );
  FDC   trans_count_3 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[6]),
    .Q(trans_count[3])
  );
  FDC   trans_count_4 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[5]),
    .Q(trans_count[4])
  );
  FDC   trans_count_5 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[4]),
    .Q(trans_count[5])
  );
  FDC   trans_count_6 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[3]),
    .Q(trans_count[6])
  );
  FDC   trans_count_7 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[2]),
    .Q(trans_count[7])
  );
  FDC   trans_count_8 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[1]),
    .Q(trans_count[8])
  );
  FDC   trans_count_9 (
    .C(clk),
    .CLR(rst),
    .D(trans_count_mux0000[0]),
    .Q(trans_count[9])
  );
  FDC   trans_start (
    .C(clk),
    .CLR(rst),
    .D(trans_start_mux0000),
    .Q(trans_start_594)
  );
  FDC   retr_state_FSM_FFd1 (
    .C(clk),
    .CLR(rst),
    .D(\retr_state_FSM_FFd1-In ),
    .Q(retr_state_FSM_FFd1_524)
  );
  mem_2port   frame_buf (
    .clk(clk),
    .we_a(recv_we),
    .we_b(N0),
    .en_a(recv_we),
    .en_b(N1),
    .clk_b(N0),
    .r_data_a({\NLW_frame_buf_r_data_a<7>_UNCONNECTED , \NLW_frame_buf_r_data_a<6>_UNCONNECTED , \NLW_frame_buf_r_data_a<5>_UNCONNECTED , 
\NLW_frame_buf_r_data_a<4>_UNCONNECTED , \NLW_frame_buf_r_data_a<3>_UNCONNECTED , \NLW_frame_buf_r_data_a<2>_UNCONNECTED , 
\NLW_frame_buf_r_data_a<1>_UNCONNECTED , \NLW_frame_buf_r_data_a<0>_UNCONNECTED }),
    .r_data_b({trans_data[7], trans_data[6], trans_data[5], trans_data[4], trans_data[3], trans_data[2], trans_data[1], trans_data[0]}),
    .addr_a({recv_addr[9], recv_addr[8], recv_addr[7], recv_addr[6], recv_addr[5], recv_addr[4], recv_addr[3], recv_addr[2], recv_addr[1], 
recv_addr[0]}),
    .addr_b({trans_addr[9], trans_addr[8], trans_addr[7], trans_addr[6], trans_addr[5], trans_addr[4], trans_addr[3], trans_addr[2], trans_addr[1], 
trans_addr[0]}),
    .w_data_a({recv_data[7], recv_data[6], recv_data[5], recv_data[4], recv_data[3], recv_data[2], recv_data[1], recv_data[0]}),
    .w_data_b({N0, N0, N0, N0, N0, N0, N0, N0})
  );
  rmii_send_mem   transmitter (
    .clk(clk),
    .start(trans_start_594),
    .rst(rst),
    .not_det(N1),
    .rm_tx_en(rm_tx_en),
    .done(NLW_transmitter_done_UNCONNECTED),
    .fast_eth(N1),
    .rmii_clk(rmii_clk),
    .rdy(trans_rdy),
    .addr({trans_addr[9], trans_addr[8], trans_addr[7], trans_addr[6], trans_addr[5], trans_addr[4], trans_addr[3], trans_addr[2], trans_addr[1], 
trans_addr[0]}),
    .rm_tx_data({rm_tx_data[1], rm_tx_data[0]}),
    .rdata({trans_data[7], trans_data[6], trans_data[5], trans_data[4], trans_data[3], trans_data[2], trans_data[1], trans_data[0]}),
    .count({trans_count[9], trans_count[8], trans_count[7], trans_count[6], trans_count[5], trans_count[4], trans_count[3], trans_count[2], 
trans_count[1], trans_count[0]})
  );
  rmii_recv_mem   reciever (
    .clk(clk),
    .rst(rst),
    .we(recv_we),
    .fast_eth(N1),
    .rmii_clk(rmii_clk),
    .rm_crs_dv(rm_crs_dv),
    .rdy(recv_rdy),
    .addr({recv_addr[9], recv_addr[8], recv_addr[7], recv_addr[6], recv_addr[5], recv_addr[4], recv_addr[3], recv_addr[2], recv_addr[1], recv_addr[0]
}),
    .count({Madd_trans_count_addsub0000_lut[9], Madd_trans_count_addsub0000_lut[8], Madd_trans_count_addsub0000_lut[7], 
Madd_trans_count_addsub0000_lut[6], Madd_trans_count_addsub0000_lut[5], Madd_trans_count_addsub0000_lut[4], Madd_trans_count_addsub0000_cy[3], 
recv_count[2], recv_count[1], recv_count[0]}),
    .wdata({recv_data[7], recv_data[6], recv_data[5], recv_data[4], recv_data[3], recv_data[2], recv_data[1], recv_data[0]}),
    .offset({N0, N0, N0, N0, N0, N0, N1, N0, N0, N0}),
    .rm_rx_data({rm_rx_data[1], rm_rx_data[0]})
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  trans_start_mux000011 (
    .I0(recv_we),
    .I1(retr_state_FSM_FFd1_524),
    .O(trans_start_mux0000)
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \trans_count_mux0000<9>1  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(trans_count[0]),
    .I3(recv_count[0]),
    .O(trans_count_mux0000[9])
  );
  LUT4 #(
    .INIT ( 16'hFA72 ))
  \retr_state_FSM_FFd1-In1  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(trans_rdy),
    .I2(recv_we),
    .I3(rmii_clk),
    .O(\retr_state_FSM_FFd1-In )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \trans_count_mux0000<4>11  (
    .I0(recv_rdy),
    .I1(trans_count[5]),
    .O(\trans_count_mux0000<4>11_571 )
  );
  LUT4 #(
    .INIT ( 16'h6CFF ))
  \trans_count_mux0000<4>126  (
    .I0(Madd_trans_count_addsub0000_lut[4]),
    .I1(Madd_trans_count_addsub0000_lut[5]),
    .I2(Madd_trans_count_addsub0000_cy[3]),
    .I3(recv_rdy),
    .O(\trans_count_mux0000<4>126_572 )
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \trans_count_mux0000<1>31  (
    .I0(Madd_trans_count_addsub0000_cy[3]),
    .I1(Madd_trans_count_addsub0000_lut[4]),
    .I2(Madd_trans_count_addsub0000_lut[5]),
    .I3(Madd_trans_count_addsub0000_lut[6]),
    .O(\trans_count_mux0000<1>_bdd2 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \trans_count_mux0000<1>11  (
    .I0(recv_rdy),
    .I1(trans_count[8]),
    .O(\trans_count_mux0000<1>11_561 )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \trans_count_mux0000<3>137  (
    .I0(Madd_trans_count_addsub0000_lut[6]),
    .I1(Madd_trans_count_addsub0000_cy[3]),
    .I2(Madd_trans_count_addsub0000_lut[5]),
    .I3(Madd_trans_count_addsub0000_lut[4]),
    .O(\trans_count_mux0000<3>137_567 )
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \trans_count_mux0000<1>152  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_we),
    .I2(\trans_count_mux0000<1>11_561 ),
    .I3(\trans_count_mux0000<1>125_562 ),
    .O(trans_count_mux0000[1])
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \trans_count_mux0000<4>153  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_we),
    .I2(\trans_count_mux0000<4>11_571 ),
    .I3(\trans_count_mux0000<4>126_572 ),
    .O(trans_count_mux0000[4])
  );
  LUT4 #(
    .INIT ( 16'hEA2A ))
  \trans_count_mux0000<0>1154_SW0  (
    .I0(Madd_trans_count_addsub0000_lut[9]),
    .I1(Madd_trans_count_addsub0000_lut[7]),
    .I2(Madd_trans_count_addsub0000_lut[8]),
    .I3(\trans_count_mux0000<0>156 ),
    .O(N13)
  );
  LUT4 #(
    .INIT ( 16'hFA72 ))
  \trans_count_mux0000<8>11  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(recv_we),
    .I3(recv_count[1]),
    .O(\trans_count_mux0000<8>1 )
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \trans_count_mux0000<8>12  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_we),
    .I2(recv_rdy),
    .I3(recv_count[1]),
    .O(\trans_count_mux0000<8>11_583 )
  );
  MUXF5   \trans_count_mux0000<8>1_f5  (
    .I0(\trans_count_mux0000<8>11_583 ),
    .I1(\trans_count_mux0000<8>1 ),
    .S(trans_count[1]),
    .O(trans_count_mux0000[8])
  );
  LUT4 #(
    .INIT ( 16'hFA72 ))
  \trans_count_mux0000<7>11  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(recv_we),
    .I3(recv_count[2]),
    .O(\trans_count_mux0000<7>1 )
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \trans_count_mux0000<7>12  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_we),
    .I2(recv_rdy),
    .I3(recv_count[2]),
    .O(\trans_count_mux0000<7>11_580 )
  );
  MUXF5   \trans_count_mux0000<7>1_f5  (
    .I0(\trans_count_mux0000<7>11_580 ),
    .I1(\trans_count_mux0000<7>1 ),
    .S(trans_count[2]),
    .O(trans_count_mux0000[7])
  );
  LUT4 #(
    .INIT ( 16'h7F2A ))
  \trans_count_mux0000<6>11  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(Madd_trans_count_addsub0000_cy[3]),
    .I3(recv_we),
    .O(\trans_count_mux0000<6>1 )
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  \trans_count_mux0000<6>12  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(Madd_trans_count_addsub0000_cy[3]),
    .I3(recv_we),
    .O(\trans_count_mux0000<6>11_577 )
  );
  MUXF5   \trans_count_mux0000<6>1_f5  (
    .I0(\trans_count_mux0000<6>11_577 ),
    .I1(\trans_count_mux0000<6>1 ),
    .S(trans_count[3]),
    .O(trans_count_mux0000[6])
  );
  LUT4 #(
    .INIT ( 16'h7D28 ))
  \trans_count_mux0000<5>11  (
    .I0(recv_rdy),
    .I1(Madd_trans_count_addsub0000_lut[4]),
    .I2(Madd_trans_count_addsub0000_cy[3]),
    .I3(trans_count[4]),
    .O(\trans_count_mux0000<5>1 )
  );
  MUXF5   \trans_count_mux0000<5>1_f5  (
    .I0(recv_we),
    .I1(\trans_count_mux0000<5>1 ),
    .S(retr_state_FSM_FFd1_524),
    .O(trans_count_mux0000[5])
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \trans_count_mux0000<0>1561  (
    .I0(Madd_trans_count_addsub0000_cy[3]),
    .I1(Madd_trans_count_addsub0000_lut[4]),
    .I2(Madd_trans_count_addsub0000_lut[6]),
    .I3(Madd_trans_count_addsub0000_lut[5]),
    .O(\trans_count_mux0000<0>1561_558 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \trans_count_mux0000<0>1562  (
    .I0(Madd_trans_count_addsub0000_cy[3]),
    .I1(Madd_trans_count_addsub0000_lut[5]),
    .I2(Madd_trans_count_addsub0000_lut[4]),
    .I3(Madd_trans_count_addsub0000_lut[6]),
    .O(\trans_count_mux0000<0>1562_559 )
  );
  MUXF5   \trans_count_mux0000<0>156_f5  (
    .I0(\trans_count_mux0000<0>1562_559 ),
    .I1(\trans_count_mux0000<0>1561_558 ),
    .S(Madd_trans_count_addsub0000_lut[9]),
    .O(\trans_count_mux0000<0>156 )
  );
  LUT4 #(
    .INIT ( 16'hFA72 ))
  \trans_count_mux0000<0>11871  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(recv_we),
    .I3(N13),
    .O(\trans_count_mux0000<0>1187 )
  );
  LUT4 #(
    .INIT ( 16'hE444 ))
  \trans_count_mux0000<0>11872  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_we),
    .I2(recv_rdy),
    .I3(N13),
    .O(\trans_count_mux0000<0>11871_556 )
  );
  MUXF5   \trans_count_mux0000<0>1187_f5  (
    .I0(\trans_count_mux0000<0>11871_556 ),
    .I1(\trans_count_mux0000<0>1187 ),
    .S(trans_count[9]),
    .O(trans_count_mux0000[0])
  );
  LUT4 #(
    .INIT ( 16'hFAD8 ))
  \trans_count_mux0000<3>1821  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(recv_rdy),
    .I2(recv_we),
    .I3(trans_count[6]),
    .O(\trans_count_mux0000<3>182 )
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  \trans_count_mux0000<3>1822  (
    .I0(retr_state_FSM_FFd1_524),
    .I1(trans_count[6]),
    .I2(recv_rdy),
    .I3(recv_we),
    .O(\trans_count_mux0000<3>1821_569 )
  );
  MUXF5   \trans_count_mux0000<3>182_f5  (
    .I0(\trans_count_mux0000<3>1821_569 ),
    .I1(\trans_count_mux0000<3>182 ),
    .S(\trans_count_mux0000<3>137_567 ),
    .O(trans_count_mux0000[3])
  );
  LUT4 #(
    .INIT ( 16'hE44E ))
  \trans_count_mux0000<2>21  (
    .I0(recv_rdy),
    .I1(trans_count[7]),
    .I2(Madd_trans_count_addsub0000_lut[7]),
    .I3(\trans_count_mux0000<1>_bdd2 ),
    .O(\trans_count_mux0000<2>2 )
  );
  MUXF5   \trans_count_mux0000<2>2_f5  (
    .I0(recv_we),
    .I1(\trans_count_mux0000<2>2 ),
    .S(retr_state_FSM_FFd1_524),
    .O(trans_count_mux0000[2])
  );
  LUT4_L #(
    .INIT ( 16'h9CFF ))
  \trans_count_mux0000<1>125  (
    .I0(\trans_count_mux0000<1>_bdd2 ),
    .I1(Madd_trans_count_addsub0000_lut[8]),
    .I2(Madd_trans_count_addsub0000_lut[7]),
    .I3(recv_rdy),
    .LO(\trans_count_mux0000<1>125_562 )
  );
endmodule

module jit_cont_jit_cont (
  clk, soc_out, rled, rm_tx_en_sl, rst, rm_tx_en_mst, rm_clk_mst, rm_clk_sl, rm_crs_dv_mst, rm_crs_dv_sl, soc_in, tt_soc, rm_tx_data_sl, 
rm_tx_data_mst, rm_rx_data_sl, rm_rx_data_mst
);
  input clk;
  output soc_out;
  output rled;
  output rm_tx_en_sl;
  input rst;
  output rm_tx_en_mst;
  output rm_clk_mst;
  output rm_clk_sl;
  input rm_crs_dv_mst;
  input rm_crs_dv_sl;
  output soc_in;
  output tt_soc;
  output [1 : 0] rm_tx_data_sl;
  output [1 : 0] rm_tx_data_mst;
  input [1 : 0] rm_rx_data_sl;
  input [1 : 0] rm_rx_data_mst;
  wire NlwRenamedSig_OI_rm_clk;
  wire rm_clk_not0001;
  wire rm_tx_en_mst_mux0000;
  wire rm_tx_en_sl_w;
  wire NLW_mst_to_sl_soc_is_runnig_UNCONNECTED;
  wire NLW_mst_to_sl_fast_eth_UNCONNECTED;
  wire NLW_sl_to_mst_fast_eth_UNCONNECTED;
  wire [1 : 0] rm_tx_data_mst_s;
  wire [1 : 0] rm_tx_data_sl_w;
  assign
    rm_clk_mst = NlwRenamedSig_OI_rm_clk,
    rm_clk_sl = NlwRenamedSig_OI_rm_clk;
  FDC   rm_clk (
    .C(clk),
    .CLR(rst),
    .D(rm_clk_not0001),
    .Q(NlwRenamedSig_OI_rm_clk)
  );
  FDC   rm_tx_data_mst_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_tx_data_mst_s[0]),
    .Q(rm_tx_data_mst[0])
  );
  FDC   rm_tx_data_mst_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_tx_data_mst_s[1]),
    .Q(rm_tx_data_mst[1])
  );
  FDC   rm_tx_en_mst_11 (
    .C(clk),
    .CLR(rst),
    .D(rm_tx_en_mst_mux0000),
    .Q(rm_tx_en_mst)
  );
  FDC   rm_tx_en_sl_12 (
    .C(clk),
    .CLR(rst),
    .D(rm_tx_en_sl_w),
    .Q(rm_tx_en_sl)
  );
  FDC   rm_tx_data_sl_0 (
    .C(clk),
    .CLR(rst),
    .D(rm_tx_data_sl_w[0]),
    .Q(rm_tx_data_sl[0])
  );
  FDC   rm_tx_data_sl_1 (
    .C(clk),
    .CLR(rst),
    .D(rm_tx_data_sl_w[1]),
    .Q(rm_tx_data_sl[1])
  );
  retr   sl_to_mst (
    .clk(clk),
    .rst(rst),
    .rm_tx_en(rm_tx_en_mst_mux0000),
    .fast_eth(NLW_sl_to_mst_fast_eth_UNCONNECTED),
    .rmii_clk(NlwRenamedSig_OI_rm_clk),
    .rm_crs_dv(rm_crs_dv_sl),
    .rm_tx_data({rm_tx_data_mst_s[1], rm_tx_data_mst_s[0]}),
    .rm_rx_data({rm_rx_data_sl[1], rm_rx_data_sl[0]})
  );
  retr_soc   mst_to_sl (
    .clk(clk),
    .rled(rled),
    .rst(rst),
    .soc_out_edge(soc_out),
    .rm_tx_en(rm_tx_en_sl_w),
    .soc_is_runnig(NLW_mst_to_sl_soc_is_runnig_UNCONNECTED),
    .soc_edge(soc_in),
    .fast_eth(NLW_mst_to_sl_fast_eth_UNCONNECTED),
    .rmii_clk(NlwRenamedSig_OI_rm_clk),
    .rm_crs_dv(rm_crs_dv_mst),
    .tt_soc(tt_soc),
    .rm_tx_data({rm_tx_data_sl_w[1], rm_tx_data_sl_w[0]}),
    .rm_rx_data({rm_rx_data_mst[1], rm_rx_data_mst[0]})
  );
  INV   rm_clk_not00011_INV_0 (
    .I(NlwRenamedSig_OI_rm_clk),
    .O(rm_clk_not0001)
  );
endmodule

module clk_gen (
  CLKIN_IBUFG_OUT, CLK0_OUT, CLKFX_OUT, RST_IN, CLKIN_IN
);
  output CLKIN_IBUFG_OUT;
  output CLK0_OUT;
  output CLKFX_OUT;
  input RST_IN;
  input CLKIN_IN;
  wire CLK0_BUF;
  wire NlwRenamedSig_OI_CLK0_OUT;
  wire CLKFX_BUF;
  wire NlwRenamedSig_OI_CLKIN_IBUFG_OUT;
  wire GND_BIT;
  wire NLW_DCM_SP_INST_CLK90_UNCONNECTED;
  wire NLW_DCM_SP_INST_CLK180_UNCONNECTED;
  wire NLW_DCM_SP_INST_CLK270_UNCONNECTED;
  wire NLW_DCM_SP_INST_CLK2X_UNCONNECTED;
  wire NLW_DCM_SP_INST_CLK2X180_UNCONNECTED;
  wire NLW_DCM_SP_INST_CLKDV_UNCONNECTED;
  wire NLW_DCM_SP_INST_CLKFX180_UNCONNECTED;
  wire NLW_DCM_SP_INST_LOCKED_UNCONNECTED;
  wire NLW_DCM_SP_INST_PSDONE_UNCONNECTED;
  wire \NLW_DCM_SP_INST_STATUS<7>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<6>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<5>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<4>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<3>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<2>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<1>_UNCONNECTED ;
  wire \NLW_DCM_SP_INST_STATUS<0>_UNCONNECTED ;
  assign
    CLKIN_IBUFG_OUT = NlwRenamedSig_OI_CLKIN_IBUFG_OUT,
    CLK0_OUT = NlwRenamedSig_OI_CLK0_OUT;
  GND   XST_GND (
    .G(GND_BIT)
  );
  BUFG   CLKFX_BUFG_INST (
    .I(CLKFX_BUF),
    .O(CLKFX_OUT)
  );
  IBUFG #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IOSTANDARD ( "DEFAULT" ))
  CLKIN_IBUFG_INST (
    .I(CLKIN_IN),
    .O(NlwRenamedSig_OI_CLKIN_IBUFG_OUT)
  );
  BUFG   CLK0_BUFG_INST (
    .I(CLK0_BUF),
    .O(NlwRenamedSig_OI_CLK0_OUT)
  );
  DCM_SP #(
    .CLKDV_DIVIDE ( 2.000000 ),
    .CLKFX_DIVIDE ( 1 ),
    .CLKFX_MULTIPLY ( 2 ),
    .CLKIN_DIVIDE_BY_2 ( "FALSE" ),
    .CLKIN_PERIOD ( 20.000000 ),
    .CLKOUT_PHASE_SHIFT ( "NONE" ),
    .CLK_FEEDBACK ( "1X" ),
    .DESKEW_ADJUST ( "SYSTEM_SYNCHRONOUS" ),
    .DFS_FREQUENCY_MODE ( "LOW" ),
    .DLL_FREQUENCY_MODE ( "LOW" ),
    .DSS_MODE ( "NONE" ),
    .DUTY_CYCLE_CORRECTION ( "TRUE" ),
    .PHASE_SHIFT ( 0 ),
    .STARTUP_WAIT ( "FALSE" ),
    .FACTORY_JF ( 16'hC080 ))
  DCM_SP_INST (
    .CLKIN(NlwRenamedSig_OI_CLKIN_IBUFG_OUT),
    .CLKFB(NlwRenamedSig_OI_CLK0_OUT),
    .RST(RST_IN),
    .DSSEN(GND_BIT),
    .PSINCDEC(GND_BIT),
    .PSEN(GND_BIT),
    .PSCLK(GND_BIT),
    .CLK0(CLK0_BUF),
    .CLK90(NLW_DCM_SP_INST_CLK90_UNCONNECTED),
    .CLK180(NLW_DCM_SP_INST_CLK180_UNCONNECTED),
    .CLK270(NLW_DCM_SP_INST_CLK270_UNCONNECTED),
    .CLK2X(NLW_DCM_SP_INST_CLK2X_UNCONNECTED),
    .CLK2X180(NLW_DCM_SP_INST_CLK2X180_UNCONNECTED),
    .CLKDV(NLW_DCM_SP_INST_CLKDV_UNCONNECTED),
    .CLKFX(CLKFX_BUF),
    .CLKFX180(NLW_DCM_SP_INST_CLKFX180_UNCONNECTED),
    .LOCKED(NLW_DCM_SP_INST_LOCKED_UNCONNECTED),
    .PSDONE(NLW_DCM_SP_INST_PSDONE_UNCONNECTED),
    .STATUS({\NLW_DCM_SP_INST_STATUS<7>_UNCONNECTED , \NLW_DCM_SP_INST_STATUS<6>_UNCONNECTED , \NLW_DCM_SP_INST_STATUS<5>_UNCONNECTED , 
\NLW_DCM_SP_INST_STATUS<4>_UNCONNECTED , \NLW_DCM_SP_INST_STATUS<3>_UNCONNECTED , \NLW_DCM_SP_INST_STATUS<2>_UNCONNECTED , 
\NLW_DCM_SP_INST_STATUS<1>_UNCONNECTED , \NLW_DCM_SP_INST_STATUS<0>_UNCONNECTED })
  );
endmodule

module top (
  soc_out, rled, rm_tx_en_sl, rst, rm_tx_en_mst, rm_clk_mst, clk_50, rm_clk_sl, rm_crs_dv_mst, rm_crs_dv_sl, soc_in, tt_soc, rm_tx_data_sl, 
rm_tx_data_mst, rm_rx_data_sl, rm_rx_data_mst
);
  output soc_out;
  output rled;
  output rm_tx_en_sl;
  input rst;
  output rm_tx_en_mst;
  output rm_clk_mst;
  input clk_50;
  output rm_clk_sl;
  input rm_crs_dv_mst;
  input rm_crs_dv_sl;
  output soc_in;
  output tt_soc;
  output [1 : 0] rm_tx_data_sl;
  output [1 : 0] rm_tx_data_mst;
  input [1 : 0] rm_rx_data_sl;
  input [1 : 0] rm_rx_data_mst;
  wire clk;
  wire rled_OBUF_3935;
  wire rm_clk_mst_OBUF_3937;
  wire rm_clk_sl_OBUF_3939;
  wire rm_crs_dv_mst_IBUF_3941;
  wire rm_crs_dv_sl_IBUF_3943;
  wire rm_rx_data_mst_0_IBUF_3946;
  wire rm_rx_data_mst_1_IBUF_3947;
  wire rm_rx_data_sl_0_IBUF_3950;
  wire rm_rx_data_sl_1_IBUF_3951;
  wire rm_tx_data_mst_0_OBUF_3954;
  wire rm_tx_data_mst_1_OBUF_3955;
  wire rm_tx_data_sl_0_OBUF_3958;
  wire rm_tx_data_sl_1_OBUF_3959;
  wire rm_tx_en_mst_OBUF_3961;
  wire rm_tx_en_sl_OBUF_3963;
  wire rst_IBUF_3965;
  wire soc_in_OBUF_3967;
  wire soc_out_OBUF_3969;
  wire tt_soc_OBUF_3971;
  wire NLW_pll_CLKIN_IBUFG_OUT_UNCONNECTED;
  wire NLW_pll_CLK0_OUT_UNCONNECTED;
  clk_gen   pll (
    .CLKIN_IBUFG_OUT(NLW_pll_CLKIN_IBUFG_OUT_UNCONNECTED),
    .CLK0_OUT(NLW_pll_CLK0_OUT_UNCONNECTED),
    .CLKFX_OUT(clk),
    .RST_IN(rst_IBUF_3965),
    .CLKIN_IN(clk_50)
  );
  jit_cont_jit_cont   jit_cont (
    .clk(clk),
    .soc_out(soc_out_OBUF_3969),
    .rled(rled_OBUF_3935),
    .rm_tx_en_sl(rm_tx_en_sl_OBUF_3963),
    .rst(rst_IBUF_3965),
    .rm_tx_en_mst(rm_tx_en_mst_OBUF_3961),
    .rm_clk_mst(rm_clk_mst_OBUF_3937),
    .rm_clk_sl(rm_clk_sl_OBUF_3939),
    .rm_crs_dv_mst(rm_crs_dv_mst_IBUF_3941),
    .rm_crs_dv_sl(rm_crs_dv_sl_IBUF_3943),
    .soc_in(soc_in_OBUF_3967),
    .tt_soc(tt_soc_OBUF_3971),
    .rm_tx_data_sl({rm_tx_data_sl_1_OBUF_3959, rm_tx_data_sl_0_OBUF_3958}),
    .rm_tx_data_mst({rm_tx_data_mst_1_OBUF_3955, rm_tx_data_mst_0_OBUF_3954}),
    .rm_rx_data_sl({rm_rx_data_sl_1_IBUF_3951, rm_rx_data_sl_0_IBUF_3950}),
    .rm_rx_data_mst({rm_rx_data_mst_1_IBUF_3947, rm_rx_data_mst_0_IBUF_3946})
  );
  IBUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_3965)
  );
  IBUF   rm_crs_dv_mst_IBUF (
    .I(rm_crs_dv_mst),
    .O(rm_crs_dv_mst_IBUF_3941)
  );
  IBUF   rm_crs_dv_sl_IBUF (
    .I(rm_crs_dv_sl),
    .O(rm_crs_dv_sl_IBUF_3943)
  );
  IBUF   rm_rx_data_sl_1_IBUF (
    .I(rm_rx_data_sl[1]),
    .O(rm_rx_data_sl_1_IBUF_3951)
  );
  IBUF   rm_rx_data_sl_0_IBUF (
    .I(rm_rx_data_sl[0]),
    .O(rm_rx_data_sl_0_IBUF_3950)
  );
  IBUF   rm_rx_data_mst_1_IBUF (
    .I(rm_rx_data_mst[1]),
    .O(rm_rx_data_mst_1_IBUF_3947)
  );
  IBUF   rm_rx_data_mst_0_IBUF (
    .I(rm_rx_data_mst[0]),
    .O(rm_rx_data_mst_0_IBUF_3946)
  );
  OBUF   soc_out_OBUF (
    .I(soc_out_OBUF_3969),
    .O(soc_out)
  );
  OBUF   rled_OBUF (
    .I(rled_OBUF_3935),
    .O(rled)
  );
  OBUF   rm_tx_en_sl_OBUF (
    .I(rm_tx_en_sl_OBUF_3963),
    .O(rm_tx_en_sl)
  );
  OBUF   rm_tx_en_mst_OBUF (
    .I(rm_tx_en_mst_OBUF_3961),
    .O(rm_tx_en_mst)
  );
  OBUF   rm_clk_mst_OBUF (
    .I(rm_clk_mst_OBUF_3937),
    .O(rm_clk_mst)
  );
  OBUF   rm_clk_sl_OBUF (
    .I(rm_clk_sl_OBUF_3939),
    .O(rm_clk_sl)
  );
  OBUF   soc_in_OBUF (
    .I(soc_in_OBUF_3967),
    .O(soc_in)
  );
  OBUF   tt_soc_OBUF (
    .I(tt_soc_OBUF_3971),
    .O(tt_soc)
  );
  OBUF   rm_tx_data_sl_1_OBUF (
    .I(rm_tx_data_sl_1_OBUF_3959),
    .O(rm_tx_data_sl[1])
  );
  OBUF   rm_tx_data_sl_0_OBUF (
    .I(rm_tx_data_sl_0_OBUF_3958),
    .O(rm_tx_data_sl[0])
  );
  OBUF   rm_tx_data_mst_1_OBUF (
    .I(rm_tx_data_mst_1_OBUF_3955),
    .O(rm_tx_data_mst[1])
  );
  OBUF   rm_tx_data_mst_0_OBUF (
    .I(rm_tx_data_mst_0_OBUF_3954),
    .O(rm_tx_data_mst[0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

