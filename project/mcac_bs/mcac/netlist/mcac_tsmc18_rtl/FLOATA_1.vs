
module FLOATA_1 ( DQ, DQ0 );
  input [15:0] DQ;
  output [10:0] DQ0;
  wire   DQ_15_, DQ0_9_, DQ0_8_, DQ0_7_, DQ0_5_, DQ0_4_, DQ0_3_, DQ0_2_,
         DQ0_1_, DQ0_0_, N60, N63, N64, N65, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n1, n2,
         DQ0_6_, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63;
  assign DQ0[10] = DQ_15_;
  assign DQ_15_ = DQ[15];
  assign DQ0[9] = DQ0_9_;
  assign DQ0[8] = DQ0_8_;
  assign DQ0[7] = DQ0_7_;
  assign DQ0[5] = DQ0_5_;
  assign DQ0[4] = DQ0_4_;
  assign DQ0[3] = DQ0_3_;
  assign DQ0[2] = DQ0_2_;
  assign DQ0[1] = DQ0_1_;
  assign DQ0[0] = DQ0_0_;
  assign DQ0[6] = DQ0_6_;

  OAI221X1 U3 ( .A0(n10), .A1(n37), .B0(n36), .B1(n31), .C0(n9), .Y(DQ0_6_) );
  NAND2XL U4 ( .A(DQ0_8_), .B(n17), .Y(n22) );
  INVX1 U5 ( .A(DQ0_7_), .Y(n4) );
  NOR2X1 U6 ( .A(n4), .B(n15), .Y(n57) );
  MXI2X1 U7 ( .A(n20), .B(n18), .S0(DQ0_7_), .Y(n56) );
  MXI2X1 U8 ( .A(n49), .B(n47), .S0(DQ0_7_), .Y(n62) );
  MXI2X1 U9 ( .A(n16), .B(n19), .S0(DQ0_7_), .Y(n55) );
  MXI2X1 U10 ( .A(n25), .B(n24), .S0(n4), .Y(n45) );
  NOR2XL U11 ( .A(n1), .B(n43), .Y(DQ0_1_) );
  NOR2XL U12 ( .A(n2), .B(n43), .Y(DQ0_2_) );
  INVXL U13 ( .A(n27), .Y(n6) );
  NOR2XL U14 ( .A(DQ[13]), .B(DQ[14]), .Y(n28) );
  NOR2XL U15 ( .A(DQ[11]), .B(n42), .Y(n26) );
  NOR2XL U16 ( .A(DQ[6]), .B(DQ0_9_), .Y(n30) );
  NOR2XL U17 ( .A(DQ[9]), .B(n35), .Y(n34) );
  MX4XL U18 ( .A(n57), .B(n56), .C(n55), .D(n54), .S0(DQ0_9_), .S1(DQ0_8_), 
        .Y(N64) );
  MXI2XL U19 ( .A(n53), .B(n52), .S0(n4), .Y(n54) );
  MXI2XL U20 ( .A(DQ[12]), .B(DQ[13]), .S0(DQ0_6_), .Y(n53) );
  MX2X1 U21 ( .A(n14), .B(n13), .S0(DQ0_9_), .Y(n1) );
  MXI2XL U22 ( .A(n12), .B(n11), .S0(DQ0_9_), .Y(N60) );
  NAND2XL U23 ( .A(n57), .B(DQ0_8_), .Y(n12) );
  MXI2XL U24 ( .A(n55), .B(n56), .S0(DQ0_8_), .Y(n11) );
  NOR2BXL U25 ( .AN(n34), .B(DQ[8]), .Y(n44) );
  MXI2XL U26 ( .A(DQ[8]), .B(DQ[9]), .S0(DQ0_6_), .Y(n18) );
  MXI2XL U27 ( .A(DQ[9]), .B(DQ[10]), .S0(DQ0_6_), .Y(n47) );
  MXI2XL U28 ( .A(DQ[6]), .B(DQ[7]), .S0(DQ0_6_), .Y(n20) );
  MXI2XL U29 ( .A(DQ[7]), .B(DQ[8]), .S0(DQ0_6_), .Y(n49) );
  MXI2XL U30 ( .A(DQ[10]), .B(DQ[11]), .S0(DQ0_6_), .Y(n52) );
  MXI2XL U31 ( .A(DQ[11]), .B(DQ[12]), .S0(DQ0_6_), .Y(n58) );
  MXI2XL U32 ( .A(n51), .B(n50), .S0(DQ0_9_), .Y(N63) );
  MX4XL U33 ( .A(n49), .B(n58), .C(n48), .D(n47), .S0(DQ0_8_), .S1(n4), .Y(n50) );
  MXI2XL U34 ( .A(n46), .B(n45), .S0(DQ0_8_), .Y(n51) );
  MX2X1 U35 ( .A(n22), .B(n21), .S0(DQ0_9_), .Y(n2) );
  MXI2XL U36 ( .A(n16), .B(n15), .S0(n4), .Y(n17) );
  NOR2XL U37 ( .A(n23), .B(n4), .Y(n46) );
  MX4XL U38 ( .A(n63), .B(n62), .C(n61), .D(n60), .S0(DQ0_9_), .S1(DQ0_8_), 
        .Y(N65) );
  MXI2XL U39 ( .A(n59), .B(n58), .S0(n4), .Y(n60) );
  MXI2XL U40 ( .A(DQ[13]), .B(DQ[14]), .S0(DQ0_6_), .Y(n59) );
  NOR2XL U41 ( .A(DQ[0]), .B(n7), .Y(n43) );
  NOR2XL U42 ( .A(DQ[4]), .B(n31), .Y(n36) );
  NOR2XL U43 ( .A(DQ[1]), .B(n8), .Y(n33) );
  MXI2XL U44 ( .A(DQ[4]), .B(DQ[5]), .S0(DQ0_6_), .Y(n19) );
  MXI2XL U45 ( .A(DQ[0]), .B(DQ[1]), .S0(DQ0_6_), .Y(n15) );
  NAND2XL U46 ( .A(DQ0_6_), .B(DQ[0]), .Y(n23) );
  INVX1 U47 ( .A(n39), .Y(n8) );
  NAND2BX1 U48 ( .AN(DQ[12]), .B(n28), .Y(n42) );
  OAI21XL U49 ( .A0(n6), .A1(DQ0_9_), .B0(n26), .Y(DQ0_8_) );
  INVX1 U50 ( .A(n38), .Y(n9) );
  OAI221XL U51 ( .A0(n30), .A1(DQ0_9_), .B0(n39), .B1(n27), .C0(n40), .Y(n38)
         );
  AOI21X1 U52 ( .A0(n26), .A1(n35), .B0(DQ[14]), .Y(n40) );
  MXI2X1 U53 ( .A(n25), .B(n48), .S0(DQ0_7_), .Y(n61) );
  MXI2X1 U54 ( .A(n23), .B(n24), .S0(DQ0_7_), .Y(n63) );
  NAND2BX1 U55 ( .AN(DQ[10]), .B(n26), .Y(n35) );
  NOR2BX1 U56 ( .AN(N60), .B(n43), .Y(DQ0_0_) );
  OAI21XL U57 ( .A0(n43), .A1(n7), .B0(n44), .Y(n41) );
  NAND3X1 U58 ( .A(n9), .B(n28), .C(n29), .Y(DQ0_7_) );
  AOI22X1 U59 ( .A0(n30), .A1(n31), .B0(n5), .B1(n32), .Y(n29) );
  INVX1 U60 ( .A(n35), .Y(n5) );
  OAI21XL U61 ( .A0(n33), .A1(n8), .B0(n34), .Y(n32) );
  MXI2X1 U62 ( .A(n61), .B(n62), .S0(DQ0_8_), .Y(n13) );
  NAND2X1 U63 ( .A(DQ0_8_), .B(n63), .Y(n14) );
  MX4X1 U64 ( .A(n20), .B(n52), .C(n19), .D(n18), .S0(DQ0_8_), .S1(n4), .Y(n21) );
  NOR2BX1 U65 ( .AN(N63), .B(n43), .Y(DQ0_3_) );
  NAND2BX1 U66 ( .AN(DQ[7]), .B(n44), .Y(DQ0_9_) );
  NAND2BX1 U67 ( .AN(DQ[3]), .B(n36), .Y(n27) );
  INVX1 U68 ( .A(n28), .Y(n10) );
  AOI21X1 U69 ( .A0(n34), .A1(n41), .B0(n42), .Y(n37) );
  INVX1 U70 ( .A(n33), .Y(n7) );
  NOR2BX1 U71 ( .AN(N64), .B(n43), .Y(DQ0_4_) );
  OR2X2 U72 ( .A(N65), .B(n43), .Y(DQ0_5_) );
  MXI2XL U73 ( .A(DQ[3]), .B(DQ[4]), .S0(DQ0_6_), .Y(n25) );
  MXI2XL U74 ( .A(DQ[5]), .B(DQ[6]), .S0(DQ0_6_), .Y(n48) );
  NAND2BX1 U75 ( .AN(DQ[5]), .B(n30), .Y(n31) );
  MXI2XL U76 ( .A(DQ[1]), .B(DQ[2]), .S0(DQ0_6_), .Y(n24) );
  MXI2XL U77 ( .A(DQ[2]), .B(DQ[3]), .S0(DQ0_6_), .Y(n16) );
  NOR2XL U78 ( .A(DQ[2]), .B(n27), .Y(n39) );
endmodule

