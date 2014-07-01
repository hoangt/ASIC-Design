
module DELAY_0220_13_1_test_1 ( x, reset, y, clk, scan_enable, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4, test_si, test_se );
  input [12:0] x;
  output [12:0] y;
  input reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, test_si, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   n17, n18, n19, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n21, n22;
  wire   [12:0] delay0;
  wire   [12:0] delay1;
  wire   [12:0] delay2;
  wire   [12:0] delay3;
  wire   [12:0] delay4;
  wire   [12:0] delay5;
  wire   [12:0] delay6;

  INVX1 U3 ( .A(reset), .Y(n18) );
  INVX1 U4 ( .A(reset), .Y(n19) );
  INVX1 U6 ( .A(reset), .Y(n17) );
  SDFFRHQXL delay7_reg_12_ ( .D(delay6[12]), .SI(y[11]), .SE(test_se), .CK(clk), .RN(n19), .Q(y[12]) );
  SDFFRHQXL delay7_reg_11_ ( .D(delay6[11]), .SI(y[10]), .SE(test_se), .CK(clk), .RN(n17), .Q(y[11]) );
  SDFFRHQXL delay0_reg_0_ ( .D(x[0]), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(delay0[0]) );
  SDFFRHQXL delay0_reg_12_ ( .D(x[12]), .SI(delay0[11]), .SE(test_se), .CK(clk), .RN(n17), .Q(delay0[12]) );
  SDFFRHQXL delay0_reg_11_ ( .D(x[11]), .SI(delay0[10]), .SE(test_se), .CK(clk), .RN(n18), .Q(delay0[11]) );
  SDFFRHQXL delay0_reg_10_ ( .D(x[10]), .SI(n4), .SE(test_se), .CK(clk), .RN(
        n18), .Q(delay0[10]) );
  SDFFRHQXL delay0_reg_8_ ( .D(x[8]), .SI(delay0[7]), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(delay0[8]) );
  SDFFRHQXL delay0_reg_7_ ( .D(x[7]), .SI(delay0[6]), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay0[7]) );
  SDFFRHQXL delay0_reg_6_ ( .D(x[6]), .SI(n3), .SE(test_se), .CK(clk), .RN(n17), .Q(delay0[6]) );
  SDFFRHQXL delay0_reg_4_ ( .D(x[4]), .SI(delay0[3]), .SE(test_se), .CK(clk), 
        .RN(n18), .Q(delay0[4]) );
  SDFFRHQXL delay0_reg_3_ ( .D(x[3]), .SI(delay0[2]), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay0[3]) );
  SDFFRHQXL delay0_reg_2_ ( .D(x[2]), .SI(delay0[1]), .SE(test_se), .CK(clk), 
        .RN(n18), .Q(delay0[2]) );
  SDFFRHQXL delay0_reg_1_ ( .D(x[1]), .SI(delay0[0]), .SE(test_se), .CK(clk), 
        .RN(n18), .Q(delay0[1]) );
  SDFFRHQXL delay1_reg_12_ ( .D(delay0[12]), .SI(delay1[11]), .SE(test_se), 
        .CK(clk), .RN(n19), .Q(delay1[12]) );
  SDFFRHQXL delay2_reg_12_ ( .D(delay1[12]), .SI(delay2[11]), .SE(test_se), 
        .CK(clk), .RN(n19), .Q(delay2[12]) );
  SDFFRHQXL delay3_reg_12_ ( .D(delay2[12]), .SI(delay3[11]), .SE(test_se), 
        .CK(clk), .RN(n18), .Q(delay3[12]) );
  SDFFRHQXL delay4_reg_12_ ( .D(delay3[12]), .SI(delay4[11]), .SE(test_se), 
        .CK(clk), .RN(n19), .Q(delay4[12]) );
  SDFFRHQXL delay5_reg_12_ ( .D(delay4[12]), .SI(delay5[11]), .SE(test_se), 
        .CK(clk), .RN(n18), .Q(delay5[12]) );
  SDFFRHQXL delay6_reg_12_ ( .D(delay5[12]), .SI(delay6[11]), .SE(test_se), 
        .CK(clk), .RN(n17), .Q(delay6[12]) );
  SDFFRHQXL delay1_reg_11_ ( .D(delay0[11]), .SI(delay1[10]), .SE(test_se), 
        .CK(clk), .RN(n18), .Q(delay1[11]) );
  SDFFRHQXL delay2_reg_11_ ( .D(delay1[11]), .SI(delay2[10]), .SE(test_se), 
        .CK(clk), .RN(n17), .Q(delay2[11]) );
  SDFFRHQXL delay3_reg_11_ ( .D(delay2[11]), .SI(delay3[10]), .SE(test_se), 
        .CK(clk), .RN(n17), .Q(delay3[11]) );
  SDFFRHQXL delay4_reg_11_ ( .D(delay3[11]), .SI(delay4[10]), .SE(test_se), 
        .CK(clk), .RN(n19), .Q(delay4[11]) );
  SDFFRHQXL delay5_reg_11_ ( .D(delay4[11]), .SI(delay5[10]), .SE(test_se), 
        .CK(clk), .RN(n19), .Q(delay5[11]) );
  SDFFRHQXL delay6_reg_11_ ( .D(delay5[11]), .SI(delay6[10]), .SE(test_se), 
        .CK(clk), .RN(n18), .Q(delay6[11]) );
  SDFFRHQXL delay1_reg_10_ ( .D(delay0[10]), .SI(n6), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(delay1[10]) );
  SDFFRHQXL delay2_reg_10_ ( .D(delay1[10]), .SI(n8), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay2[10]) );
  SDFFRHQXL delay3_reg_10_ ( .D(delay2[10]), .SI(n10), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(delay3[10]) );
  SDFFRHQXL delay4_reg_10_ ( .D(delay3[10]), .SI(n12), .SE(test_se), .CK(clk), 
        .RN(n18), .Q(delay4[10]) );
  SDFFRHQXL delay5_reg_10_ ( .D(delay4[10]), .SI(n14), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay5[10]) );
  SDFFRHQXL delay6_reg_10_ ( .D(delay5[10]), .SI(n16), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(delay6[10]) );
  SDFFRHQXL delay1_reg_8_ ( .D(delay0[8]), .SI(delay1[7]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay1[8]) );
  SDFFRHQXL delay2_reg_8_ ( .D(delay1[8]), .SI(delay2[7]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay2[8]) );
  SDFFRHQXL delay3_reg_8_ ( .D(delay2[8]), .SI(delay3[7]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay3[8]) );
  SDFFRHQXL delay4_reg_8_ ( .D(delay3[8]), .SI(delay4[7]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay4[8]) );
  SDFFRHQXL delay5_reg_8_ ( .D(delay4[8]), .SI(delay5[7]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay5[8]) );
  SDFFRHQXL delay6_reg_8_ ( .D(delay5[8]), .SI(delay6[7]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay6[8]) );
  SDFFRHQXL delay1_reg_7_ ( .D(delay0[7]), .SI(delay1[6]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay1[7]) );
  SDFFRHQXL delay2_reg_7_ ( .D(delay1[7]), .SI(delay2[6]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay2[7]) );
  SDFFRHQXL delay3_reg_7_ ( .D(delay2[7]), .SI(delay3[6]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay3[7]) );
  SDFFRHQXL delay4_reg_7_ ( .D(delay3[7]), .SI(delay4[6]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay4[7]) );
  SDFFRHQXL delay5_reg_7_ ( .D(delay4[7]), .SI(delay5[6]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay5[7]) );
  SDFFRHQXL delay6_reg_7_ ( .D(delay5[7]), .SI(delay6[6]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay6[7]) );
  SDFFRHQXL delay1_reg_6_ ( .D(delay0[6]), .SI(n5), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay1[6]) );
  SDFFRHQXL delay2_reg_6_ ( .D(delay1[6]), .SI(n7), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay2[6]) );
  SDFFRHQXL delay3_reg_6_ ( .D(delay2[6]), .SI(n9), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay3[6]) );
  SDFFRHQXL delay4_reg_6_ ( .D(delay3[6]), .SI(n11), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay4[6]) );
  SDFFRHQXL delay5_reg_6_ ( .D(delay4[6]), .SI(n13), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay5[6]) );
  SDFFRHQXL delay6_reg_6_ ( .D(delay5[6]), .SI(n15), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(delay6[6]) );
  SDFFRHQXL delay1_reg_4_ ( .D(delay0[4]), .SI(delay1[3]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay1[4]) );
  SDFFRHQXL delay2_reg_4_ ( .D(delay1[4]), .SI(delay2[3]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay2[4]) );
  SDFFRHQXL delay3_reg_4_ ( .D(delay2[4]), .SI(delay3[3]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay3[4]) );
  SDFFRHQXL delay4_reg_4_ ( .D(delay3[4]), .SI(delay4[3]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay4[4]) );
  SDFFRHQXL delay5_reg_4_ ( .D(delay4[4]), .SI(delay5[3]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay5[4]) );
  SDFFRHQXL delay6_reg_4_ ( .D(delay5[4]), .SI(delay6[3]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay6[4]) );
  SDFFRHQXL delay1_reg_3_ ( .D(delay0[3]), .SI(delay1[2]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay1[3]) );
  SDFFRHQXL delay2_reg_3_ ( .D(delay1[3]), .SI(delay2[2]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay2[3]) );
  SDFFRHQXL delay3_reg_3_ ( .D(delay2[3]), .SI(delay3[2]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay3[3]) );
  SDFFRHQXL delay4_reg_3_ ( .D(delay3[3]), .SI(delay4[2]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay4[3]) );
  SDFFRHQXL delay5_reg_3_ ( .D(delay4[3]), .SI(delay5[2]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay5[3]) );
  SDFFRHQXL delay6_reg_3_ ( .D(delay5[3]), .SI(delay6[2]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay6[3]) );
  SDFFRHQXL delay1_reg_2_ ( .D(delay0[2]), .SI(delay1[1]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay1[2]) );
  SDFFRHQXL delay2_reg_2_ ( .D(delay1[2]), .SI(delay2[1]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay2[2]) );
  SDFFRHQXL delay3_reg_2_ ( .D(delay2[2]), .SI(delay3[1]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay3[2]) );
  SDFFRHQXL delay4_reg_2_ ( .D(delay3[2]), .SI(delay4[1]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay4[2]) );
  SDFFRHQXL delay5_reg_2_ ( .D(delay4[2]), .SI(delay5[1]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay5[2]) );
  SDFFRHQXL delay6_reg_2_ ( .D(delay5[2]), .SI(delay6[1]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay6[2]) );
  SDFFRHQXL delay1_reg_1_ ( .D(delay0[1]), .SI(delay1[0]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay1[1]) );
  SDFFRHQXL delay2_reg_1_ ( .D(delay1[1]), .SI(delay2[0]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay2[1]) );
  SDFFRHQXL delay3_reg_1_ ( .D(delay2[1]), .SI(delay3[0]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay3[1]) );
  SDFFRHQXL delay4_reg_1_ ( .D(delay3[1]), .SI(delay4[0]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay4[1]) );
  SDFFRHQXL delay5_reg_1_ ( .D(delay4[1]), .SI(delay5[0]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay5[1]) );
  SDFFRHQXL delay6_reg_1_ ( .D(delay5[1]), .SI(delay6[0]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay6[1]) );
  SDFFRHQXL delay1_reg_0_ ( .D(delay0[0]), .SI(delay0[12]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay1[0]) );
  SDFFRHQXL delay2_reg_0_ ( .D(delay1[0]), .SI(delay1[12]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(delay2[0]) );
  SDFFRHQXL delay3_reg_0_ ( .D(delay2[0]), .SI(delay2[12]), .SE(test_se), .CK(
        clk), .RN(n18), .Q(delay3[0]) );
  SDFFRHQXL delay4_reg_0_ ( .D(delay3[0]), .SI(delay3[12]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay4[0]) );
  SDFFRHQXL delay5_reg_0_ ( .D(delay4[0]), .SI(delay4[12]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay5[0]) );
  SDFFRHQXL delay6_reg_0_ ( .D(delay5[0]), .SI(delay5[12]), .SE(test_se), .CK(
        clk), .RN(n17), .Q(delay6[0]) );
  SDFFSXL delay6_reg_9_ ( .D(delay5[9]), .SI(delay6[8]), .SE(test_se), .CK(clk), .SN(n18), .Q(delay6[9]), .QN(n16) );
  SDFFSXL delay6_reg_5_ ( .D(delay5[5]), .SI(delay6[4]), .SE(test_se), .CK(clk), .SN(n18), .Q(delay6[5]), .QN(n15) );
  SDFFSXL delay5_reg_9_ ( .D(delay4[9]), .SI(delay5[8]), .SE(test_se), .CK(clk), .SN(n19), .Q(delay5[9]), .QN(n14) );
  SDFFSXL delay5_reg_5_ ( .D(delay4[5]), .SI(delay5[4]), .SE(test_se), .CK(clk), .SN(n17), .Q(delay5[5]), .QN(n13) );
  SDFFSXL delay4_reg_9_ ( .D(delay3[9]), .SI(delay4[8]), .SE(test_se), .CK(clk), .SN(n17), .Q(delay4[9]), .QN(n12) );
  SDFFSXL delay4_reg_5_ ( .D(delay3[5]), .SI(delay4[4]), .SE(test_se), .CK(clk), .SN(n18), .Q(delay4[5]), .QN(n11) );
  SDFFSXL delay3_reg_9_ ( .D(delay2[9]), .SI(delay3[8]), .SE(test_se), .CK(clk), .SN(n19), .Q(delay3[9]), .QN(n10) );
  SDFFSXL delay3_reg_5_ ( .D(delay2[5]), .SI(delay3[4]), .SE(test_se), .CK(clk), .SN(n19), .Q(delay3[5]), .QN(n9) );
  SDFFSXL delay2_reg_9_ ( .D(delay1[9]), .SI(delay2[8]), .SE(test_se), .CK(clk), .SN(n17), .Q(delay2[9]), .QN(n8) );
  SDFFSXL delay2_reg_5_ ( .D(delay1[5]), .SI(delay2[4]), .SE(test_se), .CK(clk), .SN(n19), .Q(delay2[5]), .QN(n7) );
  SDFFSXL delay1_reg_9_ ( .D(delay0[9]), .SI(delay1[8]), .SE(test_se), .CK(clk), .SN(n18), .Q(delay1[9]), .QN(n6) );
  SDFFSXL delay1_reg_5_ ( .D(delay0[5]), .SI(delay1[4]), .SE(test_se), .CK(clk), .SN(n18), .Q(delay1[5]), .QN(n5) );
  SDFFSXL delay0_reg_9_ ( .D(x[9]), .SI(delay0[8]), .SE(test_se), .CK(clk), 
        .SN(n19), .Q(delay0[9]), .QN(n4) );
  SDFFSXL delay0_reg_5_ ( .D(x[5]), .SI(delay0[4]), .SE(test_se), .CK(clk), 
        .SN(n17), .Q(delay0[5]), .QN(n3) );
  SDFFRHQX2 delay7_reg_1_ ( .D(delay6[1]), .SI(y[0]), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(y[1]) );
  SDFFRHQX2 delay7_reg_6_ ( .D(delay6[6]), .SI(n21), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(y[6]) );
  SDFFRHQX1 delay7_reg_10_ ( .D(delay6[10]), .SI(n22), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(y[10]) );
  SDFFRHQX1 delay7_reg_8_ ( .D(delay6[8]), .SI(y[7]), .SE(test_se), .CK(clk), 
        .RN(n18), .Q(y[8]) );
  SDFFRHQX2 delay7_reg_7_ ( .D(delay6[7]), .SI(y[6]), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(y[7]) );
  SDFFRHQX2 delay7_reg_0_ ( .D(delay6[0]), .SI(delay6[12]), .SE(test_se), .CK(
        clk), .RN(n19), .Q(y[0]) );
  SDFFRHQX1 delay7_reg_2_ ( .D(delay6[2]), .SI(y[1]), .SE(test_se), .CK(clk), 
        .RN(n17), .Q(y[2]) );
  SDFFRHQX1 delay7_reg_3_ ( .D(delay6[3]), .SI(y[2]), .SE(test_se), .CK(clk), 
        .RN(n18), .Q(y[3]) );
  SDFFSX1 delay7_reg_9_ ( .D(delay6[9]), .SI(y[8]), .SE(test_se), .CK(clk), 
        .SN(n17), .Q(y[9]), .QN(n22) );
  SDFFRHQX1 delay7_reg_4_ ( .D(delay6[4]), .SI(y[3]), .SE(test_se), .CK(clk), 
        .RN(n19), .Q(y[4]) );
  SDFFSX1 delay7_reg_5_ ( .D(delay6[5]), .SI(y[4]), .SE(test_se), .CK(clk), 
        .SN(n18), .Q(y[5]), .QN(n21) );
endmodule

