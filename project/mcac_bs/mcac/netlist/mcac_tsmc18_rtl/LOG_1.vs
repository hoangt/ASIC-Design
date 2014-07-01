
module LOG_1 ( D, DL, DS );
  input [15:0] D;
  output [10:0] DL;
  output DS;
  wire   n211, n212, N4, n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         DL_10_;
  assign N4 = D[0];
  assign DL[10] = DL_10_;

  MXI2X1 U3 ( .A(n30), .B(n29), .S0(DS), .Y(n31) );
  AOI22X1 U4 ( .A0(n201), .A1(n199), .B0(n146), .B1(n202), .Y(n147) );
  NAND4X1 U5 ( .A(n145), .B(n144), .C(n143), .D(n142), .Y(n202) );
  OAI211X2 U6 ( .A0(n115), .A1(n138), .B0(n114), .C0(n113), .Y(DL[0]) );
  NAND4BX2 U7 ( .AN(n191), .B(n190), .C(n189), .D(n188), .Y(DL[5]) );
  NAND4X2 U8 ( .A(n3), .B(n208), .C(n207), .D(n206), .Y(DL[6]) );
  OAI211X2 U9 ( .A0(n128), .A1(n138), .B0(n127), .C0(n126), .Y(DL[1]) );
  BUFX12 U10 ( .A(n211), .Y(DL[8]) );
  XNOR2X1 U11 ( .A(D[14]), .B(DS), .Y(n60) );
  NOR2X1 U12 ( .A(n159), .B(n158), .Y(n160) );
  NOR2X1 U13 ( .A(n13), .B(n6), .Y(n24) );
  NAND2X1 U14 ( .A(n185), .B(n201), .Y(n127) );
  INVX1 U15 ( .A(n186), .Y(n128) );
  AND4X2 U16 ( .A(n21), .B(n17), .C(n57), .D(n1), .Y(n36) );
  NAND4X1 U17 ( .A(n137), .B(n136), .C(n135), .D(n134), .Y(n199) );
  AND2X2 U18 ( .A(n42), .B(n184), .Y(n44) );
  NAND2X1 U19 ( .A(n32), .B(n35), .Y(n197) );
  INVX1 U20 ( .A(n32), .Y(n38) );
  NAND2X1 U21 ( .A(n200), .B(n199), .Y(n208) );
  NAND2X1 U22 ( .A(n47), .B(n52), .Y(n102) );
  NAND2XL U23 ( .A(n139), .B(n120), .Y(n110) );
  OR2XL U24 ( .A(DL_10_), .B(DL[9]), .Y(n203) );
  NAND2BX2 U25 ( .AN(n211), .B(DL[7]), .Y(n198) );
  INVX1 U26 ( .A(n53), .Y(n1) );
  MXI2X1 U27 ( .A(n160), .B(n161), .S0(DL[9]), .Y(n169) );
  OAI222XL U28 ( .A0(n196), .A1(n184), .B0(n173), .B1(n172), .C0(n198), .C1(
        n174), .Y(n2) );
  INVX1 U29 ( .A(n2), .Y(n175) );
  NAND2X1 U30 ( .A(n42), .B(n60), .Y(n84) );
  NOR2X2 U31 ( .A(n95), .B(n61), .Y(n88) );
  INVX1 U32 ( .A(n209), .Y(n3) );
  NAND2X1 U33 ( .A(D[6]), .B(n47), .Y(n8) );
  NAND2XL U34 ( .A(n170), .B(DL[9]), .Y(n176) );
  AOI2BB2X1 U35 ( .B0(n81), .B1(n80), .A0N(DL_10_), .A1N(n101), .Y(n82) );
  AND2X2 U36 ( .A(n30), .B(n59), .Y(n13) );
  INVX1 U37 ( .A(n23), .Y(n59) );
  NAND2X1 U38 ( .A(n201), .B(n202), .Y(n207) );
  INVX1 U39 ( .A(DL[9]), .Y(n201) );
  NAND4BXL U40 ( .AN(n112), .B(n109), .C(n111), .D(n110), .Y(n171) );
  NAND2XL U41 ( .A(n193), .B(n192), .Y(n194) );
  NAND3X1 U42 ( .A(n100), .B(n197), .C(n11), .Y(DL[9]) );
  INVX1 U43 ( .A(n184), .Y(n193) );
  NAND2BX1 U44 ( .AN(n89), .B(n90), .Y(n92) );
  OR2X2 U45 ( .A(n178), .B(n176), .Y(n113) );
  OAI2BB1X2 U46 ( .A0N(n204), .A1N(n200), .B0(n147), .Y(DL[2]) );
  NAND3BX1 U47 ( .AN(D[12]), .B(n15), .C(n36), .Y(n32) );
  AND2X2 U48 ( .A(n36), .B(n15), .Y(n10) );
  NAND4BBX1 U49 ( .AN(D[13]), .BN(D[12]), .C(n15), .D(n36), .Y(n37) );
  OAI21X1 U50 ( .A0(n157), .A1(n198), .B0(n156), .Y(n158) );
  NAND2X1 U51 ( .A(n192), .B(n155), .Y(n156) );
  BUFX4 U52 ( .A(n212), .Y(DL[3]) );
  NAND2BX2 U53 ( .AN(n55), .B(n54), .Y(n101) );
  NAND3X1 U54 ( .A(n88), .B(n164), .C(n155), .Y(n79) );
  NAND4X1 U55 ( .A(n107), .B(n106), .C(n105), .D(n104), .Y(n179) );
  NAND4X1 U56 ( .A(n116), .B(n174), .C(n172), .D(n60), .Y(n61) );
  NAND3BX2 U57 ( .AN(n84), .B(n83), .C(n82), .Y(n211) );
  NOR2X1 U58 ( .A(D[11]), .B(D[10]), .Y(n15) );
  NAND2BX1 U59 ( .AN(D[1]), .B(n131), .Y(n75) );
  NAND2X1 U60 ( .A(n172), .B(n174), .Y(n89) );
  NAND2X1 U61 ( .A(n205), .B(n204), .Y(n206) );
  CLKINVX3 U62 ( .A(DL[7]), .Y(n125) );
  INVX1 U63 ( .A(n79), .Y(n74) );
  INVX1 U64 ( .A(D[13]), .Y(n40) );
  OAI21XL U65 ( .A0(n170), .A1(n169), .B0(n168), .Y(n212) );
  OAI21XL U66 ( .A0(n167), .A1(n166), .B0(n200), .Y(n168) );
  NAND2BX2 U67 ( .AN(n181), .B(n180), .Y(DL[4]) );
  OAI21XL U68 ( .A0(n177), .A1(n176), .B0(n175), .Y(n181) );
  OAI221XL U69 ( .A0(n198), .A1(n184), .B0(n196), .B1(n197), .C0(n183), .Y(
        n191) );
  INVX1 U70 ( .A(n179), .Y(n115) );
  AND2X2 U71 ( .A(n197), .B(n195), .Y(n5) );
  INVX1 U72 ( .A(D[9]), .Y(n6) );
  CLKINVX3 U73 ( .A(n196), .Y(n141) );
  NAND2BX4 U74 ( .AN(DL[7]), .B(DL[8]), .Y(n196) );
  INVX1 U75 ( .A(n94), .Y(n83) );
  NOR2X2 U76 ( .A(D[8]), .B(D[9]), .Y(n21) );
  AOI31X2 U77 ( .A0(n101), .A1(n170), .A2(n95), .B0(n94), .Y(n96) );
  NAND3X2 U78 ( .A(n102), .B(n101), .C(n103), .Y(n95) );
  MX2X1 U79 ( .A(D[6]), .B(n8), .S0(DS), .Y(n54) );
  NAND3X1 U80 ( .A(n88), .B(n5), .C(n155), .Y(n99) );
  NAND2BX1 U81 ( .AN(n89), .B(n116), .Y(n45) );
  NAND2BX2 U82 ( .AN(n10), .B(n43), .Y(n184) );
  NAND2XL U83 ( .A(n139), .B(n153), .Y(n107) );
  INVX1 U84 ( .A(D[3]), .Y(n66) );
  NAND2BX1 U85 ( .AN(D[2]), .B(n86), .Y(n77) );
  INVX1 U86 ( .A(N4), .Y(n131) );
  INVX1 U87 ( .A(n37), .Y(n41) );
  INVX1 U88 ( .A(D[10]), .Y(n27) );
  NOR2X1 U89 ( .A(n87), .B(n86), .Y(n129) );
  OAI21XL U90 ( .A0(n163), .A1(n79), .B0(n174), .Y(n80) );
  NAND3X1 U91 ( .A(n91), .B(n197), .C(n11), .Y(n73) );
  NAND4X1 U92 ( .A(n9), .B(n119), .C(n118), .D(n117), .Y(n186) );
  NAND2X1 U93 ( .A(n192), .B(n153), .Y(n117) );
  NAND2X1 U94 ( .A(n148), .B(n141), .Y(n119) );
  INVX1 U95 ( .A(n162), .Y(n187) );
  MXI2X1 U96 ( .A(n34), .B(n33), .S0(DS), .Y(n35) );
  NOR2X2 U97 ( .A(n10), .B(n34), .Y(n33) );
  INVX1 U98 ( .A(D[12]), .Y(n34) );
  NAND2X1 U99 ( .A(n171), .B(n201), .Y(n114) );
  INVX1 U100 ( .A(n176), .Y(n200) );
  NAND2BX1 U101 ( .AN(n193), .B(n5), .Y(n91) );
  CLKINVX3 U102 ( .A(D[15]), .Y(n20) );
  OR2X2 U103 ( .A(n7), .B(n172), .Y(n9) );
  NAND2BX2 U104 ( .AN(n36), .B(n25), .Y(n172) );
  NAND2BX4 U105 ( .AN(DL[8]), .B(n125), .Y(n173) );
  MXI2X1 U106 ( .A(n27), .B(n26), .S0(DS), .Y(n28) );
  NOR2XL U107 ( .A(n36), .B(n27), .Y(n26) );
  BUFX4 U108 ( .A(n165), .Y(n7) );
  NAND2BX2 U109 ( .AN(n12), .B(n28), .Y(n174) );
  CLKINVX2 U110 ( .A(n7), .Y(n140) );
  CLKINVX8 U111 ( .A(n20), .Y(DS) );
  NAND2BX1 U112 ( .AN(n59), .B(n58), .Y(n103) );
  INVXL U113 ( .A(n203), .Y(n205) );
  NAND4X1 U114 ( .A(n163), .B(n155), .C(n88), .D(n129), .Y(n90) );
  INVX4 U115 ( .A(n173), .Y(n192) );
  NOR2XL U116 ( .A(n55), .B(n57), .Y(n56) );
  AND2X2 U117 ( .A(n27), .B(n36), .Y(n12) );
  OR2X4 U118 ( .A(n41), .B(n14), .Y(n195) );
  MX2X1 U119 ( .A(n40), .B(n39), .S0(DS), .Y(n14) );
  NAND2BX1 U120 ( .AN(n20), .B(n41), .Y(n42) );
  NAND3BXL U121 ( .AN(D[3]), .B(n62), .C(n86), .Y(n63) );
  NOR2X2 U122 ( .A(D[5]), .B(D[6]), .Y(n17) );
  AOI2BB2XL U123 ( .B0(n179), .B1(n201), .A0N(n203), .A1N(n178), .Y(n180) );
  NAND2XL U124 ( .A(n141), .B(n154), .Y(n104) );
  NOR3X1 U125 ( .A(n152), .B(n151), .C(n150), .Y(n161) );
  INVXL U126 ( .A(n101), .Y(n153) );
  INVXL U127 ( .A(n116), .Y(n148) );
  INVXL U128 ( .A(n174), .Y(n182) );
  INVXL U129 ( .A(n164), .Y(n133) );
  INVXL U130 ( .A(n155), .Y(n132) );
  NOR2XL U131 ( .A(n59), .B(n30), .Y(n29) );
  MXI2XL U132 ( .A(n57), .B(n56), .S0(DS), .Y(n58) );
  NOR2XL U133 ( .A(n64), .B(n66), .Y(n65) );
  INVXL U134 ( .A(D[4]), .Y(n70) );
  INVXL U135 ( .A(n102), .Y(n157) );
  INVXL U136 ( .A(n163), .Y(n120) );
  NAND2BX1 U137 ( .AN(n12), .B(D[11]), .Y(n16) );
  NAND3BXL U138 ( .AN(D[7]), .B(n17), .C(n22), .Y(n23) );
  INVXL U139 ( .A(n53), .Y(n22) );
  NOR3XL U140 ( .A(n53), .B(D[5]), .C(D[6]), .Y(n55) );
  NAND2BXL U141 ( .AN(D[3]), .B(n64), .Y(n46) );
  INVXL U142 ( .A(D[2]), .Y(n62) );
  NAND2XL U143 ( .A(D[1]), .B(N4), .Y(n85) );
  NAND2XL U144 ( .A(n148), .B(n139), .Y(n145) );
  NAND2XL U145 ( .A(n132), .B(n139), .Y(n137) );
  NAND2XL U146 ( .A(n133), .B(n139), .Y(n124) );
  NAND2XL U147 ( .A(n139), .B(n154), .Y(n118) );
  INVX1 U148 ( .A(n91), .Y(n81) );
  INVX1 U149 ( .A(DL[8]), .Y(n108) );
  NAND2XL U150 ( .A(n99), .B(n170), .Y(n100) );
  NAND2X1 U151 ( .A(n140), .B(n153), .Y(n135) );
  NAND2X1 U152 ( .A(n157), .B(n141), .Y(n134) );
  NAND2XL U153 ( .A(n133), .B(n192), .Y(n136) );
  NAND2X1 U154 ( .A(n182), .B(n140), .Y(n143) );
  NAND2X1 U155 ( .A(n149), .B(n141), .Y(n142) );
  NAND2XL U156 ( .A(n192), .B(n154), .Y(n144) );
  INVX1 U157 ( .A(n77), .Y(n64) );
  NAND4X1 U158 ( .A(n124), .B(n123), .C(n122), .D(n121), .Y(n185) );
  NAND2X1 U159 ( .A(n157), .B(n140), .Y(n122) );
  NAND2XL U160 ( .A(n132), .B(n141), .Y(n121) );
  NAND2XL U161 ( .A(n192), .B(n120), .Y(n123) );
  INVX1 U162 ( .A(n103), .Y(n154) );
  NOR2XL U163 ( .A(n149), .B(n198), .Y(n150) );
  NOR2XL U164 ( .A(n148), .B(n173), .Y(n151) );
  INVX1 U165 ( .A(n84), .Y(n98) );
  NAND2XL U166 ( .A(DL[8]), .B(DL[7]), .Y(n165) );
  NAND2BX1 U167 ( .AN(n72), .B(n71), .Y(n155) );
  MXI2X1 U168 ( .A(n70), .B(n69), .S0(DS), .Y(n71) );
  NOR2X1 U169 ( .A(n68), .B(n70), .Y(n69) );
  NAND3BX1 U170 ( .AN(D[4]), .B(n66), .C(n64), .Y(n53) );
  NAND3BXL U171 ( .AN(n116), .B(DL[8]), .C(DL[7]), .Y(n105) );
  NAND2XL U172 ( .A(n157), .B(n192), .Y(n106) );
  NAND2BX1 U173 ( .AN(n13), .B(n31), .Y(n116) );
  INVX1 U174 ( .A(n172), .Y(n149) );
  NAND2BX1 U175 ( .AN(n68), .B(n67), .Y(n164) );
  MXI2X1 U176 ( .A(n66), .B(n65), .S0(DS), .Y(n67) );
  INVX1 U177 ( .A(D[8]), .Y(n30) );
  AND2X2 U178 ( .A(n98), .B(n195), .Y(n11) );
  INVX1 U179 ( .A(n49), .Y(n72) );
  NAND2BX1 U180 ( .AN(D[4]), .B(n48), .Y(n49) );
  OAI221XL U181 ( .A0(n198), .A1(n197), .B0(n196), .B1(n195), .C0(n194), .Y(
        n209) );
  NAND2XL U182 ( .A(n182), .B(n192), .Y(n183) );
  NAND3BXL U183 ( .AN(n176), .B(n187), .C(DL[8]), .Y(n126) );
  NAND2X1 U184 ( .A(n195), .B(n93), .Y(n97) );
  NAND3BXL U185 ( .AN(n203), .B(n187), .C(DL[8]), .Y(n188) );
  NAND2XL U186 ( .A(n186), .B(n201), .Y(n189) );
  NAND2XL U187 ( .A(n200), .B(n185), .Y(n190) );
  MXI2X1 U188 ( .A(n6), .B(n24), .S0(DS), .Y(n25) );
  INVX1 U189 ( .A(n75), .Y(n86) );
  NAND2BX1 U190 ( .AN(n78), .B(n77), .Y(n163) );
  MXI2X1 U191 ( .A(D[2]), .B(n76), .S0(DS), .Y(n78) );
  NAND2X1 U192 ( .A(D[2]), .B(n75), .Y(n76) );
  INVXL U193 ( .A(n138), .Y(n146) );
  INVX1 U194 ( .A(n46), .Y(n48) );
  MX2X1 U195 ( .A(D[11]), .B(n16), .S0(DS), .Y(n43) );
  INVX1 U196 ( .A(D[7]), .Y(n57) );
  MXI2XL U197 ( .A(n51), .B(n50), .S0(DS), .Y(n52) );
  NOR2X1 U198 ( .A(n72), .B(n51), .Y(n50) );
  INVX1 U199 ( .A(D[5]), .Y(n51) );
  INVXL U200 ( .A(n171), .Y(n177) );
  NAND3BX1 U201 ( .AN(D[5]), .B(n70), .C(n48), .Y(n47) );
  INVX1 U202 ( .A(n63), .Y(n68) );
  OAI221XL U203 ( .A0(n131), .A1(n198), .B0(n163), .B1(n7), .C0(n130), .Y(n204) );
  NAND2XL U204 ( .A(n141), .B(n129), .Y(n130) );
  NOR2XL U205 ( .A(DL[8]), .B(n162), .Y(n167) );
  NOR3XL U206 ( .A(n125), .B(n108), .C(n155), .Y(n112) );
  NAND2XL U207 ( .A(n133), .B(n141), .Y(n111) );
  NAND2XL U208 ( .A(n192), .B(n129), .Y(n109) );
  MXI2XL U209 ( .A(D[1]), .B(n85), .S0(DS), .Y(n87) );
  MXI2XL U210 ( .A(n129), .B(N4), .S0(n125), .Y(n162) );
  OAI22XL U211 ( .A0(n7), .A1(n164), .B0(n163), .B1(n196), .Y(n166) );
  NOR2XL U212 ( .A(n182), .B(n196), .Y(n152) );
  OAI22XL U213 ( .A0(n154), .A1(n7), .B0(n153), .B1(n196), .Y(n159) );
  NAND2XL U214 ( .A(DL[9]), .B(DL_10_), .Y(n138) );
  NAND3XL U215 ( .A(n92), .B(n174), .C(n81), .Y(n93) );
  INVX2 U216 ( .A(DL_10_), .Y(n170) );
  NAND4BX4 U217 ( .AN(n45), .B(n5), .C(n60), .D(n44), .Y(DL_10_) );
  NOR2X2 U218 ( .A(n38), .B(n40), .Y(n39) );
  OAI221X2 U219 ( .A0(n74), .A1(n99), .B0(DL_10_), .B1(n103), .C0(n73), .Y(n94) );
  OAI2BB1X4 U220 ( .A0N(n98), .A1N(n97), .B0(n96), .Y(DL[7]) );
  CLKINVX3 U221 ( .A(n198), .Y(n139) );
  NAND2X2 U222 ( .A(n140), .B(N4), .Y(n178) );
endmodule
