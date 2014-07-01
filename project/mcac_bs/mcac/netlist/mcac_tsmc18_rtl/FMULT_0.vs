
module FMULT_0_DW01_add_1 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [5:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(SUM[6]), .S(SUM[5]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FMULT_0 ( clk, reset, scan_enable, scan_in0, scan_in1, scan_in2, 
        scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, 
        scan_out4, An, SRn, WAn, SHIFT_EXP, SHIFT_MANT, INIT_SR, LD_OUT_SR );
  input [15:0] An;
  input [10:0] SRn;
  output [15:0] WAn;
  input clk, reset, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, SHIFT_EXP, SHIFT_MANT, INIT_SR, LD_OUT_SR;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   AnMAG_13_, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24,
         N25, N76, N77, N78, N79, N80, N81, EXP_CARRY, N86, N90, N91, N92, N93,
         N94, N95, N96, N100, N101, N102, N103, N104, N105, N106, N112, N117,
         N118, N119, N120, N121, N122, N123, N124, N125, N126, N128, N129,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, WAnMAG_15_, N160, N161, N162, N163, N164,
         N165, N166, N167, N168, N170, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N187, N188,
         N189, N190, N191, N192, N193, N194, N195, N196, N197, N198, N199,
         N200, N201, sub_245_B_1_, sub_245_B_2_, sub_245_B_7_, sub_245_B_8_,
         sub_245_B_9_, sub_245_B_10_, sub_245_B_11_, sub_245_B_12_,
         sub_245_B_13_, sub_245_B_14_, add_229_carry_2_, add_229_carry_3_,
         add_229_carry_4_, add_229_carry_5_, add_229_carry_6_,
         add_229_carry_7_, n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n48, n49, n51, n67, n70, n71, n101, n107,
         n132, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
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
         n331, n332, n333, n334, n335;
  wire   [3:0] AnEXP;
  wire   [3:0] SRnEXP_reg;
  wire   [3:0] AnEXP_reg;
  wire   [4:1] WAnEXP_reg;
  wire   [5:0] AnMANT_reg;
  wire   [5:0] SRnMANT_AND;
  wire   [12:4] WAnMANT_rege;
  wire   [7:0] WAnMANT;
  wire   [15:2] sub_245_carry;
  wire   [3:3] sub_239_carry;
  wire   [3:2] sub_237_carry;
  wire   [12:2] sub_118_carry;
  assign N13 = An[2];

  AND2X2 U39 ( .A(SRn[5]), .B(AnMANT_reg[0]), .Y(SRnMANT_AND[5]) );
  AND2X2 U40 ( .A(SRn[4]), .B(AnMANT_reg[0]), .Y(SRnMANT_AND[4]) );
  AND2X2 U41 ( .A(SRn[3]), .B(AnMANT_reg[0]), .Y(SRnMANT_AND[3]) );
  AND2X2 U42 ( .A(SRn[2]), .B(AnMANT_reg[0]), .Y(SRnMANT_AND[2]) );
  AND2X2 U43 ( .A(SRn[1]), .B(AnMANT_reg[0]), .Y(SRnMANT_AND[1]) );
  AND2X2 U44 ( .A(SRn[0]), .B(AnMANT_reg[0]), .Y(SRnMANT_AND[0]) );
  AND2X2 U54 ( .A(SRn[9]), .B(INIT_SR), .Y(N90) );
  AND4X2 U133 ( .A(n287), .B(n286), .C(n40), .D(n285), .Y(n322) );
  FMULT_0_DW01_add_1 add_217 ( .A({1'b0, SRnMANT_AND}), .B({1'b0, 
        WAnMANT_rege[12:7]}), .CI(1'b0), .SUM({N106, N105, N104, N103, N102, 
        N101, N100}) );
  DFFRHQX1 WAn_reg_reg_14_ ( .D(N201), .CK(clk), .RN(n13), .Q(WAn[14]) );
  DFFRHQX1 WAn_reg_reg_13_ ( .D(N200), .CK(clk), .RN(n12), .Q(WAn[13]) );
  DFFRHQX1 WAn_reg_reg_12_ ( .D(N199), .CK(clk), .RN(n12), .Q(WAn[12]) );
  DFFRHQX1 WAn_reg_reg_11_ ( .D(N198), .CK(clk), .RN(n13), .Q(WAn[11]) );
  DFFRHQX1 WAn_reg_reg_10_ ( .D(N197), .CK(clk), .RN(n12), .Q(WAn[10]) );
  DFFRHQX1 WAn_reg_reg_9_ ( .D(N196), .CK(clk), .RN(n12), .Q(WAn[9]) );
  DFFRHQX1 WAn_reg_reg_8_ ( .D(N195), .CK(clk), .RN(n13), .Q(WAn[8]) );
  DFFRHQX1 WAn_reg_reg_7_ ( .D(N194), .CK(clk), .RN(n13), .Q(WAn[7]) );
  DFFRHQX1 WAn_reg_reg_6_ ( .D(N193), .CK(clk), .RN(n12), .Q(WAn[6]) );
  DFFRHQX1 WAn_reg_reg_5_ ( .D(N192), .CK(clk), .RN(n12), .Q(WAn[5]) );
  DFFRHQX1 WAn_reg_reg_4_ ( .D(N191), .CK(clk), .RN(n13), .Q(WAn[4]) );
  DFFRHQX1 WAn_reg_reg_3_ ( .D(N190), .CK(clk), .RN(n13), .Q(WAn[3]) );
  DFFRHQX1 WAn_reg_reg_2_ ( .D(N189), .CK(clk), .RN(n13), .Q(WAn[2]) );
  DFFRHQX1 WAn_reg_reg_1_ ( .D(N188), .CK(clk), .RN(n12), .Q(WAn[1]) );
  DFFRHQX1 AnEXP_reg_reg_3_ ( .D(N86), .CK(SHIFT_EXP), .RN(n13), .Q(
        AnEXP_reg[3]) );
  DFFRHQX1 AnEXP_reg_reg_2_ ( .D(n41), .CK(SHIFT_EXP), .RN(n12), .Q(
        AnEXP_reg[2]) );
  DFFRHQX1 AnEXP_reg_reg_1_ ( .D(n39), .CK(SHIFT_EXP), .RN(n13), .Q(
        AnEXP_reg[1]) );
  DFFRHQX1 AnMANT_reg_reg_5_ ( .D(N112), .CK(SHIFT_MANT), .RN(n13), .Q(
        AnMANT_reg[5]) );
  DFFRHQX1 AnMANT_reg_reg_4_ ( .D(n33), .CK(SHIFT_MANT), .RN(n12), .Q(
        AnMANT_reg[4]) );
  DFFRHQX1 AnMANT_reg_reg_3_ ( .D(n37), .CK(SHIFT_MANT), .RN(n13), .Q(
        AnMANT_reg[3]) );
  DFFRHQX1 AnMANT_reg_reg_2_ ( .D(n36), .CK(SHIFT_MANT), .RN(n12), .Q(
        AnMANT_reg[2]) );
  DFFRHQX1 AnMANT_reg_reg_1_ ( .D(n35), .CK(SHIFT_MANT), .RN(n13), .Q(
        AnMANT_reg[1]) );
  DFFRHQX1 WAn_reg_reg_15_ ( .D(n258), .CK(clk), .RN(n13), .Q(WAn[15]) );
  DFFRHQX1 SRnEXP_reg_reg_3_ ( .D(N90), .CK(SHIFT_EXP), .RN(n13), .Q(
        SRnEXP_reg[3]) );
  DFFRHQX1 SRnEXP_reg_reg_2_ ( .D(n150), .CK(SHIFT_EXP), .RN(n12), .Q(
        SRnEXP_reg[2]) );
  DFFRHQX1 SRnEXP_reg_reg_1_ ( .D(n151), .CK(SHIFT_EXP), .RN(n13), .Q(
        SRnEXP_reg[1]) );
  DFFRHQX1 WAnMANT_rege_reg_12_ ( .D(N125), .CK(SHIFT_MANT), .RN(n12), .Q(
        WAnMANT_rege[12]) );
  DFFRHQX1 SRnEXP_reg_reg_0_ ( .D(n152), .CK(SHIFT_EXP), .RN(n12), .Q(
        SRnEXP_reg[0]) );
  DFFRHQX1 AnEXP_reg_reg_0_ ( .D(n43), .CK(SHIFT_EXP), .RN(n12), .Q(
        AnEXP_reg[0]) );
  DFFRHQX1 AnMANT_reg_reg_0_ ( .D(n34), .CK(SHIFT_MANT), .RN(n12), .Q(
        AnMANT_reg[0]) );
  DFFRHQX1 WAn_reg_reg_0_ ( .D(N187), .CK(clk), .RN(n13), .Q(WAn[0]) );
  DFFRHQX1 EXP_CARRY_reg ( .D(N96), .CK(SHIFT_EXP), .RN(n13), .Q(EXP_CARRY) );
  DFFRHQX1 WAnEXP_reg_reg_4_ ( .D(N95), .CK(SHIFT_EXP), .RN(n12), .Q(
        WAnEXP_reg[4]) );
  DFFRHQX1 WAnEXP_reg_reg_0_ ( .D(N91), .CK(SHIFT_EXP), .RN(n12), .Q(N128) );
  DFFRHQX1 WAnMANT_rege_reg_11_ ( .D(N124), .CK(SHIFT_MANT), .RN(n12), .Q(
        WAnMANT_rege[11]) );
  DFFRHQX1 WAnMANT_rege_reg_8_ ( .D(N121), .CK(SHIFT_MANT), .RN(n12), .Q(
        WAnMANT_rege[8]) );
  DFFRHQX1 WAnMANT_rege_reg_9_ ( .D(N122), .CK(SHIFT_MANT), .RN(n12), .Q(
        WAnMANT_rege[9]) );
  DFFRHQX1 WAnMANT_rege_reg_10_ ( .D(N123), .CK(SHIFT_MANT), .RN(n13), .Q(
        WAnMANT_rege[10]) );
  DFFRHQX1 WAnEXP_reg_reg_3_ ( .D(N94), .CK(SHIFT_EXP), .RN(n13), .Q(
        WAnEXP_reg[3]) );
  DFFRHQX1 WAnEXP_reg_reg_2_ ( .D(N93), .CK(SHIFT_EXP), .RN(n12), .Q(
        WAnEXP_reg[2]) );
  DFFRHQX1 WAnEXP_reg_reg_1_ ( .D(N92), .CK(SHIFT_EXP), .RN(n13), .Q(
        WAnEXP_reg[1]) );
  DFFRHQX1 WAnMANT_rege_reg_6_ ( .D(N119), .CK(SHIFT_MANT), .RN(n13), .Q(
        WAnMANT_rege[6]) );
  DFFRHQX1 WAnMANT_rege_reg_5_ ( .D(N118), .CK(SHIFT_MANT), .RN(n12), .Q(
        WAnMANT_rege[5]) );
  DFFRHQX1 WAnMANT_rege_reg_4_ ( .D(N117), .CK(SHIFT_MANT), .RN(n12), .Q(
        WAnMANT_rege[4]) );
  DFFRHQX1 WAnMANT_rege_reg_7_ ( .D(N120), .CK(SHIFT_MANT), .RN(n13), .Q(
        WAnMANT_rege[7]) );
  OAI21XL U3 ( .A0(n3), .A1(n8), .B0(N170), .Y(n290) );
  XNOR2X1 U4 ( .A(WAnMAG_15_), .B(sub_245_carry[15]), .Y(N185) );
  AOI32X1 U5 ( .A0(n8), .A1(N136), .A2(N126), .B0(N173), .B1(n3), .Y(n296) );
  AOI32X1 U6 ( .A0(n8), .A1(N137), .A2(N126), .B0(N174), .B1(n3), .Y(n298) );
  NAND2X1 U7 ( .A(WAnEXP_reg[1]), .B(N128), .Y(sub_237_carry[2]) );
  AOI32X1 U8 ( .A0(n8), .A1(N138), .A2(N126), .B0(N175), .B1(n3), .Y(n300) );
  NOR2X1 U9 ( .A(N13), .B(An[3]), .Y(sub_118_carry[2]) );
  NOR2X1 U10 ( .A(WAnMANT_rege[4]), .B(N128), .Y(n240) );
  AND3X2 U11 ( .A(sub_118_carry[12]), .B(n26), .C(An[15]), .Y(AnMAG_13_) );
  AOI32X1 U12 ( .A0(n8), .A1(N139), .A2(N126), .B0(N176), .B1(n3), .Y(n302) );
  XNOR2X1 U13 ( .A(WAnEXP_reg[1]), .B(WAnEXP_reg[2]), .Y(n1) );
  XNOR2X1 U14 ( .A(sub_237_carry[3]), .B(n31), .Y(n2) );
  NOR2X1 U15 ( .A(n155), .B(n288), .Y(n3) );
  XOR2X1 U16 ( .A(WAnEXP_reg[3]), .B(sub_239_carry[3]), .Y(n4) );
  XNOR2X1 U18 ( .A(WAnEXP_reg[4]), .B(n10), .Y(n5) );
  XNOR2X1 U19 ( .A(WAnEXP_reg[4]), .B(n11), .Y(n6) );
  AND2X2 U20 ( .A(n288), .B(LD_OUT_SR), .Y(n8) );
  MXI2X1 U21 ( .A(n182), .B(n183), .S0(AnEXP[2]), .Y(n157) );
  MXI2X1 U22 ( .A(n188), .B(n189), .S0(AnEXP[2]), .Y(n159) );
  INVX1 U23 ( .A(reset), .Y(n12) );
  INVX1 U24 ( .A(reset), .Y(n13) );
  INVX1 U25 ( .A(AnEXP[1]), .Y(n38) );
  MXI2X1 U26 ( .A(n101), .B(n107), .S0(n42), .Y(n171) );
  MXI2X1 U27 ( .A(n107), .B(n132), .S0(n42), .Y(n162) );
  MXI2X1 U28 ( .A(n132), .B(n134), .S0(n42), .Y(n170) );
  MXI2X1 U29 ( .A(n162), .B(n165), .S0(AnEXP[1]), .Y(n182) );
  MXI2X1 U30 ( .A(n171), .B(n175), .S0(AnEXP[1]), .Y(n188) );
  MXI2X1 U31 ( .A(n166), .B(n164), .S0(AnEXP[1]), .Y(n183) );
  MXI2X1 U32 ( .A(n176), .B(n174), .S0(AnEXP[1]), .Y(n189) );
  MXI2X1 U33 ( .A(n45), .B(n46), .S0(n42), .Y(n179) );
  MXI2X1 U34 ( .A(n48), .B(n49), .S0(n42), .Y(n164) );
  MXI2X1 U35 ( .A(n46), .B(n48), .S0(n42), .Y(n174) );
  MXI2X1 U36 ( .A(n71), .B(n101), .S0(n42), .Y(n165) );
  MXI2X1 U37 ( .A(n67), .B(n71), .S0(n42), .Y(n175) );
  MXI2X1 U38 ( .A(n169), .B(n170), .S0(AnEXP[1]), .Y(n190) );
  MXI2X1 U45 ( .A(n173), .B(n172), .S0(AnEXP[2]), .Y(n178) );
  NOR2X1 U46 ( .A(n169), .B(n38), .Y(n173) );
  MXI2X1 U47 ( .A(n171), .B(n170), .S0(n38), .Y(n172) );
  NOR2X1 U48 ( .A(n38), .B(n161), .Y(n184) );
  NAND2X1 U49 ( .A(AnEXP[2]), .B(n163), .Y(n168) );
  MXI2X1 U50 ( .A(n162), .B(n161), .S0(n38), .Y(n163) );
  INVX1 U51 ( .A(AnEXP[0]), .Y(n42) );
  INVX1 U52 ( .A(AnEXP[3]), .Y(n40) );
  OAI211X1 U53 ( .A0(AnEXP[3]), .A1(n70), .B0(n282), .C0(n281), .Y(AnEXP[2])
         );
  INVX1 U55 ( .A(n284), .Y(n70) );
  AOI31X1 U56 ( .A0(n280), .A1(n107), .A2(n279), .B0(n45), .Y(n281) );
  INVX1 U57 ( .A(n232), .Y(n141) );
  INVX1 U58 ( .A(n231), .Y(n135) );
  INVX1 U59 ( .A(n205), .Y(n137) );
  INVX1 U60 ( .A(n210), .Y(n139) );
  NOR3X1 U61 ( .A(n46), .B(n49), .C(n48), .Y(n279) );
  INVX1 U62 ( .A(n215), .Y(n136) );
  INVX1 U63 ( .A(n220), .Y(n140) );
  INVX1 U64 ( .A(n225), .Y(n138) );
  OAI211X1 U65 ( .A0(AnEXP[3]), .A1(n269), .B0(n268), .C0(n282), .Y(AnEXP[0])
         );
  AOI21X1 U66 ( .A0(n262), .A1(n275), .B0(n67), .Y(n269) );
  OAI21XL U67 ( .A0(n267), .A1(n46), .B0(n266), .Y(n268) );
  OAI21XL U68 ( .A0(n107), .A1(n283), .B0(n274), .Y(n262) );
  OAI2BB1X1 U69 ( .A0N(n278), .A1N(n282), .B0(n277), .Y(AnEXP[1]) );
  AOI31X1 U70 ( .A0(n273), .A1(n272), .A2(n271), .B0(n45), .Y(n278) );
  OAI31X1 U71 ( .A0(n276), .A1(n71), .A2(n67), .B0(n40), .Y(n277) );
  NAND4X1 U72 ( .A(n134), .B(n280), .C(n286), .D(n270), .Y(n271) );
  NOR2X1 U73 ( .A(n44), .B(AnMAG_13_), .Y(n282) );
  MXI2X1 U74 ( .A(n134), .B(n149), .S0(n42), .Y(n161) );
  MXI2X1 U75 ( .A(n199), .B(n209), .S0(n147), .Y(n219) );
  MXI2X1 U76 ( .A(n195), .B(n194), .S0(n147), .Y(n224) );
  MXI2X1 U77 ( .A(n196), .B(n144), .S0(n9), .Y(n231) );
  INVX1 U78 ( .A(n214), .Y(n144) );
  MXI2X1 U79 ( .A(n200), .B(n143), .S0(n9), .Y(n232) );
  INVX1 U80 ( .A(n219), .Y(n143) );
  MXI2X1 U81 ( .A(n198), .B(n142), .S0(n9), .Y(n205) );
  INVX1 U82 ( .A(n224), .Y(n142) );
  NAND2X1 U83 ( .A(AnEXP[0]), .B(n149), .Y(n169) );
  MXI2X1 U84 ( .A(n44), .B(n45), .S0(n42), .Y(n185) );
  INVX1 U85 ( .A(n266), .Y(n45) );
  MXI2X1 U86 ( .A(n49), .B(n51), .S0(n42), .Y(n176) );
  MXI2X1 U87 ( .A(n51), .B(n67), .S0(n42), .Y(n166) );
  NAND2X1 U88 ( .A(n229), .B(n9), .Y(n210) );
  MX2X1 U89 ( .A(n199), .B(n197), .S0(N129), .Y(n229) );
  MX2X1 U90 ( .A(n195), .B(n193), .S0(N129), .Y(n196) );
  MXI2X1 U91 ( .A(AnMAG_13_), .B(n44), .S0(n42), .Y(n180) );
  INVX1 U92 ( .A(An[15]), .Y(n27) );
  NAND4X1 U93 ( .A(n273), .B(n272), .C(n282), .D(n261), .Y(AnEXP[3]) );
  NOR3X1 U94 ( .A(n49), .B(n45), .C(n51), .Y(n261) );
  AOI2BB1X1 U95 ( .A0N(n322), .A1N(N81), .B0(n156), .Y(N112) );
  MX4X1 U96 ( .A(n190), .B(n189), .C(n188), .D(n187), .S0(AnEXP[3]), .S1(
        AnEXP[2]), .Y(N81) );
  MXI2X1 U97 ( .A(n186), .B(n185), .S0(n38), .Y(n187) );
  NAND2X1 U98 ( .A(AnMAG_13_), .B(n42), .Y(n186) );
  NOR2X1 U99 ( .A(n156), .B(n322), .Y(n327) );
  INVX1 U100 ( .A(N129), .Y(n147) );
  NAND3X1 U101 ( .A(n275), .B(n274), .C(n264), .Y(n284) );
  MXI2X1 U102 ( .A(n204), .B(n203), .S0(n147), .Y(n223) );
  NAND2X1 U103 ( .A(n203), .B(N129), .Y(n213) );
  MXI2X1 U104 ( .A(n209), .B(n208), .S0(n147), .Y(n228) );
  NAND2X1 U105 ( .A(N129), .B(n208), .Y(n218) );
  MXI2X1 U106 ( .A(n194), .B(n204), .S0(n147), .Y(n214) );
  NOR2X1 U107 ( .A(n284), .B(n51), .Y(n280) );
  INVX1 U108 ( .A(n273), .Y(n46) );
  NAND2X1 U109 ( .A(n196), .B(n9), .Y(n215) );
  NAND2X1 U110 ( .A(n200), .B(n9), .Y(n220) );
  NAND2X1 U111 ( .A(n198), .B(n9), .Y(n225) );
  INVX1 U112 ( .A(n270), .Y(n49) );
  INVX1 U113 ( .A(n272), .Y(n48) );
  NOR3X1 U114 ( .A(n284), .B(n132), .C(n149), .Y(n287) );
  MXI2X1 U115 ( .A(n219), .B(n218), .S0(n9), .Y(n221) );
  INVX1 U116 ( .A(n264), .Y(n67) );
  MXI2X1 U117 ( .A(n229), .B(n146), .S0(n9), .Y(n230) );
  INVX1 U118 ( .A(n228), .Y(n146) );
  MXI2X1 U119 ( .A(n214), .B(n213), .S0(n9), .Y(n216) );
  MXI2X1 U120 ( .A(n224), .B(n223), .S0(n9), .Y(n226) );
  AOI21X1 U121 ( .A0(n270), .A1(n265), .B0(n48), .Y(n267) );
  NAND4X1 U122 ( .A(n149), .B(n280), .C(n285), .D(n286), .Y(n265) );
  NOR2X1 U123 ( .A(n9), .B(n218), .Y(n201) );
  NOR2X1 U124 ( .A(n9), .B(n213), .Y(n191) );
  NOR2XL U125 ( .A(n223), .B(n9), .Y(n206) );
  NOR2XL U126 ( .A(n228), .B(n9), .Y(n211) );
  NOR2X1 U127 ( .A(n40), .B(n156), .Y(N86) );
  INVX1 U128 ( .A(n286), .Y(n107) );
  NOR3X1 U129 ( .A(n283), .B(n107), .C(n101), .Y(n276) );
  INVX1 U130 ( .A(n274), .Y(n101) );
  INVX1 U131 ( .A(n275), .Y(n71) );
  INVX1 U132 ( .A(n285), .Y(n134) );
  INVX1 U134 ( .A(n283), .Y(n132) );
  OAI22X1 U135 ( .A0(N24), .A1(n27), .B0(An[15]), .B1(An[13]), .Y(n266) );
  MX2X1 U136 ( .A(WAnMANT[4]), .B(WAnMANT[5]), .S0(N128), .Y(n199) );
  MX2X1 U137 ( .A(WAnMANT[5]), .B(WAnMANT[6]), .S0(N128), .Y(n195) );
  INVX1 U138 ( .A(n289), .Y(N170) );
  NAND2X1 U139 ( .A(N133), .B(N126), .Y(n289) );
  NOR2X1 U140 ( .A(n5), .B(n192), .Y(N133) );
  MXI2X1 U141 ( .A(n191), .B(n135), .S0(n2), .Y(n192) );
  INVX1 U142 ( .A(n259), .Y(n44) );
  OAI22X1 U143 ( .A0(N25), .A1(n27), .B0(An[15]), .B1(An[14]), .Y(n259) );
  NOR2BX1 U144 ( .AN(WAnMANT[7]), .B(N128), .Y(n193) );
  MX2X1 U145 ( .A(WAnMANT[6]), .B(WAnMANT[7]), .S0(N128), .Y(n197) );
  INVX1 U146 ( .A(n291), .Y(sub_245_B_1_) );
  NAND2X1 U147 ( .A(N134), .B(N126), .Y(n291) );
  NOR2X1 U148 ( .A(n5), .B(n202), .Y(N134) );
  MXI2X1 U149 ( .A(n201), .B(n141), .S0(n2), .Y(n202) );
  INVX1 U150 ( .A(n293), .Y(sub_245_B_2_) );
  NAND2X1 U151 ( .A(N135), .B(N126), .Y(n293) );
  NOR2X1 U152 ( .A(n5), .B(n207), .Y(N135) );
  MXI2X1 U153 ( .A(n206), .B(n137), .S0(n2), .Y(n207) );
  NAND2X1 U154 ( .A(N136), .B(N126), .Y(n295) );
  NOR2X1 U155 ( .A(n5), .B(n212), .Y(N136) );
  MXI2X1 U156 ( .A(n211), .B(n139), .S0(n2), .Y(n212) );
  INVX1 U157 ( .A(N13), .Y(n14) );
  INVX1 U158 ( .A(An[3]), .Y(n15) );
  INVX1 U159 ( .A(An[4]), .Y(n16) );
  INVX1 U160 ( .A(An[5]), .Y(n17) );
  OAI22X1 U161 ( .A0(N22), .A1(n27), .B0(An[15]), .B1(An[11]), .Y(n272) );
  OAI22X1 U162 ( .A0(N18), .A1(n27), .B0(An[7]), .B1(An[15]), .Y(n275) );
  OAI22X1 U163 ( .A0(N19), .A1(n27), .B0(An[8]), .B1(An[15]), .Y(n264) );
  OAI22X1 U164 ( .A0(N17), .A1(n27), .B0(An[6]), .B1(An[15]), .Y(n274) );
  INVX1 U165 ( .A(n260), .Y(n51) );
  OAI22X1 U166 ( .A0(N20), .A1(n27), .B0(An[9]), .B1(An[15]), .Y(n260) );
  OAI22X1 U167 ( .A0(N21), .A1(n27), .B0(An[15]), .B1(An[10]), .Y(n270) );
  OAI22X1 U168 ( .A0(N23), .A1(n27), .B0(An[15]), .B1(An[12]), .Y(n273) );
  INVX1 U169 ( .A(n303), .Y(sub_245_B_7_) );
  AOI22X1 U170 ( .A0(N160), .A1(n153), .B0(N140), .B1(N126), .Y(n303) );
  NOR3X1 U171 ( .A(n255), .B(n6), .C(n4), .Y(N160) );
  NOR3X1 U172 ( .A(n230), .B(n5), .C(n2), .Y(N140) );
  MX2X1 U173 ( .A(WAnMANT[2]), .B(WAnMANT[3]), .S0(N128), .Y(n209) );
  MX2X1 U174 ( .A(WAnMANT[1]), .B(WAnMANT[2]), .S0(N128), .Y(n204) );
  MX2X1 U175 ( .A(WAnMANT[3]), .B(WAnMANT[4]), .S0(N128), .Y(n194) );
  XNOR2X1 U176 ( .A(n30), .B(sub_237_carry[2]), .Y(n9) );
  MX2X1 U177 ( .A(WAnMANT[0]), .B(WAnMANT[1]), .S0(N128), .Y(n208) );
  INVX1 U178 ( .A(n305), .Y(sub_245_B_8_) );
  AOI22X1 U179 ( .A0(N161), .A1(n153), .B0(N141), .B1(N126), .Y(n305) );
  NOR4BX1 U180 ( .AN(n256), .B(n1), .C(n4), .D(n6), .Y(N161) );
  NOR3X1 U181 ( .A(n231), .B(n5), .C(n2), .Y(N141) );
  NAND2X1 U182 ( .A(N137), .B(N126), .Y(n297) );
  NOR2X1 U183 ( .A(n5), .B(n217), .Y(N137) );
  MXI2X1 U184 ( .A(n216), .B(n136), .S0(n2), .Y(n217) );
  NAND2X1 U185 ( .A(N138), .B(N126), .Y(n299) );
  NOR2X1 U186 ( .A(n5), .B(n222), .Y(N138) );
  MXI2X1 U187 ( .A(n221), .B(n140), .S0(n2), .Y(n222) );
  NAND2X1 U188 ( .A(N139), .B(N126), .Y(n301) );
  NOR2X1 U189 ( .A(n5), .B(n227), .Y(N139) );
  MXI2X1 U190 ( .A(n226), .B(n138), .S0(n2), .Y(n227) );
  INVX1 U191 ( .A(An[8]), .Y(n20) );
  INVX1 U192 ( .A(An[7]), .Y(n19) );
  INVX1 U193 ( .A(An[9]), .Y(n21) );
  INVX1 U194 ( .A(An[10]), .Y(n22) );
  INVX1 U195 ( .A(An[11]), .Y(n23) );
  INVX1 U196 ( .A(An[6]), .Y(n18) );
  INVX1 U197 ( .A(N128), .Y(n28) );
  INVX1 U198 ( .A(N126), .Y(n153) );
  OAI22X1 U199 ( .A0(N15), .A1(n27), .B0(An[4]), .B1(An[15]), .Y(n283) );
  OAI22X1 U200 ( .A0(N16), .A1(n27), .B0(An[5]), .B1(An[15]), .Y(n286) );
  OAI22X1 U201 ( .A0(N14), .A1(n27), .B0(An[3]), .B1(An[15]), .Y(n285) );
  MXI2X1 U202 ( .A(WAnMANT[1]), .B(WAnMANT[0]), .S0(N128), .Y(n235) );
  MXI2X1 U203 ( .A(WAnMANT[4]), .B(WAnMANT[5]), .S0(n28), .Y(n243) );
  MXI2X1 U204 ( .A(WAnMANT[3]), .B(WAnMANT[2]), .S0(N128), .Y(n234) );
  MXI2X1 U205 ( .A(n238), .B(n239), .S0(n29), .Y(n250) );
  NOR2BX1 U206 ( .AN(n240), .B(n29), .Y(n252) );
  MXI2X1 U207 ( .A(n234), .B(n235), .S0(n29), .Y(n245) );
  INVX1 U208 ( .A(n309), .Y(sub_245_B_10_) );
  AOI22X1 U209 ( .A0(N163), .A1(n153), .B0(N143), .B1(N126), .Y(n309) );
  NOR4BX1 U210 ( .AN(n245), .B(n1), .C(n4), .D(n6), .Y(N163) );
  NOR3X1 U211 ( .A(n205), .B(n5), .C(n2), .Y(N143) );
  INVX1 U212 ( .A(n311), .Y(sub_245_B_11_) );
  AOI22X1 U213 ( .A0(N164), .A1(n153), .B0(N144), .B1(N126), .Y(n311) );
  NOR3X1 U214 ( .A(n233), .B(n6), .C(n4), .Y(N164) );
  NOR3X1 U215 ( .A(n210), .B(n5), .C(n2), .Y(N144) );
  INVX1 U216 ( .A(n315), .Y(sub_245_B_13_) );
  AOI22X1 U217 ( .A0(N166), .A1(n153), .B0(N146), .B1(N126), .Y(n315) );
  NOR3X1 U218 ( .A(n242), .B(n6), .C(n4), .Y(N166) );
  NOR3X1 U219 ( .A(n220), .B(n5), .C(n2), .Y(N146) );
  NOR2X1 U220 ( .A(n235), .B(n29), .Y(n256) );
  MXI2X1 U221 ( .A(n145), .B(n252), .S0(n1), .Y(n233) );
  INVX1 U222 ( .A(n250), .Y(n145) );
  MXI2X1 U223 ( .A(n236), .B(n256), .S0(n1), .Y(n237) );
  MXI2X1 U224 ( .A(n243), .B(n234), .S0(n29), .Y(n236) );
  INVX1 U225 ( .A(n263), .Y(n149) );
  OAI22X1 U226 ( .A0(N13), .A1(n27), .B0(N13), .B1(An[15]), .Y(n263) );
  MX2X1 U227 ( .A(WAnMANT[3]), .B(WAnMANT[4]), .S0(n28), .Y(n238) );
  MX2X1 U228 ( .A(WAnMANT[5]), .B(WAnMANT[6]), .S0(n28), .Y(n248) );
  MX2X1 U229 ( .A(WAnMANT[1]), .B(WAnMANT[2]), .S0(n28), .Y(n239) );
  NAND2BX1 U230 ( .AN(n1), .B(n252), .Y(n255) );
  INVX1 U231 ( .A(n307), .Y(sub_245_B_9_) );
  AOI22X1 U232 ( .A0(N162), .A1(n153), .B0(N142), .B1(N126), .Y(n307) );
  NOR4BX1 U233 ( .AN(n257), .B(n4), .C(n1), .D(n6), .Y(N162) );
  NOR3X1 U234 ( .A(n232), .B(n5), .C(n2), .Y(N142) );
  INVX1 U235 ( .A(n313), .Y(sub_245_B_12_) );
  AOI22X1 U236 ( .A0(N165), .A1(n153), .B0(N145), .B1(N126), .Y(n313) );
  NOR3X1 U237 ( .A(n237), .B(n6), .C(n4), .Y(N165) );
  NOR3X1 U238 ( .A(n215), .B(n5), .C(n2), .Y(N145) );
  INVX1 U239 ( .A(n317), .Y(sub_245_B_14_) );
  AOI22X1 U240 ( .A0(N167), .A1(n153), .B0(N147), .B1(N126), .Y(n317) );
  NOR3X1 U241 ( .A(n247), .B(n6), .C(n4), .Y(N167) );
  NOR3XL U242 ( .A(n225), .B(n5), .C(n2), .Y(N147) );
  INVX1 U243 ( .A(An[14]), .Y(n26) );
  INVX1 U244 ( .A(An[13]), .Y(n25) );
  INVX1 U245 ( .A(An[12]), .Y(n24) );
  MXI2X1 U246 ( .A(n246), .B(n245), .S0(n1), .Y(n247) );
  MXI2X1 U247 ( .A(n244), .B(n243), .S0(n29), .Y(n246) );
  MXI2X1 U248 ( .A(WAnMANT[7]), .B(WAnMANT[6]), .S0(N128), .Y(n244) );
  NOR2BX1 U249 ( .AN(N168), .B(N126), .Y(WAnMAG_15_) );
  NOR2X1 U250 ( .A(n6), .B(n254), .Y(N168) );
  MXI2X1 U251 ( .A(n253), .B(n148), .S0(n4), .Y(n254) );
  INVX1 U252 ( .A(n255), .Y(n148) );
  MXI2X1 U253 ( .A(n251), .B(n250), .S0(n1), .Y(n253) );
  MXI2X1 U254 ( .A(n249), .B(n248), .S0(n29), .Y(n251) );
  NOR2BX1 U255 ( .AN(WAnMANT[7]), .B(n28), .Y(n249) );
  NOR2BX1 U256 ( .AN(N106), .B(INIT_SR), .Y(N125) );
  NOR2BX1 U257 ( .AN(N105), .B(INIT_SR), .Y(N124) );
  NOR2BX1 U258 ( .AN(N104), .B(INIT_SR), .Y(N123) );
  NOR2BX1 U259 ( .AN(N103), .B(INIT_SR), .Y(N122) );
  NOR2BX1 U260 ( .AN(N102), .B(INIT_SR), .Y(N121) );
  INVX1 U261 ( .A(INIT_SR), .Y(n156) );
  NOR2BX1 U262 ( .AN(N101), .B(INIT_SR), .Y(N120) );
  INVX1 U263 ( .A(n323), .Y(n34) );
  AOI22X1 U264 ( .A0(N76), .A1(n327), .B0(AnMANT_reg[1]), .B1(n156), .Y(n323)
         );
  MXI2X1 U265 ( .A(n158), .B(n157), .S0(AnEXP[3]), .Y(N76) );
  NAND2X1 U266 ( .A(n184), .B(AnEXP[2]), .Y(n158) );
  INVX1 U267 ( .A(n324), .Y(n35) );
  AOI22X1 U268 ( .A0(N77), .A1(n327), .B0(AnMANT_reg[2]), .B1(n156), .Y(n324)
         );
  MXI2X1 U269 ( .A(n160), .B(n159), .S0(AnEXP[3]), .Y(N77) );
  NAND2X1 U270 ( .A(AnEXP[2]), .B(n190), .Y(n160) );
  INVX1 U271 ( .A(n325), .Y(n36) );
  AOI22X1 U272 ( .A0(N78), .A1(n327), .B0(AnMANT_reg[3]), .B1(n156), .Y(n325)
         );
  MXI2X1 U273 ( .A(n168), .B(n167), .S0(AnEXP[3]), .Y(N78) );
  MX4X1 U274 ( .A(n166), .B(n179), .C(n165), .D(n164), .S0(AnEXP[2]), .S1(n38), 
        .Y(n167) );
  INVX1 U275 ( .A(n326), .Y(n37) );
  AOI22X1 U276 ( .A0(N79), .A1(n327), .B0(AnMANT_reg[4]), .B1(n156), .Y(n326)
         );
  MXI2X1 U277 ( .A(n178), .B(n177), .S0(AnEXP[3]), .Y(N79) );
  MX4X1 U278 ( .A(n176), .B(n185), .C(n175), .D(n174), .S0(AnEXP[2]), .S1(n38), 
        .Y(n177) );
  INVX1 U279 ( .A(n328), .Y(n33) );
  AOI22X1 U280 ( .A0(N80), .A1(n327), .B0(AnMANT_reg[5]), .B1(n156), .Y(n328)
         );
  MX4X1 U281 ( .A(n184), .B(n183), .C(n182), .D(n181), .S0(AnEXP[3]), .S1(
        AnEXP[2]), .Y(N80) );
  MXI2X1 U282 ( .A(n180), .B(n179), .S0(n38), .Y(n181) );
  OAI21XL U283 ( .A0(LD_OUT_SR), .A1(n154), .B0(n318), .Y(N201) );
  AOI22X1 U284 ( .A0(N184), .A1(n3), .B0(n8), .B1(sub_245_B_14_), .Y(n318) );
  OAI21XL U285 ( .A0(LD_OUT_SR), .A1(n154), .B0(n335), .Y(n258) );
  AOI22X1 U286 ( .A0(N185), .A1(n3), .B0(WAnMAG_15_), .B1(n8), .Y(n335) );
  OAI2BB1X1 U287 ( .A0N(WAn[14]), .A1N(n155), .B0(n316), .Y(N200) );
  AOI22X1 U288 ( .A0(N183), .A1(n3), .B0(n8), .B1(sub_245_B_13_), .Y(n316) );
  NAND2BX1 U289 ( .AN(n32), .B(WAnEXP_reg[4]), .Y(N126) );
  OAI2BB1X1 U290 ( .A0N(WAn[8]), .A1N(n155), .B0(n304), .Y(N194) );
  AOI22X1 U291 ( .A0(N177), .A1(n3), .B0(n8), .B1(sub_245_B_7_), .Y(n304) );
  OAI2BB1X1 U292 ( .A0N(WAn[9]), .A1N(n155), .B0(n306), .Y(N195) );
  AOI22X1 U293 ( .A0(N178), .A1(n3), .B0(n8), .B1(sub_245_B_8_), .Y(n306) );
  OAI2BB1X1 U294 ( .A0N(WAn[10]), .A1N(n155), .B0(n308), .Y(N196) );
  AOI22X1 U295 ( .A0(N179), .A1(n3), .B0(n8), .B1(sub_245_B_9_), .Y(n308) );
  OAI2BB1X1 U296 ( .A0N(WAn[11]), .A1N(n155), .B0(n310), .Y(N197) );
  AOI22X1 U297 ( .A0(N180), .A1(n3), .B0(n8), .B1(sub_245_B_10_), .Y(n310) );
  OAI2BB1X1 U298 ( .A0N(WAn[12]), .A1N(n155), .B0(n312), .Y(N198) );
  AOI22X1 U299 ( .A0(N181), .A1(n3), .B0(n8), .B1(sub_245_B_11_), .Y(n312) );
  INVX1 U300 ( .A(WAnEXP_reg[3]), .Y(n31) );
  NOR2X1 U301 ( .A(n31), .B(sub_237_carry[3]), .Y(n10) );
  INVX1 U302 ( .A(WAnMANT_rege[4]), .Y(WAnMANT[0]) );
  INVX1 U303 ( .A(WAnEXP_reg[1]), .Y(n29) );
  INVX1 U304 ( .A(WAnEXP_reg[2]), .Y(n30) );
  OAI2BB1X1 U305 ( .A0N(WAn[13]), .A1N(n155), .B0(n314), .Y(N199) );
  AOI22X1 U306 ( .A0(N182), .A1(n3), .B0(n8), .B1(sub_245_B_12_), .Y(n314) );
  INVX1 U307 ( .A(n332), .Y(n43) );
  AOI22X1 U308 ( .A0(AnEXP[0]), .A1(INIT_SR), .B0(AnEXP_reg[1]), .B1(n156), 
        .Y(n332) );
  INVX1 U309 ( .A(n333), .Y(n39) );
  AOI22X1 U310 ( .A0(AnEXP[1]), .A1(INIT_SR), .B0(AnEXP_reg[2]), .B1(n156), 
        .Y(n333) );
  INVX1 U311 ( .A(n334), .Y(n41) );
  AOI22X1 U312 ( .A0(AnEXP[2]), .A1(INIT_SR), .B0(AnEXP_reg[3]), .B1(n156), 
        .Y(n334) );
  MXI2X1 U313 ( .A(n241), .B(n257), .S0(n1), .Y(n242) );
  MX2X1 U314 ( .A(n238), .B(n248), .S0(WAnEXP_reg[1]), .Y(n241) );
  OAI2BB1X1 U315 ( .A0N(WAn[6]), .A1N(n155), .B0(n300), .Y(N192) );
  OAI2BB1X1 U316 ( .A0N(WAn[7]), .A1N(n155), .B0(n302), .Y(N193) );
  MX2X1 U317 ( .A(n240), .B(n239), .S0(WAnEXP_reg[1]), .Y(n257) );
  NAND2X1 U318 ( .A(sub_239_carry[3]), .B(WAnEXP_reg[3]), .Y(n11) );
  OAI2BB1X1 U319 ( .A0N(WAn[3]), .A1N(n155), .B0(n294), .Y(N189) );
  AOI22XL U320 ( .A0(N172), .A1(n3), .B0(n8), .B1(sub_245_B_2_), .Y(n294) );
  OAI2BB1X1 U321 ( .A0N(WAn[4]), .A1N(n155), .B0(n296), .Y(N190) );
  OAI2BB1X1 U322 ( .A0N(WAn[5]), .A1N(n155), .B0(n298), .Y(N191) );
  OAI2BB1X1 U323 ( .A0N(WAn[2]), .A1N(n155), .B0(n292), .Y(N188) );
  AOI22XL U324 ( .A0(N171), .A1(n3), .B0(n8), .B1(sub_245_B_1_), .Y(n292) );
  XOR2X1 U325 ( .A(n27), .B(SRn[10]), .Y(n288) );
  OAI2BB1X1 U326 ( .A0N(WAn[1]), .A1N(n155), .B0(n290), .Y(N187) );
  INVX1 U327 ( .A(LD_OUT_SR), .Y(n155) );
  XOR2X1 U328 ( .A(AnEXP_reg[0]), .B(EXP_CARRY), .Y(n320) );
  NOR2BX1 U329 ( .AN(N100), .B(INIT_SR), .Y(N119) );
  NOR2X1 U330 ( .A(INIT_SR), .B(n319), .Y(N95) );
  XNOR2X1 U331 ( .A(SRnEXP_reg[0]), .B(n320), .Y(n319) );
  INVX1 U332 ( .A(n329), .Y(n152) );
  AOI22X1 U333 ( .A0(SRnEXP_reg[1]), .A1(n156), .B0(SRn[6]), .B1(INIT_SR), .Y(
        n329) );
  INVX1 U334 ( .A(n330), .Y(n151) );
  AOI22X1 U335 ( .A0(SRnEXP_reg[2]), .A1(n156), .B0(SRn[7]), .B1(INIT_SR), .Y(
        n330) );
  INVX1 U336 ( .A(n331), .Y(n150) );
  AOI22X1 U337 ( .A0(SRnEXP_reg[3]), .A1(n156), .B0(SRn[8]), .B1(INIT_SR), .Y(
        n331) );
  INVX1 U338 ( .A(WAn[15]), .Y(n154) );
  NOR2BX1 U339 ( .AN(WAnEXP_reg[1]), .B(INIT_SR), .Y(N91) );
  NOR2BX1 U340 ( .AN(WAnMANT_rege[5]), .B(INIT_SR), .Y(N117) );
  NOR2BX1 U341 ( .AN(WAnMANT_rege[6]), .B(INIT_SR), .Y(N118) );
  NOR2BX1 U342 ( .AN(WAnEXP_reg[2]), .B(INIT_SR), .Y(N92) );
  NOR2BX1 U343 ( .AN(WAnEXP_reg[3]), .B(INIT_SR), .Y(N93) );
  NOR2BX1 U344 ( .AN(WAnEXP_reg[4]), .B(INIT_SR), .Y(N94) );
  NOR2X1 U345 ( .A(INIT_SR), .B(n321), .Y(N96) );
  AOI22X1 U346 ( .A0(SRnEXP_reg[0]), .A1(n320), .B0(AnEXP_reg[0]), .B1(
        EXP_CARRY), .Y(n321) );
  AND2X1 U347 ( .A(sub_245_carry[14]), .B(n317), .Y(sub_245_carry[15]) );
  XOR2X1 U348 ( .A(n317), .B(sub_245_carry[14]), .Y(N184) );
  AND2X1 U349 ( .A(sub_245_carry[13]), .B(n315), .Y(sub_245_carry[14]) );
  XOR2X1 U350 ( .A(n315), .B(sub_245_carry[13]), .Y(N183) );
  AND2X1 U351 ( .A(sub_245_carry[12]), .B(n313), .Y(sub_245_carry[13]) );
  XOR2X1 U352 ( .A(n313), .B(sub_245_carry[12]), .Y(N182) );
  AND2X1 U353 ( .A(sub_245_carry[11]), .B(n311), .Y(sub_245_carry[12]) );
  XOR2X1 U354 ( .A(n311), .B(sub_245_carry[11]), .Y(N181) );
  AND2X1 U355 ( .A(sub_245_carry[10]), .B(n309), .Y(sub_245_carry[11]) );
  XOR2X1 U356 ( .A(n309), .B(sub_245_carry[10]), .Y(N180) );
  AND2X1 U357 ( .A(sub_245_carry[9]), .B(n307), .Y(sub_245_carry[10]) );
  XOR2X1 U358 ( .A(n307), .B(sub_245_carry[9]), .Y(N179) );
  AND2X1 U359 ( .A(sub_245_carry[8]), .B(n305), .Y(sub_245_carry[9]) );
  XOR2X1 U360 ( .A(n305), .B(sub_245_carry[8]), .Y(N178) );
  AND2X1 U361 ( .A(sub_245_carry[7]), .B(n303), .Y(sub_245_carry[8]) );
  XOR2X1 U362 ( .A(n303), .B(sub_245_carry[7]), .Y(N177) );
  AND2X1 U363 ( .A(sub_245_carry[6]), .B(n301), .Y(sub_245_carry[7]) );
  XOR2X1 U364 ( .A(n301), .B(sub_245_carry[6]), .Y(N176) );
  AND2X1 U365 ( .A(sub_245_carry[5]), .B(n299), .Y(sub_245_carry[6]) );
  XOR2X1 U366 ( .A(n299), .B(sub_245_carry[5]), .Y(N175) );
  AND2X1 U367 ( .A(sub_245_carry[4]), .B(n297), .Y(sub_245_carry[5]) );
  XOR2X1 U368 ( .A(n297), .B(sub_245_carry[4]), .Y(N174) );
  AND2X1 U369 ( .A(sub_245_carry[3]), .B(n295), .Y(sub_245_carry[4]) );
  XOR2X1 U370 ( .A(n295), .B(sub_245_carry[3]), .Y(N173) );
  AND2X1 U371 ( .A(sub_245_carry[2]), .B(n293), .Y(sub_245_carry[3]) );
  XOR2X1 U372 ( .A(n293), .B(sub_245_carry[2]), .Y(N172) );
  AND2X1 U373 ( .A(n289), .B(n291), .Y(sub_245_carry[2]) );
  XOR2X1 U374 ( .A(n291), .B(n289), .Y(N171) );
  AND2X1 U375 ( .A(sub_237_carry[2]), .B(n30), .Y(sub_237_carry[3]) );
  XNOR2X1 U376 ( .A(n28), .B(n29), .Y(N129) );
  XOR2X1 U377 ( .A(WAnMANT_rege[11]), .B(add_229_carry_7_), .Y(WAnMANT[7]) );
  AND2X1 U378 ( .A(add_229_carry_6_), .B(WAnMANT_rege[10]), .Y(
        add_229_carry_7_) );
  XOR2X1 U379 ( .A(WAnMANT_rege[10]), .B(add_229_carry_6_), .Y(WAnMANT[6]) );
  AND2X1 U380 ( .A(add_229_carry_5_), .B(WAnMANT_rege[9]), .Y(add_229_carry_6_) );
  XOR2X1 U381 ( .A(WAnMANT_rege[9]), .B(add_229_carry_5_), .Y(WAnMANT[5]) );
  AND2X1 U382 ( .A(add_229_carry_4_), .B(WAnMANT_rege[8]), .Y(add_229_carry_5_) );
  XOR2X1 U383 ( .A(WAnMANT_rege[8]), .B(add_229_carry_4_), .Y(WAnMANT[4]) );
  AND2X1 U384 ( .A(add_229_carry_3_), .B(WAnMANT_rege[7]), .Y(add_229_carry_4_) );
  XOR2X1 U385 ( .A(WAnMANT_rege[7]), .B(add_229_carry_3_), .Y(WAnMANT[3]) );
  AND2X1 U386 ( .A(add_229_carry_2_), .B(WAnMANT_rege[6]), .Y(add_229_carry_3_) );
  XOR2X1 U387 ( .A(WAnMANT_rege[6]), .B(add_229_carry_2_), .Y(WAnMANT[2]) );
  OR2X1 U388 ( .A(WAnMANT_rege[5]), .B(WAnMANT_rege[4]), .Y(add_229_carry_2_)
         );
  XNOR2X1 U389 ( .A(WAnMANT_rege[4]), .B(WAnMANT_rege[5]), .Y(WAnMANT[1]) );
  OR2X1 U390 ( .A(WAnEXP_reg[2]), .B(WAnEXP_reg[1]), .Y(sub_239_carry[3]) );
  XOR2X1 U391 ( .A(n26), .B(sub_118_carry[12]), .Y(N25) );
  AND2X1 U392 ( .A(sub_118_carry[11]), .B(n25), .Y(sub_118_carry[12]) );
  XOR2X1 U393 ( .A(n25), .B(sub_118_carry[11]), .Y(N24) );
  AND2X1 U394 ( .A(sub_118_carry[10]), .B(n24), .Y(sub_118_carry[11]) );
  XOR2X1 U395 ( .A(n24), .B(sub_118_carry[10]), .Y(N23) );
  AND2X1 U396 ( .A(sub_118_carry[9]), .B(n23), .Y(sub_118_carry[10]) );
  XOR2X1 U397 ( .A(n23), .B(sub_118_carry[9]), .Y(N22) );
  AND2X1 U398 ( .A(sub_118_carry[8]), .B(n22), .Y(sub_118_carry[9]) );
  XOR2X1 U399 ( .A(n22), .B(sub_118_carry[8]), .Y(N21) );
  AND2X1 U400 ( .A(sub_118_carry[7]), .B(n21), .Y(sub_118_carry[8]) );
  XOR2X1 U401 ( .A(n21), .B(sub_118_carry[7]), .Y(N20) );
  AND2X1 U402 ( .A(sub_118_carry[6]), .B(n20), .Y(sub_118_carry[7]) );
  XOR2X1 U403 ( .A(n20), .B(sub_118_carry[6]), .Y(N19) );
  AND2X1 U404 ( .A(sub_118_carry[5]), .B(n19), .Y(sub_118_carry[6]) );
  XOR2X1 U405 ( .A(n19), .B(sub_118_carry[5]), .Y(N18) );
  AND2X1 U406 ( .A(sub_118_carry[4]), .B(n18), .Y(sub_118_carry[5]) );
  XOR2X1 U407 ( .A(n18), .B(sub_118_carry[4]), .Y(N17) );
  AND2X1 U408 ( .A(sub_118_carry[3]), .B(n17), .Y(sub_118_carry[4]) );
  XOR2X1 U409 ( .A(n17), .B(sub_118_carry[3]), .Y(N16) );
  AND2X1 U410 ( .A(sub_118_carry[2]), .B(n16), .Y(sub_118_carry[3]) );
  XOR2X1 U411 ( .A(n16), .B(sub_118_carry[2]), .Y(N15) );
  XOR2X1 U412 ( .A(n15), .B(n14), .Y(N14) );
  AOI32X1 U413 ( .A0(WAnEXP_reg[1]), .A1(N128), .A2(WAnEXP_reg[3]), .B0(
        WAnEXP_reg[2]), .B1(WAnEXP_reg[3]), .Y(n32) );
  AND2X2 U414 ( .A(WAnMANT[0]), .B(N128), .Y(n203) );
  AND2X2 U415 ( .A(n193), .B(n147), .Y(n198) );
  AND2X2 U416 ( .A(n197), .B(n147), .Y(n200) );
endmodule

