
module FILTB_0 ( FI, DML, DMLP );
  input [2:0] FI;
  input [13:0] DML;
  output [13:0] DMLP;
  wire   DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_13_,
         DIFSX_0_, N15, N13, N12, N11, N0, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [14:12] add_0_root_sub_0_root_sub_44_carry;
  wire   [13:7] sub_1_root_sub_0_root_sub_44_carry;
  assign N0 = DML[0];

  XNOR2X1 U3 ( .A(N15), .B(add_0_root_sub_0_root_sub_44_carry[14]), .Y(
        DIFSX_13_) );
  ADDFX2 U4 ( .A(N12), .B(FI[1]), .CI(add_0_root_sub_0_root_sub_44_carry[12]), 
        .CO(add_0_root_sub_0_root_sub_44_carry[13]), .S(DIFSX_5_) );
  ADDFX2 U5 ( .A(N13), .B(FI[2]), .CI(add_0_root_sub_0_root_sub_44_carry[13]), 
        .CO(add_0_root_sub_0_root_sub_44_carry[14]), .S(DIFSX_6_) );
  INVX1 U6 ( .A(DML[9]), .Y(n4) );
  INVX1 U7 ( .A(DML[10]), .Y(n5) );
  INVX1 U8 ( .A(DML[7]), .Y(n2) );
  INVX1 U9 ( .A(DML[8]), .Y(n3) );
  INVX1 U10 ( .A(DML[11]), .Y(n6) );
  INVX1 U11 ( .A(DML[12]), .Y(n7) );
  INVX1 U12 ( .A(DML[13]), .Y(n8) );
  AND2X1 U13 ( .A(N11), .B(FI[0]), .Y(add_0_root_sub_0_root_sub_44_carry[12])
         );
  XOR2X1 U14 ( .A(FI[0]), .B(N11), .Y(DIFSX_4_) );
  AND2X1 U15 ( .A(sub_1_root_sub_0_root_sub_44_carry[13]), .B(n8), .Y(N15) );
  XOR2X1 U16 ( .A(n8), .B(sub_1_root_sub_0_root_sub_44_carry[13]), .Y(N13) );
  AND2X1 U17 ( .A(sub_1_root_sub_0_root_sub_44_carry[12]), .B(n7), .Y(
        sub_1_root_sub_0_root_sub_44_carry[13]) );
  XOR2X1 U18 ( .A(n7), .B(sub_1_root_sub_0_root_sub_44_carry[12]), .Y(N12) );
  AND2X1 U19 ( .A(sub_1_root_sub_0_root_sub_44_carry[11]), .B(n6), .Y(
        sub_1_root_sub_0_root_sub_44_carry[12]) );
  XOR2X1 U20 ( .A(n6), .B(sub_1_root_sub_0_root_sub_44_carry[11]), .Y(N11) );
  AND2X1 U21 ( .A(sub_1_root_sub_0_root_sub_44_carry[10]), .B(n5), .Y(
        sub_1_root_sub_0_root_sub_44_carry[11]) );
  XOR2X1 U22 ( .A(n5), .B(sub_1_root_sub_0_root_sub_44_carry[10]), .Y(DIFSX_3_) );
  AND2X1 U23 ( .A(sub_1_root_sub_0_root_sub_44_carry[9]), .B(n4), .Y(
        sub_1_root_sub_0_root_sub_44_carry[10]) );
  XOR2X1 U24 ( .A(n4), .B(sub_1_root_sub_0_root_sub_44_carry[9]), .Y(DIFSX_2_)
         );
  AND2X1 U25 ( .A(sub_1_root_sub_0_root_sub_44_carry[8]), .B(n3), .Y(
        sub_1_root_sub_0_root_sub_44_carry[9]) );
  XOR2X1 U26 ( .A(n3), .B(sub_1_root_sub_0_root_sub_44_carry[8]), .Y(DIFSX_1_)
         );
  AND2X1 U27 ( .A(sub_1_root_sub_0_root_sub_44_carry[7]), .B(n2), .Y(
        sub_1_root_sub_0_root_sub_44_carry[8]) );
  XOR2X1 U28 ( .A(n2), .B(sub_1_root_sub_0_root_sub_44_carry[7]), .Y(DIFSX_0_)
         );
  NOR4X1 U29 ( .A(DML[6]), .B(DML[5]), .C(DML[4]), .D(DML[3]), .Y(n1) );
  NOR4BX1 U30 ( .AN(n1), .B(DML[2]), .C(N0), .D(DML[1]), .Y(
        sub_1_root_sub_0_root_sub_44_carry[7]) );
  FILTB_0_DW01_add_1 add_60 ( .A({DIFSX_13_, DIFSX_13_, DIFSX_13_, DIFSX_13_, 
        DIFSX_13_, DIFSX_13_, DIFSX_13_, DIFSX_6_, DIFSX_5_, DIFSX_4_, 
        DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_}), .B({DML[13:1], N0}), .CI(
        1'b0), .SUM(DMLP) );
endmodule

