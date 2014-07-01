
module FILTC_1 ( AX, AP, APP );
  input [9:0] AP;
  output [9:0] APP;
  input AX;
  wire   DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_, N0, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  assign N0 = AP[0];

  XOR2X2 U3 ( .A(AX), .B(n8), .Y(DIFSX_5_) );
  NAND2X1 U4 ( .A(AX), .B(n8), .Y(n1) );
  XOR2X1 U5 ( .A(n7), .B(n3), .Y(n8) );
  NOR2XL U6 ( .A(n13), .B(AP[4]), .Y(n4) );
  NOR2XL U7 ( .A(AP[3]), .B(AP[2]), .Y(n5) );
  XOR2XL U8 ( .A(n11), .B(AP[6]), .Y(DIFSX_2_) );
  XOR2XL U9 ( .A(n13), .B(AP[4]), .Y(DIFSX_0_) );
  INVXL U10 ( .A(AP[5]), .Y(n12) );
  XOR2XL U11 ( .A(n10), .B(AP[7]), .Y(DIFSX_3_) );
  XOR2XL U12 ( .A(n9), .B(AP[8]), .Y(DIFSX_4_) );
  OR2XL U13 ( .A(n10), .B(AP[7]), .Y(n9) );
  OR2XL U14 ( .A(n11), .B(AP[6]), .Y(n10) );
  NAND2X1 U15 ( .A(n3), .B(n7), .Y(n2) );
  AND2X4 U16 ( .A(n1), .B(n2), .Y(n14) );
  NOR2XL U17 ( .A(n9), .B(AP[8]), .Y(n3) );
  INVXL U18 ( .A(AP[9]), .Y(n7) );
  NAND2X1 U19 ( .A(n4), .B(n12), .Y(n11) );
  XOR2X1 U20 ( .A(n12), .B(n4), .Y(DIFSX_1_) );
  NAND2X1 U21 ( .A(n6), .B(n5), .Y(n13) );
  NOR2X1 U22 ( .A(AP[1]), .B(N0), .Y(n6) );
  FILTC_1_DW01_add_3 add_88 ( .A({n14, n14, n14, n14, DIFSX_5_, DIFSX_4_, 
        DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_}), .B({AP[9:1], N0}), .CI(1'b0), 
        .SUM(APP) );
endmodule

