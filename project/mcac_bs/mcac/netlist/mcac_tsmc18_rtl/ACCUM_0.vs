
module ACCUM_0 ( a, clk, sei_en, sezi_en, m1_sel, m2_sel, sei, sezi, reset, 
        scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, test_mode, 
        scan_enable, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4 );
  output [14:0] sei;
  output [14:0] sezi;
  input a, clk, sei_en, sezi_en, m1_sel, m2_sel, reset, scan_in0, scan_in1,
         scan_in2, scan_in3, scan_in4, test_mode, scan_enable;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   m1_out, cout, m2_out, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [15:0] tmp1;

  DFFRHQX1 tmp1_reg_0_ ( .D(tmp1[1]), .CK(clk), .RN(n2), .Q(tmp1[0]) );
  DFFRHQX1 m1_out_reg ( .D(cout), .CK(clk), .RN(n3), .Q(m1_out) );
  DFFRHQX1 sezi_reg_13_ ( .D(tmp1[14]), .CK(n10), .RN(n3), .Q(sezi[13]) );
  DFFRHQX1 sezi_reg_14_ ( .D(tmp1[15]), .CK(n10), .RN(n2), .Q(sezi[14]) );
  DFFRHQX1 sezi_reg_12_ ( .D(tmp1[13]), .CK(n10), .RN(n3), .Q(sezi[12]) );
  DFFRHQX1 sezi_reg_11_ ( .D(tmp1[12]), .CK(n10), .RN(n2), .Q(sezi[11]) );
  DFFRHQX1 sezi_reg_10_ ( .D(tmp1[11]), .CK(n10), .RN(n3), .Q(sezi[10]) );
  DFFRHQX1 sezi_reg_9_ ( .D(tmp1[10]), .CK(n10), .RN(n2), .Q(sezi[9]) );
  DFFRHQX1 sezi_reg_8_ ( .D(tmp1[9]), .CK(n10), .RN(n2), .Q(sezi[8]) );
  DFFRHQX1 sezi_reg_7_ ( .D(tmp1[8]), .CK(n10), .RN(n2), .Q(sezi[7]) );
  DFFRHQX1 sezi_reg_6_ ( .D(tmp1[7]), .CK(n10), .RN(n2), .Q(sezi[6]) );
  DFFRHQX1 sezi_reg_5_ ( .D(tmp1[6]), .CK(n10), .RN(n2), .Q(sezi[5]) );
  DFFRHQX1 sezi_reg_4_ ( .D(tmp1[5]), .CK(n10), .RN(n2), .Q(sezi[4]) );
  DFFRHQX1 sezi_reg_3_ ( .D(tmp1[4]), .CK(n10), .RN(n2), .Q(sezi[3]) );
  DFFRHQX1 sezi_reg_2_ ( .D(tmp1[3]), .CK(n10), .RN(n2), .Q(sezi[2]) );
  DFFRHQX1 sezi_reg_1_ ( .D(tmp1[2]), .CK(n10), .RN(n2), .Q(sezi[1]) );
  DFFRHQX1 sezi_reg_0_ ( .D(tmp1[1]), .CK(n10), .RN(n2), .Q(sezi[0]) );
  DFFRHQX1 sei_reg_12_ ( .D(tmp1[13]), .CK(n9), .RN(n3), .Q(sei[12]) );
  DFFRHQX1 sei_reg_10_ ( .D(tmp1[11]), .CK(n9), .RN(n3), .Q(sei[10]) );
  DFFRHQX1 sei_reg_13_ ( .D(tmp1[14]), .CK(n9), .RN(n3), .Q(sei[13]) );
  DFFRHQX1 sei_reg_11_ ( .D(tmp1[12]), .CK(n9), .RN(n3), .Q(sei[11]) );
  DFFRHQX1 sei_reg_14_ ( .D(tmp1[15]), .CK(n9), .RN(n2), .Q(sei[14]) );
  DFFRHQX1 sei_reg_6_ ( .D(tmp1[7]), .CK(n9), .RN(n3), .Q(sei[6]) );
  DFFRHQX1 sei_reg_8_ ( .D(tmp1[9]), .CK(n9), .RN(n3), .Q(sei[8]) );
  DFFRHQX1 sei_reg_4_ ( .D(tmp1[5]), .CK(n9), .RN(n3), .Q(sei[4]) );
  DFFRHQX1 sei_reg_2_ ( .D(tmp1[3]), .CK(n9), .RN(n2), .Q(sei[2]) );
  DFFRHQX1 sei_reg_1_ ( .D(tmp1[2]), .CK(n9), .RN(n2), .Q(sei[1]) );
  DFFRHQX1 sei_reg_9_ ( .D(tmp1[10]), .CK(n9), .RN(n3), .Q(sei[9]) );
  DFFRHQX1 sei_reg_7_ ( .D(tmp1[8]), .CK(n9), .RN(n3), .Q(sei[7]) );
  DFFRHQX1 sei_reg_5_ ( .D(tmp1[6]), .CK(n9), .RN(n3), .Q(sei[5]) );
  DFFRHQX1 sei_reg_3_ ( .D(tmp1[4]), .CK(n9), .RN(n3), .Q(sei[3]) );
  DFFRHQX1 sei_reg_0_ ( .D(tmp1[1]), .CK(n9), .RN(n3), .Q(sei[0]) );
  DFFRHQX1 tmp1_reg_15_ ( .D(m2_out), .CK(clk), .RN(n3), .Q(tmp1[15]) );
  DFFRHQX1 tmp1_reg_14_ ( .D(tmp1[15]), .CK(clk), .RN(n2), .Q(tmp1[14]) );
  DFFRHQX1 tmp1_reg_13_ ( .D(tmp1[14]), .CK(clk), .RN(n3), .Q(tmp1[13]) );
  DFFRHQX1 tmp1_reg_12_ ( .D(tmp1[13]), .CK(clk), .RN(n2), .Q(tmp1[12]) );
  DFFRHQX1 tmp1_reg_11_ ( .D(tmp1[12]), .CK(clk), .RN(n2), .Q(tmp1[11]) );
  DFFRHQX1 tmp1_reg_10_ ( .D(tmp1[11]), .CK(clk), .RN(n3), .Q(tmp1[10]) );
  DFFRHQX1 tmp1_reg_9_ ( .D(tmp1[10]), .CK(clk), .RN(n3), .Q(tmp1[9]) );
  DFFRHQX1 tmp1_reg_8_ ( .D(tmp1[9]), .CK(clk), .RN(n2), .Q(tmp1[8]) );
  DFFRHQX1 tmp1_reg_7_ ( .D(tmp1[8]), .CK(clk), .RN(n3), .Q(tmp1[7]) );
  DFFRHQX1 tmp1_reg_6_ ( .D(tmp1[7]), .CK(clk), .RN(n2), .Q(tmp1[6]) );
  DFFRHQX1 tmp1_reg_5_ ( .D(tmp1[6]), .CK(clk), .RN(n3), .Q(tmp1[5]) );
  DFFRHQX1 tmp1_reg_4_ ( .D(tmp1[5]), .CK(clk), .RN(n2), .Q(tmp1[4]) );
  DFFRHQX1 tmp1_reg_3_ ( .D(tmp1[4]), .CK(clk), .RN(n3), .Q(tmp1[3]) );
  DFFRHQX1 tmp1_reg_2_ ( .D(tmp1[3]), .CK(clk), .RN(n2), .Q(tmp1[2]) );
  DFFRHQX1 tmp1_reg_1_ ( .D(tmp1[2]), .CK(clk), .RN(n3), .Q(tmp1[1]) );
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
endmodule

