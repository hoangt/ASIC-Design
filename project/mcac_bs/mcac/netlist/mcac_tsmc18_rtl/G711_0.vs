
module G711_0 ( LAW, PCM, mag );
  input [7:0] PCM;
  output [13:0] mag;
  input LAW;
  wire   N44, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, mag_11_, mag_10_, mag_9_, mag_8_;
  assign N44 = PCM[4];
  assign mag[11] = mag_11_;
  assign mag[10] = mag_10_;
  assign mag[9] = mag_9_;
  assign mag[8] = mag_8_;

  MXI2X4 U3 ( .A(n120), .B(n121), .S0(LAW), .Y(mag[12]) );
  NAND2BX1 U4 ( .AN(n15), .B(PCM[0]), .Y(n60) );
  NAND3X4 U5 ( .A(n31), .B(n30), .C(n32), .Y(mag[2]) );
  NAND2X2 U6 ( .A(n91), .B(n94), .Y(n83) );
  NAND3X2 U7 ( .A(n93), .B(n92), .C(n91), .Y(n105) );
  NAND3BX2 U8 ( .AN(n82), .B(n94), .C(n91), .Y(n97) );
  MXI2X4 U9 ( .A(n8), .B(n111), .S0(n16), .Y(n91) );
  NOR2X2 U10 ( .A(n89), .B(n76), .Y(n28) );
  OAI21X2 U11 ( .A0(LAW), .A1(n20), .B0(n57), .Y(mag[0]) );
  NAND2BX2 U12 ( .AN(n15), .B(n67), .Y(n42) );
  CLKINVX2 U13 ( .A(n49), .Y(n33) );
  INVXL U14 ( .A(n15), .Y(n85) );
  NAND3BX2 U15 ( .AN(n6), .B(n78), .C(n77), .Y(mag[6]) );
  NAND2X2 U16 ( .A(n43), .B(n27), .Y(n59) );
  OAI21XL U17 ( .A0(n47), .A1(n46), .B0(n19), .Y(n55) );
  INVXL U18 ( .A(n71), .Y(n47) );
  AOI21X1 U19 ( .A0(n82), .A1(n83), .B0(n81), .Y(n90) );
  INVX2 U20 ( .A(n92), .Y(n82) );
  NAND2XL U21 ( .A(n16), .B(n15), .Y(n65) );
  NAND2BX1 U22 ( .AN(n87), .B(n113), .Y(n88) );
  AOI21XL U23 ( .A0(n96), .A1(n97), .B0(n95), .Y(n103) );
  INVXL U24 ( .A(n93), .Y(n96) );
  INVX1 U25 ( .A(n104), .Y(n95) );
  NAND3X1 U26 ( .A(n67), .B(n113), .C(n60), .Y(n61) );
  CLKINVX3 U27 ( .A(n84), .Y(n67) );
  OR2X2 U28 ( .A(n94), .B(n91), .Y(n75) );
  OAI2BB1X2 U29 ( .A0N(n65), .A1N(n1), .B0(n64), .Y(mag[5]) );
  INVX1 U30 ( .A(n57), .Y(n1) );
  OR2XL U31 ( .A(n76), .B(n116), .Y(n77) );
  MX2X2 U32 ( .A(n2), .B(n106), .S0(n16), .Y(n70) );
  INVX1 U33 ( .A(n59), .Y(n2) );
  AOI21X1 U34 ( .A0(n13), .A1(n16), .B0(n29), .Y(n10) );
  OAI2BB1X1 U35 ( .A0N(n75), .A1N(n83), .B0(n18), .Y(n78) );
  AND2X2 U36 ( .A(n25), .B(n60), .Y(n13) );
  NOR2XL U37 ( .A(n118), .B(n45), .Y(n46) );
  NAND2BX1 U38 ( .AN(n65), .B(n43), .Y(n21) );
  INVX4 U39 ( .A(n79), .Y(n43) );
  XOR2X1 U40 ( .A(n71), .B(n70), .Y(n63) );
  NOR2BX1 U41 ( .AN(n5), .B(n116), .Y(n108) );
  NAND2X1 U42 ( .A(n119), .B(n118), .Y(n120) );
  INVX2 U43 ( .A(n25), .Y(n119) );
  INVX1 U44 ( .A(n16), .Y(n118) );
  NAND2X4 U45 ( .A(n43), .B(n15), .Y(n26) );
  OAI21XL U46 ( .A0(n116), .A1(n109), .B0(n112), .Y(mag_10_) );
  MX2X2 U47 ( .A(n34), .B(n44), .S0(n15), .Y(n3) );
  MXI2X4 U48 ( .A(PCM[0]), .B(PCM[2]), .S0(n43), .Y(n44) );
  MXI2X4 U49 ( .A(n49), .B(n86), .S0(n43), .Y(n58) );
  INVX2 U50 ( .A(n44), .Y(n12) );
  OAI21X1 U51 ( .A0(n79), .A1(n118), .B0(LAW), .Y(n41) );
  NAND2X4 U52 ( .A(PCM[0]), .B(n15), .Y(n27) );
  NAND2BX2 U53 ( .AN(n15), .B(n79), .Y(n25) );
  BUFX20 U54 ( .A(N44), .Y(n15) );
  NAND2X2 U55 ( .A(n70), .B(n71), .Y(n94) );
  MXI2XL U56 ( .A(n11), .B(n119), .S0(n16), .Y(n93) );
  AOI21X1 U57 ( .A0(PCM[2]), .A1(n119), .B0(n72), .Y(n73) );
  AOI21X2 U58 ( .A0(n63), .A1(n19), .B0(n62), .Y(n64) );
  NOR2X1 U59 ( .A(n23), .B(n22), .Y(n24) );
  NAND3BX1 U60 ( .AN(n108), .B(n107), .C(n110), .Y(mag_9_) );
  OAI21XL U61 ( .A0(n15), .A1(n86), .B0(n79), .Y(n114) );
  NAND2X1 U62 ( .A(n3), .B(n19), .Y(n39) );
  INVX1 U63 ( .A(n21), .Y(n20) );
  MXI2X2 U64 ( .A(n58), .B(n4), .S0(n15), .Y(n106) );
  OAI2BB1X2 U65 ( .A0N(n100), .A1N(n52), .B0(n51), .Y(n98) );
  OAI221X2 U66 ( .A0(n10), .A1(n39), .B0(n89), .B1(n87), .C0(n38), .Y(mag[3])
         );
  OAI221X4 U67 ( .A0(LAW), .A1(n103), .B0(n102), .B1(n116), .C0(n101), .Y(
        mag_8_) );
  OAI221X4 U68 ( .A0(n90), .A1(LAW), .B0(n117), .B1(n89), .C0(n88), .Y(mag[7])
         );
  INVX1 U69 ( .A(n114), .Y(n80) );
  AOI2BB2X1 U70 ( .B0(n19), .B1(n118), .A0N(PCM[2]), .A1N(n57), .Y(n38) );
  AOI21X1 U71 ( .A0(n99), .A1(n98), .B0(n53), .Y(n54) );
  CLKINVX3 U72 ( .A(n13), .Y(n9) );
  NAND2X1 U73 ( .A(n33), .B(n43), .Y(n34) );
  NAND2BX2 U74 ( .AN(n16), .B(n26), .Y(n40) );
  OAI2BB1X2 U75 ( .A0N(n37), .A1N(PCM[2]), .B0(n36), .Y(n87) );
  OAI2BB1X2 U76 ( .A0N(n99), .A1N(n5), .B0(n61), .Y(n62) );
  AND2X2 U77 ( .A(PCM[2]), .B(n79), .Y(n4) );
  OAI21X1 U78 ( .A0(n86), .A1(n85), .B0(n73), .Y(n74) );
  NAND2X2 U79 ( .A(n10), .B(n19), .Y(n31) );
  MX2X1 U80 ( .A(n68), .B(n7), .S0(n15), .Y(n5) );
  OAI21X2 U81 ( .A0(n59), .A1(n118), .B0(n21), .Y(n29) );
  MX2X2 U82 ( .A(n49), .B(n86), .S0(n67), .Y(n7) );
  NOR2X1 U83 ( .A(n59), .B(n21), .Y(n23) );
  MXI2X2 U84 ( .A(n12), .B(n58), .S0(n15), .Y(n11) );
  CLKINVX2 U85 ( .A(n26), .Y(n72) );
  OR2X2 U86 ( .A(n41), .B(n40), .Y(n116) );
  NOR2XL U87 ( .A(n66), .B(n57), .Y(n53) );
  MXI2X1 U88 ( .A(n14), .B(n35), .S0(n67), .Y(n36) );
  MXI2X2 U89 ( .A(n3), .B(n80), .S0(n16), .Y(n92) );
  NAND3BX1 U90 ( .AN(n79), .B(n16), .C(n17), .Y(n57) );
  BUFX8 U91 ( .A(PCM[6]), .Y(n16) );
  NAND3BX1 U92 ( .AN(n115), .B(n111), .C(n110), .Y(n112) );
  OAI22XL U93 ( .A0(n117), .A1(n116), .B0(n115), .B1(n114), .Y(mag_11_) );
  NOR2XL U94 ( .A(n109), .B(n89), .Y(n6) );
  INVX1 U95 ( .A(n60), .Y(n14) );
  MXI2X1 U96 ( .A(n7), .B(n50), .S0(n15), .Y(n51) );
  NOR2X1 U97 ( .A(n84), .B(n89), .Y(n22) );
  INVXL U98 ( .A(n48), .Y(n100) );
  NAND2BX1 U99 ( .AN(n105), .B(n94), .Y(n104) );
  INVX1 U100 ( .A(n97), .Y(n81) );
  MXI2XL U101 ( .A(n69), .B(n68), .S0(n15), .Y(n109) );
  NAND3BXL U102 ( .AN(n115), .B(n106), .C(n104), .Y(n107) );
  INVXL U103 ( .A(n89), .Y(n99) );
  INVX1 U104 ( .A(n116), .Y(n113) );
  OR2XL U105 ( .A(n106), .B(n105), .Y(n110) );
  AOI21X4 U106 ( .A0(n72), .A1(n33), .B0(n9), .Y(n8) );
  INVXL U107 ( .A(n86), .Y(n66) );
  NOR2XL U108 ( .A(n49), .B(n85), .Y(n35) );
  NAND2BXL U109 ( .AN(n57), .B(n49), .Y(n32) );
  NAND2BX1 U110 ( .AN(n16), .B(n19), .Y(n115) );
  NAND2XL U111 ( .A(n100), .B(n99), .Y(n101) );
  INVXL U112 ( .A(n98), .Y(n102) );
  INVXL U113 ( .A(PCM[0]), .Y(n52) );
  INVX1 U114 ( .A(n17), .Y(n19) );
  XOR2X1 U115 ( .A(n19), .B(PCM[7]), .Y(n121) );
  INVX1 U116 ( .A(n18), .Y(n17) );
  NOR2X1 U117 ( .A(LAW), .B(n122), .Y(mag[13]) );
  INVX1 U118 ( .A(n121), .Y(n122) );
  INVX1 U119 ( .A(LAW), .Y(n18) );
  INVX1 U120 ( .A(n42), .Y(n37) );
  NAND2X4 U121 ( .A(n26), .B(n25), .Y(n84) );
  NOR2XL U122 ( .A(n116), .B(n42), .Y(n56) );
  OAI221X4 U123 ( .A0(LAW), .A1(n29), .B0(PCM[0]), .B1(n57), .C0(n24), .Y(
        mag[1]) );
  OAI21XL U124 ( .A0(n86), .A1(n85), .B0(n84), .Y(n117) );
  NOR2XL U125 ( .A(n67), .B(n66), .Y(n69) );
  NAND2XL U126 ( .A(PCM[2]), .B(n84), .Y(n68) );
  NOR2XL U127 ( .A(PCM[2]), .B(n84), .Y(n50) );
  NAND2BX1 U128 ( .AN(n85), .B(n84), .Y(n48) );
  XOR2X4 U129 ( .A(n19), .B(PCM[5]), .Y(n79) );
  NAND2BX4 U130 ( .AN(n41), .B(n40), .Y(n89) );
  XOR2X4 U131 ( .A(n19), .B(PCM[1]), .Y(n49) );
  OAI211X2 U132 ( .A0(n49), .A1(n42), .B0(n48), .C0(n27), .Y(n76) );
  AOI31X2 U133 ( .A0(n8), .A1(n19), .A2(n29), .B0(n28), .Y(n30) );
  XOR2X4 U134 ( .A(n19), .B(PCM[3]), .Y(n86) );
  MXI2X4 U135 ( .A(n72), .B(n11), .S0(n16), .Y(n45) );
  NAND2BX4 U136 ( .AN(n16), .B(n45), .Y(n71) );
  NAND3BX4 U137 ( .AN(n56), .B(n55), .C(n54), .Y(mag[4]) );
  CLKINVX3 U138 ( .A(n74), .Y(n111) );
endmodule

