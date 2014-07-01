
module ACCUM_0_test_1 ( a, clk, sei_en, sezi_en, m1_sel, m2_sel, sei, sezi, 
        reset, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, test_mode, 
        scan_enable, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, 
        test_si, test_so, test_se );
  output [14:0] sei;
  output [14:0] sezi;
  input a, clk, sei_en, sezi_en, m1_sel, m2_sel, reset, scan_in0, scan_in1,
         scan_in2, scan_in3, scan_in4, test_mode, scan_enable, test_si,
         test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_so;
  wire   m1_out, cout, m2_out, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [15:0] tmp1;
  assign test_so = tmp1[15];

  INVX1 U3 ( .A(reset), .Y(n3) );
  INVX1 U4 ( .A(reset), .Y(n2) );
  INVX1 U5 ( .A(test_mode), .Y(n1) );
  XOR2X1 U6 ( .A(a), .B(m1_out), .Y(n5) );
  NOR2X1 U7 ( .A(m2_sel), .B(n6), .Y(m2_out) );
  XNOR2X1 U8 ( .A(tmp1[0]), .B(n5), .Y(n6) );
  NOR2X1 U9 ( .A(m1_sel), .B(n4), .Y(cout) );
  AOI22X1 U10 ( .A0(tmp1[0]), .A1(n5), .B0(a), .B1(m1_out), .Y(n4) );
  INVX1 U11 ( .A(n7), .Y(n9) );
  AOI22X1 U12 ( .A0(clk), .A1(test_mode), .B0(sei_en), .B1(n1), .Y(n7) );
  INVX1 U13 ( .A(n8), .Y(n10) );
  AOI22X1 U14 ( .A0(clk), .A1(test_mode), .B0(sezi_en), .B1(n1), .Y(n8) );
  SDFFRHQXL tmp1_reg_0_ ( .D(tmp1[1]), .SI(sezi[14]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[0]) );
  SDFFRHQXL m1_out_reg ( .D(cout), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        n3), .Q(m1_out) );
  SDFFRHQXL sezi_reg_13_ ( .D(tmp1[14]), .SI(sezi[12]), .SE(test_se), .CK(n10), 
        .RN(n3), .Q(sezi[13]) );
  SDFFRHQXL sezi_reg_14_ ( .D(tmp1[15]), .SI(sezi[13]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[14]) );
  SDFFRHQXL sezi_reg_12_ ( .D(tmp1[13]), .SI(sezi[11]), .SE(test_se), .CK(n10), 
        .RN(n3), .Q(sezi[12]) );
  SDFFRHQXL sezi_reg_11_ ( .D(tmp1[12]), .SI(sezi[10]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[11]) );
  SDFFRHQXL sezi_reg_10_ ( .D(tmp1[11]), .SI(sezi[9]), .SE(test_se), .CK(n10), 
        .RN(n3), .Q(sezi[10]) );
  SDFFRHQXL sezi_reg_9_ ( .D(tmp1[10]), .SI(sezi[8]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[9]) );
  SDFFRHQXL sezi_reg_8_ ( .D(tmp1[9]), .SI(sezi[7]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[8]) );
  SDFFRHQXL sezi_reg_7_ ( .D(tmp1[8]), .SI(sezi[6]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[7]) );
  SDFFRHQXL sezi_reg_6_ ( .D(tmp1[7]), .SI(sezi[5]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[6]) );
  SDFFRHQXL sezi_reg_5_ ( .D(tmp1[6]), .SI(sezi[4]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[5]) );
  SDFFRHQXL sezi_reg_4_ ( .D(tmp1[5]), .SI(sezi[3]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[4]) );
  SDFFRHQXL sezi_reg_3_ ( .D(tmp1[4]), .SI(sezi[2]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[3]) );
  SDFFRHQXL sezi_reg_2_ ( .D(tmp1[3]), .SI(sezi[1]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[2]) );
  SDFFRHQXL sezi_reg_1_ ( .D(tmp1[2]), .SI(sezi[0]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[1]) );
  SDFFRHQXL sezi_reg_0_ ( .D(tmp1[1]), .SI(sei[14]), .SE(test_se), .CK(n10), 
        .RN(n2), .Q(sezi[0]) );
  SDFFRHQXL sei_reg_12_ ( .D(tmp1[13]), .SI(sei[11]), .SE(test_se), .CK(n9), 
        .RN(n3), .Q(sei[12]) );
  SDFFRHQXL sei_reg_10_ ( .D(tmp1[11]), .SI(sei[9]), .SE(test_se), .CK(n9), 
        .RN(n3), .Q(sei[10]) );
  SDFFRHQXL sei_reg_13_ ( .D(tmp1[14]), .SI(sei[12]), .SE(test_se), .CK(n9), 
        .RN(n3), .Q(sei[13]) );
  SDFFRHQXL sei_reg_11_ ( .D(tmp1[12]), .SI(sei[10]), .SE(test_se), .CK(n9), 
        .RN(n3), .Q(sei[11]) );
  SDFFRHQXL sei_reg_14_ ( .D(tmp1[15]), .SI(sei[13]), .SE(test_se), .CK(n9), 
        .RN(n2), .Q(sei[14]) );
  SDFFRHQXL sei_reg_6_ ( .D(tmp1[7]), .SI(sei[5]), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[6]) );
  SDFFRHQXL sei_reg_8_ ( .D(tmp1[9]), .SI(sei[7]), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[8]) );
  SDFFRHQXL sei_reg_4_ ( .D(tmp1[5]), .SI(sei[3]), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[4]) );
  SDFFRHQXL sei_reg_2_ ( .D(tmp1[3]), .SI(sei[1]), .SE(test_se), .CK(n9), .RN(
        n2), .Q(sei[2]) );
  SDFFRHQXL sei_reg_1_ ( .D(tmp1[2]), .SI(sei[0]), .SE(test_se), .CK(n9), .RN(
        n2), .Q(sei[1]) );
  SDFFRHQXL sei_reg_9_ ( .D(tmp1[10]), .SI(sei[8]), .SE(test_se), .CK(n9), 
        .RN(n3), .Q(sei[9]) );
  SDFFRHQXL sei_reg_7_ ( .D(tmp1[8]), .SI(sei[6]), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[7]) );
  SDFFRHQXL sei_reg_5_ ( .D(tmp1[6]), .SI(sei[4]), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[5]) );
  SDFFRHQXL sei_reg_3_ ( .D(tmp1[4]), .SI(sei[2]), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[3]) );
  SDFFRHQXL sei_reg_0_ ( .D(tmp1[1]), .SI(m1_out), .SE(test_se), .CK(n9), .RN(
        n3), .Q(sei[0]) );
  SDFFRHQXL tmp1_reg_15_ ( .D(m2_out), .SI(tmp1[14]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[15]) );
  SDFFRHQXL tmp1_reg_14_ ( .D(tmp1[15]), .SI(tmp1[13]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[14]) );
  SDFFRHQXL tmp1_reg_13_ ( .D(tmp1[14]), .SI(tmp1[12]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[13]) );
  SDFFRHQXL tmp1_reg_12_ ( .D(tmp1[13]), .SI(tmp1[11]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[12]) );
  SDFFRHQXL tmp1_reg_11_ ( .D(tmp1[12]), .SI(tmp1[10]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[11]) );
  SDFFRHQXL tmp1_reg_10_ ( .D(tmp1[11]), .SI(tmp1[9]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[10]) );
  SDFFRHQXL tmp1_reg_9_ ( .D(tmp1[10]), .SI(tmp1[8]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[9]) );
  SDFFRHQXL tmp1_reg_8_ ( .D(tmp1[9]), .SI(tmp1[7]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[8]) );
  SDFFRHQXL tmp1_reg_7_ ( .D(tmp1[8]), .SI(tmp1[6]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[7]) );
  SDFFRHQXL tmp1_reg_6_ ( .D(tmp1[7]), .SI(tmp1[5]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[6]) );
  SDFFRHQXL tmp1_reg_5_ ( .D(tmp1[6]), .SI(tmp1[4]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[5]) );
  SDFFRHQXL tmp1_reg_4_ ( .D(tmp1[5]), .SI(tmp1[3]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[4]) );
  SDFFRHQXL tmp1_reg_3_ ( .D(tmp1[4]), .SI(tmp1[2]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[3]) );
  SDFFRHQXL tmp1_reg_2_ ( .D(tmp1[3]), .SI(tmp1[1]), .SE(test_se), .CK(clk), 
        .RN(n2), .Q(tmp1[2]) );
  SDFFRHQXL tmp1_reg_1_ ( .D(tmp1[2]), .SI(tmp1[0]), .SE(test_se), .CK(clk), 
        .RN(n3), .Q(tmp1[1]) );
endmodule

