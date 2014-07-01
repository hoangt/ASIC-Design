
module FUNCTF_0 ( I, RATE, FI );
  input [4:0] I;
  input [1:0] RATE;
  output [2:0] FI;
  wire   n1, FI_1_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54;
  assign FI[1] = FI_1_;

  XOR2XL U2 ( .A(I[1]), .B(I[0]), .Y(n12) );
  NOR2XL U3 ( .A(n1), .B(RATE[1]), .Y(n13) );
  AND2X1 U4 ( .A(RATE[1]), .B(n1), .Y(n47) );
  INVXL U5 ( .A(RATE[0]), .Y(n1) );
  AND2X1 U6 ( .A(RATE[1]), .B(RATE[0]), .Y(n14) );
  INVXL U7 ( .A(I[3]), .Y(n7) );
  INVXL U8 ( .A(I[1]), .Y(n9) );
  XOR2XL U9 ( .A(n9), .B(I[4]), .Y(n36) );
  XNOR2XL U10 ( .A(I[2]), .B(I[4]), .Y(n38) );
  XOR2XL U11 ( .A(n7), .B(I[4]), .Y(n15) );
  NOR3X1 U12 ( .A(n14), .B(n47), .C(n13), .Y(n52) );
  NAND2X1 U13 ( .A(n54), .B(n53), .Y(FI[2]) );
  AOI33X1 U14 ( .A0(n51), .A1(n50), .A2(n8), .B0(n49), .B1(n48), .B2(n47), .Y(
        n54) );
  AOI31X1 U15 ( .A0(n6), .A1(n5), .A2(n52), .B0(n10), .Y(n53) );
  NAND4X1 U16 ( .A(n43), .B(n44), .C(n42), .D(n41), .Y(FI[0]) );
  NAND3X1 U17 ( .A(n51), .B(n50), .C(n13), .Y(n42) );
  AOI22X1 U18 ( .A0(n52), .A1(n40), .B0(n47), .B1(n48), .Y(n41) );
  OAI22X1 U19 ( .A0(n39), .A1(n38), .B0(n6), .B1(n37), .Y(n40) );
  INVX1 U20 ( .A(n46), .Y(FI_1_) );
  AOI221X1 U21 ( .A0(n50), .A1(n8), .B0(n49), .B1(n47), .C0(n3), .Y(n46) );
  INVX1 U22 ( .A(n45), .Y(n3) );
  AOI31X1 U23 ( .A0(n4), .A1(n5), .A2(n52), .B0(n10), .Y(n45) );
  INVX1 U24 ( .A(n43), .Y(n8) );
  INVX1 U25 ( .A(n44), .Y(n10) );
  AOI22X1 U26 ( .A0(n36), .A1(n16), .B0(n15), .B1(n4), .Y(n39) );
  OAI21XL U27 ( .A0(n36), .A1(n16), .B0(n5), .Y(n37) );
  INVX1 U28 ( .A(n15), .Y(n5) );
  XOR2X1 U29 ( .A(n9), .B(n7), .Y(n50) );
  INVX1 U30 ( .A(n36), .Y(n4) );
  INVX1 U31 ( .A(n38), .Y(n6) );
  NAND2X1 U32 ( .A(n14), .B(n12), .Y(n44) );
  NAND2X1 U33 ( .A(n13), .B(n11), .Y(n43) );
  XOR2X1 U34 ( .A(I[3]), .B(I[2]), .Y(n11) );
  XOR2X1 U35 ( .A(I[0]), .B(I[4]), .Y(n16) );
  XOR2X1 U36 ( .A(I[0]), .B(I[2]), .Y(n48) );
  XOR2X1 U37 ( .A(I[1]), .B(I[2]), .Y(n49) );
  XOR2X1 U38 ( .A(I[0]), .B(I[3]), .Y(n51) );
endmodule

