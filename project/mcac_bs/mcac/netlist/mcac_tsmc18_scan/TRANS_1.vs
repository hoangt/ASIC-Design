
module TRANS_1 ( TD, YL, DQ, TR );
  input [18:0] YL;
  input [15:0] DQ;
  input TD;
  output TR;
  wire   N3, N4, DQTHR_9_, DQTHR_8_, DQTHR_7_, DQTHR_6_, DQTHR_5_, DQTHR_4_,
         DQTHR_3_, DQTHR_2_, DQTHR_1_, DQTHR_19_, DQTHR_18_, DQTHR_17_,
         DQTHR_16_, DQTHR_15_, DQTHR_14_, DQTHR_13_, DQTHR_12_, DQTHR_11_,
         DQTHR_10_, DQTHR_0_, n17, n5, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, SYNOPSYS_UNCONNECTED__0;
  wire   [12:8] THR1;
  wire   [20:0] THR2;
  assign TR = N4;

  AND2X2 U11 ( .A(THR1[9]), .B(n8), .Y(THR2[9]) );
  AND2X2 U12 ( .A(THR1[8]), .B(n17), .Y(THR2[8]) );
  AND2X2 U33 ( .A(TD), .B(N3), .Y(N4) );
  NOR3BX1 U3 ( .AN(n9), .B(n7), .C(n82), .Y(THR2[4]) );
  OAI21XL U4 ( .A0(n58), .A1(n83), .B0(n9), .Y(THR2[13]) );
  OAI21XL U5 ( .A0(n58), .A1(n84), .B0(n17), .Y(THR2[14]) );
  NOR3X1 U6 ( .A(n58), .B(n5), .C(n85), .Y(THR2[15]) );
  NOR3X1 U8 ( .A(n58), .B(n5), .C(n87), .Y(THR2[16]) );
  NOR3BX1 U13 ( .AN(n8), .B(n7), .C(n81), .Y(THR2[3]) );
  NOR3BX1 U14 ( .AN(n17), .B(n7), .C(n80), .Y(THR2[2]) );
  NOR3BX1 U15 ( .AN(n17), .B(n7), .C(n83), .Y(THR2[5]) );
  NOR3BX1 U16 ( .AN(n8), .B(n7), .C(n84), .Y(THR2[6]) );
  NOR3BX1 U17 ( .AN(n9), .B(n7), .C(n85), .Y(THR2[7]) );
  NOR3X1 U18 ( .A(n58), .B(n5), .C(n89), .Y(THR2[17]) );
  NOR3X1 U20 ( .A(n58), .B(n5), .C(n79), .Y(THR2[20]) );
  NOR3BX1 U22 ( .AN(n8), .B(n7), .C(n86), .Y(THR2[0]) );
  NOR3BX1 U23 ( .AN(n8), .B(n7), .C(n88), .Y(THR2[1]) );
  NOR3X1 U24 ( .A(n58), .B(n5), .C(n76), .Y(THR2[18]) );
  INVX1 U25 ( .A(n9), .Y(n5) );
  NOR3X1 U26 ( .A(n58), .B(n5), .C(n77), .Y(THR2[19]) );
  INVXL U28 ( .A(DQ[7]), .Y(n50) );
  NAND2XL U29 ( .A(DQ[14]), .B(n47), .Y(n15) );
  INVXL U30 ( .A(DQ[9]), .Y(n48) );
  INVXL U31 ( .A(YL[17]), .Y(n59) );
  BUFX1 U32 ( .A(YL[18]), .Y(n7) );
  MX2XL U35 ( .A(YL[11]), .B(YL[10]), .S0(YL[15]), .Y(n66) );
  MX2XL U36 ( .A(YL[12]), .B(YL[11]), .S0(YL[15]), .Y(n63) );
  OR2XL U37 ( .A(n65), .B(YL[17]), .Y(n86) );
  OR2XL U38 ( .A(n78), .B(YL[17]), .Y(n88) );
  MX2XL U39 ( .A(YL[13]), .B(YL[12]), .S0(YL[15]), .Y(n67) );
  MX2XL U40 ( .A(YL[14]), .B(YL[13]), .S0(YL[15]), .Y(n64) );
  NAND2XL U41 ( .A(YL[17]), .B(n69), .Y(n76) );
  NAND2XL U42 ( .A(n71), .B(YL[17]), .Y(n77) );
  NAND2XL U43 ( .A(n74), .B(YL[17]), .Y(n79) );
  INVX1 U44 ( .A(DQ[8]), .Y(n49) );
  INVX1 U45 ( .A(DQ[10]), .Y(n57) );
  INVX1 U46 ( .A(DQ[11]), .Y(n56) );
  INVXL U47 ( .A(DQ[6]), .Y(n51) );
  INVX1 U48 ( .A(n15), .Y(n55) );
  INVXL U49 ( .A(DQ[4]), .Y(n53) );
  INVX1 U50 ( .A(DQTHR_13_), .Y(n46) );
  INVXL U51 ( .A(DQ[5]), .Y(n52) );
  INVX1 U52 ( .A(DQTHR_12_), .Y(n45) );
  INVX1 U53 ( .A(DQTHR_14_), .Y(n47) );
  INVX1 U54 ( .A(DQTHR_3_), .Y(n44) );
  INVX1 U55 ( .A(DQTHR_2_), .Y(n43) );
  INVX1 U56 ( .A(DQTHR_0_), .Y(n42) );
  INVXL U57 ( .A(DQ[1]), .Y(n54) );
  MXI2X1 U58 ( .A(n87), .B(n86), .S0(n7), .Y(THR1[8]) );
  NAND2X1 U59 ( .A(n70), .B(n59), .Y(n80) );
  NAND2X1 U60 ( .A(n72), .B(n59), .Y(n81) );
  MXI2X1 U61 ( .A(n70), .B(n69), .S0(n59), .Y(n84) );
  MXI2X1 U62 ( .A(n61), .B(n74), .S0(n59), .Y(n87) );
  INVX1 U63 ( .A(n73), .Y(n61) );
  MX2X1 U64 ( .A(n78), .B(n75), .S0(n59), .Y(n83) );
  MX2X1 U65 ( .A(n65), .B(n73), .S0(n59), .Y(n82) );
  MX2X1 U66 ( .A(n62), .B(n63), .S0(n60), .Y(n70) );
  MX2X1 U67 ( .A(n66), .B(n67), .S0(n60), .Y(n72) );
  NAND2X1 U68 ( .A(n62), .B(n60), .Y(n65) );
  NAND2X1 U69 ( .A(n66), .B(n60), .Y(n78) );
  NAND2BX1 U70 ( .AN(THR1[10]), .B(n9), .Y(THR2[10]) );
  MXI2X1 U71 ( .A(n76), .B(n80), .S0(n7), .Y(THR1[10]) );
  NAND2BX1 U72 ( .AN(THR1[12]), .B(n8), .Y(THR2[12]) );
  MXI2X1 U73 ( .A(n79), .B(n82), .S0(n7), .Y(THR1[12]) );
  NAND2BX1 U74 ( .AN(THR1[11]), .B(n17), .Y(THR2[11]) );
  MXI2X1 U75 ( .A(n77), .B(n81), .S0(n7), .Y(THR1[11]) );
  MXI2X1 U76 ( .A(n89), .B(n88), .S0(n7), .Y(THR1[9]) );
  MXI2X1 U77 ( .A(n72), .B(n71), .S0(n59), .Y(n85) );
  OR2X2 U78 ( .A(n75), .B(n59), .Y(n89) );
  INVX1 U79 ( .A(n7), .Y(n58) );
  MX2XL U80 ( .A(n64), .B(YL[15]), .S0(n60), .Y(n69) );
  NOR2BXL U81 ( .AN(YL[10]), .B(YL[15]), .Y(n62) );
  NAND2BXL U82 ( .AN(YL[14]), .B(YL[15]), .Y(n68) );
  NOR2BX1 U83 ( .AN(YL[15]), .B(n60), .Y(n74) );
  AND2X1 U84 ( .A(n68), .B(YL[16]), .Y(n71) );
  OAI21XL U85 ( .A0(YL[16]), .A1(YL[17]), .B0(n7), .Y(n9) );
  MXI2XL U86 ( .A(n68), .B(n67), .S0(YL[16]), .Y(n75) );
  OAI21XL U87 ( .A0(YL[16]), .A1(YL[17]), .B0(n7), .Y(n17) );
  MXI2XL U88 ( .A(n64), .B(n63), .S0(YL[16]), .Y(n73) );
  OAI21XL U89 ( .A0(YL[16]), .A1(YL[17]), .B0(n7), .Y(n8) );
  OR2X1 U90 ( .A(DQTHR_11_), .B(n56), .Y(n10) );
  AOI32X1 U91 ( .A0(DQTHR_10_), .A1(n57), .A2(n10), .B0(n56), .B1(DQTHR_11_), 
        .Y(n12) );
  OAI21XL U92 ( .A0(DQTHR_10_), .A1(n57), .B0(n10), .Y(n34) );
  NAND2BX1 U93 ( .AN(DQTHR_9_), .B(DQ[9]), .Y(n33) );
  AOI32X1 U94 ( .A0(n33), .A1(n49), .A2(DQTHR_8_), .B0(DQTHR_9_), .B1(n48), 
        .Y(n11) );
  AOI22X1 U95 ( .A0(n12), .A1(n34), .B0(n11), .B1(n12), .Y(n21) );
  NOR2BX1 U96 ( .AN(DQ[13]), .B(DQTHR_13_), .Y(n14) );
  AOI211X1 U97 ( .A0(n45), .A1(DQ[12]), .B0(n14), .C0(n55), .Y(n36) );
  NOR2X1 U98 ( .A(DQTHR_16_), .B(DQTHR_15_), .Y(n13) );
  OAI21XL U99 ( .A0(DQ[14]), .A1(n47), .B0(n13), .Y(n19) );
  OAI32X1 U100 ( .A0(n45), .A1(DQ[12]), .A2(n14), .B0(DQ[13]), .B1(n46), .Y(
        n18) );
  OAI22X1 U101 ( .A0(n19), .A1(n18), .B0(n19), .B1(n15), .Y(n20) );
  OAI2BB1X1 U102 ( .A0N(n21), .A1N(n36), .B0(n20), .Y(n40) );
  OR2X1 U103 ( .A(DQTHR_7_), .B(n50), .Y(n22) );
  AOI32X1 U104 ( .A0(DQTHR_6_), .A1(n51), .A2(n22), .B0(n50), .B1(DQTHR_7_), 
        .Y(n24) );
  OAI21XL U105 ( .A0(DQTHR_6_), .A1(n51), .B0(n22), .Y(n30) );
  NAND2BX1 U106 ( .AN(DQTHR_5_), .B(DQ[5]), .Y(n26) );
  AOI32X1 U107 ( .A0(n26), .A1(n53), .A2(DQTHR_4_), .B0(DQTHR_5_), .B1(n52), 
        .Y(n23) );
  AOI22X1 U108 ( .A0(n24), .A1(n30), .B0(n23), .B1(n24), .Y(n39) );
  AND2X1 U109 ( .A(DQ[3]), .B(n44), .Y(n25) );
  AOI21X1 U110 ( .A0(DQ[2]), .A1(n43), .B0(n25), .Y(n27) );
  OAI32X1 U111 ( .A0(n43), .A1(DQ[2]), .A2(n25), .B0(DQ[3]), .B1(n44), .Y(n29)
         );
  OAI221XL U112 ( .A0(DQTHR_4_), .A1(n53), .B0(n27), .B1(n29), .C0(n26), .Y(
        n32) );
  AOI2BB2X1 U113 ( .B0(DQ[0]), .B1(n42), .A0N(n54), .A1N(DQTHR_1_), .Y(n28) );
  AOI211X1 U114 ( .A0(DQTHR_1_), .A1(n54), .B0(n29), .C0(n28), .Y(n31) );
  NOR3X1 U115 ( .A(n32), .B(n31), .C(n30), .Y(n38) );
  OAI21XL U116 ( .A0(DQTHR_8_), .A1(n49), .B0(n33), .Y(n35) );
  NOR3BX1 U117 ( .AN(n36), .B(n35), .C(n34), .Y(n37) );
  OAI32X1 U118 ( .A0(n40), .A1(n39), .A2(n38), .B0(n37), .B1(n40), .Y(n41) );
  NOR4BX1 U119 ( .AN(n41), .B(DQTHR_19_), .C(DQTHR_18_), .D(DQTHR_17_), .Y(N3)
         );
  INVX1 U1 ( .A(YL[16]), .Y(n60) );
  TRANS_1_DW01_add_0 add_62 ( .A(THR2), .B({1'b0, THR2[20:1]}), .CI(1'b0), 
        .SUM({DQTHR_19_, DQTHR_18_, DQTHR_17_, DQTHR_16_, DQTHR_15_, DQTHR_14_, 
        DQTHR_13_, DQTHR_12_, DQTHR_11_, DQTHR_10_, DQTHR_9_, DQTHR_8_, 
        DQTHR_7_, DQTHR_6_, DQTHR_5_, DQTHR_4_, DQTHR_3_, DQTHR_2_, DQTHR_1_, 
        DQTHR_0_, SYNOPSYS_UNCONNECTED__0}) );
endmodule

