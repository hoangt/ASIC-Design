
module SUBTB_1 ( DL, DLN, Y );
  input [10:0] DL;
  output [11:0] DLN;
  input [12:0] Y;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N12, N11, N10, N1, N0, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         SYNOPSYS_UNCONNECTED__0;
  assign N0 = Y[2];

  INVX1 U4 ( .A(n8), .Y(n11) );
  NAND2BX1 U6 ( .AN(Y[9]), .B(n13), .Y(n7) );
  XNOR2X2 U7 ( .A(Y[12]), .B(n10), .Y(N10) );
  NAND2BXL U8 ( .AN(Y[12]), .B(n10), .Y(N11) );
  INVX1 U9 ( .A(N0), .Y(n19) );
  INVX1 U10 ( .A(n1), .Y(n18) );
  NAND2BX1 U11 ( .AN(Y[3]), .B(n19), .Y(n1) );
  INVX1 U12 ( .A(n9), .Y(n10) );
  NAND2BX1 U13 ( .AN(Y[11]), .B(n11), .Y(n9) );
  INVX1 U14 ( .A(n7), .Y(n12) );
  INVX1 U15 ( .A(n6), .Y(n13) );
  NAND2BX1 U16 ( .AN(Y[8]), .B(n14), .Y(n6) );
  INVX1 U17 ( .A(n5), .Y(n14) );
  INVX1 U18 ( .A(n4), .Y(n15) );
  NAND2BX1 U19 ( .AN(Y[6]), .B(n16), .Y(n4) );
  NAND2BX1 U20 ( .AN(Y[10]), .B(n12), .Y(n8) );
  INVX1 U21 ( .A(n3), .Y(n16) );
  NAND2BX1 U22 ( .AN(Y[5]), .B(n17), .Y(n3) );
  INVX1 U23 ( .A(n2), .Y(n17) );
  NAND2BX1 U24 ( .AN(Y[4]), .B(n18), .Y(n2) );
  XNOR2X1 U25 ( .A(Y[11]), .B(n11), .Y(N9) );
  XNOR2X1 U26 ( .A(Y[9]), .B(n13), .Y(N7) );
  XNOR2X1 U27 ( .A(Y[8]), .B(n14), .Y(N6) );
  XNOR2X1 U28 ( .A(Y[10]), .B(n12), .Y(N8) );
  INVX1 U29 ( .A(N11), .Y(N12) );
  XNOR2X1 U30 ( .A(Y[6]), .B(n16), .Y(N4) );
  XNOR2X1 U31 ( .A(Y[4]), .B(n18), .Y(N2) );
  XNOR2X1 U32 ( .A(Y[3]), .B(n19), .Y(N1) );
  XNOR2X1 U33 ( .A(Y[5]), .B(n17), .Y(N3) );
  SUBTB_1_DW01_add_5 add_0_root_sub_0_root_sub_45 ( .A({N12, N11, N10, N9, N8, 
        N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 1'b0, DL}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, DLN}) );
  NAND2BX2 U1 ( .AN(Y[7]), .B(n15), .Y(n5) );
  XNOR2X1 U2 ( .A(Y[7]), .B(n15), .Y(N5) );
endmodule

