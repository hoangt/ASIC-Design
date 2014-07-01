
module EXPAND_0 ( SIN, LAW, SOUT );
  input [7:0] SIN;
  output [13:0] SOUT;
  input LAW;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, SOUT_0_;
  wire   [13:0] SS;
  assign SOUT[0] = SOUT_0_;

  XOR2X2 U3 ( .A(n34), .B(n36), .Y(SOUT[7]) );
  BUFX4 U4 ( .A(SS[3]), .Y(n1) );
  XNOR2X2 U5 ( .A(n27), .B(n26), .Y(SOUT[4]) );
  MXI2X1 U6 ( .A(SS[10]), .B(SS[9]), .S0(n17), .Y(n41) );
  BUFX8 U7 ( .A(n44), .Y(n16) );
  NOR2X2 U8 ( .A(n16), .B(n33), .Y(n31) );
  NAND2BX4 U9 ( .AN(n17), .B(SS[0]), .Y(n18) );
  MXI2X4 U10 ( .A(SS[0]), .B(SS[1]), .S0(n5), .Y(n19) );
  MX2X2 U11 ( .A(SS[2]), .B(SS[3]), .S0(n7), .Y(n6) );
  NAND2X2 U12 ( .A(n14), .B(n27), .Y(n29) );
  INVX1 U13 ( .A(n18), .Y(SOUT_0_) );
  NOR2X1 U14 ( .A(n18), .B(n44), .Y(n12) );
  AOI21X1 U15 ( .A0(n38), .A1(n37), .B0(n44), .Y(n2) );
  INVX1 U16 ( .A(n2), .Y(n39) );
  NAND2X1 U17 ( .A(n23), .B(n22), .Y(n20) );
  AND2X2 U18 ( .A(n25), .B(n23), .Y(n11) );
  INVXL U19 ( .A(n16), .Y(n23) );
  AND3X4 U20 ( .A(n33), .B(n32), .C(n36), .Y(n38) );
  AOI21XL U21 ( .A0(n15), .A1(n41), .B0(n44), .Y(n3) );
  INVX1 U22 ( .A(n3), .Y(n42) );
  AND3X4 U23 ( .A(n38), .B(n37), .C(n40), .Y(n15) );
  NOR2X2 U24 ( .A(n44), .B(n46), .Y(n9) );
  NOR2X2 U25 ( .A(n25), .B(n6), .Y(n14) );
  AND3X2 U26 ( .A(n15), .B(n41), .C(n43), .Y(n46) );
  NOR2BX4 U27 ( .AN(n30), .B(n29), .Y(n33) );
  XOR2X2 U28 ( .A(n39), .B(n40), .Y(SOUT[9]) );
  XOR2X1 U29 ( .A(n28), .B(n30), .Y(SOUT[5]) );
  XOR2X2 U30 ( .A(n42), .B(n43), .Y(SOUT[11]) );
  MXI2X4 U31 ( .A(SS[6]), .B(SS[5]), .S0(n17), .Y(n32) );
  INVX1 U32 ( .A(n17), .Y(n5) );
  INVX1 U33 ( .A(n17), .Y(n7) );
  INVXL U34 ( .A(n6), .Y(n24) );
  NAND2X2 U35 ( .A(n19), .B(n18), .Y(n22) );
  XNOR2X2 U36 ( .A(n19), .B(n12), .Y(SOUT[1]) );
  INVX1 U37 ( .A(n17), .Y(n4) );
  NAND2X2 U38 ( .A(n33), .B(n32), .Y(n35) );
  MXI2X4 U39 ( .A(SS[6]), .B(SS[7]), .S0(n4), .Y(n36) );
  MXI2X4 U40 ( .A(SS[8]), .B(SS[7]), .S0(n17), .Y(n37) );
  XNOR2X2 U41 ( .A(n32), .B(n31), .Y(SOUT[6]) );
  XOR2X2 U42 ( .A(n21), .B(n20), .Y(SOUT[2]) );
  AOI21X2 U43 ( .A0(n46), .A1(n45), .B0(n16), .Y(SOUT[13]) );
  INVX1 U44 ( .A(n17), .Y(n8) );
  NAND2BX1 U45 ( .AN(n16), .B(n35), .Y(n34) );
  MXI2X4 U46 ( .A(SS[1]), .B(SS[2]), .S0(n8), .Y(n21) );
  MXI2X4 U47 ( .A(SS[9]), .B(SS[8]), .S0(n17), .Y(n40) );
  NOR2X1 U48 ( .A(n16), .B(n14), .Y(n26) );
  XNOR2X2 U49 ( .A(n24), .B(n11), .Y(SOUT[3]) );
  XNOR2X1 U50 ( .A(n37), .B(n10), .Y(SOUT[8]) );
  MXI2X1 U51 ( .A(SS[11]), .B(SS[10]), .S0(n17), .Y(n43) );
  MXI2XL U52 ( .A(SS[12]), .B(SS[11]), .S0(n17), .Y(n45) );
  XOR2X2 U53 ( .A(n41), .B(n13), .Y(SOUT[10]) );
  XNOR2X2 U54 ( .A(n45), .B(n9), .Y(SOUT[12]) );
  NOR2XL U55 ( .A(n16), .B(n38), .Y(n10) );
  OR2X2 U56 ( .A(n16), .B(n15), .Y(n13) );
  BUFX3 U57 ( .A(LAW), .Y(n17) );
  NAND2BXL U58 ( .AN(n16), .B(n29), .Y(n28) );
  MXI2X4 U59 ( .A(SS[13]), .B(SS[12]), .S0(n17), .Y(n44) );
  NAND2BX4 U60 ( .AN(n22), .B(n21), .Y(n25) );
  MXI2X4 U61 ( .A(SS[4]), .B(n1), .S0(n17), .Y(n27) );
  MXI2X4 U62 ( .A(SS[5]), .B(SS[4]), .S0(n17), .Y(n30) );
  G711_0 inst_G711 ( .LAW(n17), .PCM(SIN), .mag(SS) );
endmodule

