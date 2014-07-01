
module FILTA_0 ( FI, DMS, DMSP );
  input [2:0] FI;
  input [11:0] DMS;
  output [11:0] DMSP;
  wire   DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_11_,
         DIFSX_0_, N9, N13, N11, N10, N0, n1, n2, n3, n4, n5, n6, n7, n8,
         SYNOPSYS_UNCONNECTED__0;
  wire   [12:10] add_0_root_sub_0_root_sub_64_carry;
  wire   [11:5] sub_1_root_sub_0_root_sub_64_carry;
  assign N0 = DMS[0];

  XNOR2X1 U3 ( .A(N13), .B(add_0_root_sub_0_root_sub_64_carry[12]), .Y(
        DIFSX_11_) );
  ADDFX2 U4 ( .A(N10), .B(FI[1]), .CI(add_0_root_sub_0_root_sub_64_carry[10]), 
        .CO(add_0_root_sub_0_root_sub_64_carry[11]), .S(DIFSX_5_) );
  ADDFX2 U5 ( .A(N11), .B(FI[2]), .CI(add_0_root_sub_0_root_sub_64_carry[11]), 
        .CO(add_0_root_sub_0_root_sub_64_carry[12]), .S(DIFSX_6_) );
  INVX1 U6 ( .A(DMS[5]), .Y(n2) );
  INVX1 U7 ( .A(DMS[7]), .Y(n4) );
  INVX1 U8 ( .A(DMS[8]), .Y(n5) );
  INVX1 U9 ( .A(DMS[9]), .Y(n6) );
  INVX1 U10 ( .A(DMS[10]), .Y(n7) );
  INVX1 U11 ( .A(DMS[6]), .Y(n3) );
  INVX1 U12 ( .A(DMS[11]), .Y(n8) );
  AND2X1 U13 ( .A(N9), .B(FI[0]), .Y(add_0_root_sub_0_root_sub_64_carry[10])
         );
  XOR2X1 U14 ( .A(FI[0]), .B(N9), .Y(DIFSX_4_) );
  AND2X1 U15 ( .A(sub_1_root_sub_0_root_sub_64_carry[11]), .B(n8), .Y(N13) );
  XOR2X1 U16 ( .A(n8), .B(sub_1_root_sub_0_root_sub_64_carry[11]), .Y(N11) );
  AND2X1 U17 ( .A(sub_1_root_sub_0_root_sub_64_carry[10]), .B(n7), .Y(
        sub_1_root_sub_0_root_sub_64_carry[11]) );
  XOR2X1 U18 ( .A(n7), .B(sub_1_root_sub_0_root_sub_64_carry[10]), .Y(N10) );
  AND2X1 U19 ( .A(sub_1_root_sub_0_root_sub_64_carry[9]), .B(n6), .Y(
        sub_1_root_sub_0_root_sub_64_carry[10]) );
  XOR2X1 U20 ( .A(n6), .B(sub_1_root_sub_0_root_sub_64_carry[9]), .Y(N9) );
  AND2X1 U21 ( .A(sub_1_root_sub_0_root_sub_64_carry[8]), .B(n5), .Y(
        sub_1_root_sub_0_root_sub_64_carry[9]) );
  XOR2X1 U22 ( .A(n5), .B(sub_1_root_sub_0_root_sub_64_carry[8]), .Y(DIFSX_3_)
         );
  AND2X1 U23 ( .A(sub_1_root_sub_0_root_sub_64_carry[7]), .B(n4), .Y(
        sub_1_root_sub_0_root_sub_64_carry[8]) );
  XOR2X1 U24 ( .A(n4), .B(sub_1_root_sub_0_root_sub_64_carry[7]), .Y(DIFSX_2_)
         );
  AND2X1 U25 ( .A(sub_1_root_sub_0_root_sub_64_carry[6]), .B(n3), .Y(
        sub_1_root_sub_0_root_sub_64_carry[7]) );
  XOR2X1 U26 ( .A(n3), .B(sub_1_root_sub_0_root_sub_64_carry[6]), .Y(DIFSX_1_)
         );
  AND2X1 U27 ( .A(sub_1_root_sub_0_root_sub_64_carry[5]), .B(n2), .Y(
        sub_1_root_sub_0_root_sub_64_carry[6]) );
  XOR2X1 U28 ( .A(n2), .B(sub_1_root_sub_0_root_sub_64_carry[5]), .Y(DIFSX_0_)
         );
  NOR2X1 U29 ( .A(DMS[4]), .B(DMS[3]), .Y(n1) );
  NOR4BX1 U30 ( .AN(n1), .B(DMS[1]), .C(N0), .D(DMS[2]), .Y(
        sub_1_root_sub_0_root_sub_64_carry[5]) );
  FILTA_0_DW01_add_1 add_80 ( .A({1'b0, DIFSX_11_, DIFSX_11_, DIFSX_11_, 
        DIFSX_11_, DIFSX_11_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, 
        DIFSX_1_, DIFSX_0_}), .B({1'b0, DMS[11:1], N0}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED__0, DMSP}) );
endmodule

