
module FLOATB_1 ( SR, SR0 );
  input [15:0] SR;
  output [10:0] SR0;
  wire   SR_15_, SR0_9_, SR0_8_, SR0_7_, SR0_6_, SR0_5_, SR0_4_, SR0_3_,
         SR0_2_, SR0_1_, SR0_0_, N6, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, SR0_10_, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152;
  assign SR_15_ = SR[15];
  assign SR0[9] = SR0_9_;
  assign SR0[8] = SR0_8_;
  assign SR0[7] = SR0_7_;
  assign SR0[6] = SR0_6_;
  assign SR0[5] = SR0_5_;
  assign SR0[4] = SR0_4_;
  assign SR0[3] = SR0_3_;
  assign SR0[2] = SR0_2_;
  assign SR0[1] = SR0_1_;
  assign SR0[0] = SR0_0_;
  assign N6 = SR[0];
  assign SR0[10] = SR0_10_;

  MX2X2 U3 ( .A(SR[12]), .B(n18), .S0(SR0_10_), .Y(n5) );
  MX2X2 U4 ( .A(SR[11]), .B(n15), .S0(SR0_10_), .Y(n6) );
  NAND2X2 U5 ( .A(SR0_10_), .B(n21), .Y(n16) );
  BUFX20 U6 ( .A(SR_15_), .Y(SR0_10_) );
  MX4X1 U7 ( .A(n91), .B(n92), .C(n89), .D(n90), .S0(SR0_8_), .S1(SR0_7_), .Y(
        n105) );
  OAI221XL U8 ( .A0(n119), .A1(n121), .B0(n122), .B1(n115), .C0(n70), .Y(n140)
         );
  NAND4X1 U9 ( .A(n90), .B(n147), .C(n107), .D(n146), .Y(n49) );
  NOR2BX1 U10 ( .AN(n65), .B(n46), .Y(n3) );
  NOR2X1 U11 ( .A(n80), .B(SR0_9_), .Y(n58) );
  OR2X2 U12 ( .A(n146), .B(n118), .Y(n133) );
  NOR2BX1 U13 ( .AN(n121), .B(n53), .Y(n57) );
  AOI2BB1X1 U14 ( .A0N(SR0_9_), .A1N(n95), .B0(n51), .Y(n52) );
  OAI222XL U15 ( .A0(SR0_7_), .A1(n139), .B0(n118), .B1(n115), .C0(n116), .C1(
        n121), .Y(n1) );
  INVX1 U16 ( .A(n1), .Y(n103) );
  AOI21X1 U17 ( .A0(n53), .A1(n109), .B0(n49), .Y(n2) );
  INVX1 U18 ( .A(n2), .Y(SR0_8_) );
  NAND2X1 U19 ( .A(n89), .B(n3), .Y(SR0_9_) );
  AND4X1 U20 ( .A(n147), .B(n146), .C(n107), .D(n119), .Y(n152) );
  AOI21XL U21 ( .A0(n57), .A1(n64), .B0(n74), .Y(n60) );
  OAI2BB2X1 U22 ( .B0(n60), .B1(n59), .A0N(n81), .A1N(n58), .Y(n63) );
  NAND2XL U23 ( .A(n47), .B(n146), .Y(n55) );
  OR2X2 U24 ( .A(n151), .B(n139), .Y(n143) );
  INVX1 U25 ( .A(n115), .Y(n79) );
  INVX1 U26 ( .A(SR0_6_), .Y(n104) );
  INVX1 U27 ( .A(n118), .Y(n130) );
  INVX1 U28 ( .A(SR0_8_), .Y(n137) );
  NAND2X1 U29 ( .A(n12), .B(n117), .Y(n48) );
  NAND2XL U30 ( .A(n108), .B(n127), .Y(n78) );
  NAND2XL U31 ( .A(n73), .B(n148), .Y(n77) );
  MXI2X1 U32 ( .A(n145), .B(n86), .S0(n137), .Y(n87) );
  NAND2X1 U33 ( .A(SR0_6_), .B(n93), .Y(n122) );
  NAND2BX1 U34 ( .AN(SR0_9_), .B(n137), .Y(n151) );
  NAND2BX1 U35 ( .AN(SR0_9_), .B(SR0_8_), .Y(n150) );
  NAND2X1 U36 ( .A(n104), .B(n93), .Y(n119) );
  INVX1 U37 ( .A(n59), .Y(n50) );
  NAND2XL U38 ( .A(SR0_7_), .B(n104), .Y(n116) );
  INVXL U39 ( .A(SR0_7_), .Y(n93) );
  NAND2XL U40 ( .A(n130), .B(n74), .Y(n67) );
  NAND2XL U41 ( .A(n129), .B(n130), .Y(n76) );
  AOI21XL U42 ( .A0(n130), .A1(n110), .B0(n109), .Y(n112) );
  MXI2XL U43 ( .A(n149), .B(n108), .S0(n137), .Y(n110) );
  AOI21XL U44 ( .A0(n148), .A1(n98), .B0(n109), .Y(n99) );
  MXI2XL U45 ( .A(n108), .B(n97), .S0(n137), .Y(n98) );
  NAND2XL U46 ( .A(n141), .B(n140), .Y(n142) );
  NAND2XL U47 ( .A(n128), .B(n127), .Y(n135) );
  NAND2XL U48 ( .A(n129), .B(n148), .Y(n134) );
  NAND2XL U49 ( .A(n130), .B(n80), .Y(n83) );
  NAND2XL U50 ( .A(n97), .B(n127), .Y(n85) );
  NAND2XL U51 ( .A(n79), .B(n148), .Y(n84) );
  NAND2XL U52 ( .A(n149), .B(n131), .Y(n132) );
  NAND2XL U53 ( .A(n74), .B(n131), .Y(n75) );
  NAND2XL U54 ( .A(n131), .B(n106), .Y(n100) );
  NAND2XL U55 ( .A(n131), .B(n108), .Y(n66) );
  NAND2XL U56 ( .A(n131), .B(n81), .Y(n82) );
  NAND2XL U57 ( .A(n127), .B(n106), .Y(n113) );
  OAI211XL U58 ( .A0(n57), .A1(n53), .B0(n147), .C0(n52), .Y(n61) );
  NOR2XL U59 ( .A(n50), .B(n49), .Y(n51) );
  OAI22XL U60 ( .A0(n118), .A1(n117), .B0(n116), .B1(n115), .Y(n124) );
  NAND4BXL U61 ( .AN(n145), .B(n152), .C(n151), .D(n150), .Y(SR0_5_) );
  NAND2XL U62 ( .A(n105), .B(SR0_6_), .Y(n101) );
  INVXL U63 ( .A(n91), .Y(n81) );
  INVXL U64 ( .A(n92), .Y(n74) );
  INVXL U65 ( .A(n117), .Y(n97) );
  MXI2XL U66 ( .A(n64), .B(N6), .S0(n104), .Y(n139) );
  NAND2X1 U67 ( .A(n4), .B(n24), .Y(n94) );
  MX2X1 U68 ( .A(SR[10]), .B(n23), .S0(SR0_10_), .Y(n4) );
  NAND2X1 U69 ( .A(n5), .B(n19), .Y(n107) );
  NAND2XL U70 ( .A(n127), .B(N6), .Y(n72) );
  NAND2X1 U71 ( .A(n6), .B(n17), .Y(n90) );
  NOR3BXL U72 ( .AN(N6), .B(n151), .C(n118), .Y(n111) );
  NAND2X1 U73 ( .A(n7), .B(n34), .Y(n95) );
  MX2X1 U74 ( .A(SR[6]), .B(n33), .S0(SR0_10_), .Y(n7) );
  NAND2X1 U75 ( .A(n8), .B(n28), .Y(n89) );
  MX2X1 U76 ( .A(SR[7]), .B(n14), .S0(SR0_10_), .Y(n8) );
  NAND2X1 U77 ( .A(n9), .B(n30), .Y(n65) );
  MX2X1 U78 ( .A(SR[8]), .B(n29), .S0(SR0_10_), .Y(n9) );
  NAND2XL U79 ( .A(n10), .B(n45), .Y(n121) );
  MX2X1 U80 ( .A(SR[2]), .B(n44), .S0(SR0_10_), .Y(n10) );
  NAND2XL U81 ( .A(n11), .B(n43), .Y(n120) );
  MX2X1 U82 ( .A(SR[1]), .B(n42), .S0(SR0_10_), .Y(n11) );
  INVX1 U83 ( .A(n150), .Y(n141) );
  INVX1 U84 ( .A(n119), .Y(n148) );
  INVX1 U85 ( .A(n116), .Y(n131) );
  INVX1 U86 ( .A(SR0_9_), .Y(n109) );
  INVX1 U87 ( .A(n122), .Y(n127) );
  NAND4X1 U88 ( .A(n69), .B(n68), .C(n67), .D(n66), .Y(n138) );
  NAND2X1 U89 ( .A(n127), .B(n73), .Y(n69) );
  NAND2X1 U90 ( .A(n148), .B(n80), .Y(n68) );
  NAND4X1 U91 ( .A(n78), .B(n77), .C(n76), .D(n75), .Y(n145) );
  NAND4X1 U92 ( .A(n135), .B(n134), .C(n133), .D(n132), .Y(n136) );
  NAND4X1 U93 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n86) );
  NAND3X1 U94 ( .A(n144), .B(n143), .C(n142), .Y(SR0_4_) );
  AOI21X1 U95 ( .A0(n138), .A1(n137), .B0(n136), .Y(n144) );
  OR2X2 U96 ( .A(n79), .B(n48), .Y(n53) );
  NAND2X1 U97 ( .A(n105), .B(n104), .Y(n114) );
  NAND2X1 U98 ( .A(SR0_6_), .B(SR0_7_), .Y(n118) );
  NAND3BX1 U99 ( .AN(n63), .B(n146), .C(n62), .Y(SR0_7_) );
  INVX1 U100 ( .A(n61), .Y(n62) );
  OAI31X1 U101 ( .A0(n93), .A1(n139), .A2(n150), .B0(n71), .Y(SR0_0_) );
  MXI2X1 U102 ( .A(n138), .B(n140), .S0(n137), .Y(n71) );
  NAND2X1 U103 ( .A(n50), .B(n92), .Y(n46) );
  AOI22X1 U104 ( .A0(n97), .A1(n131), .B0(n130), .B1(n81), .Y(n70) );
  OAI21XL U105 ( .A0(n103), .A1(n150), .B0(n102), .Y(SR0_2_) );
  NAND3X1 U106 ( .A(n101), .B(n100), .C(n99), .Y(n102) );
  NAND2BX1 U107 ( .AN(n49), .B(n94), .Y(n59) );
  NAND2X1 U108 ( .A(n126), .B(n125), .Y(SR0_3_) );
  OAI21XL U109 ( .A0(n124), .A1(n123), .B0(n141), .Y(n125) );
  AOI31X1 U110 ( .A0(n114), .A1(n113), .A2(n112), .B0(n111), .Y(n126) );
  OAI22X1 U111 ( .A0(n122), .A1(n121), .B0(n120), .B1(n119), .Y(n123) );
  AND2X2 U112 ( .A(n58), .B(n91), .Y(n12) );
  INVX1 U113 ( .A(n90), .Y(n128) );
  INVX1 U114 ( .A(n95), .Y(n80) );
  OAI21XL U115 ( .A0(n3), .A1(n46), .B0(n107), .Y(n47) );
  INVX1 U116 ( .A(n89), .Y(n73) );
  INVX1 U117 ( .A(n96), .Y(n106) );
  OAI21XL U118 ( .A0(SR0_8_), .A1(n95), .B0(n94), .Y(n96) );
  INVX1 U119 ( .A(n120), .Y(n64) );
  INVX1 U120 ( .A(n65), .Y(n108) );
  INVX1 U121 ( .A(n107), .Y(n149) );
  INVX1 U122 ( .A(n94), .Y(n129) );
  NAND4X1 U123 ( .A(n56), .B(n55), .C(n54), .D(n62), .Y(SR0_6_) );
  NAND2X1 U124 ( .A(n48), .B(n12), .Y(n54) );
  NAND3X1 U125 ( .A(N6), .B(n120), .C(n57), .Y(n56) );
  NAND2BX1 U126 ( .AN(n22), .B(n21), .Y(n146) );
  MXI2X1 U127 ( .A(SR[13]), .B(n20), .S0(SR0_10_), .Y(n22) );
  NAND2X1 U128 ( .A(SR[13]), .B(n19), .Y(n20) );
  NAND2X1 U129 ( .A(SR[12]), .B(n17), .Y(n18) );
  OR2X2 U130 ( .A(SR[2]), .B(n43), .Y(n45) );
  OR2X2 U131 ( .A(SR[3]), .B(n45), .Y(n38) );
  OR2X2 U132 ( .A(SR[4]), .B(n38), .Y(n40) );
  OR2X2 U133 ( .A(SR[5]), .B(n40), .Y(n36) );
  OR2X2 U134 ( .A(SR[8]), .B(n28), .Y(n30) );
  OR2X2 U135 ( .A(SR[6]), .B(n36), .Y(n34) );
  OR2X2 U136 ( .A(SR[9]), .B(n30), .Y(n26) );
  OR2X2 U137 ( .A(SR[7]), .B(n34), .Y(n28) );
  OR2X2 U138 ( .A(SR[10]), .B(n26), .Y(n24) );
  OR2X2 U139 ( .A(SR[12]), .B(n17), .Y(n19) );
  OR2X2 U140 ( .A(SR[11]), .B(n24), .Y(n17) );
  NAND2BX1 U141 ( .AN(n27), .B(n26), .Y(n92) );
  MXI2X1 U142 ( .A(SR[9]), .B(n25), .S0(SR0_10_), .Y(n27) );
  NAND2X1 U143 ( .A(SR[9]), .B(n30), .Y(n25) );
  NAND2X1 U144 ( .A(SR[10]), .B(n26), .Y(n23) );
  NAND2X1 U145 ( .A(SR[11]), .B(n24), .Y(n15) );
  XOR2X1 U146 ( .A(n16), .B(SR[14]), .Y(n147) );
  OAI2BB1X1 U147 ( .A0N(n141), .A1N(n88), .B0(n87), .Y(SR0_1_) );
  OAI221XL U148 ( .A0(n120), .A1(n116), .B0(n118), .B1(n121), .C0(n72), .Y(n88) );
  OR2X2 U149 ( .A(SR[13]), .B(n19), .Y(n21) );
  NAND2BX1 U150 ( .AN(n32), .B(n38), .Y(n115) );
  MXI2X1 U151 ( .A(SR[3]), .B(n31), .S0(SR0_10_), .Y(n32) );
  NAND2X1 U152 ( .A(SR[3]), .B(n45), .Y(n31) );
  NAND2BX1 U153 ( .AN(n41), .B(n40), .Y(n117) );
  MXI2X1 U154 ( .A(SR[4]), .B(n39), .S0(SR0_10_), .Y(n41) );
  NAND2X1 U155 ( .A(SR[4]), .B(n38), .Y(n39) );
  OR2X2 U156 ( .A(SR[1]), .B(N6), .Y(n43) );
  NAND2BX1 U157 ( .AN(n37), .B(n36), .Y(n91) );
  MXI2X1 U158 ( .A(SR[5]), .B(n35), .S0(SR0_10_), .Y(n37) );
  NAND2X1 U159 ( .A(SR[5]), .B(n40), .Y(n35) );
  NAND2X1 U160 ( .A(SR[6]), .B(n36), .Y(n33) );
  NAND2X1 U161 ( .A(SR[2]), .B(n43), .Y(n44) );
  NAND2X1 U162 ( .A(SR[7]), .B(n34), .Y(n14) );
  NAND2X1 U163 ( .A(SR[8]), .B(n28), .Y(n29) );
  NAND2X1 U164 ( .A(SR[1]), .B(N6), .Y(n42) );
endmodule

