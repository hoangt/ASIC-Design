
module LOG_0 ( D, DL, DS );
  input [15:0] D;
  output [10:0] DL;
  output DS;
  wire   n202, n203, N4, n1, n2, n3, n4, n5, DL_10_, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201;
  assign N4 = D[0];
  assign DL[10] = DL_10_;

  OAI2BB1X4 U3 ( .A0N(n192), .A1N(n163), .B0(n162), .Y(DL[3]) );
  AOI22X2 U4 ( .A0(n191), .A1(n193), .B0(n17), .B1(n194), .Y(n142) );
  NAND4X2 U5 ( .A(n1), .B(n136), .C(n135), .D(n134), .Y(n191) );
  NAND2BX4 U6 ( .AN(n44), .B(n43), .Y(n189) );
  NAND2BX4 U7 ( .AN(D[1]), .B(n131), .Y(n89) );
  NAND2X4 U8 ( .A(n196), .B(n195), .Y(n197) );
  OAI2BB1X2 U9 ( .A0N(n195), .A1N(n192), .B0(n142), .Y(DL[2]) );
  OAI221X2 U10 ( .A0(n131), .A1(n190), .B0(n130), .B1(n153), .C0(n129), .Y(
        n195) );
  NAND2BX2 U11 ( .AN(n67), .B(n64), .Y(n132) );
  BUFX3 U12 ( .A(D[1]), .Y(n4) );
  INVX1 U13 ( .A(N4), .Y(n131) );
  INVX1 U14 ( .A(D[10]), .Y(n56) );
  OAI21XL U15 ( .A0(n95), .A1(n94), .B0(n93), .Y(n103) );
  AOI2BB2X1 U16 ( .B0(n167), .B1(n193), .A0N(n143), .A1N(n169), .Y(n115) );
  OR2XL U17 ( .A(n2), .B(n82), .Y(n13) );
  INVX2 U18 ( .A(n28), .Y(n82) );
  OR2X2 U19 ( .A(n202), .B(DL[7]), .Y(n157) );
  NAND2XL U20 ( .A(n21), .B(n145), .Y(n124) );
  NAND2XL U21 ( .A(n16), .B(n89), .Y(n110) );
  INVX1 U22 ( .A(n137), .Y(n1) );
  MXI2XL U23 ( .A(n69), .B(n68), .S0(DS), .Y(n70) );
  NAND2XL U24 ( .A(n21), .B(n138), .Y(n135) );
  INVX2 U25 ( .A(n190), .Y(n138) );
  AND2X2 U26 ( .A(n116), .B(n166), .Y(n9) );
  NOR2XL U27 ( .A(n71), .B(n49), .Y(n48) );
  INVX2 U28 ( .A(n32), .Y(n71) );
  OAI22XL U29 ( .A0(n21), .A1(n157), .B0(n156), .B1(n190), .Y(n158) );
  NAND2XL U30 ( .A(n26), .B(n73), .Y(n130) );
  OAI22XL U31 ( .A0(n154), .A1(n153), .B0(n152), .B1(n188), .Y(n159) );
  AND2X1 U32 ( .A(n33), .B(D[9]), .Y(n51) );
  INVX1 U33 ( .A(n155), .Y(n21) );
  OR2X2 U34 ( .A(DL[9]), .B(DL_10_), .Y(n179) );
  INVXL U35 ( .A(n114), .Y(DL_10_) );
  MX2X1 U36 ( .A(n3), .B(n13), .S0(DS), .Y(n65) );
  AND2X2 U37 ( .A(n39), .B(n44), .Y(n5) );
  INVX2 U38 ( .A(n37), .Y(n44) );
  NAND2XL U39 ( .A(n156), .B(n185), .Y(n107) );
  AOI211XL U40 ( .A0(n9), .A1(n91), .B0(n10), .C0(n92), .Y(n94) );
  NAND2XL U41 ( .A(n145), .B(n154), .Y(n109) );
  INVX2 U42 ( .A(n188), .Y(n145) );
  AND2X2 U43 ( .A(n37), .B(D[13]), .Y(n38) );
  NOR2BX1 U44 ( .AN(n187), .B(n83), .Y(n104) );
  NAND2BX1 U45 ( .AN(n166), .B(n25), .Y(n19) );
  NAND3BX1 U46 ( .AN(n201), .B(n74), .C(n144), .Y(n75) );
  INVXL U47 ( .A(n76), .Y(n74) );
  NAND2X1 U48 ( .A(n192), .B(n191), .Y(n199) );
  OR2X2 U49 ( .A(n169), .B(n179), .Y(n170) );
  INVX1 U50 ( .A(n179), .Y(n196) );
  NOR2X1 U51 ( .A(n21), .B(n98), .Y(n20) );
  NAND2XL U52 ( .A(n28), .B(n81), .Y(n147) );
  NAND2XL U53 ( .A(n193), .B(n194), .Y(n198) );
  NOR2XL U54 ( .A(n152), .B(n201), .Y(n99) );
  INVX1 U55 ( .A(n132), .Y(n152) );
  AND2X2 U56 ( .A(n26), .B(n73), .Y(n144) );
  NAND2BXL U57 ( .AN(n184), .B(n185), .Y(n186) );
  CLKINVXL U58 ( .A(D[4]), .Y(n2) );
  INVX1 U59 ( .A(n2), .Y(n3) );
  NOR3X2 U60 ( .A(n85), .B(n84), .C(n83), .Y(n86) );
  OAI2BB1X4 U61 ( .A0N(n17), .A1N(n176), .B0(n127), .Y(DL[1]) );
  OAI221X4 U62 ( .A0(n190), .A1(n184), .B0(n188), .B1(n189), .C0(n174), .Y(
        n183) );
  NAND2X2 U63 ( .A(n121), .B(n132), .Y(n98) );
  NAND2XL U64 ( .A(n145), .B(n128), .Y(n129) );
  NAND2X1 U65 ( .A(n20), .B(n106), .Y(n76) );
  INVX1 U66 ( .A(n73), .Y(n78) );
  MXI2X1 U67 ( .A(n52), .B(n51), .S0(DS), .Y(n53) );
  OR2X2 U68 ( .A(n50), .B(n14), .Y(n117) );
  INVX1 U69 ( .A(D[13]), .Y(n39) );
  NAND4BX2 U70 ( .AN(n183), .B(n182), .C(n181), .D(n180), .Y(DL[5]) );
  NAND2X1 U71 ( .A(n192), .B(n175), .Y(n182) );
  AOI21X1 U72 ( .A0(n175), .A1(n193), .B0(n126), .Y(n127) );
  NAND4BX2 U73 ( .AN(n173), .B(n172), .C(n171), .D(n170), .Y(DL[4]) );
  OR2X2 U74 ( .A(n57), .B(n12), .Y(n166) );
  CLKINVX3 U75 ( .A(n166), .Y(n10) );
  NAND2X2 U76 ( .A(n176), .B(n193), .Y(n181) );
  NAND2BX4 U77 ( .AN(DL[7]), .B(DL[8]), .Y(n188) );
  NAND2BX1 U78 ( .AN(n54), .B(n53), .Y(n116) );
  INVX4 U79 ( .A(n34), .Y(n54) );
  MXI2X4 U80 ( .A(n39), .B(n38), .S0(DS), .Y(n40) );
  MXI2X1 U81 ( .A(n128), .B(N4), .S0(n125), .Y(n177) );
  NAND2XL U82 ( .A(D[2]), .B(n89), .Y(n72) );
  MX2X1 U83 ( .A(D[2]), .B(n72), .S0(DS), .Y(n26) );
  OR2X4 U84 ( .A(D[2]), .B(n89), .Y(n73) );
  NAND2BX2 U85 ( .AN(D[5]), .B(n66), .Y(n30) );
  NAND2BX2 U86 ( .AN(D[3]), .B(n78), .Y(n28) );
  NAND2X1 U87 ( .A(n185), .B(n133), .Y(n134) );
  NAND2XL U88 ( .A(n138), .B(n144), .Y(n112) );
  NAND2XL U89 ( .A(n145), .B(n133), .Y(n113) );
  NAND2X1 U90 ( .A(n164), .B(n145), .Y(n141) );
  INVXL U91 ( .A(D[11]), .Y(n45) );
  INVX2 U92 ( .A(n29), .Y(n66) );
  NAND2BX2 U93 ( .AN(D[4]), .B(n82), .Y(n29) );
  NAND2BX2 U94 ( .AN(D[7]), .B(n67), .Y(n32) );
  INVX1 U95 ( .A(n147), .Y(n133) );
  INVX1 U96 ( .A(n77), .Y(n105) );
  OAI2BB1X2 U97 ( .A0N(D[15]), .A1N(n5), .B0(n58), .Y(n83) );
  NAND2X1 U98 ( .A(n100), .B(n96), .Y(n85) );
  INVX2 U99 ( .A(n83), .Y(n93) );
  NAND2BX1 U100 ( .AN(n106), .B(n114), .Y(n100) );
  INVX1 U101 ( .A(D[12]), .Y(n42) );
  OAI2BB1X2 U102 ( .A0N(n17), .A1N(n168), .B0(n115), .Y(DL[0]) );
  MXI2X1 U103 ( .A(n161), .B(n160), .S0(n193), .Y(n162) );
  INVX1 U104 ( .A(n143), .Y(n192) );
  NAND4X1 U105 ( .A(n103), .B(n102), .C(n101), .D(n100), .Y(n203) );
  NAND3X1 U106 ( .A(n92), .B(n189), .C(n104), .Y(n96) );
  BUFX8 U107 ( .A(n203), .Y(DL[7]) );
  NAND2BX2 U108 ( .AN(n47), .B(n46), .Y(n184) );
  MX2X1 U109 ( .A(D[11]), .B(n15), .S0(DS), .Y(n46) );
  BUFX8 U110 ( .A(n202), .Y(DL[8]) );
  INVX4 U111 ( .A(n25), .Y(n153) );
  MXI2XL U112 ( .A(n60), .B(n59), .S0(DS), .Y(n61) );
  BUFX20 U113 ( .A(D[15]), .Y(DS) );
  NAND2X1 U114 ( .A(n148), .B(n138), .Y(n140) );
  NAND2X1 U115 ( .A(n168), .B(n193), .Y(n171) );
  NAND2X1 U116 ( .A(n192), .B(n167), .Y(n172) );
  AND2X2 U117 ( .A(DL[8]), .B(DL[7]), .Y(n25) );
  MX2X1 U118 ( .A(n56), .B(n55), .S0(DS), .Y(n12) );
  INVX4 U119 ( .A(n201), .Y(n114) );
  NAND2BXL U120 ( .AN(n76), .B(n114), .Y(n77) );
  INVXL U121 ( .A(D[9]), .Y(n52) );
  INVX4 U122 ( .A(n157), .Y(n185) );
  AND2X1 U123 ( .A(DL[9]), .B(DL_10_), .Y(n17) );
  OR2XL U124 ( .A(n153), .B(n117), .Y(n18) );
  MX2X1 U125 ( .A(D[6]), .B(n11), .S0(DS), .Y(n64) );
  OR2XL U126 ( .A(n62), .B(n63), .Y(n11) );
  OR2XL U127 ( .A(n153), .B(n121), .Y(n22) );
  MX2X1 U128 ( .A(n49), .B(n48), .S0(DS), .Y(n14) );
  OR2XL U129 ( .A(n153), .B(n116), .Y(n24) );
  XNOR2XL U130 ( .A(D[14]), .B(DS), .Y(n58) );
  INVXL U131 ( .A(n106), .Y(n154) );
  INVXL U132 ( .A(n121), .Y(n156) );
  OR2X1 U133 ( .A(n57), .B(n45), .Y(n15) );
  NAND2XL U134 ( .A(n185), .B(n128), .Y(n111) );
  MX2X1 U135 ( .A(n4), .B(n88), .S0(DS), .Y(n16) );
  NAND2BX1 U136 ( .AN(n153), .B(N4), .Y(n169) );
  NAND2XL U137 ( .A(DL[9]), .B(n114), .Y(n143) );
  INVX1 U138 ( .A(n96), .Y(n97) );
  NAND3BX2 U139 ( .AN(n87), .B(n102), .C(n86), .Y(n202) );
  NOR2X1 U140 ( .A(n159), .B(n158), .Y(n160) );
  NAND2X1 U141 ( .A(n156), .B(n145), .Y(n136) );
  NOR3X1 U142 ( .A(n151), .B(n150), .C(n149), .Y(n161) );
  OAI21XL U143 ( .A0(n10), .A1(n188), .B0(n153), .Y(n150) );
  NAND4X1 U144 ( .A(n18), .B(n109), .C(n108), .D(n107), .Y(n168) );
  NAND4X2 U145 ( .A(n19), .B(n141), .C(n140), .D(n139), .Y(n194) );
  INVX1 U146 ( .A(n117), .Y(n148) );
  NAND2BX1 U147 ( .AN(n66), .B(n65), .Y(n155) );
  MXI2X1 U148 ( .A(n42), .B(n41), .S0(DS), .Y(n43) );
  NOR2X1 U149 ( .A(n47), .B(n42), .Y(n41) );
  NAND4X1 U150 ( .A(n22), .B(n124), .C(n123), .D(n122), .Y(n175) );
  INVX1 U151 ( .A(DL[7]), .Y(n125) );
  INVXL U152 ( .A(D[8]), .Y(n49) );
  NOR2XL U153 ( .A(n54), .B(n56), .Y(n55) );
  NAND4X2 U154 ( .A(n23), .B(n113), .C(n112), .D(n111), .Y(n167) );
  OR2XL U155 ( .A(n153), .B(n155), .Y(n23) );
  NAND4X1 U156 ( .A(n24), .B(n120), .C(n119), .D(n118), .Y(n176) );
  INVXL U157 ( .A(D[6]), .Y(n63) );
  INVX1 U158 ( .A(n116), .Y(n164) );
  INVX4 U159 ( .A(n33), .Y(n50) );
  OAI221XL U160 ( .A0(n190), .A1(n189), .B0(n188), .B1(n187), .C0(n186), .Y(
        n200) );
  OAI221XL U161 ( .A0(n190), .A1(n166), .B0(n188), .B1(n184), .C0(n165), .Y(
        n173) );
  INVXL U162 ( .A(n187), .Y(n95) );
  NAND3BXL U163 ( .AN(n179), .B(n178), .C(DL[8]), .Y(n180) );
  NAND4BX2 U164 ( .AN(n200), .B(n199), .C(n198), .D(n197), .Y(DL[6]) );
  NAND2BX1 U165 ( .AN(n62), .B(n61), .Y(n121) );
  INVXL U166 ( .A(D[5]), .Y(n60) );
  NAND2BX1 U167 ( .AN(n71), .B(n70), .Y(n106) );
  NOR2XL U168 ( .A(n67), .B(n69), .Y(n68) );
  INVXL U169 ( .A(D[7]), .Y(n69) );
  MXI2XL U170 ( .A(n80), .B(n79), .S0(DS), .Y(n81) );
  NOR2XL U171 ( .A(n78), .B(n80), .Y(n79) );
  INVXL U172 ( .A(D[3]), .Y(n80) );
  NAND3X1 U173 ( .A(n20), .B(n117), .C(n90), .Y(n91) );
  NOR2X1 U174 ( .A(n144), .B(n110), .Y(n90) );
  OAI221XL U175 ( .A0(n147), .A1(n153), .B0(DL[8]), .B1(n177), .C0(n146), .Y(
        n163) );
  NOR3BXL U176 ( .AN(DL[8]), .B(n177), .C(n143), .Y(n126) );
  INVX1 U177 ( .A(n110), .Y(n128) );
  INVX1 U178 ( .A(n177), .Y(n178) );
  NAND2XL U179 ( .A(n4), .B(N4), .Y(n88) );
  NAND2X1 U180 ( .A(n138), .B(n133), .Y(n123) );
  NOR2XL U181 ( .A(n66), .B(n60), .Y(n59) );
  NAND2XL U182 ( .A(n138), .B(n154), .Y(n119) );
  NAND2XL U183 ( .A(n138), .B(n152), .Y(n108) );
  INVX4 U184 ( .A(n31), .Y(n67) );
  NAND2BX2 U185 ( .AN(D[6]), .B(n62), .Y(n31) );
  NAND2XL U186 ( .A(n10), .B(n185), .Y(n174) );
  NAND2XL U187 ( .A(n185), .B(n152), .Y(n118) );
  NAND2X1 U188 ( .A(n185), .B(n144), .Y(n122) );
  NOR2XL U189 ( .A(n132), .B(n153), .Y(n137) );
  NAND2XL U190 ( .A(n145), .B(n144), .Y(n146) );
  NAND2XL U191 ( .A(n148), .B(n145), .Y(n120) );
  NOR2XL U192 ( .A(n148), .B(n157), .Y(n149) );
  AOI21X1 U193 ( .A0(n99), .A1(n98), .B0(n97), .Y(n101) );
  AOI21XL U194 ( .A0(n75), .A1(n166), .B0(n92), .Y(n87) );
  OAI211X4 U195 ( .A0(DL_10_), .A1(n105), .B0(n189), .C0(n104), .Y(DL[9]) );
  NOR2XL U196 ( .A(n201), .B(n132), .Y(n84) );
  INVX4 U197 ( .A(n35), .Y(n57) );
  NAND4BX4 U198 ( .AN(n92), .B(n117), .C(n9), .D(n93), .Y(n201) );
  NAND3X4 U199 ( .A(n187), .B(n189), .C(n184), .Y(n92) );
  INVX4 U200 ( .A(n36), .Y(n47) );
  NAND2BX2 U201 ( .AN(D[11]), .B(n57), .Y(n36) );
  NAND2XL U202 ( .A(n164), .B(n185), .Y(n165) );
  NOR2XL U203 ( .A(n164), .B(n190), .Y(n151) );
  CLKINVX3 U204 ( .A(n30), .Y(n62) );
  NAND2BX4 U205 ( .AN(D[8]), .B(n71), .Y(n33) );
  NAND2BX4 U206 ( .AN(D[9]), .B(n50), .Y(n34) );
  NAND2BX4 U207 ( .AN(D[10]), .B(n54), .Y(n35) );
  NAND2BX4 U208 ( .AN(D[12]), .B(n47), .Y(n37) );
  NAND2BX4 U209 ( .AN(n5), .B(n40), .Y(n187) );
  NAND2X2 U210 ( .A(n105), .B(n133), .Y(n102) );
  NAND2BX4 U211 ( .AN(DL[8]), .B(DL[7]), .Y(n190) );
  CLKINVX3 U212 ( .A(DL[9]), .Y(n193) );
  NAND2X2 U213 ( .A(n185), .B(n154), .Y(n139) );
endmodule

