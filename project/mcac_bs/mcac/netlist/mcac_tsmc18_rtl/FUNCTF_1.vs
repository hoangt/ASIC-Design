
module FUNCTF_1 ( I, RATE, FI );
  input [4:0] I;
  input [1:0] RATE;
  output [2:0] FI;
  wire   n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n1, n2, n3, n4,
         FI_1_, n6, n7, n8, n9, n10, n11, n12;
  assign FI[1] = FI_1_;

  AND2X2 U19 ( .A(RATE[1]), .B(n4), .Y(n24) );
  AND2X2 U25 ( .A(RATE[1]), .B(RATE[0]), .Y(n38) );
  DLY1X1 U2 ( .A(I[2]), .Y(n3) );
  DLY1X1 U3 ( .A(I[0]), .Y(n1) );
  INVX1 U4 ( .A(I[1]), .Y(n2) );
  INVX1 U5 ( .A(n37), .Y(n9) );
  XOR2XL U6 ( .A(n2), .B(n10), .Y(n21) );
  XOR2XL U7 ( .A(n1), .B(n3), .Y(n23) );
  AOI31XL U8 ( .A0(n12), .A1(n9), .A2(n19), .B0(n8), .Y(n18) );
  AOI33XL U9 ( .A0(n20), .A1(n21), .A2(n11), .B0(n22), .B1(n23), .B2(n24), .Y(
        n17) );
  XOR2X1 U10 ( .A(I[1]), .B(n3), .Y(n22) );
  INVX1 U11 ( .A(I[3]), .Y(n10) );
  AOI22X1 U12 ( .A0(n35), .A1(n36), .B0(n37), .B1(n7), .Y(n32) );
  OAI21XL U13 ( .A0(n35), .A1(n36), .B0(n9), .Y(n34) );
  INVX1 U14 ( .A(n35), .Y(n7) );
  INVX1 U15 ( .A(n33), .Y(n12) );
  XOR2XL U16 ( .A(n2), .B(I[4]), .Y(n35) );
  XOR2XL U17 ( .A(n1), .B(I[4]), .Y(n36) );
  XNOR2XL U18 ( .A(n3), .B(I[4]), .Y(n33) );
  XOR2XL U20 ( .A(n10), .B(I[4]), .Y(n37) );
  INVX1 U21 ( .A(n28), .Y(n11) );
  INVX1 U22 ( .A(n27), .Y(n8) );
  NAND2X1 U23 ( .A(n17), .B(n18), .Y(FI[2]) );
  NAND4X1 U24 ( .A(n28), .B(n27), .C(n29), .D(n30), .Y(FI[0]) );
  AOI22X1 U26 ( .A0(n19), .A1(n31), .B0(n24), .B1(n23), .Y(n30) );
  NAND3X1 U27 ( .A(n20), .B(n21), .C(n39), .Y(n29) );
  OAI22X1 U28 ( .A0(n32), .A1(n33), .B0(n12), .B1(n34), .Y(n31) );
  INVX1 U29 ( .A(n25), .Y(FI_1_) );
  AOI221X1 U30 ( .A0(n21), .A1(n11), .B0(n22), .B1(n24), .C0(n6), .Y(n25) );
  INVX1 U31 ( .A(n26), .Y(n6) );
  AOI31X1 U32 ( .A0(n7), .A1(n9), .A2(n19), .B0(n8), .Y(n26) );
  NAND2X1 U33 ( .A(n39), .B(n41), .Y(n28) );
  NAND2X1 U34 ( .A(n38), .B(n40), .Y(n27) );
  XOR2X1 U35 ( .A(I[1]), .B(n1), .Y(n40) );
  NOR3X1 U36 ( .A(n38), .B(n24), .C(n39), .Y(n19) );
  INVX1 U37 ( .A(RATE[0]), .Y(n4) );
  NOR2X1 U38 ( .A(n4), .B(RATE[1]), .Y(n39) );
  XOR2XL U39 ( .A(n1), .B(I[3]), .Y(n20) );
  XOR2X1 U40 ( .A(I[3]), .B(n3), .Y(n41) );
endmodule

