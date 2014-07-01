
module FILTE_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [13:2] carry;

  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U3 ( .A(B[13]), .B(carry[13]), .Y(SUM[13]) );
endmodule


module FILTE_0_DW01_add_1 ( A, B, CI, SUM, CO );
  input [18:0] A;
  input [18:0] B;
  output [18:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [18:2] carry;

  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFXL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X2 U1_18 ( .A(A[18]), .B(B[18]), .C(carry[18]), .Y(SUM[18]) );
  ADDFXL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFXL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FILTE_0 ( YUP, YL, YLP );
  input [12:0] YUP;
  input [18:0] YL;
  output [18:0] YLP;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N14, N13, N12, N11, N10, N1, N0,
         DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_,
         DIFSX_2_, DIFSX_1_, DIFSX_18_, DIFSX_12_, DIFSX_11_, DIFSX_10_,
         DIFSX_0_, n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15;
  wire   [18:6] sub_51_carry;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  FILTE_0_DW01_add_0 add_51 ( .A({1'b0, 1'b0, 1'b0, YUP}), .B({1'b0, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, DIFSX_18_, 
        DIFSX_12_, DIFSX_11_, DIFSX_10_, DIFSX_9_, DIFSX_8_, DIFSX_7_, 
        DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_})
         );
  FILTE_0_DW01_add_1 add_56 ( .A(YL), .B({DIFSX_18_, DIFSX_18_, DIFSX_18_, 
        DIFSX_18_, DIFSX_18_, DIFSX_18_, DIFSX_12_, DIFSX_11_, DIFSX_10_, 
        DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, 
        DIFSX_2_, DIFSX_1_, DIFSX_0_}), .CI(1'b0), .SUM(YLP) );
  NOR2BX1 U3 ( .AN(sub_51_carry[11]), .B(YL[11]), .Y(sub_51_carry[12]) );
  NOR2BX1 U4 ( .AN(sub_51_carry[13]), .B(YL[13]), .Y(sub_51_carry[14]) );
  NOR2BX1 U5 ( .AN(sub_51_carry[15]), .B(YL[15]), .Y(sub_51_carry[16]) );
  INVXL U7 ( .A(YL[8]), .Y(n5) );
  INVX1 U8 ( .A(YL[10]), .Y(n7) );
  INVX1 U9 ( .A(YL[11]), .Y(n8) );
  INVX1 U10 ( .A(YL[12]), .Y(n9) );
  INVX1 U11 ( .A(YL[13]), .Y(n10) );
  INVX1 U12 ( .A(YL[14]), .Y(n11) );
  INVX1 U13 ( .A(YL[16]), .Y(n13) );
  INVX1 U14 ( .A(YL[7]), .Y(n3) );
  INVX1 U15 ( .A(N14), .Y(N13) );
  INVXL U16 ( .A(YL[6]), .Y(n2) );
  INVXL U17 ( .A(YL[9]), .Y(n6) );
  INVXL U18 ( .A(YL[17]), .Y(n14) );
  INVXL U19 ( .A(YL[15]), .Y(n12) );
  INVXL U20 ( .A(YL[18]), .Y(n15) );
  AND2X1 U21 ( .A(sub_51_carry[18]), .B(n15), .Y(N14) );
  XOR2X1 U22 ( .A(n15), .B(sub_51_carry[18]), .Y(N12) );
  AND2X1 U23 ( .A(sub_51_carry[17]), .B(n14), .Y(sub_51_carry[18]) );
  XOR2X1 U24 ( .A(n14), .B(sub_51_carry[17]), .Y(N11) );
  AND2X1 U25 ( .A(sub_51_carry[16]), .B(n13), .Y(sub_51_carry[17]) );
  XOR2X1 U26 ( .A(n13), .B(sub_51_carry[16]), .Y(N10) );
  XOR2X1 U27 ( .A(n12), .B(sub_51_carry[15]), .Y(N9) );
  AND2X1 U28 ( .A(sub_51_carry[14]), .B(n11), .Y(sub_51_carry[15]) );
  XOR2X1 U29 ( .A(n11), .B(sub_51_carry[14]), .Y(N8) );
  XOR2X1 U30 ( .A(n10), .B(sub_51_carry[13]), .Y(N7) );
  AND2X1 U31 ( .A(sub_51_carry[12]), .B(n9), .Y(sub_51_carry[13]) );
  XOR2X1 U32 ( .A(n9), .B(sub_51_carry[12]), .Y(N6) );
  XOR2X1 U33 ( .A(n8), .B(sub_51_carry[11]), .Y(N5) );
  AND2X1 U34 ( .A(sub_51_carry[10]), .B(n7), .Y(sub_51_carry[11]) );
  XOR2X1 U35 ( .A(n7), .B(sub_51_carry[10]), .Y(N4) );
  AND2X1 U36 ( .A(sub_51_carry[9]), .B(n6), .Y(sub_51_carry[10]) );
  XOR2X1 U37 ( .A(n6), .B(sub_51_carry[9]), .Y(N3) );
  AND2X1 U38 ( .A(sub_51_carry[8]), .B(n5), .Y(sub_51_carry[9]) );
  XOR2X1 U39 ( .A(n5), .B(sub_51_carry[8]), .Y(N2) );
  AND2X1 U40 ( .A(sub_51_carry[7]), .B(n3), .Y(sub_51_carry[8]) );
  XOR2X1 U41 ( .A(n3), .B(sub_51_carry[7]), .Y(N1) );
  AND2X1 U42 ( .A(sub_51_carry[6]), .B(n2), .Y(sub_51_carry[7]) );
  XOR2X1 U43 ( .A(n2), .B(sub_51_carry[6]), .Y(N0) );
  NOR3X1 U44 ( .A(YL[3]), .B(YL[5]), .C(YL[4]), .Y(n1) );
  NOR4BX1 U45 ( .AN(n1), .B(YL[2]), .C(YL[0]), .D(YL[1]), .Y(sub_51_carry[6])
         );
endmodule

