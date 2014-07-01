
module RECONST_0 ( I, RATE, DQLN, DQS );
  input [4:0] I;
  input [1:0] RATE;
  output [11:0] DQLN;
  output DQS;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164;

  OAI2BB1X1 U3 ( .A0N(n144), .A1N(n153), .B0(n143), .Y(DQLN[8]) );
  NAND2X1 U4 ( .A(I[4]), .B(n58), .Y(n121) );
  NAND3X1 U5 ( .A(n113), .B(n156), .C(n55), .Y(n52) );
  OR2X2 U6 ( .A(n17), .B(n52), .Y(n119) );
  NAND2X1 U7 ( .A(I[0]), .B(n153), .Y(n91) );
  OR2X2 U8 ( .A(n55), .B(n121), .Y(n40) );
  AOI2BB1X1 U9 ( .A0N(n139), .A1N(n126), .B0(n28), .Y(n30) );
  OAI32X1 U10 ( .A0(n63), .A1(n112), .A2(n117), .B0(n147), .B1(n39), .Y(n43)
         );
  AOI2BB1X1 U11 ( .A0N(n106), .A1N(n111), .B0(n107), .Y(n108) );
  NOR2X1 U12 ( .A(n63), .B(n112), .Y(n86) );
  OR3XL U13 ( .A(n12), .B(n122), .C(n148), .Y(n3) );
  AND2X2 U14 ( .A(n114), .B(n49), .Y(n120) );
  AND4X2 U15 ( .A(n105), .B(n141), .C(n77), .D(n76), .Y(n1) );
  INVX1 U16 ( .A(n1), .Y(DQLN[4]) );
  OR2X2 U17 ( .A(n117), .B(n119), .Y(n111) );
  OAI32X1 U18 ( .A0(n33), .A1(n102), .A2(n63), .B0(n163), .B1(n91), .Y(
        DQLN[10]) );
  NAND3X1 U19 ( .A(n72), .B(DQS), .C(n52), .Y(n20) );
  NAND2X1 U20 ( .A(n90), .B(n121), .Y(n149) );
  OAI21XL U21 ( .A0(n33), .A1(n69), .B0(n98), .Y(n135) );
  AOI211X1 U22 ( .A0(n2), .A1(n38), .B0(n43), .C0(n42), .Y(n44) );
  INVX1 U23 ( .A(n156), .Y(n2) );
  OR3XL U24 ( .A(n90), .B(n126), .C(n119), .Y(n95) );
  NAND2X1 U25 ( .A(I[0]), .B(n64), .Y(n156) );
  NAND2X1 U26 ( .A(I[2]), .B(n64), .Y(n41) );
  NAND2X1 U27 ( .A(I[4]), .B(n133), .Y(n139) );
  AOI32X1 U28 ( .A0(n134), .A1(n153), .A2(n100), .B0(n81), .B1(n7), .Y(n4) );
  NAND2X1 U29 ( .A(I[1]), .B(n154), .Y(n113) );
  OR2X2 U30 ( .A(n69), .B(n147), .Y(n163) );
  NAND2X1 U31 ( .A(I[2]), .B(n50), .Y(n122) );
  NAND4X1 U32 ( .A(n4), .B(n48), .C(n60), .D(n59), .Y(DQLN[3]) );
  NAND2X1 U33 ( .A(I[3]), .B(n154), .Y(n71) );
  AOI221X1 U34 ( .A0(I[2]), .A1(n64), .B0(I[4]), .B1(n153), .C0(n11), .Y(n9)
         );
  NAND2BX1 U35 ( .AN(n34), .B(n9), .Y(n114) );
  INVX1 U36 ( .A(I[3]), .Y(n17) );
  INVX1 U37 ( .A(n112), .Y(n154) );
  INVX1 U38 ( .A(n46), .Y(n81) );
  NAND2BX1 U39 ( .AN(n38), .B(n153), .Y(n55) );
  INVX1 U40 ( .A(I[0]), .Y(n34) );
  NAND2BX1 U41 ( .AN(n158), .B(n91), .Y(n90) );
  INVX1 U42 ( .A(I[1]), .Y(n16) );
  INVX1 U43 ( .A(n122), .Y(n133) );
  INVX1 U44 ( .A(n72), .Y(n50) );
  INVX1 U45 ( .A(n69), .Y(n99) );
  INVX1 U46 ( .A(I[2]), .Y(n38) );
  OAI2BB1X1 U47 ( .A0N(I[1]), .A1N(n81), .B0(n71), .Y(n11) );
  INVX1 U48 ( .A(n148), .Y(n153) );
  INVX1 U49 ( .A(I[4]), .Y(n158) );
  NAND2BX1 U50 ( .AN(n17), .B(n153), .Y(n157) );
  NAND2BXL U51 ( .AN(n16), .B(n153), .Y(n126) );
  NAND2BXL U52 ( .AN(n38), .B(n154), .Y(n106) );
  NAND3X1 U53 ( .A(n58), .B(I[2]), .C(n91), .Y(n101) );
  NOR2BXL U54 ( .AN(n149), .B(n55), .Y(n56) );
  INVX1 U55 ( .A(n13), .Y(n132) );
  NAND2BXL U56 ( .AN(n158), .B(n153), .Y(n102) );
  AND2X1 U57 ( .A(n64), .B(I[1]), .Y(n6) );
  INVX1 U58 ( .A(n49), .Y(n134) );
  INVX1 U59 ( .A(n89), .Y(n96) );
  AOI2BB2X1 U60 ( .B0(n132), .B1(n91), .A0N(n70), .A1N(n90), .Y(n35) );
  INVXL U61 ( .A(n117), .Y(n58) );
  NAND2BXL U62 ( .AN(n117), .B(n82), .Y(n70) );
  NAND2XL U63 ( .A(n50), .B(n154), .Y(n54) );
  NAND2XL U64 ( .A(n97), .B(n154), .Y(n105) );
  NOR2XL U65 ( .A(n148), .B(n147), .Y(n150) );
  INVX4 U66 ( .A(n9), .Y(DQS) );
  NAND4X1 U67 ( .A(n3), .B(n22), .C(n4), .D(n21), .Y(DQLN[0]) );
  OAI22XL U68 ( .A0(n157), .A1(n90), .B0(n119), .B1(n54), .Y(n85) );
  OAI22XL U69 ( .A0(n119), .A1(n106), .B0(n54), .B1(n49), .Y(n127) );
  NAND2XL U70 ( .A(n84), .B(n65), .Y(n31) );
  AOI21XL U71 ( .A0(n105), .A1(n104), .B0(DQS), .Y(n107) );
  AOI21XL U72 ( .A0(n70), .A1(n69), .B0(n106), .Y(n74) );
  NOR2XL U73 ( .A(n72), .B(n121), .Y(n15) );
  NOR2XL U74 ( .A(n72), .B(n90), .Y(n23) );
  AOI21XL U75 ( .A0(n99), .A1(n91), .B0(n128), .Y(n12) );
  NOR2XL U76 ( .A(n147), .B(n91), .Y(n57) );
  NAND2XL U77 ( .A(n159), .B(n82), .Y(n24) );
  NOR2XL U78 ( .A(n122), .B(n121), .Y(n123) );
  NAND3BXL U79 ( .AN(n91), .B(n99), .C(n133), .Y(n94) );
  NAND2XL U80 ( .A(n86), .B(n84), .Y(n48) );
  NAND2XL U81 ( .A(n153), .B(n68), .Y(n75) );
  AND3X1 U82 ( .A(n134), .B(n82), .C(n91), .Y(n37) );
  INVXL U83 ( .A(n91), .Y(n145) );
  AND3X1 U84 ( .A(n142), .B(n141), .C(n140), .Y(n143) );
  NAND3XL U85 ( .A(n139), .B(n138), .C(n137), .Y(n144) );
  AOI21XL U86 ( .A0(n134), .A1(n133), .B0(n132), .Y(n138) );
  NAND3X1 U87 ( .A(n5), .B(n109), .C(n108), .Y(DQLN[6]) );
  AND4X2 U88 ( .A(n96), .B(n95), .C(n94), .D(n93), .Y(n5) );
  OAI22XL U89 ( .A0(n52), .A1(n121), .B0(DQS), .B1(n63), .Y(n68) );
  NAND2BXL U90 ( .AN(n34), .B(n154), .Y(n39) );
  NOR2XL U91 ( .A(n16), .B(n119), .Y(n14) );
  NAND2BXL U92 ( .AN(n51), .B(n82), .Y(n104) );
  NOR2XL U93 ( .A(n72), .B(n155), .Y(n73) );
  NAND2BXL U94 ( .AN(n51), .B(n50), .Y(n61) );
  AOI21XL U95 ( .A0(n133), .A1(n82), .B0(n81), .Y(n83) );
  NAND2BXL U96 ( .AN(n17), .B(n91), .Y(n33) );
  NOR2XL U97 ( .A(n136), .B(n135), .Y(n137) );
  NOR2XL U98 ( .A(n34), .B(n106), .Y(n27) );
  NAND3XL U99 ( .A(n50), .B(n58), .C(n25), .Y(n26) );
  NAND3XL U100 ( .A(n64), .B(n63), .C(n62), .Y(n141) );
  NOR2XL U101 ( .A(n102), .B(n101), .Y(n103) );
  NAND3XL U102 ( .A(n156), .B(n71), .C(n18), .Y(n19) );
  NAND2BXL U103 ( .AN(n140), .B(n7), .Y(n93) );
  NAND3BXL U104 ( .AN(n146), .B(n9), .C(I[3]), .Y(n152) );
  NAND2XL U105 ( .A(n150), .B(n149), .Y(n151) );
  AOI21XL U106 ( .A0(n145), .A1(I[2]), .B0(n159), .Y(n146) );
  OAI31XL U107 ( .A0(n148), .A1(n147), .A2(DQS), .B0(n66), .Y(n67) );
  NAND2XL U108 ( .A(I[2]), .B(I[1]), .Y(n63) );
  NAND2XL U109 ( .A(I[0]), .B(I[1]), .Y(n51) );
  NAND2XL U110 ( .A(n154), .B(n92), .Y(n140) );
  OR2XL U111 ( .A(I[2]), .B(I[1]), .Y(n62) );
  NOR2X1 U112 ( .A(n154), .B(n153), .Y(n164) );
  INVX1 U113 ( .A(n52), .Y(n82) );
  INVX1 U114 ( .A(n10), .Y(n64) );
  NAND2BX1 U115 ( .AN(RATE[0]), .B(RATE[1]), .Y(n10) );
  NAND2X1 U116 ( .A(n153), .B(n53), .Y(n60) );
  AOI211X1 U117 ( .A0(n58), .A1(n85), .B0(n57), .C0(n56), .Y(n59) );
  OR2X2 U118 ( .A(RATE[0]), .B(RATE[1]), .Y(n148) );
  NAND2X1 U119 ( .A(RATE[1]), .B(RATE[0]), .Y(n46) );
  NAND2BX1 U120 ( .AN(RATE[1]), .B(RATE[0]), .Y(n112) );
  OAI211X1 U121 ( .A0(n114), .A1(n70), .B0(n111), .C0(n118), .Y(n136) );
  NAND2X1 U122 ( .A(n39), .B(n126), .Y(n117) );
  NAND2X1 U123 ( .A(n20), .B(n19), .Y(n21) );
  OAI31X1 U124 ( .A0(n15), .A1(n132), .A2(n14), .B0(n145), .Y(n22) );
  NAND4X1 U125 ( .A(n32), .B(n110), .C(n31), .D(n30), .Y(DQLN[1]) );
  OAI31X1 U126 ( .A0(n23), .A1(n136), .A2(n68), .B0(n153), .Y(n32) );
  NAND2BX1 U127 ( .AN(n72), .B(n82), .Y(n147) );
  OAI221XL U128 ( .A0(n120), .A1(n52), .B0(DQS), .B1(n61), .C0(n115), .Y(n53)
         );
  NAND2X1 U129 ( .A(n128), .B(n159), .Y(n118) );
  INVX1 U130 ( .A(n114), .Y(n84) );
  INVX1 U131 ( .A(n90), .Y(n128) );
  NAND2BX1 U132 ( .AN(n119), .B(n9), .Y(n13) );
  NAND2BX1 U133 ( .AN(n72), .B(n84), .Y(n116) );
  OAI21XL U134 ( .A0(n120), .A1(n119), .B0(n118), .Y(n124) );
  OAI21XL U135 ( .A0(n117), .A1(n116), .B0(n115), .Y(n125) );
  OAI2BB1X1 U136 ( .A0N(n24), .A1N(n116), .B0(n64), .Y(n110) );
  NAND2BX1 U137 ( .AN(n117), .B(n9), .Y(n69) );
  INVX1 U138 ( .A(n61), .Y(n97) );
  OAI21XL U139 ( .A0(n164), .A1(n163), .B0(n162), .Y(DQLN[11]) );
  INVX1 U140 ( .A(n113), .Y(n25) );
  INVX1 U141 ( .A(n157), .Y(n65) );
  INVX1 U142 ( .A(n126), .Y(n29) );
  INVX1 U143 ( .A(n33), .Y(n100) );
  NAND3BX1 U144 ( .AN(n6), .B(n106), .C(n157), .Y(n72) );
  NAND4X1 U145 ( .A(n47), .B(n46), .C(n45), .D(n44), .Y(DQLN[2]) );
  NOR2X1 U146 ( .A(DQLN[10]), .B(n127), .Y(n45) );
  OAI21XL U147 ( .A0(n37), .A1(n78), .B0(n153), .Y(n47) );
  MXI2X1 U148 ( .A(n81), .B(n67), .S0(n7), .Y(n77) );
  NOR3BX1 U149 ( .AN(n75), .B(n74), .C(n73), .Y(n76) );
  AOI21X1 U150 ( .A0(n153), .A1(n135), .B0(n103), .Y(n109) );
  NAND2BX1 U151 ( .AN(n16), .B(n9), .Y(n49) );
  OAI2BB1X1 U152 ( .A0N(n153), .A1N(n88), .B0(n87), .Y(DQLN[5]) );
  AOI211X1 U153 ( .A0(n86), .A1(n9), .B0(n89), .C0(n85), .Y(n87) );
  NAND2X1 U154 ( .A(n80), .B(n116), .Y(n88) );
  NOR2X1 U155 ( .A(n79), .B(n78), .Y(n80) );
  NAND2BX1 U156 ( .AN(n36), .B(n35), .Y(n78) );
  OAI22X1 U157 ( .A0(n63), .A1(n114), .B0(n34), .B1(n139), .Y(n36) );
  OAI2BB1X1 U158 ( .A0N(n27), .A1N(n82), .B0(n26), .Y(n28) );
  INVX1 U159 ( .A(n79), .Y(n115) );
  OAI2BB1X1 U160 ( .A0N(n6), .A1N(n84), .B0(n83), .Y(n89) );
  INVX1 U161 ( .A(n63), .Y(n159) );
  NAND2X1 U162 ( .A(n81), .B(n7), .Y(n142) );
  OAI21XL U163 ( .A0(n154), .A1(n64), .B0(n62), .Y(n18) );
  OAI21XL U164 ( .A0(n161), .A1(n160), .B0(n159), .Y(n162) );
  OAI21XL U165 ( .A0(n158), .A1(n157), .B0(n156), .Y(n160) );
  INVX1 U166 ( .A(n155), .Y(n161) );
  NAND3X1 U167 ( .A(I[4]), .B(I[2]), .C(n65), .Y(n66) );
  MXI2X1 U168 ( .A(n41), .B(n40), .S0(I[0]), .Y(n42) );
  OAI22X1 U169 ( .A0(n158), .A1(n104), .B0(DQS), .B1(n101), .Y(n79) );
  NAND3BX1 U170 ( .AN(n131), .B(n130), .C(n129), .Y(DQLN[7]) );
  AOI31X1 U171 ( .A0(n128), .A1(I[3]), .A2(n29), .B0(n127), .Y(n129) );
  OAI31X1 U172 ( .A0(n125), .A1(n124), .A2(n123), .B0(n153), .Y(n130) );
  OAI221XL U173 ( .A0(n114), .A1(n113), .B0(n112), .B1(n111), .C0(n110), .Y(
        n131) );
  NAND2X1 U174 ( .A(n97), .B(I[4]), .Y(n98) );
  NAND2BX1 U175 ( .AN(n71), .B(I[0]), .Y(n155) );
  NAND3BX1 U176 ( .AN(DQLN[10]), .B(n152), .C(n151), .Y(DQLN[9]) );
  XOR2X1 U177 ( .A(I[2]), .B(I[3]), .Y(n92) );
  XOR2X1 U178 ( .A(I[0]), .B(I[1]), .Y(n7) );
endmodule

