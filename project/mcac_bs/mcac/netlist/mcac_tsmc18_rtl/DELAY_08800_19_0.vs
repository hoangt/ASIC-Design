
module DELAY_08800_19_0 ( x, reset, y, clk, scan_enable, scan_in0, scan_in1, 
        scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, 
        scan_out3, scan_out4 );
  input [18:0] x;
  output [18:0] y;
  input reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   n24, n25, n1, n18, n19, n20, n21, n22, n23;
  wire   [18:0] delay0;
  wire   [18:0] delay1;
  wire   [18:0] delay2;
  wire   [18:0] delay3;
  wire   [18:0] delay4;
  wire   [18:0] delay5;
  wire   [18:0] delay6;

  DFFRHQX4 delay7_reg_17_ ( .D(delay6[17]), .CK(clk), .RN(n22), .Q(y[17]) );
  DFFRHQX4 delay7_reg_16_ ( .D(delay6[16]), .CK(clk), .RN(n23), .Q(y[16]) );
  DFFRHQX4 delay7_reg_13_ ( .D(delay6[13]), .CK(clk), .RN(n23), .Q(y[13]) );
  DFFRHQX4 delay7_reg_12_ ( .D(delay6[12]), .CK(clk), .RN(n19), .Q(n25) );
  DFFRHQX4 delay7_reg_10_ ( .D(delay6[10]), .CK(clk), .RN(n22), .Q(y[10]) );
  DFFRHQX4 delay7_reg_9_ ( .D(delay6[9]), .CK(clk), .RN(n22), .Q(y[9]) );
  DFFRHQX4 delay7_reg_8_ ( .D(delay6[8]), .CK(clk), .RN(n21), .Q(y[8]) );
  DFFRHQX4 delay7_reg_7_ ( .D(delay6[7]), .CK(clk), .RN(n21), .Q(y[7]) );
  DFFRHQX4 delay7_reg_6_ ( .D(delay6[6]), .CK(clk), .RN(n21), .Q(y[6]) );
  DFFRHQX1 delay7_reg_4_ ( .D(delay6[4]), .CK(clk), .RN(n20), .Q(y[4]) );
  DFFRHQX1 delay7_reg_5_ ( .D(delay6[5]), .CK(clk), .RN(n20), .Q(y[5]) );
  DFFRHQX1 delay7_reg_3_ ( .D(delay6[3]), .CK(clk), .RN(n20), .Q(y[3]) );
  DFFRHQX1 delay7_reg_2_ ( .D(delay6[2]), .CK(clk), .RN(n19), .Q(y[2]) );
  DFFRHQX1 delay7_reg_1_ ( .D(delay6[1]), .CK(clk), .RN(n21), .Q(y[1]) );
  DFFRHQX1 delay7_reg_0_ ( .D(delay6[0]), .CK(clk), .RN(n22), .Q(y[0]) );
  DFFSX1 delay0_reg_15_ ( .D(x[15]), .CK(clk), .SN(n18), .Q(delay0[15]) );
  DFFSX1 delay0_reg_11_ ( .D(x[11]), .CK(clk), .SN(n20), .Q(delay0[11]) );
  DFFRHQX1 delay0_reg_18_ ( .D(x[18]), .CK(clk), .RN(n18), .Q(delay0[18]) );
  DFFRHQX1 delay0_reg_17_ ( .D(x[17]), .CK(clk), .RN(n22), .Q(delay0[17]) );
  DFFRHQX1 delay0_reg_16_ ( .D(x[16]), .CK(clk), .RN(n23), .Q(delay0[16]) );
  DFFRHQX1 delay0_reg_14_ ( .D(x[14]), .CK(clk), .RN(n23), .Q(delay0[14]) );
  DFFRHQX1 delay0_reg_13_ ( .D(x[13]), .CK(clk), .RN(n20), .Q(delay0[13]) );
  DFFRHQX1 delay0_reg_12_ ( .D(x[12]), .CK(clk), .RN(n19), .Q(delay0[12]) );
  DFFRHQX1 delay0_reg_10_ ( .D(x[10]), .CK(clk), .RN(n21), .Q(delay0[10]) );
  DFFRHQX1 delay0_reg_9_ ( .D(x[9]), .CK(clk), .RN(n18), .Q(delay0[9]) );
  DFFRHQX1 delay0_reg_8_ ( .D(x[8]), .CK(clk), .RN(n22), .Q(delay0[8]) );
  DFFRHQX1 delay0_reg_7_ ( .D(x[7]), .CK(clk), .RN(n19), .Q(delay0[7]) );
  DFFRHQX1 delay0_reg_6_ ( .D(x[6]), .CK(clk), .RN(n23), .Q(delay0[6]) );
  DFFRHQX1 delay0_reg_5_ ( .D(x[5]), .CK(clk), .RN(n20), .Q(delay0[5]) );
  DFFRHQX1 delay0_reg_4_ ( .D(x[4]), .CK(clk), .RN(n19), .Q(delay0[4]) );
  DFFRHQX1 delay0_reg_3_ ( .D(x[3]), .CK(clk), .RN(n20), .Q(delay0[3]) );
  DFFRHQX1 delay0_reg_2_ ( .D(x[2]), .CK(clk), .RN(n19), .Q(delay0[2]) );
  DFFRHQX1 delay0_reg_1_ ( .D(x[1]), .CK(clk), .RN(n21), .Q(delay0[1]) );
  DFFRHQX1 delay0_reg_0_ ( .D(x[0]), .CK(clk), .RN(n18), .Q(delay0[0]) );
  DFFSX1 delay1_reg_15_ ( .D(delay0[15]), .CK(clk), .SN(n22), .Q(delay1[15])
         );
  DFFSX1 delay2_reg_15_ ( .D(delay1[15]), .CK(clk), .SN(n19), .Q(delay2[15])
         );
  DFFSX1 delay3_reg_15_ ( .D(delay2[15]), .CK(clk), .SN(n18), .Q(delay3[15])
         );
  DFFSX1 delay4_reg_15_ ( .D(delay3[15]), .CK(clk), .SN(n18), .Q(delay4[15])
         );
  DFFSX1 delay5_reg_15_ ( .D(delay4[15]), .CK(clk), .SN(n22), .Q(delay5[15])
         );
  DFFSX1 delay6_reg_15_ ( .D(delay5[15]), .CK(clk), .SN(n18), .Q(delay6[15])
         );
  DFFSX1 delay1_reg_11_ ( .D(delay0[11]), .CK(clk), .SN(n23), .Q(delay1[11])
         );
  DFFSX1 delay2_reg_11_ ( .D(delay1[11]), .CK(clk), .SN(n20), .Q(delay2[11])
         );
  DFFSX1 delay3_reg_11_ ( .D(delay2[11]), .CK(clk), .SN(n18), .Q(delay3[11])
         );
  DFFSX1 delay4_reg_11_ ( .D(delay3[11]), .CK(clk), .SN(n22), .Q(delay4[11])
         );
  DFFSX1 delay5_reg_11_ ( .D(delay4[11]), .CK(clk), .SN(n18), .Q(delay5[11])
         );
  DFFSX1 delay6_reg_11_ ( .D(delay5[11]), .CK(clk), .SN(n18), .Q(delay6[11])
         );
  DFFRHQX1 delay2_reg_3_ ( .D(delay1[3]), .CK(clk), .RN(n19), .Q(delay2[3]) );
  DFFRHQX1 delay5_reg_3_ ( .D(delay4[3]), .CK(clk), .RN(n19), .Q(delay5[3]) );
  DFFRHQX1 delay6_reg_3_ ( .D(delay5[3]), .CK(clk), .RN(n19), .Q(delay6[3]) );
  DFFRHQX1 delay1_reg_2_ ( .D(delay0[2]), .CK(clk), .RN(n19), .Q(delay1[2]) );
  DFFRHQX1 delay2_reg_2_ ( .D(delay1[2]), .CK(clk), .RN(n19), .Q(delay2[2]) );
  DFFRHQX1 delay4_reg_2_ ( .D(delay3[2]), .CK(clk), .RN(n19), .Q(delay4[2]) );
  DFFRHQX1 delay5_reg_2_ ( .D(delay4[2]), .CK(clk), .RN(n19), .Q(delay5[2]) );
  DFFRHQX1 delay1_reg_1_ ( .D(delay0[1]), .CK(clk), .RN(n18), .Q(delay1[1]) );
  DFFRHQX1 delay2_reg_1_ ( .D(delay1[1]), .CK(clk), .RN(n19), .Q(delay2[1]) );
  DFFRHQX1 delay3_reg_1_ ( .D(delay2[1]), .CK(clk), .RN(n19), .Q(delay3[1]) );
  DFFRHQX1 delay4_reg_1_ ( .D(delay3[1]), .CK(clk), .RN(n18), .Q(delay4[1]) );
  DFFRHQX1 delay5_reg_1_ ( .D(delay4[1]), .CK(clk), .RN(n19), .Q(delay5[1]) );
  DFFRHQX1 delay6_reg_1_ ( .D(delay5[1]), .CK(clk), .RN(n18), .Q(delay6[1]) );
  DFFRHQX1 delay1_reg_0_ ( .D(delay0[0]), .CK(clk), .RN(n19), .Q(delay1[0]) );
  DFFRHQX1 delay3_reg_0_ ( .D(delay2[0]), .CK(clk), .RN(n19), .Q(delay3[0]) );
  DFFRHQX1 delay4_reg_0_ ( .D(delay3[0]), .CK(clk), .RN(n18), .Q(delay4[0]) );
  DFFRHQX1 delay5_reg_0_ ( .D(delay4[0]), .CK(clk), .RN(n18), .Q(delay5[0]) );
  DFFRHQX1 delay6_reg_0_ ( .D(delay5[0]), .CK(clk), .RN(n18), .Q(delay6[0]) );
  DFFRHQX1 delay1_reg_18_ ( .D(delay0[18]), .CK(clk), .RN(n23), .Q(delay1[18])
         );
  DFFRHQX1 delay2_reg_18_ ( .D(delay1[18]), .CK(clk), .RN(n22), .Q(delay2[18])
         );
  DFFRHQX1 delay3_reg_18_ ( .D(delay2[18]), .CK(clk), .RN(n22), .Q(delay3[18])
         );
  DFFRHQX1 delay4_reg_18_ ( .D(delay3[18]), .CK(clk), .RN(n23), .Q(delay4[18])
         );
  DFFRHQX1 delay5_reg_18_ ( .D(delay4[18]), .CK(clk), .RN(n20), .Q(delay5[18])
         );
  DFFRHQX1 delay6_reg_18_ ( .D(delay5[18]), .CK(clk), .RN(n19), .Q(delay6[18])
         );
  DFFRHQX1 delay1_reg_17_ ( .D(delay0[17]), .CK(clk), .RN(n21), .Q(delay1[17])
         );
  DFFRHQX1 delay2_reg_17_ ( .D(delay1[17]), .CK(clk), .RN(n18), .Q(delay2[17])
         );
  DFFRHQX1 delay3_reg_17_ ( .D(delay2[17]), .CK(clk), .RN(n21), .Q(delay3[17])
         );
  DFFRHQX1 delay4_reg_17_ ( .D(delay3[17]), .CK(clk), .RN(n20), .Q(delay4[17])
         );
  DFFRHQX1 delay5_reg_17_ ( .D(delay4[17]), .CK(clk), .RN(n19), .Q(delay5[17])
         );
  DFFRHQX1 delay6_reg_17_ ( .D(delay5[17]), .CK(clk), .RN(n21), .Q(delay6[17])
         );
  DFFRHQX1 delay1_reg_16_ ( .D(delay0[16]), .CK(clk), .RN(n18), .Q(delay1[16])
         );
  DFFRHQX1 delay2_reg_16_ ( .D(delay1[16]), .CK(clk), .RN(n20), .Q(delay2[16])
         );
  DFFRHQX1 delay3_reg_16_ ( .D(delay2[16]), .CK(clk), .RN(n18), .Q(delay3[16])
         );
  DFFRHQX1 delay4_reg_16_ ( .D(delay3[16]), .CK(clk), .RN(n18), .Q(delay4[16])
         );
  DFFRHQX1 delay5_reg_16_ ( .D(delay4[16]), .CK(clk), .RN(n20), .Q(delay5[16])
         );
  DFFRHQX1 delay6_reg_16_ ( .D(delay5[16]), .CK(clk), .RN(n19), .Q(delay6[16])
         );
  DFFRHQX1 delay1_reg_14_ ( .D(delay0[14]), .CK(clk), .RN(n21), .Q(delay1[14])
         );
  DFFRHQX1 delay2_reg_14_ ( .D(delay1[14]), .CK(clk), .RN(n23), .Q(delay2[14])
         );
  DFFRHQX1 delay3_reg_14_ ( .D(delay2[14]), .CK(clk), .RN(n23), .Q(delay3[14])
         );
  DFFRHQX1 delay4_reg_14_ ( .D(delay3[14]), .CK(clk), .RN(n23), .Q(delay4[14])
         );
  DFFRHQX1 delay5_reg_14_ ( .D(delay4[14]), .CK(clk), .RN(n23), .Q(delay5[14])
         );
  DFFRHQX1 delay6_reg_14_ ( .D(delay5[14]), .CK(clk), .RN(n23), .Q(delay6[14])
         );
  DFFRHQX1 delay1_reg_13_ ( .D(delay0[13]), .CK(clk), .RN(n23), .Q(delay1[13])
         );
  DFFRHQX1 delay2_reg_13_ ( .D(delay1[13]), .CK(clk), .RN(n23), .Q(delay2[13])
         );
  DFFRHQX1 delay3_reg_13_ ( .D(delay2[13]), .CK(clk), .RN(n23), .Q(delay3[13])
         );
  DFFRHQX1 delay4_reg_13_ ( .D(delay3[13]), .CK(clk), .RN(n23), .Q(delay4[13])
         );
  DFFRHQX1 delay5_reg_13_ ( .D(delay4[13]), .CK(clk), .RN(n23), .Q(delay5[13])
         );
  DFFRHQX1 delay6_reg_13_ ( .D(delay5[13]), .CK(clk), .RN(n23), .Q(delay6[13])
         );
  DFFRHQX1 delay1_reg_12_ ( .D(delay0[12]), .CK(clk), .RN(n18), .Q(delay1[12])
         );
  DFFRHQX1 delay2_reg_12_ ( .D(delay1[12]), .CK(clk), .RN(n23), .Q(delay2[12])
         );
  DFFRHQX1 delay3_reg_12_ ( .D(delay2[12]), .CK(clk), .RN(n19), .Q(delay3[12])
         );
  DFFRHQX1 delay4_reg_12_ ( .D(delay3[12]), .CK(clk), .RN(n20), .Q(delay4[12])
         );
  DFFRHQX1 delay5_reg_12_ ( .D(delay4[12]), .CK(clk), .RN(n22), .Q(delay5[12])
         );
  DFFRHQX1 delay6_reg_12_ ( .D(delay5[12]), .CK(clk), .RN(n19), .Q(delay6[12])
         );
  DFFRHQX1 delay1_reg_10_ ( .D(delay0[10]), .CK(clk), .RN(n23), .Q(delay1[10])
         );
  DFFRHQX1 delay2_reg_10_ ( .D(delay1[10]), .CK(clk), .RN(n19), .Q(delay2[10])
         );
  DFFRHQX1 delay3_reg_10_ ( .D(delay2[10]), .CK(clk), .RN(n20), .Q(delay3[10])
         );
  DFFRHQX1 delay4_reg_10_ ( .D(delay3[10]), .CK(clk), .RN(n22), .Q(delay4[10])
         );
  DFFRHQX1 delay5_reg_10_ ( .D(delay4[10]), .CK(clk), .RN(n21), .Q(delay5[10])
         );
  DFFRHQX1 delay6_reg_10_ ( .D(delay5[10]), .CK(clk), .RN(n23), .Q(delay6[10])
         );
  DFFRHQX1 delay1_reg_9_ ( .D(delay0[9]), .CK(clk), .RN(n22), .Q(delay1[9]) );
  DFFRHQX1 delay2_reg_9_ ( .D(delay1[9]), .CK(clk), .RN(n22), .Q(delay2[9]) );
  DFFRHQX1 delay3_reg_9_ ( .D(delay2[9]), .CK(clk), .RN(n22), .Q(delay3[9]) );
  DFFRHQX1 delay4_reg_9_ ( .D(delay3[9]), .CK(clk), .RN(n22), .Q(delay4[9]) );
  DFFRHQX1 delay5_reg_9_ ( .D(delay4[9]), .CK(clk), .RN(n22), .Q(delay5[9]) );
  DFFRHQX1 delay6_reg_9_ ( .D(delay5[9]), .CK(clk), .RN(n22), .Q(delay6[9]) );
  DFFRHQX1 delay1_reg_8_ ( .D(delay0[8]), .CK(clk), .RN(n22), .Q(delay1[8]) );
  DFFRHQX1 delay2_reg_8_ ( .D(delay1[8]), .CK(clk), .RN(n22), .Q(delay2[8]) );
  DFFRHQX1 delay3_reg_8_ ( .D(delay2[8]), .CK(clk), .RN(n22), .Q(delay3[8]) );
  DFFRHQX1 delay4_reg_8_ ( .D(delay3[8]), .CK(clk), .RN(n22), .Q(delay4[8]) );
  DFFRHQX1 delay5_reg_8_ ( .D(delay4[8]), .CK(clk), .RN(n20), .Q(delay5[8]) );
  DFFRHQX1 delay6_reg_8_ ( .D(delay5[8]), .CK(clk), .RN(n22), .Q(delay6[8]) );
  DFFRHQX1 delay1_reg_7_ ( .D(delay0[7]), .CK(clk), .RN(n18), .Q(delay1[7]) );
  DFFRHQX1 delay2_reg_7_ ( .D(delay1[7]), .CK(clk), .RN(n23), .Q(delay2[7]) );
  DFFRHQX1 delay3_reg_7_ ( .D(delay2[7]), .CK(clk), .RN(n19), .Q(delay3[7]) );
  DFFRHQX1 delay4_reg_7_ ( .D(delay3[7]), .CK(clk), .RN(n21), .Q(delay4[7]) );
  DFFRHQX1 delay5_reg_7_ ( .D(delay4[7]), .CK(clk), .RN(n20), .Q(delay5[7]) );
  DFFRHQX1 delay6_reg_7_ ( .D(delay5[7]), .CK(clk), .RN(n22), .Q(delay6[7]) );
  DFFRHQX1 delay1_reg_6_ ( .D(delay0[6]), .CK(clk), .RN(n21), .Q(delay1[6]) );
  DFFRHQX1 delay2_reg_6_ ( .D(delay1[6]), .CK(clk), .RN(n18), .Q(delay2[6]) );
  DFFRHQX1 delay3_reg_6_ ( .D(delay2[6]), .CK(clk), .RN(n23), .Q(delay3[6]) );
  DFFRHQX1 delay4_reg_6_ ( .D(delay3[6]), .CK(clk), .RN(n21), .Q(delay4[6]) );
  DFFRHQX1 delay5_reg_6_ ( .D(delay4[6]), .CK(clk), .RN(n19), .Q(delay5[6]) );
  DFFRHQX1 delay6_reg_6_ ( .D(delay5[6]), .CK(clk), .RN(n21), .Q(delay6[6]) );
  DFFRHQX1 delay1_reg_5_ ( .D(delay0[5]), .CK(clk), .RN(n21), .Q(delay1[5]) );
  DFFRHQX1 delay2_reg_5_ ( .D(delay1[5]), .CK(clk), .RN(n21), .Q(delay2[5]) );
  DFFRHQX1 delay3_reg_5_ ( .D(delay2[5]), .CK(clk), .RN(n21), .Q(delay3[5]) );
  DFFRHQX1 delay4_reg_5_ ( .D(delay3[5]), .CK(clk), .RN(n21), .Q(delay4[5]) );
  DFFRHQX1 delay5_reg_5_ ( .D(delay4[5]), .CK(clk), .RN(n20), .Q(delay5[5]) );
  DFFRHQX1 delay6_reg_5_ ( .D(delay5[5]), .CK(clk), .RN(n21), .Q(delay6[5]) );
  DFFRHQX1 delay1_reg_4_ ( .D(delay0[4]), .CK(clk), .RN(n20), .Q(delay1[4]) );
  DFFRHQX1 delay2_reg_4_ ( .D(delay1[4]), .CK(clk), .RN(n21), .Q(delay2[4]) );
  DFFRHQX1 delay3_reg_4_ ( .D(delay2[4]), .CK(clk), .RN(n21), .Q(delay3[4]) );
  DFFRHQX1 delay4_reg_4_ ( .D(delay3[4]), .CK(clk), .RN(n20), .Q(delay4[4]) );
  DFFRHQX1 delay5_reg_4_ ( .D(delay4[4]), .CK(clk), .RN(n20), .Q(delay5[4]) );
  DFFRHQX1 delay6_reg_4_ ( .D(delay5[4]), .CK(clk), .RN(n20), .Q(delay6[4]) );
  DFFRHQX1 delay1_reg_3_ ( .D(delay0[3]), .CK(clk), .RN(n20), .Q(delay1[3]) );
  DFFRHQX1 delay3_reg_3_ ( .D(delay2[3]), .CK(clk), .RN(n21), .Q(delay3[3]) );
  DFFRHQX1 delay4_reg_3_ ( .D(delay3[3]), .CK(clk), .RN(n20), .Q(delay4[3]) );
  DFFRHQX1 delay3_reg_2_ ( .D(delay2[2]), .CK(clk), .RN(n20), .Q(delay3[2]) );
  DFFRHQX1 delay6_reg_2_ ( .D(delay5[2]), .CK(clk), .RN(n20), .Q(delay6[2]) );
  DFFRHQX1 delay2_reg_0_ ( .D(delay1[0]), .CK(clk), .RN(n20), .Q(delay2[0]) );
  DFFRHQX2 delay7_reg_18_ ( .D(delay6[18]), .CK(clk), .RN(n20), .Q(y[18]) );
  DFFRHQX4 delay7_reg_14_ ( .D(delay6[14]), .CK(clk), .RN(n23), .Q(y[14]) );
  DFFSHQX1 delay7_reg_15_ ( .D(delay6[15]), .CK(clk), .SN(n21), .Q(n24) );
  DFFSHQX2 delay7_reg_11_ ( .D(delay6[11]), .CK(clk), .SN(n18), .Q(y[11]) );
  CLKBUFX8 U3 ( .A(n24), .Y(y[15]) );
  INVX4 U4 ( .A(n25), .Y(n1) );
  CLKINVX8 U5 ( .A(n1), .Y(y[12]) );
  INVX1 U6 ( .A(reset), .Y(n20) );
  INVX1 U7 ( .A(reset), .Y(n21) );
  INVX1 U8 ( .A(reset), .Y(n22) );
  INVX1 U9 ( .A(reset), .Y(n23) );
  INVX1 U10 ( .A(reset), .Y(n19) );
  INVX1 U11 ( .A(reset), .Y(n18) );
endmodule

