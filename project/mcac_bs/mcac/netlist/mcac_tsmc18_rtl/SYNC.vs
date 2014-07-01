
module SYNC_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   SUM_0_;
  wire   [7:2] carry;
  assign SUM[0] = SUM_0_;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  INVX1 U1 ( .A(A[0]), .Y(SUM_0_) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module SYNC_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   SUM_0_;
  wire   [7:2] carry;
  assign SUM[0] = SUM_0_;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  INVXL U1 ( .A(A[0]), .Y(SUM_0_) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module SYNC ( I, SP, DLNX, DSX, LAW, SD, RATE );
  input [4:0] I;
  input [7:0] SP;
  input [11:0] DLNX;
  output [7:0] SD;
  input [1:0] RATE;
  input DSX, LAW;
  wire   I_4_, n421, N68, N69, N70, N71, N157, N207, N208, N239, N240, N241,
         N448, N449, N450, N451, N452, N453, N454, N455, N675, N676, N677,
         N678, N679, N680, N681, N682, r519_A_0_, r519_A_2_, r519_A_4_,
         r519_A_6_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, SD_3_, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
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
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420;
  wire   [3:3] add_234_carry;
  wire   [4:4] add_199_carry;
  assign I_4_ = I[4];
  assign N68 = I[0];
  assign N69 = I[1];
  assign N70 = I[2];
  assign N71 = I[3];
  assign SD[3] = SD_3_;

  SYNC_DW01_inc_0 r520 ( .A({SP[7], r519_A_6_, SP[5], r519_A_4_, SP[3], 
        r519_A_2_, SP[1], r519_A_0_}), .SUM({N682, N681, N680, N679, N678, 
        N677, N676, N675}) );
  SYNC_DW01_inc_1 r517 ( .A(SP), .SUM({N455, N454, N453, N452, N451, N450, 
        N449, N448}) );
  CLKINVXL U3 ( .A(SP[4]), .Y(r519_A_4_) );
  INVX4 U4 ( .A(n57), .Y(n110) );
  INVX4 U5 ( .A(n143), .Y(n116) );
  NAND2BX2 U6 ( .AN(n143), .B(n97), .Y(n208) );
  NAND2BX2 U7 ( .AN(n217), .B(n97), .Y(n38) );
  OAI21X2 U8 ( .A0(n27), .A1(n37), .B0(n118), .Y(n97) );
  NAND2BX4 U9 ( .AN(DLNX[4]), .B(n46), .Y(n242) );
  XOR2X2 U10 ( .A(n295), .B(n296), .Y(n302) );
  CLKINVX1 U11 ( .A(n216), .Y(n250) );
  OAI21X1 U12 ( .A0(n216), .A1(n217), .B0(n218), .Y(n4) );
  OAI211X2 U13 ( .A0(n28), .A1(n170), .B0(n169), .C0(n216), .Y(n98) );
  NOR2X2 U14 ( .A(n216), .B(n155), .Y(n134) );
  NAND3X1 U15 ( .A(n154), .B(n216), .C(n133), .Y(n61) );
  NAND3BX2 U16 ( .AN(n88), .B(n40), .C(n119), .Y(n216) );
  AOI2BB1X4 U17 ( .A0N(n255), .A1N(n254), .B0(n253), .Y(n256) );
  AOI2BB1X2 U18 ( .A0N(n7), .A1N(n251), .B0(n252), .Y(n253) );
  NAND3BX2 U19 ( .AN(n242), .B(n47), .C(n164), .Y(n79) );
  INVX2 U20 ( .A(n55), .Y(n47) );
  INVX4 U21 ( .A(n27), .Y(n164) );
  NAND2X1 U22 ( .A(N449), .B(n385), .Y(n335) );
  OAI21X1 U23 ( .A0(n178), .A1(n177), .B0(n176), .Y(n182) );
  OAI2BB1X2 U24 ( .A0N(n162), .A1N(n70), .B0(n102), .Y(n100) );
  NAND2BX2 U25 ( .AN(n229), .B(n208), .Y(n209) );
  OAI2BB1X4 U26 ( .A0N(n96), .A1N(n95), .B0(n116), .Y(n229) );
  NOR2XL U27 ( .A(n162), .B(n119), .Y(n96) );
  INVX2 U28 ( .A(n208), .Y(n279) );
  MXI2X4 U29 ( .A(n225), .B(n224), .S0(n29), .Y(n236) );
  NAND3X2 U30 ( .A(n222), .B(n221), .C(n220), .Y(n225) );
  NAND2BX2 U31 ( .AN(n30), .B(n116), .Y(n217) );
  OAI21X2 U32 ( .A0(n30), .A1(n196), .B0(n197), .Y(n114) );
  MXI2X2 U33 ( .A(n197), .B(n196), .S0(n29), .Y(n198) );
  OAI211X2 U34 ( .A0(n19), .A1(n113), .B0(n112), .C0(n179), .Y(n197) );
  OAI21X1 U35 ( .A0(n133), .A1(n249), .B0(n228), .Y(n195) );
  OAI21X2 U36 ( .A0(n100), .A1(n99), .B0(n122), .Y(n249) );
  INVX4 U37 ( .A(n389), .Y(n360) );
  NAND2X2 U38 ( .A(LAW), .B(n319), .Y(n389) );
  NOR3XL U39 ( .A(n117), .B(DLNX[1]), .C(DLNX[3]), .Y(n48) );
  NAND4X1 U40 ( .A(n61), .B(n230), .C(n218), .D(n60), .Y(n62) );
  BUFX16 U41 ( .A(DLNX[11]), .Y(n28) );
  OR2X2 U42 ( .A(DLNX[1]), .B(DLNX[0]), .Y(n140) );
  OAI2BB1X1 U43 ( .A0N(n27), .A1N(DLNX[7]), .B0(n162), .Y(n102) );
  INVX1 U44 ( .A(DLNX[7]), .Y(n90) );
  OAI21X1 U45 ( .A0(n134), .A1(n195), .B0(n279), .Y(n152) );
  OAI211X1 U46 ( .A0(n148), .A1(n174), .B0(n147), .C0(n227), .Y(n151) );
  CLKINVX3 U47 ( .A(DLNX[8]), .Y(n162) );
  INVX1 U48 ( .A(n69), .Y(n175) );
  INVXL U49 ( .A(n192), .Y(n201) );
  NAND3X1 U50 ( .A(n168), .B(n107), .C(n106), .Y(n196) );
  INVX1 U51 ( .A(SP[1]), .Y(n331) );
  INVX1 U52 ( .A(n285), .Y(n286) );
  MXI2X1 U53 ( .A(n187), .B(n186), .S0(n29), .Y(n188) );
  OAI21XL U54 ( .A0(n211), .A1(n210), .B0(n281), .Y(n214) );
  INVXL U55 ( .A(SP[2]), .Y(n6) );
  NAND2X1 U56 ( .A(n297), .B(n8), .Y(n285) );
  NAND2BX2 U57 ( .AN(n318), .B(n317), .Y(n417) );
  XOR2X2 U58 ( .A(n398), .B(LAW), .Y(SD[6]) );
  AOI21X1 U59 ( .A0(n102), .A1(n1), .B0(n101), .Y(n111) );
  NAND2BX1 U60 ( .AN(n246), .B(n223), .Y(n218) );
  CLKINVX2 U61 ( .A(n28), .Y(n246) );
  NAND2X1 U62 ( .A(n272), .B(n30), .Y(n252) );
  NAND2X1 U63 ( .A(n280), .B(n29), .Y(n60) );
  NAND3X1 U64 ( .A(n154), .B(n228), .C(n148), .Y(n230) );
  INVX1 U65 ( .A(n38), .Y(n154) );
  NAND2X1 U66 ( .A(n233), .B(n257), .Y(n259) );
  NAND2X1 U67 ( .A(n248), .B(n30), .Y(n254) );
  OAI2BB1X1 U68 ( .A0N(n67), .A1N(n68), .B0(n66), .Y(n69) );
  INVX2 U69 ( .A(n136), .Y(n68) );
  OAI31X1 U70 ( .A0(n242), .A1(n131), .A2(n108), .B0(n243), .Y(n155) );
  OAI211X1 U71 ( .A0(n110), .A1(n164), .B0(n116), .C0(n84), .Y(n123) );
  NOR3X2 U72 ( .A(n263), .B(n24), .C(n262), .Y(n299) );
  OAI31XL U73 ( .A0(DLNX[8]), .A1(n57), .A2(n71), .B0(n102), .Y(n133) );
  AOI21X1 U74 ( .A0(n29), .A1(n232), .B0(n231), .Y(n235) );
  AOI21XL U75 ( .A0(n376), .A1(n345), .B0(n360), .Y(n344) );
  NAND3X1 U76 ( .A(n323), .B(n339), .C(n20), .Y(n337) );
  AOI2BB1X1 U77 ( .A0N(DLNX[1]), .A1N(DLNX[2]), .B0(n94), .Y(n1) );
  INVX1 U78 ( .A(n1), .Y(n99) );
  AOI32X1 U79 ( .A0(n204), .A1(n237), .A2(n28), .B0(n194), .B1(n155), .Y(n157)
         );
  NAND2XL U80 ( .A(LAW), .B(n322), .Y(n402) );
  OAI221XL U81 ( .A0(n346), .A1(n378), .B0(n345), .B1(n409), .C0(n335), .Y(
        n342) );
  NAND2XL U82 ( .A(n132), .B(n139), .Y(n243) );
  AOI2BB2X2 U83 ( .B0(n204), .B1(n240), .A0N(n252), .A1N(n2), .Y(n199) );
  INVX1 U84 ( .A(n277), .Y(n2) );
  AND2X2 U85 ( .A(n3), .B(n338), .Y(n405) );
  INVX1 U86 ( .A(n337), .Y(n3) );
  NAND3BXL U87 ( .AN(n243), .B(n110), .C(n109), .Y(n245) );
  NAND4X1 U88 ( .A(n29), .B(n126), .C(n204), .D(n128), .Y(n76) );
  OAI2BB1X2 U89 ( .A0N(n323), .A1N(n316), .B0(n332), .Y(n347) );
  AOI21XL U90 ( .A0(n376), .A1(n361), .B0(n360), .Y(n366) );
  INVX2 U91 ( .A(n409), .Y(n376) );
  AND2X2 U92 ( .A(n287), .B(n289), .Y(n5) );
  AOI21XL U93 ( .A0(n68), .A1(n65), .B0(n143), .Y(n66) );
  NOR2BX1 U94 ( .AN(n169), .B(n223), .Y(n150) );
  OAI211XL U95 ( .A0(n417), .A1(n368), .B0(n410), .C0(n374), .Y(n371) );
  NOR2XL U96 ( .A(n20), .B(n402), .Y(n403) );
  AND3X2 U97 ( .A(n131), .B(n83), .C(n82), .Y(n125) );
  INVX1 U98 ( .A(n4), .Y(n234) );
  AND3X2 U99 ( .A(n192), .B(n191), .C(n156), .Y(n115) );
  AOI31X1 U100 ( .A0(n404), .A1(n322), .A2(n32), .B0(n403), .Y(n408) );
  AOI21X1 U101 ( .A0(n333), .A1(n316), .B0(n414), .Y(n317) );
  OAI2BB1X4 U102 ( .A0N(n43), .A1N(n70), .B0(n68), .Y(n81) );
  INVXL U103 ( .A(n26), .Y(n70) );
  OAI21XL U104 ( .A0(n180), .A1(n179), .B0(n168), .Y(n187) );
  NOR2XL U105 ( .A(n280), .B(n279), .Y(n282) );
  OR2X1 U106 ( .A(n409), .B(n388), .Y(n374) );
  OAI21XL U107 ( .A0(n312), .A1(n311), .B0(n338), .Y(n329) );
  INVX2 U108 ( .A(n402), .Y(n338) );
  NOR2X1 U109 ( .A(n233), .B(n38), .Y(n194) );
  OAI22X1 U110 ( .A0(n127), .A1(n128), .B0(n126), .B1(n125), .Y(n129) );
  INVX1 U111 ( .A(n105), .Y(n126) );
  AND3X2 U112 ( .A(n410), .B(n359), .C(n358), .Y(n11) );
  NAND2XL U113 ( .A(n68), .B(n41), .Y(n228) );
  NAND2X1 U114 ( .A(n220), .B(n223), .Y(n278) );
  NAND3BX1 U115 ( .AN(n215), .B(n214), .C(n213), .Y(n265) );
  OR2X2 U116 ( .A(n233), .B(I_4_), .Y(n273) );
  OR2X4 U117 ( .A(n353), .B(LAW), .Y(n14) );
  NAND2XL U118 ( .A(n375), .B(n374), .Y(n381) );
  NOR2X2 U119 ( .A(n125), .B(n143), .Y(n178) );
  NAND2BX1 U120 ( .AN(n90), .B(n67), .Y(n40) );
  NAND2X1 U121 ( .A(n204), .B(n30), .Y(n207) );
  NAND2BX2 U122 ( .AN(n414), .B(n347), .Y(n378) );
  NAND2X1 U123 ( .A(SP[7]), .B(n314), .Y(n399) );
  OAI2BB1X2 U124 ( .A0N(n288), .A1N(n5), .B0(n285), .Y(n407) );
  NAND4X1 U125 ( .A(n387), .B(n410), .C(n386), .D(n397), .Y(n398) );
  INVX1 U126 ( .A(n176), .Y(n127) );
  NAND3X1 U127 ( .A(n124), .B(n123), .C(n122), .Y(n176) );
  MXI2X1 U128 ( .A(n343), .B(n344), .S0(n6), .Y(n352) );
  NOR2X2 U129 ( .A(n28), .B(DLNX[9]), .Y(n34) );
  OAI21XL U130 ( .A0(n26), .A1(n27), .B0(DLNX[7]), .Y(n119) );
  OR2XL U131 ( .A(n26), .B(DLNX[7]), .Y(n65) );
  NAND3BX4 U132 ( .AN(n342), .B(n341), .C(n340), .Y(n421) );
  AOI31X2 U133 ( .A0(n115), .A1(n199), .A2(n114), .B0(N68), .Y(n190) );
  NAND2BX4 U134 ( .AN(DLNX[10]), .B(n34), .Y(n143) );
  NAND2BX1 U135 ( .AN(SP[1]), .B(SP[0]), .Y(n345) );
  NAND4BX2 U136 ( .AN(n201), .B(n200), .C(n199), .D(n198), .Y(n307) );
  OAI221X2 U137 ( .A0(n185), .A1(n233), .B0(n19), .B1(n184), .C0(n183), .Y(
        n186) );
  AOI21X2 U138 ( .A0(n204), .A1(n182), .B0(n181), .Y(n183) );
  AOI21XL U139 ( .A0(n364), .A1(n346), .B0(n362), .Y(n343) );
  OAI21X4 U140 ( .A0(n44), .A1(n81), .B0(n116), .Y(n148) );
  OR2X4 U141 ( .A(n27), .B(DLNX[7]), .Y(n141) );
  NOR2XL U142 ( .A(DLNX[3]), .B(DLNX[7]), .Y(n42) );
  INVX4 U143 ( .A(n148), .Y(n212) );
  NAND3BX4 U144 ( .AN(n420), .B(n419), .C(n418), .Y(SD[7]) );
  OAI21X2 U145 ( .A0(n416), .A1(n415), .B0(SP[7]), .Y(n419) );
  BUFX12 U146 ( .A(DLNX[5]), .Y(n26) );
  BUFX8 U147 ( .A(DLNX[6]), .Y(n27) );
  NAND2BX2 U148 ( .AN(n296), .B(n295), .Y(n268) );
  XOR2X2 U149 ( .A(n407), .B(SP[7]), .Y(n318) );
  NAND2BX2 U150 ( .AN(n104), .B(n93), .Y(n221) );
  NAND3X1 U151 ( .A(n178), .B(n204), .C(n105), .Y(n106) );
  NAND2BX2 U152 ( .AN(n339), .B(n338), .Y(n410) );
  NOR2X1 U153 ( .A(n110), .B(n36), .Y(n37) );
  NAND3BX1 U154 ( .AN(n166), .B(n54), .C(n246), .Y(n104) );
  NAND3X1 U155 ( .A(n53), .B(n26), .C(n52), .Y(n54) );
  NAND2X1 U156 ( .A(DLNX[9]), .B(n91), .Y(n103) );
  OAI21X1 U157 ( .A0(n59), .A1(n58), .B0(n116), .Y(n93) );
  NAND2X1 U158 ( .A(n118), .B(n57), .Y(n58) );
  OAI211X1 U159 ( .A0(n26), .A1(n56), .B0(n27), .C0(n55), .Y(n59) );
  INVX1 U160 ( .A(n209), .Y(n172) );
  OAI2BB1X1 U161 ( .A0N(n75), .A1N(n108), .B0(n74), .Y(n105) );
  INVX1 U162 ( .A(n49), .Y(n118) );
  NAND2BX1 U163 ( .AN(n142), .B(n103), .Y(n219) );
  OAI21XL U164 ( .A0(n160), .A1(n94), .B0(n164), .Y(n95) );
  INVX1 U165 ( .A(n219), .Y(n170) );
  OAI31X1 U166 ( .A0(DLNX[1]), .A1(DLNX[3]), .A2(DLNX[2]), .B0(DLNX[4]), .Y(
        n120) );
  NAND3X1 U167 ( .A(n72), .B(n162), .C(n116), .Y(n128) );
  INVX1 U168 ( .A(n298), .Y(n300) );
  INVX1 U169 ( .A(n322), .Y(n319) );
  OAI21X2 U170 ( .A0(n262), .A1(n263), .B0(n24), .Y(n298) );
  OAI2BB1X1 U171 ( .A0N(n283), .A1N(n282), .B0(n281), .Y(n284) );
  INVX1 U172 ( .A(n393), .Y(n364) );
  NAND2BX2 U173 ( .AN(n414), .B(n347), .Y(n393) );
  OAI21X2 U174 ( .A0(n299), .A1(n269), .B0(n268), .Y(n287) );
  INVX1 U175 ( .A(n410), .Y(n384) );
  NAND2BX1 U176 ( .AN(n378), .B(n379), .Y(n375) );
  OAI21XL U177 ( .A0(n379), .A1(n378), .B0(n377), .Y(n380) );
  NAND2X2 U178 ( .A(n140), .B(DLNX[2]), .Y(n160) );
  NAND2X2 U179 ( .A(n157), .B(n156), .Y(n158) );
  MXI2XL U180 ( .A(n366), .B(n365), .S0(SP[4]), .Y(n373) );
  NOR4BX4 U181 ( .AN(n152), .B(n151), .C(n150), .D(n149), .Y(n153) );
  NOR2XL U182 ( .A(n131), .B(n56), .Y(n44) );
  OAI21XL U183 ( .A0(n171), .A1(n170), .B0(n169), .Y(n173) );
  INVX2 U184 ( .A(n81), .Y(n82) );
  OAI21XL U185 ( .A0(n229), .A1(n228), .B0(n227), .Y(n232) );
  NAND3X1 U186 ( .A(n238), .B(n204), .C(n123), .Y(n112) );
  NAND4BBX2 U187 ( .AN(n7), .BN(n98), .C(n227), .D(n209), .Y(n277) );
  NAND2X2 U188 ( .A(n188), .B(n189), .Y(n303) );
  NOR4BX2 U189 ( .AN(n192), .B(n267), .C(n159), .D(n158), .Y(n189) );
  OAI21XL U190 ( .A0(n394), .A1(n393), .B0(n392), .Y(n395) );
  INVX1 U191 ( .A(DLNX[4]), .Y(n50) );
  NAND2BX1 U192 ( .AN(n26), .B(n73), .Y(n55) );
  OR2X2 U193 ( .A(DLNX[2]), .B(n15), .Y(n56) );
  NAND2BX1 U194 ( .AN(n139), .B(DLNX[8]), .Y(n136) );
  INVX1 U195 ( .A(n108), .Y(n132) );
  INVX1 U196 ( .A(n131), .Y(n165) );
  NAND3BX1 U197 ( .AN(n166), .B(n162), .C(n246), .Y(n88) );
  INVX1 U198 ( .A(n65), .Y(n80) );
  OR2X2 U199 ( .A(DLNX[3]), .B(n22), .Y(n71) );
  AOI21X1 U200 ( .A0(n99), .A1(n90), .B0(n80), .Y(n41) );
  INVX1 U201 ( .A(n128), .Y(n238) );
  INVX1 U202 ( .A(n220), .Y(n149) );
  AOI211X1 U203 ( .A0(n7), .A1(n174), .B0(n173), .C0(n172), .Y(n185) );
  OAI2BB1X1 U204 ( .A0N(n78), .A1N(n77), .B0(n76), .Y(n193) );
  NOR2X1 U205 ( .A(n175), .B(n113), .Y(n78) );
  INVX2 U206 ( .A(n323), .Y(n334) );
  OAI21X2 U207 ( .A0(n177), .A1(n129), .B0(n246), .Y(n130) );
  OAI2BB1X1 U208 ( .A0N(n234), .A1N(n236), .B0(n272), .Y(n264) );
  XNOR2X1 U209 ( .A(n305), .B(n304), .Y(n309) );
  NOR4X2 U210 ( .A(n302), .B(n301), .C(n300), .D(n299), .Y(n310) );
  INVX1 U211 ( .A(SP[3]), .Y(n369) );
  NAND2X1 U212 ( .A(n306), .B(n307), .Y(n260) );
  OAI21XL U213 ( .A0(n21), .A1(n378), .B0(n355), .Y(n356) );
  XOR2X2 U214 ( .A(n330), .B(LAW), .Y(SD[0]) );
  NAND3X1 U215 ( .A(n329), .B(n328), .C(n327), .Y(n330) );
  CLKINVX3 U216 ( .A(n9), .Y(SD[1]) );
  NAND3BX2 U217 ( .AN(n384), .B(n383), .C(n382), .Y(SD[5]) );
  AND2X2 U218 ( .A(n249), .B(n212), .Y(n7) );
  NAND2BX2 U219 ( .AN(n233), .B(n62), .Y(n192) );
  AND4X2 U220 ( .A(n276), .B(n275), .C(n274), .D(n273), .Y(n8) );
  INVX1 U221 ( .A(n303), .Y(n305) );
  MXI2X1 U222 ( .A(n357), .B(n356), .S0(SP[3]), .Y(n359) );
  MXI2X4 U223 ( .A(n86), .B(n85), .S0(n29), .Y(n87) );
  NOR2X2 U224 ( .A(n28), .B(n178), .Y(n86) );
  NAND4X1 U225 ( .A(n26), .B(n27), .C(DLNX[4]), .D(n92), .Y(n169) );
  MXI2X1 U226 ( .A(n409), .B(n378), .S0(SP[0]), .Y(n336) );
  NAND4X1 U227 ( .A(n322), .B(LAW), .C(n321), .D(n320), .Y(n324) );
  OR2X2 U228 ( .A(n28), .B(DLNX[10]), .Y(n142) );
  AND2X2 U229 ( .A(DLNX[1]), .B(DLNX[2]), .Y(n22) );
  AND2X2 U230 ( .A(DLNX[0]), .B(DLNX[1]), .Y(n15) );
  CLKINVX3 U231 ( .A(n421), .Y(n9) );
  INVX4 U232 ( .A(n11), .Y(SD_3_) );
  NAND2X1 U233 ( .A(n353), .B(LAW), .Y(n13) );
  NAND2X4 U234 ( .A(n13), .B(n14), .Y(SD[2]) );
  NOR2X2 U235 ( .A(n352), .B(n351), .Y(n353) );
  NAND3XL U236 ( .A(n135), .B(n242), .C(n26), .Y(n145) );
  NOR2XL U237 ( .A(n51), .B(n50), .Y(n52) );
  NOR2XL U238 ( .A(n49), .B(n164), .Y(n53) );
  NAND2BX1 U239 ( .AN(n400), .B(n313), .Y(n332) );
  NAND2X1 U240 ( .A(n227), .B(n209), .Y(n210) );
  AND2X2 U241 ( .A(n111), .B(n245), .Y(n19) );
  NAND4BBX1 U242 ( .AN(SP[0]), .BN(SP[2]), .C(r519_A_6_), .D(r519_A_4_), .Y(
        n292) );
  NAND3BX2 U243 ( .AN(n142), .B(n104), .C(n103), .Y(n220) );
  NAND3BX1 U244 ( .AN(n233), .B(n278), .C(n169), .Y(n107) );
  NOR2XL U245 ( .A(n212), .B(n208), .Y(n211) );
  OAI2BB1X1 U246 ( .A0N(n118), .A1N(n117), .B0(n116), .Y(n177) );
  NOR2XL U247 ( .A(DLNX[3]), .B(n142), .Y(n109) );
  NAND3BXL U248 ( .AN(n100), .B(DLNX[4]), .C(n71), .Y(n72) );
  NAND3BX2 U249 ( .AN(n267), .B(n226), .C(n264), .Y(n295) );
  MXI2X1 U250 ( .A(n381), .B(n380), .S0(SP[5]), .Y(n383) );
  INVX1 U251 ( .A(n392), .Y(n362) );
  NAND3BX1 U252 ( .AN(n414), .B(n347), .C(n21), .Y(n348) );
  INVXL U253 ( .A(SP[6]), .Y(r519_A_6_) );
  INVX4 U254 ( .A(n141), .Y(n139) );
  MXI2X1 U255 ( .A(n239), .B(n30), .S0(n238), .Y(n241) );
  NAND2XL U256 ( .A(n219), .B(n223), .Y(n222) );
  NAND2BX1 U257 ( .AN(n119), .B(n121), .Y(n124) );
  NAND2XL U258 ( .A(n171), .B(n246), .Y(n147) );
  NAND2XL U259 ( .A(n111), .B(n248), .Y(n168) );
  OR2XL U260 ( .A(DLNX[9]), .B(DLNX[10]), .Y(n166) );
  NAND2XL U261 ( .A(n80), .B(n160), .Y(n83) );
  NAND3XL U262 ( .A(DLNX[3]), .B(n140), .C(n26), .Y(n146) );
  NAND2BX2 U263 ( .AN(n360), .B(n392), .Y(n411) );
  OAI2BB1X1 U264 ( .A0N(n26), .A1N(DLNX[8]), .B0(n136), .Y(n137) );
  NAND2XL U265 ( .A(DLNX[3]), .B(n56), .Y(n39) );
  INVXL U266 ( .A(DSX), .Y(n30) );
  XNOR2X4 U267 ( .A(n32), .B(n16), .Y(SD[4]) );
  OR2X4 U268 ( .A(n373), .B(n372), .Y(n16) );
  XNOR2X1 U269 ( .A(n297), .B(n8), .Y(n301) );
  NAND2BX1 U270 ( .AN(n333), .B(n17), .Y(n413) );
  XOR2X1 U271 ( .A(n407), .B(SP[7]), .Y(n17) );
  INVX1 U272 ( .A(n296), .Y(n266) );
  NOR2BXL U273 ( .AN(n204), .B(N71), .Y(n23) );
  MXI2XL U274 ( .A(n23), .B(n272), .S0(N71), .Y(n205) );
  INVXL U275 ( .A(N69), .Y(n63) );
  XNOR2X1 U276 ( .A(I_4_), .B(n18), .Y(N241) );
  NAND2XL U277 ( .A(add_234_carry[3]), .B(N71), .Y(n18) );
  INVXL U278 ( .A(N68), .Y(n304) );
  INVX1 U279 ( .A(n391), .Y(n379) );
  NAND3X1 U280 ( .A(n21), .B(r519_A_4_), .C(n369), .Y(n391) );
  NAND2X1 U281 ( .A(n332), .B(n316), .Y(n333) );
  INVX1 U282 ( .A(n354), .Y(n367) );
  INVX1 U283 ( .A(n88), .Y(n122) );
  NOR2XL U284 ( .A(n250), .B(n249), .Y(n251) );
  INVX1 U285 ( .A(n221), .Y(n280) );
  INVX1 U286 ( .A(n230), .Y(n231) );
  INVX1 U287 ( .A(n252), .Y(n281) );
  NAND2X1 U288 ( .A(n315), .B(n314), .Y(n316) );
  INVXL U289 ( .A(SP[5]), .Y(n291) );
  INVX1 U290 ( .A(n401), .Y(n313) );
  NAND3BXL U291 ( .AN(n291), .B(SP[3]), .C(SP[1]), .Y(n400) );
  NAND2BXL U292 ( .AN(n345), .B(SP[2]), .Y(n354) );
  INVX1 U293 ( .A(n33), .Y(n314) );
  NAND3BX1 U294 ( .AN(SP[3]), .B(n331), .C(n291), .Y(n33) );
  NAND2BX1 U295 ( .AN(n400), .B(n315), .Y(n339) );
  OR2X2 U296 ( .A(n401), .B(n399), .Y(n320) );
  AND2X2 U297 ( .A(n321), .B(n320), .Y(n20) );
  INVXL U298 ( .A(SP[2]), .Y(r519_A_2_) );
  NOR2XL U299 ( .A(SP[2]), .B(n346), .Y(n21) );
  NOR2XL U300 ( .A(DLNX[8]), .B(DLNX[7]), .Y(n84) );
  NAND2BX4 U301 ( .AN(n93), .B(n229), .Y(n227) );
  AOI21XL U302 ( .A0(n195), .A1(n194), .B0(n193), .Y(n200) );
  NAND2BX1 U303 ( .AN(n27), .B(n120), .Y(n121) );
  NOR2X1 U304 ( .A(n26), .B(n35), .Y(n36) );
  NOR2BX1 U305 ( .AN(DLNX[3]), .B(n160), .Y(n35) );
  NAND2XL U306 ( .A(DLNX[4]), .B(DLNX[3]), .Y(n94) );
  INVXL U307 ( .A(n223), .Y(n224) );
  NAND2XL U308 ( .A(n237), .B(n30), .Y(n239) );
  NOR2XL U309 ( .A(n27), .B(DLNX[8]), .Y(n89) );
  NAND2XL U310 ( .A(n100), .B(n116), .Y(n101) );
  OAI21XL U311 ( .A0(n167), .A1(n166), .B0(n246), .Y(n180) );
  AOI31XL U312 ( .A0(n165), .A1(n164), .A2(n163), .B0(n162), .Y(n167) );
  NOR2XL U313 ( .A(DLNX[4]), .B(n161), .Y(n163) );
  INVX1 U314 ( .A(n160), .Y(n161) );
  NAND2BX1 U315 ( .AN(n26), .B(n42), .Y(n131) );
  NOR2X2 U316 ( .A(n153), .B(n252), .Y(n159) );
  OAI21XL U317 ( .A0(n247), .A1(n246), .B0(n245), .Y(n255) );
  NOR3BXL U318 ( .AN(n244), .B(DLNX[10]), .C(n243), .Y(n247) );
  OAI21XL U319 ( .A0(DLNX[3]), .A1(n242), .B0(n26), .Y(n244) );
  AOI21X1 U320 ( .A0(N450), .A1(n385), .B0(n384), .Y(n349) );
  NAND2XL U321 ( .A(N454), .B(n385), .Y(n386) );
  NOR2X1 U322 ( .A(n278), .B(n277), .Y(n283) );
  NOR2XL U323 ( .A(DLNX[4]), .B(DLNX[7]), .Y(n43) );
  NAND2BX1 U324 ( .AN(DLNX[4]), .B(n73), .Y(n135) );
  INVX1 U325 ( .A(DLNX[3]), .Y(n73) );
  AOI21X1 U326 ( .A0(n364), .A1(n363), .B0(n362), .Y(n365) );
  NAND2X1 U327 ( .A(n21), .B(n369), .Y(n363) );
  INVX1 U328 ( .A(n142), .Y(n74) );
  NAND3BXL U329 ( .AN(DLNX[9]), .B(n145), .C(n139), .Y(n75) );
  INVX1 U330 ( .A(DLNX[2]), .Y(n46) );
  INVX1 U331 ( .A(n71), .Y(n51) );
  OR2XL U332 ( .A(DLNX[8]), .B(DLNX[9]), .Y(n108) );
  INVX1 U333 ( .A(n30), .Y(n29) );
  INVXL U334 ( .A(SP[0]), .Y(r519_A_0_) );
  NAND3X1 U335 ( .A(n313), .B(n314), .C(n31), .Y(n321) );
  NAND2BX1 U336 ( .AN(SP[0]), .B(n331), .Y(n346) );
  INVX1 U337 ( .A(n292), .Y(n315) );
  AOI22XL U338 ( .A0(N680), .A1(n405), .B0(N453), .B1(n385), .Y(n382) );
  NAND2XL U339 ( .A(n175), .B(n248), .Y(n184) );
  NAND2X1 U340 ( .A(n350), .B(n349), .Y(n351) );
  AOI31XL U341 ( .A0(n146), .A1(n145), .A2(n144), .B0(n116), .Y(n171) );
  NAND2X1 U342 ( .A(n367), .B(n369), .Y(n361) );
  NOR2X2 U343 ( .A(n241), .B(n240), .Y(n258) );
  NOR2X2 U344 ( .A(n49), .B(n45), .Y(n92) );
  NAND3XL U345 ( .A(DLNX[9]), .B(DLNX[10]), .C(n28), .Y(n45) );
  AOI22XL U346 ( .A0(N678), .A1(n405), .B0(N451), .B1(n385), .Y(n358) );
  INVX1 U347 ( .A(N452), .Y(n368) );
  NAND2X1 U348 ( .A(N682), .B(n405), .Y(n406) );
  NOR2XL U349 ( .A(n28), .B(n207), .Y(n215) );
  NAND2XL U350 ( .A(n212), .B(n194), .Y(n213) );
  NOR2XL U351 ( .A(SP[5]), .B(n391), .Y(n394) );
  NAND2X1 U352 ( .A(N679), .B(n405), .Y(n370) );
  NAND2XL U353 ( .A(n123), .B(n237), .Y(n85) );
  AOI21X1 U354 ( .A0(N677), .A1(n405), .B0(n357), .Y(n350) );
  NAND2X1 U355 ( .A(N681), .B(n405), .Y(n387) );
  NOR2BX1 U356 ( .AN(n180), .B(n179), .Y(n181) );
  NAND2BX1 U357 ( .AN(n28), .B(n29), .Y(n77) );
  MXI2X1 U358 ( .A(n396), .B(n395), .S0(SP[6]), .Y(n397) );
  NAND2BX1 U359 ( .AN(DLNX[4]), .B(n39), .Y(n67) );
  OAI2BB1X1 U360 ( .A0N(n139), .A1N(n138), .B0(n137), .Y(n174) );
  OAI21XL U361 ( .A0(DLNX[1]), .A1(n242), .B0(n135), .Y(n138) );
  INVX1 U362 ( .A(SP[7]), .Y(n31) );
  INVX1 U363 ( .A(n257), .Y(n204) );
  INVX1 U364 ( .A(n113), .Y(n248) );
  INVX1 U365 ( .A(n233), .Y(n272) );
  AOI21XL U366 ( .A0(N676), .A1(n405), .B0(n384), .Y(n340) );
  OAI21XL U367 ( .A0(n336), .A1(n411), .B0(SP[1]), .Y(n341) );
  NAND3BXL U368 ( .AN(n371), .B(n375), .C(n370), .Y(n372) );
  NAND2BX1 U369 ( .AN(LAW), .B(n319), .Y(n392) );
  NAND2X1 U370 ( .A(N448), .B(n385), .Y(n328) );
  MXI2XL U371 ( .A(n326), .B(n325), .S0(SP[0]), .Y(n327) );
  NAND2XL U372 ( .A(n392), .B(n409), .Y(n325) );
  OAI21XL U373 ( .A0(n414), .A1(n413), .B0(n389), .Y(n326) );
  NAND2XL U374 ( .A(n410), .B(n409), .Y(n416) );
  OAI21XL U375 ( .A0(n390), .A1(n409), .B0(n389), .Y(n396) );
  NOR2XL U376 ( .A(SP[5]), .B(n388), .Y(n390) );
  OAI21XL U377 ( .A0(n401), .A1(n400), .B0(n399), .Y(n404) );
  OAI21XL U378 ( .A0(n414), .A1(n413), .B0(n412), .Y(n415) );
  INVXL U379 ( .A(n411), .Y(n412) );
  OAI22X1 U380 ( .A0(n337), .A1(n294), .B0(n339), .B1(n293), .Y(n311) );
  INVX1 U381 ( .A(N675), .Y(n294) );
  INVXL U382 ( .A(n318), .Y(n293) );
  NAND2X1 U383 ( .A(RATE[1]), .B(RATE[0]), .Y(n179) );
  NAND2BX1 U384 ( .AN(RATE[1]), .B(RATE[0]), .Y(n257) );
  OR2X2 U385 ( .A(RATE[1]), .B(RATE[0]), .Y(n233) );
  NAND2BX1 U386 ( .AN(RATE[0]), .B(RATE[1]), .Y(n113) );
  NAND2BX1 U387 ( .AN(n417), .B(N455), .Y(n418) );
  OAI21XL U388 ( .A0(n408), .A1(n407), .B0(n406), .Y(n420) );
  MXI2XL U389 ( .A(n320), .B(n321), .S0(n407), .Y(n312) );
  NAND2BXL U390 ( .AN(n8), .B(n284), .Y(n289) );
  INVX1 U391 ( .A(n191), .Y(n306) );
  INVX1 U392 ( .A(n203), .Y(n270) );
  INVX1 U393 ( .A(LAW), .Y(n32) );
  XOR2X1 U394 ( .A(n307), .B(n306), .Y(n308) );
  NOR4BX2 U395 ( .AN(n264), .B(n267), .C(n266), .D(n265), .Y(n269) );
  XOR2X2 U396 ( .A(n31), .B(n290), .Y(n323) );
  OAI21XL U397 ( .A0(n64), .A1(n63), .B0(n203), .Y(n191) );
  NOR2X1 U398 ( .A(n248), .B(n259), .Y(n64) );
  NAND2BX1 U399 ( .AN(n179), .B(n63), .Y(n203) );
  NAND2X1 U400 ( .A(N241), .B(n270), .Y(n276) );
  NAND2X1 U401 ( .A(n206), .B(n205), .Y(n296) );
  AOI22X1 U402 ( .A0(N207), .A1(n271), .B0(N240), .B1(n270), .Y(n206) );
  INVX1 U403 ( .A(n202), .Y(n271) );
  NAND2BX1 U404 ( .AN(N70), .B(n248), .Y(n202) );
  NAND2X1 U405 ( .A(N208), .B(n271), .Y(n275) );
  AOI21X1 U406 ( .A0(N239), .A1(n270), .B0(n25), .Y(n24) );
  MX2X1 U407 ( .A(n271), .B(n259), .S0(N70), .Y(n25) );
  NAND2X1 U408 ( .A(N157), .B(n23), .Y(n274) );
  NOR3XL U409 ( .A(n142), .B(DLNX[8]), .C(n141), .Y(n144) );
  NAND3X1 U410 ( .A(n110), .B(n90), .C(n89), .Y(n91) );
  NAND3X4 U411 ( .A(n310), .B(n309), .C(n308), .Y(n322) );
  AOI21XL U412 ( .A0(n376), .A1(n354), .B0(n411), .Y(n355) );
  AOI21XL U413 ( .A0(n376), .A1(n388), .B0(n411), .Y(n377) );
  NAND3XL U414 ( .A(n367), .B(SP[4]), .C(n369), .Y(n388) );
  NAND4XL U415 ( .A(SP[4]), .B(SP[6]), .C(SP[0]), .D(SP[2]), .Y(n401) );
  NAND2X1 U416 ( .A(n110), .B(n164), .Y(n117) );
  NAND2BX4 U417 ( .AN(n26), .B(n50), .Y(n57) );
  NAND2X2 U418 ( .A(DLNX[8]), .B(DLNX[7]), .Y(n49) );
  NAND3BX4 U419 ( .AN(n48), .B(n92), .C(n79), .Y(n223) );
  CLKINVX3 U420 ( .A(n193), .Y(n156) );
  NAND2X2 U421 ( .A(n92), .B(n79), .Y(n237) );
  OAI2BB1X4 U422 ( .A0N(n28), .A1N(n237), .B0(n87), .Y(n240) );
  AOI21X4 U423 ( .A0(n237), .A1(n130), .B0(n207), .Y(n267) );
  NAND2X2 U424 ( .A(n190), .B(n303), .Y(n261) );
  CLKINVX3 U425 ( .A(n265), .Y(n226) );
  AOI31X2 U426 ( .A0(n236), .A1(n235), .A2(n234), .B0(n233), .Y(n262) );
  OAI21X4 U427 ( .A0(n258), .A1(n257), .B0(n256), .Y(n263) );
  NAND4X2 U428 ( .A(n261), .B(n260), .C(n268), .D(n298), .Y(n288) );
  CLKINVX3 U429 ( .A(n284), .Y(n297) );
  AOI31X2 U430 ( .A0(n289), .A1(n288), .A2(n287), .B0(n286), .Y(n290) );
  NAND2X2 U431 ( .A(n322), .B(n32), .Y(n414) );
  NAND2BX4 U432 ( .AN(n324), .B(n334), .Y(n409) );
  CLKINVX3 U433 ( .A(n417), .Y(n385) );
  OAI2BB1X2 U434 ( .A0N(n376), .A1N(n367), .B0(n348), .Y(n357) );
  XOR2X1 U435 ( .A(I_4_), .B(add_199_carry[4]), .Y(N208) );
  AND2X1 U436 ( .A(N70), .B(N71), .Y(add_199_carry[4]) );
  XOR2X1 U437 ( .A(N71), .B(N70), .Y(N207) );
  XOR2X1 U438 ( .A(N71), .B(add_234_carry[3]), .Y(N240) );
  AND2X1 U439 ( .A(N69), .B(N70), .Y(add_234_carry[3]) );
  XOR2X1 U440 ( .A(N70), .B(N69), .Y(N239) );
  XOR2X1 U441 ( .A(I_4_), .B(N71), .Y(N157) );
endmodule

