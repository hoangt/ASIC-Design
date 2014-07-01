
module FILTC_0 ( AX, AP, APP );
  input [9:0] AP;
  output [9:0] APP;
  input AX;
  wire   DIFSX_9_, DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_,
         N9, N11, N0, n1, n2, n3, n4, n5, n6, n7;
  wire   [9:4] sub_1_root_sub_0_root_sub_68_carry;
  assign N0 = AP[0];

  NAND2XL U3 ( .A(N9), .B(AX), .Y(n1) );
  NOR4XL U4 ( .A(AP[3]), .B(AP[2]), .C(AP[1]), .D(N0), .Y(
        sub_1_root_sub_0_root_sub_68_carry[4]) );
  INVXL U5 ( .A(AP[7]), .Y(n5) );
  INVXL U6 ( .A(AP[4]), .Y(n2) );
  INVXL U7 ( .A(AP[5]), .Y(n3) );
  INVXL U8 ( .A(AP[6]), .Y(n4) );
  XOR2X1 U9 ( .A(N11), .B(n1), .Y(DIFSX_9_) );
  INVXL U11 ( .A(AP[9]), .Y(n7) );
  XOR2X1 U12 ( .A(AX), .B(N9), .Y(DIFSX_5_) );
  AND2X1 U13 ( .A(n7), .B(sub_1_root_sub_0_root_sub_68_carry[9]), .Y(N11) );
  XOR2X1 U14 ( .A(n7), .B(sub_1_root_sub_0_root_sub_68_carry[9]), .Y(N9) );
  AND2X1 U15 ( .A(sub_1_root_sub_0_root_sub_68_carry[8]), .B(n6), .Y(
        sub_1_root_sub_0_root_sub_68_carry[9]) );
  XOR2X1 U16 ( .A(n6), .B(sub_1_root_sub_0_root_sub_68_carry[8]), .Y(DIFSX_4_)
         );
  AND2X1 U17 ( .A(sub_1_root_sub_0_root_sub_68_carry[7]), .B(n5), .Y(
        sub_1_root_sub_0_root_sub_68_carry[8]) );
  XOR2X1 U18 ( .A(n5), .B(sub_1_root_sub_0_root_sub_68_carry[7]), .Y(DIFSX_3_)
         );
  AND2X1 U19 ( .A(sub_1_root_sub_0_root_sub_68_carry[6]), .B(n4), .Y(
        sub_1_root_sub_0_root_sub_68_carry[7]) );
  XOR2X1 U20 ( .A(n4), .B(sub_1_root_sub_0_root_sub_68_carry[6]), .Y(DIFSX_2_)
         );
  AND2X1 U21 ( .A(sub_1_root_sub_0_root_sub_68_carry[5]), .B(n3), .Y(
        sub_1_root_sub_0_root_sub_68_carry[6]) );
  XOR2X1 U22 ( .A(n3), .B(sub_1_root_sub_0_root_sub_68_carry[5]), .Y(DIFSX_1_)
         );
  AND2X1 U23 ( .A(sub_1_root_sub_0_root_sub_68_carry[4]), .B(n2), .Y(
        sub_1_root_sub_0_root_sub_68_carry[5]) );
  XOR2X1 U24 ( .A(n2), .B(sub_1_root_sub_0_root_sub_68_carry[4]), .Y(DIFSX_0_)
         );
  INVX1 U1 ( .A(AP[8]), .Y(n6) );
  FILTC_0_DW01_add_1 add_88 ( .A({DIFSX_9_, DIFSX_9_, DIFSX_9_, DIFSX_9_, 
        DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_}), .B({
        AP[9:1], N0}), .CI(1'b0), .SUM(APP) );
endmodule

