
module FILTE_1 ( YUP, YL, YLP );
  input [12:0] YUP;
  input [18:0] YL;
  output [18:0] YLP;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N14, N13, N12, N11, N10, N1, N0,
         DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_,
         DIFSX_2_, DIFSX_1_, DIFSX_18_, DIFSX_12_, DIFSX_11_, DIFSX_10_,
         DIFSX_0_, n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;
  wire   [18:6] sub_51_carry;

  INVX1 U4 ( .A(YL[7]), .Y(n3) );
  INVX1 U5 ( .A(YL[8]), .Y(n5) );
  INVX1 U7 ( .A(YL[9]), .Y(n6) );
  INVXL U9 ( .A(YL[10]), .Y(n7) );
  INVXL U10 ( .A(YL[18]), .Y(n15) );
  INVXL U11 ( .A(YL[17]), .Y(n14) );
  INVXL U12 ( .A(YL[16]), .Y(n13) );
  INVXL U13 ( .A(YL[14]), .Y(n11) );
  INVX1 U14 ( .A(N14), .Y(N13) );
  INVXL U16 ( .A(YL[15]), .Y(n12) );
  INVXL U17 ( .A(YL[13]), .Y(n10) );
  AND2X1 U18 ( .A(sub_51_carry[18]), .B(n15), .Y(N14) );
  XOR2X1 U19 ( .A(n15), .B(sub_51_carry[18]), .Y(N12) );
  AND2X1 U20 ( .A(sub_51_carry[17]), .B(n14), .Y(sub_51_carry[18]) );
  XOR2X1 U21 ( .A(n14), .B(sub_51_carry[17]), .Y(N11) );
  AND2X1 U22 ( .A(sub_51_carry[16]), .B(n13), .Y(sub_51_carry[17]) );
  XOR2X1 U23 ( .A(n13), .B(sub_51_carry[16]), .Y(N10) );
  AND2X1 U24 ( .A(sub_51_carry[15]), .B(n12), .Y(sub_51_carry[16]) );
  XOR2X1 U25 ( .A(n12), .B(sub_51_carry[15]), .Y(N9) );
  AND2X1 U26 ( .A(sub_51_carry[14]), .B(n11), .Y(sub_51_carry[15]) );
  XOR2X1 U27 ( .A(n11), .B(sub_51_carry[14]), .Y(N8) );
  AND2X1 U28 ( .A(sub_51_carry[13]), .B(n10), .Y(sub_51_carry[14]) );
  XOR2X1 U29 ( .A(n10), .B(sub_51_carry[13]), .Y(N7) );
  AND2X1 U30 ( .A(sub_51_carry[12]), .B(n9), .Y(sub_51_carry[13]) );
  XOR2X1 U31 ( .A(n9), .B(sub_51_carry[12]), .Y(N6) );
  AND2X1 U32 ( .A(sub_51_carry[11]), .B(n8), .Y(sub_51_carry[12]) );
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
  INVX1 U2 ( .A(YL[11]), .Y(n8) );
  FILTE_1_DW01_add_0 add_51 ( .A({1'b0, 1'b0, 1'b0, YUP}), .B({1'b0, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, DIFSX_18_, 
        DIFSX_12_, DIFSX_11_, DIFSX_10_, DIFSX_9_, DIFSX_8_, DIFSX_7_, 
        DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_})
         );
  FILTE_1_DW01_add_1 add_56 ( .A(YL), .B({DIFSX_18_, DIFSX_18_, DIFSX_18_, 
        DIFSX_18_, DIFSX_18_, DIFSX_18_, DIFSX_12_, DIFSX_11_, DIFSX_10_, 
        DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_, 
        DIFSX_2_, DIFSX_1_, DIFSX_0_}), .CI(1'b0), .SUM(YLP) );
  INVX1 U1 ( .A(YL[6]), .Y(n2) );
  INVX1 U3 ( .A(YL[12]), .Y(n9) );
endmodule

