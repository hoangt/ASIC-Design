
module SUBTA_1 ( SL, SE, D );
  input [13:0] SL;
  input [14:0] SE;
  output [15:0] D;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N16, N15, N14, N13, N12, N11, N10, N1,
         N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, SYNOPSYS_UNCONNECTED__0;
  assign N0 = SE[0];

  XOR2X1 U3 ( .A(n11), .B(n5), .Y(N12) );
  XOR2X1 U4 ( .A(n17), .B(n2), .Y(N6) );
  INVX1 U5 ( .A(SE[4]), .Y(n19) );
  INVX1 U6 ( .A(SE[2]), .Y(n21) );
  INVX1 U7 ( .A(SE[6]), .Y(n17) );
  INVX1 U8 ( .A(SE[8]), .Y(n15) );
  INVX1 U9 ( .A(SE[10]), .Y(n13) );
  INVX1 U10 ( .A(SE[12]), .Y(n11) );
  INVX1 U11 ( .A(SE[14]), .Y(n9) );
  NOR2X1 U12 ( .A(n16), .B(SE[7]), .Y(n3) );
  XOR2XL U13 ( .A(n19), .B(n1), .Y(N4) );
  XOR2XL U14 ( .A(n13), .B(n4), .Y(N10) );
  XOR2XL U15 ( .A(n21), .B(n7), .Y(N2) );
  NAND2XL U16 ( .A(n6), .B(n9), .Y(n8) );
  XOR2XL U17 ( .A(N0), .B(SE[1]), .Y(N1) );
  INVX1 U18 ( .A(n8), .Y(N16) );
  NAND2X1 U19 ( .A(n7), .B(n21), .Y(n20) );
  NAND2X1 U20 ( .A(n1), .B(n19), .Y(n18) );
  NAND2X1 U21 ( .A(n2), .B(n17), .Y(n16) );
  NAND2X1 U22 ( .A(n3), .B(n15), .Y(n14) );
  NAND2X1 U23 ( .A(n4), .B(n13), .Y(n12) );
  NAND2X1 U24 ( .A(n5), .B(n11), .Y(n10) );
  XOR2X1 U25 ( .A(n9), .B(n6), .Y(N14) );
  XOR2X1 U26 ( .A(n15), .B(n3), .Y(N8) );
  NOR2BX1 U27 ( .AN(n8), .B(SE[14]), .Y(N15) );
  NOR2X1 U28 ( .A(n20), .B(SE[3]), .Y(n1) );
  NOR2X1 U29 ( .A(n18), .B(SE[5]), .Y(n2) );
  NOR2X1 U30 ( .A(n14), .B(SE[9]), .Y(n4) );
  NOR2X1 U31 ( .A(n12), .B(SE[11]), .Y(n5) );
  NOR2X1 U32 ( .A(n10), .B(SE[13]), .Y(n6) );
  NOR2X1 U33 ( .A(N0), .B(SE[1]), .Y(n7) );
  XOR2X1 U34 ( .A(n10), .B(SE[13]), .Y(N13) );
  XOR2X1 U35 ( .A(n14), .B(SE[9]), .Y(N9) );
  XOR2X1 U36 ( .A(n16), .B(SE[7]), .Y(N7) );
  XOR2X1 U37 ( .A(n12), .B(SE[11]), .Y(N11) );
  XOR2X1 U38 ( .A(n18), .B(SE[5]), .Y(N5) );
  XOR2X1 U39 ( .A(n20), .B(SE[3]), .Y(N3) );
  SUBTA_1_DW01_add_2 add_0_root_sub_0_root_sub_59 ( .A({N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 
        SL[13], SL[13], SL}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, D}) );
endmodule

