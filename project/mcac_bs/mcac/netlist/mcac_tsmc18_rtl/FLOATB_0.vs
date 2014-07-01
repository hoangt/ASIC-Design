
module FLOATB_0 ( SR, SR0 );
  input [15:0] SR;
  output [10:0] SR0;
  wire   SR_15_, SR0_8_, SR0_7_, SR0_5_, SR0_4_, SR0_3_, SR0_2_, SR0_1_,
         SR0_0_, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N77, N78, N79, N80, N81, N82, SR0_9_, SR0_6_, n3, n4,
         SR0_10_, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139;
  wire   [14:2] sub_53_carry;
  assign SR_15_ = SR[15];
  assign SR0[8] = SR0_8_;
  assign SR0[7] = SR0_7_;
  assign SR0[5] = SR0_5_;
  assign SR0[4] = SR0_4_;
  assign SR0[3] = SR0_3_;
  assign SR0[2] = SR0_2_;
  assign SR0[1] = SR0_1_;
  assign SR0[0] = SR0_0_;
  assign N6 = SR[0];
  assign SR0[9] = SR0_9_;
  assign SR0[6] = SR0_6_;
  assign SR0[10] = SR0_10_;

  AND2X2 U34 ( .A(n121), .B(n114), .Y(n139) );
  AND2X2 U35 ( .A(n136), .B(n113), .Y(n121) );
  CLKINVXL U3 ( .A(SR[1]), .Y(n7) );
  NOR2XL U4 ( .A(N6), .B(SR[1]), .Y(sub_53_carry[2]) );
  INVX1 U5 ( .A(SR[4]), .Y(n10) );
  MX4XL U6 ( .A(n90), .B(n89), .C(n91), .D(n100), .S0(SR0_8_), .S1(SR0_7_), 
        .Y(n92) );
  MX4XL U7 ( .A(n99), .B(n98), .C(n97), .D(n96), .S0(SR0_9_), .S1(SR0_8_), .Y(
        N81) );
  NOR2BX1 U8 ( .AN(sub_53_carry[7]), .B(SR[7]), .Y(sub_53_carry[8]) );
  MX4XL U9 ( .A(n105), .B(n104), .C(n103), .D(n102), .S0(SR0_9_), .S1(SR0_8_), 
        .Y(N82) );
  NOR2BX1 U10 ( .AN(sub_53_carry[9]), .B(SR[9]), .Y(sub_53_carry[10]) );
  OAI221X4 U11 ( .A0(n127), .A1(n133), .B0(n126), .B1(n130), .C0(n125), .Y(
        SR0_6_) );
  INVX1 U12 ( .A(SR[10]), .Y(n16) );
  AOI22XL U13 ( .A0(N9), .A1(n4), .B0(SR[3]), .B1(n3), .Y(n118) );
  NAND2X1 U14 ( .A(n122), .B(n116), .Y(SR0_9_) );
  INVXL U15 ( .A(SR[6]), .Y(n12) );
  AOI22XL U16 ( .A0(N19), .A1(n4), .B0(SR[13]), .B1(n3), .Y(n106) );
  INVXL U17 ( .A(SR[13]), .Y(n19) );
  INVXL U18 ( .A(SR[11]), .Y(n17) );
  INVXL U19 ( .A(SR[8]), .Y(n14) );
  AOI22XL U20 ( .A0(N17), .A1(SR0_10_), .B0(SR[11]), .B1(n3), .Y(n114) );
  AOI22XL U21 ( .A0(SR0_10_), .A1(N16), .B0(SR[10]), .B1(n3), .Y(n115) );
  AOI22XL U22 ( .A0(N14), .A1(n4), .B0(SR[8]), .B1(n3), .Y(n111) );
  AOI22XL U23 ( .A0(N12), .A1(n4), .B0(SR[6]), .B1(n3), .Y(n110) );
  AOI22XL U24 ( .A0(N7), .A1(n4), .B0(SR[1]), .B1(n3), .Y(n119) );
  INVXL U25 ( .A(N6), .Y(n6) );
  INVXL U26 ( .A(SR_15_), .Y(n3) );
  AOI22XL U27 ( .A0(N6), .A1(SR0_10_), .B0(N6), .B1(n3), .Y(n126) );
  INVX1 U28 ( .A(SR0_7_), .Y(n22) );
  MXI2X1 U29 ( .A(n77), .B(n80), .S0(SR0_7_), .Y(n97) );
  MXI2X1 U30 ( .A(n86), .B(n90), .S0(SR0_7_), .Y(n103) );
  MXI2X1 U31 ( .A(n81), .B(n79), .S0(SR0_7_), .Y(n98) );
  MXI2X1 U32 ( .A(n91), .B(n89), .S0(SR0_7_), .Y(n104) );
  MXI2X1 U33 ( .A(n84), .B(n85), .S0(SR0_7_), .Y(n105) );
  MXI2X1 U36 ( .A(n86), .B(n85), .S0(n22), .Y(n87) );
  NOR2X1 U37 ( .A(n22), .B(n76), .Y(n99) );
  MXI2X1 U38 ( .A(n77), .B(n76), .S0(n22), .Y(n78) );
  NOR2X1 U39 ( .A(n84), .B(n22), .Y(n88) );
  NAND3BX1 U40 ( .AN(n137), .B(n136), .C(n135), .Y(SR0_7_) );
  AOI2BB2X1 U41 ( .B0(n134), .B1(n133), .A0N(n132), .A1N(n131), .Y(n135) );
  AOI21X1 U42 ( .A0(n130), .A1(n129), .B0(n128), .Y(n131) );
  NOR2BX1 U43 ( .AN(N77), .B(n120), .Y(SR0_0_) );
  MXI2X1 U44 ( .A(n39), .B(n38), .S0(SR0_9_), .Y(N77) );
  MXI2X1 U45 ( .A(n97), .B(n98), .S0(SR0_8_), .Y(n38) );
  NAND2X1 U46 ( .A(n99), .B(SR0_8_), .Y(n39) );
  NOR2BX1 U47 ( .AN(N78), .B(n120), .Y(SR0_1_) );
  MXI2X1 U48 ( .A(n75), .B(n74), .S0(SR0_9_), .Y(N78) );
  NAND2X1 U49 ( .A(SR0_8_), .B(n105), .Y(n75) );
  MXI2X1 U50 ( .A(n103), .B(n104), .S0(SR0_8_), .Y(n74) );
  NOR2BX1 U51 ( .AN(N79), .B(n120), .Y(SR0_2_) );
  MXI2X1 U52 ( .A(n83), .B(n82), .S0(SR0_9_), .Y(N79) );
  MX4X1 U53 ( .A(n81), .B(n94), .C(n80), .D(n79), .S0(SR0_8_), .S1(n22), .Y(
        n82) );
  NAND2X1 U54 ( .A(SR0_8_), .B(n78), .Y(n83) );
  NOR2BX1 U55 ( .AN(N80), .B(n120), .Y(SR0_3_) );
  MXI2X1 U56 ( .A(n93), .B(n92), .S0(SR0_9_), .Y(N80) );
  MXI2X1 U57 ( .A(n88), .B(n87), .S0(SR0_8_), .Y(n93) );
  OAI21XL U58 ( .A0(n21), .A1(SR0_9_), .B0(n139), .Y(SR0_8_) );
  INVX1 U59 ( .A(n138), .Y(n21) );
  INVX1 U60 ( .A(n3), .Y(n4) );
  INVX1 U61 ( .A(n3), .Y(SR0_10_) );
  OAI221XL U62 ( .A0(n134), .A1(SR0_9_), .B0(n129), .B1(n138), .C0(n123), .Y(
        n137) );
  AOI21X1 U63 ( .A0(n139), .A1(n132), .B0(n32), .Y(n123) );
  NAND2X1 U64 ( .A(n134), .B(n117), .Y(n133) );
  NAND2X1 U65 ( .A(n129), .B(n119), .Y(n130) );
  NAND2X1 U66 ( .A(n127), .B(n118), .Y(n138) );
  NAND2X1 U67 ( .A(n139), .B(n115), .Y(n132) );
  MXI2X1 U68 ( .A(n37), .B(n31), .S0(SR0_6_), .Y(n76) );
  MXI2X1 U69 ( .A(n31), .B(n30), .S0(SR0_6_), .Y(n85) );
  MXI2X1 U70 ( .A(n30), .B(n29), .S0(SR0_6_), .Y(n77) );
  MXI2X1 U71 ( .A(n29), .B(n28), .S0(SR0_6_), .Y(n86) );
  NAND2X1 U72 ( .A(SR0_6_), .B(n37), .Y(n84) );
  NOR2X1 U73 ( .A(n138), .B(n30), .Y(n129) );
  NOR2X1 U74 ( .A(n33), .B(n32), .Y(n136) );
  NOR2X1 U75 ( .A(SR0_9_), .B(n26), .Y(n134) );
  MXI2X1 U76 ( .A(n28), .B(n27), .S0(SR0_6_), .Y(n80) );
  MXI2X1 U77 ( .A(n27), .B(n26), .S0(SR0_6_), .Y(n90) );
  MXI2X1 U78 ( .A(n26), .B(n25), .S0(SR0_6_), .Y(n81) );
  MXI2X1 U79 ( .A(n25), .B(n24), .S0(SR0_6_), .Y(n91) );
  MXI2X1 U80 ( .A(n24), .B(n23), .S0(SR0_6_), .Y(n79) );
  MXI2X1 U81 ( .A(n23), .B(n36), .S0(SR0_6_), .Y(n89) );
  MXI2X1 U82 ( .A(n36), .B(n35), .S0(SR0_6_), .Y(n94) );
  MXI2X1 U83 ( .A(n35), .B(n34), .S0(SR0_6_), .Y(n100) );
  NOR2X1 U84 ( .A(n128), .B(n24), .Y(n122) );
  OR2X2 U85 ( .A(n132), .B(n23), .Y(n128) );
  OR2X2 U86 ( .A(n120), .B(N82), .Y(SR0_5_) );
  MXI2X1 U87 ( .A(n101), .B(n100), .S0(n22), .Y(n102) );
  MXI2X1 U88 ( .A(n33), .B(n32), .S0(SR0_6_), .Y(n101) );
  NOR2X1 U89 ( .A(n133), .B(n28), .Y(n127) );
  NOR2BX1 U90 ( .AN(N81), .B(n120), .Y(SR0_4_) );
  MXI2X1 U91 ( .A(n95), .B(n94), .S0(n22), .Y(n96) );
  MXI2X1 U92 ( .A(n34), .B(n33), .S0(SR0_6_), .Y(n95) );
  NOR2X1 U93 ( .A(n130), .B(n37), .Y(n120) );
  INVX1 U94 ( .A(n118), .Y(n29) );
  INVX1 U95 ( .A(n116), .Y(n25) );
  INVX1 U96 ( .A(n119), .Y(n31) );
  INVX1 U97 ( .A(n115), .Y(n36) );
  INVX1 U98 ( .A(n117), .Y(n27) );
  INVX1 U99 ( .A(n114), .Y(n35) );
  INVX1 U100 ( .A(n113), .Y(n34) );
  AOI22X1 U101 ( .A0(N18), .A1(SR0_10_), .B0(SR[12]), .B1(n3), .Y(n113) );
  INVX1 U102 ( .A(n107), .Y(n32) );
  AOI22X1 U103 ( .A0(N20), .A1(n4), .B0(SR[14]), .B1(n3), .Y(n107) );
  INVX1 U104 ( .A(SR[14]), .Y(n20) );
  INVX1 U105 ( .A(n106), .Y(n33) );
  AOI21X1 U106 ( .A0(n136), .A1(n124), .B0(n137), .Y(n125) );
  OAI21XL U107 ( .A0(n122), .A1(n128), .B0(n121), .Y(n124) );
  INVX1 U108 ( .A(SR[3]), .Y(n9) );
  INVXL U109 ( .A(SR[2]), .Y(n8) );
  INVXL U110 ( .A(SR[7]), .Y(n13) );
  INVXL U111 ( .A(SR[9]), .Y(n15) );
  INVXL U112 ( .A(SR[5]), .Y(n11) );
  INVX1 U113 ( .A(n112), .Y(n23) );
  AOI22XL U114 ( .A0(N15), .A1(n4), .B0(SR[9]), .B1(n3), .Y(n112) );
  INVX1 U115 ( .A(SR[12]), .Y(n18) );
  AOI22XL U116 ( .A0(N13), .A1(n4), .B0(SR[7]), .B1(n3), .Y(n116) );
  AOI22XL U117 ( .A0(N11), .A1(n4), .B0(SR[5]), .B1(n3), .Y(n117) );
  INVX1 U118 ( .A(n110), .Y(n26) );
  INVX1 U119 ( .A(n108), .Y(n30) );
  AOI22XL U120 ( .A0(N8), .A1(n4), .B0(SR[2]), .B1(n3), .Y(n108) );
  INVX1 U121 ( .A(n109), .Y(n28) );
  AOI22XL U122 ( .A0(N10), .A1(n4), .B0(SR[4]), .B1(n3), .Y(n109) );
  INVX1 U123 ( .A(n111), .Y(n24) );
  INVX1 U124 ( .A(n126), .Y(n37) );
  XOR2X1 U125 ( .A(n20), .B(sub_53_carry[14]), .Y(N20) );
  AND2X1 U126 ( .A(sub_53_carry[13]), .B(n19), .Y(sub_53_carry[14]) );
  XOR2X1 U127 ( .A(n19), .B(sub_53_carry[13]), .Y(N19) );
  AND2X1 U128 ( .A(sub_53_carry[12]), .B(n18), .Y(sub_53_carry[13]) );
  XOR2X1 U129 ( .A(n18), .B(sub_53_carry[12]), .Y(N18) );
  AND2X1 U130 ( .A(sub_53_carry[11]), .B(n17), .Y(sub_53_carry[12]) );
  XOR2X1 U131 ( .A(n17), .B(sub_53_carry[11]), .Y(N17) );
  AND2X1 U132 ( .A(sub_53_carry[10]), .B(n16), .Y(sub_53_carry[11]) );
  XOR2X1 U133 ( .A(n16), .B(sub_53_carry[10]), .Y(N16) );
  XOR2X1 U134 ( .A(n15), .B(sub_53_carry[9]), .Y(N15) );
  AND2X1 U135 ( .A(sub_53_carry[8]), .B(n14), .Y(sub_53_carry[9]) );
  XOR2X1 U136 ( .A(n14), .B(sub_53_carry[8]), .Y(N14) );
  XOR2X1 U137 ( .A(n13), .B(sub_53_carry[7]), .Y(N13) );
  AND2X1 U138 ( .A(sub_53_carry[6]), .B(n12), .Y(sub_53_carry[7]) );
  XOR2X1 U139 ( .A(n12), .B(sub_53_carry[6]), .Y(N12) );
  AND2X1 U140 ( .A(sub_53_carry[5]), .B(n11), .Y(sub_53_carry[6]) );
  XOR2X1 U141 ( .A(n11), .B(sub_53_carry[5]), .Y(N11) );
  AND2X1 U142 ( .A(sub_53_carry[4]), .B(n10), .Y(sub_53_carry[5]) );
  XOR2X1 U143 ( .A(n10), .B(sub_53_carry[4]), .Y(N10) );
  AND2X1 U144 ( .A(sub_53_carry[3]), .B(n9), .Y(sub_53_carry[4]) );
  XOR2X1 U145 ( .A(n9), .B(sub_53_carry[3]), .Y(N9) );
  AND2X1 U146 ( .A(sub_53_carry[2]), .B(n8), .Y(sub_53_carry[3]) );
  XOR2X1 U147 ( .A(n8), .B(sub_53_carry[2]), .Y(N8) );
  XOR2X1 U148 ( .A(n7), .B(n6), .Y(N7) );
endmodule

