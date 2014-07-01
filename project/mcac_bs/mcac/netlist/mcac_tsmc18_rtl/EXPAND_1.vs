
module EXPAND_1 ( SIN, LAW, SOUT );
  input [7:0] SIN;
  output [13:0] SOUT;
  input LAW;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, SOUT_0_;
  wire   [13:0] SS;
  assign SOUT[0] = SOUT_0_;

  G711_1 inst_G711 ( .LAW(LAW), .PCM(SIN), .mag(SS) );
  MXI2X1 U3 ( .A(SS[1]), .B(SS[0]), .S0(n16), .Y(n19) );
  MXI2X1 U4 ( .A(SS[2]), .B(SS[1]), .S0(n16), .Y(n21) );
  NOR2X1 U5 ( .A(n15), .B(n45), .Y(n42) );
  CLKINVX3 U6 ( .A(n41), .Y(n45) );
  NAND2BX1 U7 ( .AN(n39), .B(n40), .Y(n41) );
  AOI21X2 U8 ( .A0(n45), .A1(n44), .B0(n15), .Y(SOUT[13]) );
  AOI21X1 U9 ( .A0(n14), .A1(n34), .B0(n43), .Y(n1) );
  INVX1 U10 ( .A(n1), .Y(n35) );
  AND3X2 U11 ( .A(n14), .B(n34), .C(n36), .Y(n13) );
  XNOR2X1 U12 ( .A(n4), .B(n10), .Y(SOUT[6]) );
  NOR2BX1 U13 ( .AN(n29), .B(n30), .Y(n31) );
  NAND2BX1 U14 ( .AN(n43), .B(n39), .Y(n38) );
  AOI21X1 U15 ( .A0(n19), .A1(n18), .B0(n43), .Y(n2) );
  INVX1 U16 ( .A(n2), .Y(n20) );
  NOR2BX2 U17 ( .AN(n3), .B(n33), .Y(n14) );
  AND3X2 U18 ( .A(n19), .B(n18), .C(n21), .Y(n24) );
  XOR2X1 U19 ( .A(n32), .B(n3), .Y(SOUT[7]) );
  NOR2XL U20 ( .A(n15), .B(n31), .Y(n10) );
  XNOR2X2 U21 ( .A(n44), .B(n42), .Y(SOUT[12]) );
  XOR2X1 U22 ( .A(n38), .B(n40), .Y(SOUT[11]) );
  AND2X2 U23 ( .A(n6), .B(n7), .Y(n3) );
  NAND2BXL U24 ( .AN(n15), .B(n33), .Y(n32) );
  MXI2X1 U25 ( .A(SS[4]), .B(SS[3]), .S0(n16), .Y(n26) );
  NAND2X1 U26 ( .A(n24), .B(n23), .Y(n27) );
  MXI2X1 U27 ( .A(SS[5]), .B(SS[4]), .S0(n16), .Y(n29) );
  NAND2BX1 U28 ( .AN(n27), .B(n26), .Y(n30) );
  MXI2X1 U29 ( .A(SS[3]), .B(SS[2]), .S0(n16), .Y(n23) );
  XNOR2X1 U30 ( .A(n37), .B(n11), .Y(SOUT[10]) );
  NOR2X1 U31 ( .A(n15), .B(n13), .Y(n11) );
  NAND2X1 U32 ( .A(n13), .B(n37), .Y(n39) );
  NAND2X1 U33 ( .A(SS[7]), .B(n5), .Y(n6) );
  AND2X2 U34 ( .A(n8), .B(n9), .Y(n4) );
  BUFX3 U35 ( .A(LAW), .Y(n16) );
  MXI2X1 U36 ( .A(SS[13]), .B(SS[12]), .S0(n16), .Y(n43) );
  XOR2XL U37 ( .A(n28), .B(n29), .Y(SOUT[5]) );
  XOR2X1 U38 ( .A(n35), .B(n36), .Y(SOUT[9]) );
  MXI2X1 U39 ( .A(SS[8]), .B(SS[7]), .S0(n16), .Y(n34) );
  NAND2XL U40 ( .A(SS[6]), .B(n5), .Y(n8) );
  NAND2XL U41 ( .A(SS[6]), .B(n16), .Y(n7) );
  INVXL U42 ( .A(n16), .Y(n5) );
  MXI2X1 U43 ( .A(SS[10]), .B(SS[9]), .S0(n16), .Y(n37) );
  MXI2X1 U44 ( .A(SS[9]), .B(SS[8]), .S0(n16), .Y(n36) );
  NAND2XL U45 ( .A(SS[5]), .B(n16), .Y(n9) );
  NAND2X1 U46 ( .A(n31), .B(n4), .Y(n33) );
  MXI2X1 U47 ( .A(SS[11]), .B(SS[10]), .S0(n16), .Y(n40) );
  INVXL U48 ( .A(n18), .Y(SOUT_0_) );
  XNOR2X1 U49 ( .A(n34), .B(n12), .Y(SOUT[8]) );
  NOR2XL U50 ( .A(n15), .B(n14), .Y(n12) );
  MXI2XL U51 ( .A(SS[12]), .B(SS[11]), .S0(n16), .Y(n44) );
  NAND2BXL U52 ( .AN(n15), .B(n27), .Y(n25) );
  NAND2BX1 U53 ( .AN(n16), .B(SS[0]), .Y(n18) );
  NAND2BXL U54 ( .AN(n15), .B(n30), .Y(n28) );
  XNOR2X1 U55 ( .A(n19), .B(n17), .Y(SOUT[1]) );
  NOR2X1 U56 ( .A(n15), .B(n18), .Y(n17) );
  XNOR2XL U57 ( .A(n22), .B(n23), .Y(SOUT[3]) );
  BUFX3 U58 ( .A(n43), .Y(n15) );
  XOR2XL U59 ( .A(n25), .B(n26), .Y(SOUT[4]) );
  XOR2XL U60 ( .A(n20), .B(n21), .Y(SOUT[2]) );
  NOR2XL U61 ( .A(n15), .B(n24), .Y(n22) );
endmodule

