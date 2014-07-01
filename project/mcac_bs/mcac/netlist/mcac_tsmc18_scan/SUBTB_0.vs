
module SUBTB_0 ( DL, DLN, Y );
  input [10:0] DL;
  output [11:0] DLN;
  input [12:0] Y;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N12, N11, N10, N1, N0, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, SYNOPSYS_UNCONNECTED__0;
  assign N0 = Y[2];

  INVX1 U3 ( .A(N11), .Y(N12) );
  NOR2XL U4 ( .A(Y[5]), .B(n8), .Y(n1) );
  XOR2XL U5 ( .A(n8), .B(Y[5]), .Y(N3) );
  INVX1 U6 ( .A(N0), .Y(n10) );
  NOR2XL U7 ( .A(Y[8]), .B(n6), .Y(n2) );
  NAND2BX1 U8 ( .AN(Y[3]), .B(n10), .Y(n9) );
  NAND2BX1 U9 ( .AN(Y[6]), .B(n1), .Y(n7) );
  NAND2BX1 U10 ( .AN(Y[9]), .B(n2), .Y(n5) );
  XNOR2X1 U11 ( .A(Y[9]), .B(n2), .Y(N7) );
  XOR2XL U12 ( .A(n5), .B(Y[10]), .Y(N8) );
  XOR2XL U13 ( .A(n4), .B(Y[11]), .Y(N9) );
  OR2X2 U14 ( .A(Y[4]), .B(n9), .Y(n8) );
  OR2XL U15 ( .A(Y[7]), .B(n7), .Y(n6) );
  OR2XL U16 ( .A(Y[10]), .B(n5), .Y(n4) );
  OR2XL U17 ( .A(Y[11]), .B(n4), .Y(n3) );
  XOR2XL U18 ( .A(n3), .B(Y[12]), .Y(N10) );
  XNOR2X1 U19 ( .A(Y[3]), .B(n10), .Y(N1) );
  XOR2XL U20 ( .A(n6), .B(Y[8]), .Y(N6) );
  XOR2XL U21 ( .A(n7), .B(Y[7]), .Y(N5) );
  XOR2X1 U22 ( .A(n9), .B(Y[4]), .Y(N2) );
  XNOR2X1 U23 ( .A(Y[6]), .B(n1), .Y(N4) );
  OR2XL U24 ( .A(Y[12]), .B(n3), .Y(N11) );
  SUBTB_0_DW01_add_2 add_0_root_sub_0_root_sub_45 ( .A({N12, N11, N10, N9, N8, 
        N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 1'b0, DL}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, DLN}) );
endmodule

