
module UPA2_1 ( PK0, PK1, PK2, A1, A2, SIGPK, A2T );
  input [15:0] A1;
  input [15:0] A2;
  output [15:0] A2T;
  input PK0, PK1, PK2, SIGPK;
  wire   N31, N92, UA2_9_, UA2_8_, UA2_7_, UA2_6_, UA2_5_, UA2_4_, UA2_3_,
         UA2_2_, UA2_1_, UA2_10_, UA2_0_, N84, N83, N82, N81, N80, N79, N78,
         N77, sub_112_2_carry_2_, sub_112_2_carry_3_, sub_112_2_carry_4_,
         sub_112_2_carry_5_, sub_112_2_carry_6_, sub_112_2_carry_7_, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, sub_90_carry_6_, n104;
  wire   [5:3] FA1;
  wire   [7:2] sub_112_carry;
  assign N92 = A2[7];
  assign N84 = A2[15];
  assign N83 = A2[14];
  assign N82 = A2[13];
  assign N81 = A2[12];
  assign N80 = A2[11];
  assign N79 = A2[10];
  assign N78 = A2[9];
  assign N77 = A2[8];

  CLKINVX3 U3 ( .A(SIGPK), .Y(n1) );
  INVX8 U4 ( .A(n1), .Y(n2) );
  OAI2BB1X2 U5 ( .A0N(n120), .A1N(n121), .B0(n99), .Y(n116) );
  CLKBUFX8 U6 ( .A(n88), .Y(n11) );
  OAI2BB1X2 U7 ( .A0N(n123), .A1N(n124), .B0(n98), .Y(n119) );
  INVX2 U8 ( .A(SIGPK), .Y(n81) );
  OAI2BB1X2 U9 ( .A0N(n112), .A1N(n110), .B0(n102), .Y(n107) );
  OAI2BB1X1 U10 ( .A0N(n50), .A1N(n3), .B0(n119), .Y(n99) );
  INVX1 U11 ( .A(n121), .Y(n3) );
  OR2X2 U12 ( .A(n91), .B(n92), .Y(n93) );
  NOR2X1 U13 ( .A(N92), .B(N77), .Y(sub_112_2_carry_2_) );
  OAI2BB1X2 U14 ( .A0N(n42), .A1N(n4), .B0(n116), .Y(n100) );
  INVX1 U15 ( .A(n118), .Y(n4) );
  AOI2BB1X1 U16 ( .A0N(n31), .A1N(n24), .B0(n25), .Y(n26) );
  AOI21X1 U17 ( .A0(sub_112_carry[7]), .A1(n134), .B0(n12), .Y(n5) );
  INVX1 U18 ( .A(n5), .Y(n108) );
  NOR4X1 U19 ( .A(FA1[3]), .B(N31), .C(FA1[5]), .D(FA1[4]), .Y(sub_90_carry_6_) );
  OAI2BB1X1 U20 ( .A0N(n58), .A1N(n6), .B0(n122), .Y(n98) );
  INVX1 U21 ( .A(n124), .Y(n6) );
  NAND2X1 U22 ( .A(A1[15]), .B(n16), .Y(n142) );
  OAI2BB1X2 U23 ( .A0N(n105), .A1N(n108), .B0(n107), .Y(n103) );
  XNOR3X2 U24 ( .A(n92), .B(n91), .C(n131), .Y(UA2_1_) );
  XNOR3X2 U25 ( .A(n124), .B(n58), .C(n122), .Y(UA2_4_) );
  OR4X2 U26 ( .A(A1[4]), .B(A1[5]), .C(A1[6]), .D(A1[7]), .Y(n146) );
  NOR2X1 U27 ( .A(n23), .B(n41), .Y(n17) );
  NOR2X1 U28 ( .A(N92), .B(N77), .Y(sub_112_carry[2]) );
  OAI2BB1X1 U29 ( .A0N(n34), .A1N(n7), .B0(n113), .Y(n101) );
  INVX1 U30 ( .A(n115), .Y(n7) );
  OAI21X2 U31 ( .A0(n126), .A1(n127), .B0(n125), .Y(n97) );
  NAND3BX4 U32 ( .AN(n2), .B(n90), .C(n89), .Y(n91) );
  INVX1 U33 ( .A(n29), .Y(n33) );
  OAI2BB1X1 U34 ( .A0N(n17), .A1N(n20), .B0(n19), .Y(n30) );
  INVX1 U35 ( .A(n105), .Y(n109) );
  INVX1 U36 ( .A(n66), .Y(n126) );
  OAI2BB1X4 U37 ( .A0N(n126), .A1N(n127), .B0(n97), .Y(n122) );
  XOR2X1 U38 ( .A(n27), .B(n26), .Y(n28) );
  XNOR2X1 U39 ( .A(PK1), .B(PK0), .Y(n79) );
  NOR2X1 U40 ( .A(n69), .B(n11), .Y(n71) );
  NOR2X1 U41 ( .A(n32), .B(n2), .Y(n112) );
  AND3X2 U42 ( .A(A1[14]), .B(A1[13]), .C(A1[15]), .Y(n8) );
  NOR2X4 U43 ( .A(n85), .B(n11), .Y(n87) );
  MXI2X4 U44 ( .A(n11), .B(n87), .S0(n86), .Y(n90) );
  MXI2X1 U45 ( .A(n11), .B(n71), .S0(n70), .Y(n72) );
  OAI21X1 U46 ( .A0(n129), .A1(n130), .B0(n128), .Y(n96) );
  NAND2XL U47 ( .A(n77), .B(n79), .Y(n80) );
  OAI2BB1X2 U48 ( .A0N(n129), .A1N(n130), .B0(n96), .Y(n125) );
  NOR2XL U49 ( .A(n61), .B(n11), .Y(n63) );
  MXI2XL U50 ( .A(n18), .B(n20), .S0(n11), .Y(n19) );
  NOR2XL U51 ( .A(n37), .B(n11), .Y(n39) );
  NOR2XL U52 ( .A(n45), .B(n11), .Y(n47) );
  NOR2XL U53 ( .A(n53), .B(n11), .Y(n55) );
  XOR2XL U54 ( .A(n140), .B(n132), .Y(UA2_0_) );
  MXI2XL U55 ( .A(n11), .B(n63), .S0(n62), .Y(n64) );
  MXI2XL U56 ( .A(n11), .B(n39), .S0(n38), .Y(n40) );
  MXI2XL U57 ( .A(n11), .B(n47), .S0(n46), .Y(n48) );
  MXI2XL U58 ( .A(n11), .B(n55), .S0(n54), .Y(n56) );
  NOR2XL U59 ( .A(n21), .B(n11), .Y(n22) );
  INVX1 U60 ( .A(n34), .Y(n114) );
  NAND2BX1 U61 ( .AN(n2), .B(n33), .Y(n34) );
  INVX1 U62 ( .A(n30), .Y(n24) );
  XOR2X1 U63 ( .A(n106), .B(n9), .Y(UA2_10_) );
  NOR2X1 U64 ( .A(n17), .B(n20), .Y(n18) );
  XNOR2X1 U65 ( .A(n105), .B(n5), .Y(n9) );
  XOR3X2 U66 ( .A(n110), .B(n112), .C(n111), .Y(UA2_8_) );
  XNOR3X2 U67 ( .A(n109), .B(n108), .C(n107), .Y(UA2_9_) );
  INVX1 U68 ( .A(n89), .Y(n69) );
  INVX1 U69 ( .A(n73), .Y(n61) );
  INVX1 U70 ( .A(n65), .Y(n53) );
  INVX1 U71 ( .A(n57), .Y(n45) );
  INVX1 U72 ( .A(n49), .Y(n37) );
  INVX1 U73 ( .A(n41), .Y(n21) );
  INVX1 U74 ( .A(n82), .Y(n85) );
  XNOR2X1 U76 ( .A(n10), .B(n31), .Y(n32) );
  XNOR2X1 U77 ( .A(n30), .B(n29), .Y(n10) );
  INVX1 U78 ( .A(n42), .Y(n117) );
  NAND3BX1 U79 ( .AN(n2), .B(n41), .C(n40), .Y(n42) );
  INVX1 U80 ( .A(n50), .Y(n120) );
  NAND3BX1 U81 ( .AN(n2), .B(n49), .C(n48), .Y(n50) );
  INVX1 U82 ( .A(n74), .Y(n129) );
  NAND3BX1 U83 ( .AN(n2), .B(n73), .C(n72), .Y(n74) );
  NAND3BX1 U84 ( .AN(n2), .B(n65), .C(n64), .Y(n66) );
  INVX1 U85 ( .A(n58), .Y(n123) );
  NAND3BX1 U86 ( .AN(n2), .B(n57), .C(n56), .Y(n58) );
  NAND3BX1 U87 ( .AN(n83), .B(n82), .C(n81), .Y(n132) );
  AOI21X1 U88 ( .A0(n24), .A1(n31), .B0(n33), .Y(n25) );
  XOR3X2 U89 ( .A(n121), .B(n120), .C(n119), .Y(UA2_5_) );
  XOR3X2 U90 ( .A(n127), .B(n126), .C(n125), .Y(UA2_3_) );
  XOR3X2 U91 ( .A(n130), .B(n129), .C(n128), .Y(UA2_2_) );
  XOR3X2 U92 ( .A(n118), .B(n117), .C(n116), .Y(UA2_6_) );
  NAND2XL U93 ( .A(n92), .B(n91), .Y(n94) );
  INVX1 U94 ( .A(n131), .Y(n95) );
  XOR2X1 U95 ( .A(n23), .B(n22), .Y(n29) );
  NAND2BX1 U96 ( .AN(n2), .B(n28), .Y(n105) );
  XNOR2X1 U97 ( .A(n19), .B(n31), .Y(n27) );
  INVX1 U98 ( .A(n79), .Y(n88) );
  NAND3X1 U99 ( .A(sub_90_carry_6_), .B(n141), .C(n14), .Y(n77) );
  NAND2X1 U100 ( .A(n142), .B(A1[4]), .Y(n14) );
  NAND2BX1 U101 ( .AN(n86), .B(n85), .Y(n89) );
  NAND2BX1 U102 ( .AN(n70), .B(n69), .Y(n73) );
  NAND2BX1 U103 ( .AN(n62), .B(n61), .Y(n65) );
  NAND2BX1 U104 ( .AN(n54), .B(n53), .Y(n57) );
  NAND2BX1 U105 ( .AN(n46), .B(n45), .Y(n49) );
  NAND2BX1 U106 ( .AN(n38), .B(n37), .Y(n41) );
  NAND2BX1 U107 ( .AN(n77), .B(n78), .Y(n82) );
  NAND2X1 U109 ( .A(n16), .B(n142), .Y(n20) );
  XNOR2XL U110 ( .A(PK2), .B(PK0), .Y(n31) );
  NAND2X2 U111 ( .A(n84), .B(N92), .Y(n131) );
  CLKINVX3 U112 ( .A(n132), .Y(n84) );
  INVX1 U113 ( .A(A1[15]), .Y(n13) );
  OAI2BB1X1 U114 ( .A0N(n144), .A1N(n143), .B0(n8), .Y(n16) );
  OR3XL U115 ( .A(A1[8]), .B(A1[9]), .C(A1[12]), .Y(n145) );
  OAI2BB1X1 U116 ( .A0N(n142), .A1N(A1[6]), .B0(n141), .Y(n86) );
  INVX1 U117 ( .A(n15), .Y(n78) );
  OAI2BB1X1 U118 ( .A0N(n142), .A1N(A1[5]), .B0(n141), .Y(n15) );
  OAI21XL U119 ( .A0(A1[14]), .A1(A1[13]), .B0(n13), .Y(n141) );
  MXI2X1 U120 ( .A(n52), .B(n51), .S0(n12), .Y(n121) );
  XOR2X1 U121 ( .A(sub_112_carry[5]), .B(N81), .Y(n52) );
  XOR2X1 U122 ( .A(sub_112_2_carry_5_), .B(N81), .Y(n51) );
  MXI2X1 U123 ( .A(n44), .B(n43), .S0(n12), .Y(n118) );
  XOR2X1 U124 ( .A(sub_112_carry[6]), .B(N82), .Y(n44) );
  XOR2X1 U125 ( .A(sub_112_2_carry_6_), .B(N82), .Y(n43) );
  MXI2X1 U126 ( .A(n36), .B(n35), .S0(n12), .Y(n115) );
  XOR2X1 U127 ( .A(sub_112_2_carry_7_), .B(N83), .Y(n35) );
  XOR2X1 U128 ( .A(sub_112_carry[7]), .B(N83), .Y(n36) );
  INVX1 U129 ( .A(N92), .Y(n140) );
  INVX1 U130 ( .A(N78), .Y(n139) );
  OAI2BB1X1 U131 ( .A0N(n142), .A1N(A1[12]), .B0(n141), .Y(n23) );
  OAI2BB1X1 U132 ( .A0N(n142), .A1N(A1[8]), .B0(n141), .Y(n62) );
  OAI2BB1X1 U133 ( .A0N(A1[11]), .A1N(n142), .B0(n141), .Y(n38) );
  OAI2BB1X1 U134 ( .A0N(A1[10]), .A1N(n142), .B0(n141), .Y(n46) );
  OAI2BB1X1 U135 ( .A0N(n142), .A1N(A1[9]), .B0(n141), .Y(n54) );
  OAI2BB1X1 U136 ( .A0N(n142), .A1N(A1[7]), .B0(n141), .Y(n70) );
  MXI2X1 U137 ( .A(n76), .B(n75), .S0(n12), .Y(n130) );
  XOR2X1 U138 ( .A(sub_112_carry[2]), .B(N78), .Y(n76) );
  XOR2X1 U139 ( .A(sub_112_2_carry_2_), .B(N78), .Y(n75) );
  INVX1 U140 ( .A(N79), .Y(n138) );
  INVX1 U141 ( .A(N80), .Y(n137) );
  INVX1 U142 ( .A(N81), .Y(n136) );
  INVX1 U143 ( .A(N82), .Y(n135) );
  BUFX3 U144 ( .A(N84), .Y(n12) );
  XNOR2X1 U145 ( .A(N77), .B(N92), .Y(n92) );
  MXI2X1 U146 ( .A(n68), .B(n67), .S0(n12), .Y(n127) );
  XOR2X1 U147 ( .A(sub_112_carry[3]), .B(N79), .Y(n68) );
  XOR2X1 U148 ( .A(sub_112_2_carry_3_), .B(N79), .Y(n67) );
  MXI2X1 U149 ( .A(n60), .B(n59), .S0(n12), .Y(n124) );
  XOR2X1 U150 ( .A(sub_112_carry[4]), .B(N80), .Y(n60) );
  XOR2X1 U151 ( .A(sub_112_2_carry_4_), .B(N80), .Y(n59) );
  INVX1 U152 ( .A(N83), .Y(n134) );
  MXI2XL U153 ( .A(n80), .B(n79), .S0(n78), .Y(n83) );
  XOR3X2 U154 ( .A(n115), .B(n114), .C(n113), .Y(UA2_7_) );
  OAI2BB1X4 U155 ( .A0N(n95), .A1N(n94), .B0(n93), .Y(n128) );
  OAI2BB1X4 U156 ( .A0N(n117), .A1N(n118), .B0(n100), .Y(n113) );
  OAI2BB1X4 U157 ( .A0N(n114), .A1N(n115), .B0(n101), .Y(n111) );
  OAI21X4 U158 ( .A0(n112), .A1(n110), .B0(n111), .Y(n102) );
  OAI2BB1X4 U159 ( .A0N(n109), .A1N(n5), .B0(n103), .Y(n106) );
  XOR2X4 U160 ( .A(n106), .B(n9), .Y(n133) );
  AND2X1 U162 ( .A(sub_112_2_carry_6_), .B(n135), .Y(sub_112_2_carry_7_) );
  AND2X1 U163 ( .A(sub_112_2_carry_5_), .B(n136), .Y(sub_112_2_carry_6_) );
  AND2X1 U164 ( .A(sub_112_2_carry_4_), .B(n137), .Y(sub_112_2_carry_5_) );
  AND2X1 U165 ( .A(sub_112_2_carry_3_), .B(n138), .Y(sub_112_2_carry_4_) );
  AND2X1 U166 ( .A(sub_112_2_carry_2_), .B(n139), .Y(sub_112_2_carry_3_) );
  AND2X1 U167 ( .A(sub_112_carry[6]), .B(n135), .Y(sub_112_carry[7]) );
  AND2X1 U168 ( .A(sub_112_carry[5]), .B(n136), .Y(sub_112_carry[6]) );
  AND2X1 U169 ( .A(sub_112_carry[4]), .B(n137), .Y(sub_112_carry[5]) );
  AND2X1 U170 ( .A(sub_112_carry[3]), .B(n138), .Y(sub_112_carry[4]) );
  AND2X1 U171 ( .A(sub_112_carry[2]), .B(n139), .Y(sub_112_carry[3]) );
  OAI2BB1X1 U172 ( .A0N(n142), .A1N(A1[3]), .B0(n141), .Y(FA1[5]) );
  OAI2BB1X1 U173 ( .A0N(n142), .A1N(A1[2]), .B0(n141), .Y(FA1[4]) );
  OAI2BB1X1 U174 ( .A0N(n142), .A1N(A1[1]), .B0(n141), .Y(FA1[3]) );
  NAND3BX1 U175 ( .AN(A1[0]), .B(n142), .C(n141), .Y(N31) );
  NOR3X1 U176 ( .A(n145), .B(A1[11]), .C(A1[10]), .Y(n144) );
  NOR4X1 U177 ( .A(A1[1]), .B(n146), .C(A1[3]), .D(A1[2]), .Y(n143) );
  UPA2_1_DW01_add_11 add_120 ( .A({n12, N83, N82, N81, N80, N79, N78, N77, N92, 
        A2[6:0]}), .B({n133, n133, n133, n133, n133, UA2_10_, UA2_9_, UA2_8_, 
        UA2_7_, UA2_6_, UA2_5_, UA2_4_, UA2_3_, UA2_2_, UA2_1_, UA2_0_}), .CI(
        1'b0), .SUM(A2T) );
  AOI31X1 U1 ( .A0(n12), .A1(sub_112_2_carry_7_), .A2(n134), .B0(n5), .Y(n104)
         );
  INVX1 U2 ( .A(n104), .Y(n110) );
endmodule

