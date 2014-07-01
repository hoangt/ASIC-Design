
module FLOATA_0 ( DQ, DQ0 );
  input [15:0] DQ;
  output [10:0] DQ0;
  wire   DQ_15_, DQ0_9_, DQ0_7_, DQ0_5_, DQ0_4_, DQ0_3_, DQ0_2_, DQ0_1_,
         DQ0_0_, N60, N61, N62, N63, N64, N65, n1, DQ0_6_, DQ0_8_, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  assign DQ0[10] = DQ_15_;
  assign DQ_15_ = DQ[15];
  assign DQ0[9] = DQ0_9_;
  assign DQ0[7] = DQ0_7_;
  assign DQ0[5] = DQ0_5_;
  assign DQ0[4] = DQ0_4_;
  assign DQ0[3] = DQ0_3_;
  assign DQ0[2] = DQ0_2_;
  assign DQ0[1] = DQ0_1_;
  assign DQ0[0] = DQ0_0_;
  assign DQ0[6] = DQ0_6_;
  assign DQ0[8] = DQ0_8_;

  OAI221X1 U3 ( .A0(n9), .A1(n70), .B0(n71), .B1(n76), .C0(n8), .Y(DQ0_6_) );
  OAI2BB1X1 U4 ( .A0N(n80), .A1N(n1), .B0(n81), .Y(DQ0_8_) );
  INVX1 U5 ( .A(DQ0_9_), .Y(n1) );
  MXI2XL U6 ( .A(DQ[12]), .B(DQ[13]), .S0(DQ0_6_), .Y(n52) );
  NOR2XL U7 ( .A(DQ[11]), .B(n65), .Y(n81) );
  NOR2XL U8 ( .A(DQ[6]), .B(DQ0_9_), .Y(n77) );
  MXI2XL U9 ( .A(DQ[8]), .B(DQ[9]), .S0(DQ0_6_), .Y(n17) );
  MXI2XL U10 ( .A(DQ[9]), .B(DQ[10]), .S0(DQ0_6_), .Y(n46) );
  MXI2XL U11 ( .A(DQ[6]), .B(DQ[7]), .S0(DQ0_6_), .Y(n19) );
  MXI2XL U12 ( .A(DQ[7]), .B(DQ[8]), .S0(DQ0_6_), .Y(n48) );
  MXI2XL U13 ( .A(DQ[10]), .B(DQ[11]), .S0(DQ0_6_), .Y(n51) );
  MXI2XL U14 ( .A(DQ[11]), .B(DQ[12]), .S0(DQ0_6_), .Y(n57) );
  MXI2XL U15 ( .A(DQ[4]), .B(DQ[5]), .S0(DQ0_6_), .Y(n18) );
  MXI2XL U16 ( .A(DQ[5]), .B(DQ[6]), .S0(DQ0_6_), .Y(n47) );
  MXI2XL U17 ( .A(DQ[3]), .B(DQ[4]), .S0(DQ0_6_), .Y(n24) );
  NOR2XL U18 ( .A(DQ[9]), .B(n72), .Y(n73) );
  NOR2XL U19 ( .A(DQ[4]), .B(n76), .Y(n71) );
  NOR2BXL U20 ( .AN(n73), .B(DQ[8]), .Y(n63) );
  INVX1 U21 ( .A(DQ0_7_), .Y(n4) );
  NOR2BX1 U22 ( .AN(N61), .B(n64), .Y(DQ0_1_) );
  MXI2X1 U23 ( .A(n13), .B(n12), .S0(DQ0_9_), .Y(N61) );
  MXI2X1 U24 ( .A(n60), .B(n61), .S0(DQ0_8_), .Y(n12) );
  NAND2X1 U25 ( .A(DQ0_8_), .B(n62), .Y(n13) );
  NOR2BX1 U26 ( .AN(N63), .B(n64), .Y(DQ0_3_) );
  MXI2X1 U27 ( .A(n50), .B(n49), .S0(DQ0_9_), .Y(N63) );
  MX4X1 U28 ( .A(n48), .B(n57), .C(n47), .D(n46), .S0(DQ0_8_), .S1(n4), .Y(n49) );
  MXI2X1 U29 ( .A(n45), .B(n25), .S0(DQ0_8_), .Y(n50) );
  OAI21XL U30 ( .A0(n64), .A1(n6), .B0(n63), .Y(n66) );
  MXI2X1 U31 ( .A(n15), .B(n18), .S0(DQ0_7_), .Y(n54) );
  MXI2X1 U32 ( .A(n24), .B(n47), .S0(DQ0_7_), .Y(n60) );
  MXI2X1 U33 ( .A(n19), .B(n17), .S0(DQ0_7_), .Y(n55) );
  MXI2X1 U34 ( .A(n48), .B(n46), .S0(DQ0_7_), .Y(n61) );
  MXI2X1 U35 ( .A(n22), .B(n23), .S0(DQ0_7_), .Y(n62) );
  MXI2X1 U36 ( .A(n24), .B(n23), .S0(n4), .Y(n25) );
  MXI2X1 U37 ( .A(n15), .B(n14), .S0(n4), .Y(n16) );
  NOR2X1 U38 ( .A(n4), .B(n14), .Y(n56) );
  INVX1 U39 ( .A(n68), .Y(n7) );
  NOR2BX1 U40 ( .AN(N60), .B(n64), .Y(DQ0_0_) );
  MXI2X1 U41 ( .A(n11), .B(n10), .S0(DQ0_9_), .Y(N60) );
  NAND2X1 U42 ( .A(n56), .B(DQ0_8_), .Y(n11) );
  MXI2X1 U43 ( .A(n54), .B(n55), .S0(DQ0_8_), .Y(n10) );
  NOR2X1 U44 ( .A(n22), .B(n4), .Y(n45) );
  NOR2BX1 U45 ( .AN(N62), .B(n64), .Y(DQ0_2_) );
  MXI2X1 U46 ( .A(n21), .B(n20), .S0(DQ0_9_), .Y(N62) );
  MX4X1 U47 ( .A(n19), .B(n51), .C(n18), .D(n17), .S0(DQ0_8_), .S1(n4), .Y(n20) );
  NAND2X1 U48 ( .A(DQ0_8_), .B(n16), .Y(n21) );
  NAND2BX1 U49 ( .AN(DQ[12]), .B(n79), .Y(n65) );
  INVX1 U50 ( .A(n79), .Y(n9) );
  AOI21X1 U51 ( .A0(n73), .A1(n66), .B0(n65), .Y(n70) );
  INVX1 U52 ( .A(n74), .Y(n6) );
  NOR2BX1 U53 ( .AN(N64), .B(n64), .Y(DQ0_4_) );
  MX4X1 U54 ( .A(n56), .B(n55), .C(n54), .D(n53), .S0(DQ0_9_), .S1(DQ0_8_), 
        .Y(N64) );
  MXI2X1 U55 ( .A(n52), .B(n51), .S0(n4), .Y(n53) );
  NAND3X1 U56 ( .A(n8), .B(n79), .C(n78), .Y(DQ0_7_) );
  AOI22X1 U57 ( .A0(n77), .A1(n76), .B0(n5), .B1(n75), .Y(n78) );
  INVX1 U58 ( .A(n72), .Y(n5) );
  OAI21XL U59 ( .A0(n74), .A1(n7), .B0(n73), .Y(n75) );
  NOR2XL U60 ( .A(DQ[13]), .B(DQ[14]), .Y(n79) );
  NOR2XL U61 ( .A(DQ[1]), .B(n7), .Y(n74) );
  NAND2BX1 U62 ( .AN(DQ[10]), .B(n81), .Y(n72) );
  NAND2BX1 U63 ( .AN(DQ[5]), .B(n77), .Y(n76) );
  NAND2BX1 U64 ( .AN(DQ[3]), .B(n71), .Y(n80) );
  OR2X2 U65 ( .A(N65), .B(n64), .Y(DQ0_5_) );
  MX4X1 U66 ( .A(n62), .B(n61), .C(n60), .D(n59), .S0(DQ0_9_), .S1(DQ0_8_), 
        .Y(N65) );
  MXI2X1 U67 ( .A(n58), .B(n57), .S0(n4), .Y(n59) );
  MXI2XL U68 ( .A(DQ[13]), .B(DQ[14]), .S0(DQ0_6_), .Y(n58) );
  NAND2BX1 U69 ( .AN(DQ[7]), .B(n63), .Y(DQ0_9_) );
  INVX1 U70 ( .A(n69), .Y(n8) );
  OAI221XL U71 ( .A0(n77), .A1(DQ0_9_), .B0(n68), .B1(n80), .C0(n67), .Y(n69)
         );
  AOI21X1 U72 ( .A0(n81), .A1(n72), .B0(DQ[14]), .Y(n67) );
  MXI2XL U73 ( .A(DQ[0]), .B(DQ[1]), .S0(DQ0_6_), .Y(n14) );
  NAND2XL U74 ( .A(DQ0_6_), .B(DQ[0]), .Y(n22) );
  NOR2XL U75 ( .A(DQ[0]), .B(n6), .Y(n64) );
  MXI2XL U76 ( .A(DQ[1]), .B(DQ[2]), .S0(DQ0_6_), .Y(n23) );
  MXI2XL U77 ( .A(DQ[2]), .B(DQ[3]), .S0(DQ0_6_), .Y(n15) );
  NOR2XL U78 ( .A(DQ[2]), .B(n80), .Y(n68) );
endmodule

