
module UPB_11 ( UN, RATE, BN, DQ, BNP );
  input [1:0] RATE;
  input [15:0] BN;
  input [15:0] DQ;
  output [15:0] BNP;
  input UN;
  wire   N44, N45, N46, N47, N48, N49, N50, N60, N61, N62, N63, N64, N65, N74,
         N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N165, N166, N167, N168, N169, N170, N171, N181, N205,
         N206, N207, N208, N209, N210, N211, N212, N213, N214, N215, N216,
         N217, N218, N219, N220, N222, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, N98, N97, N96, N95, N94, N93, N92, N91,
         N90, N89, N88, N87, N86, N85, N84, N83, N204, N203, N202, N201, N200,
         N199, N198, N197, N196, N195, N194, N193, N192, N191, N190, N189,
         N139, N138, N137, N136, N135, N134, N133, sub_75_carry_2_,
         sub_75_carry_3_, sub_75_carry_4_, sub_75_carry_5_, sub_75_carry_6_,
         sub_94_carry_2_, sub_94_carry_3_, sub_94_carry_4_, sub_94_carry_5_,
         sub_94_carry_6_, sub_94_carry_7_, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         BNP_15_, BNP_14_, BNP_13_, BNP_12_, BNP_11_, BNP_10_, BNP_9_, BNP_8_,
         BNP_7_, BNP_6_, BNP_5_, BNP_4_, BNP_3_, BNP_2_, BNP_1_, BNP_0_, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43;
  wire   [8:2] sub_94_2_carry;
  wire   [7:2] sub_75_2_carry;
  assign N148 = BN[8];
  assign N139 = BN[15];
  assign N138 = BN[14];
  assign N137 = BN[13];
  assign N136 = BN[12];
  assign N135 = BN[11];
  assign N134 = BN[10];
  assign N133 = BN[9];
  assign BNP[15] = BNP_15_;
  assign BNP[14] = BNP_14_;
  assign BNP[13] = BNP_13_;
  assign BNP[12] = BNP_12_;
  assign BNP[11] = BNP_11_;
  assign BNP[10] = BNP_10_;
  assign BNP[9] = BNP_9_;
  assign BNP[8] = BNP_8_;
  assign BNP[7] = BNP_7_;
  assign BNP[6] = BNP_6_;
  assign BNP[5] = BNP_5_;
  assign BNP[4] = BNP_4_;
  assign BNP[3] = BNP_3_;
  assign BNP[2] = BNP_2_;
  assign BNP[1] = BNP_1_;
  assign BNP[0] = BNP_0_;

  NOR2X1 U3 ( .A(N133), .B(N134), .Y(sub_75_carry_2_) );
  NOR2X1 U4 ( .A(N148), .B(N133), .Y(sub_94_carry_2_) );
  NOR2X1 U5 ( .A(N133), .B(N134), .Y(sub_75_2_carry[2]) );
  NOR2X1 U6 ( .A(N148), .B(N133), .Y(sub_94_2_carry[2]) );
  NOR3XL U7 ( .A(DQ[0]), .B(DQ[11]), .C(DQ[10]), .Y(n81) );
  NOR4XL U8 ( .A(DQ[1]), .B(DQ[14]), .C(DQ[13]), .D(DQ[12]), .Y(n82) );
  NAND2XL U9 ( .A(n78), .B(n79), .Y(N222) );
  NAND4X1 U10 ( .A(n81), .B(n82), .C(n83), .D(n84), .Y(n80) );
  NOR4XL U11 ( .A(DQ[9]), .B(DQ[8]), .C(DQ[7]), .D(DQ[6]), .Y(n84) );
  INVX1 U12 ( .A(n61), .Y(n40) );
  INVX1 U13 ( .A(n69), .Y(n41) );
  OR2X2 U14 ( .A(RATE[1]), .B(RATE[0]), .Y(n1) );
  INVX1 U15 ( .A(n1), .Y(n86) );
  INVX1 U16 ( .A(n78), .Y(n26) );
  INVX1 U17 ( .A(n99), .Y(BNP_11_) );
  AOI22X1 U18 ( .A0(N216), .A1(n1), .B0(N110), .B1(n86), .Y(n99) );
  INVX1 U19 ( .A(n98), .Y(BNP_12_) );
  AOI22X1 U20 ( .A0(N217), .A1(n1), .B0(N111), .B1(n86), .Y(n98) );
  INVX1 U21 ( .A(n97), .Y(BNP_13_) );
  AOI22X1 U22 ( .A0(N218), .A1(n1), .B0(N112), .B1(n86), .Y(n97) );
  INVX1 U23 ( .A(n96), .Y(BNP_14_) );
  AOI22X1 U24 ( .A0(N219), .A1(n1), .B0(N113), .B1(n86), .Y(n96) );
  INVX1 U25 ( .A(n95), .Y(BNP_15_) );
  AOI22X1 U26 ( .A0(N220), .A1(n1), .B0(N114), .B1(n86), .Y(n95) );
  INVX1 U27 ( .A(n100), .Y(BNP_10_) );
  AOI22X1 U28 ( .A0(N215), .A1(n1), .B0(N109), .B1(n86), .Y(n100) );
  INVX1 U29 ( .A(n87), .Y(BNP_8_) );
  AOI22X1 U30 ( .A0(N213), .A1(n1), .B0(N107), .B1(n86), .Y(n87) );
  INVX1 U31 ( .A(n85), .Y(BNP_9_) );
  AOI22X1 U32 ( .A0(N214), .A1(n1), .B0(N108), .B1(n86), .Y(n85) );
  NAND2BX1 U33 ( .AN(sub_75_2_carry[7]), .B(n2), .Y(n61) );
  NAND2BX1 U34 ( .AN(sub_94_2_carry[8]), .B(n2), .Y(n69) );
  NAND2X1 U35 ( .A(n80), .B(n79), .Y(n78) );
  INVX1 U36 ( .A(n94), .Y(BNP_1_) );
  AOI22X1 U37 ( .A0(N206), .A1(n1), .B0(N100), .B1(n86), .Y(n94) );
  INVX1 U38 ( .A(n93), .Y(BNP_2_) );
  AOI22X1 U39 ( .A0(N207), .A1(n1), .B0(N101), .B1(n86), .Y(n93) );
  INVX1 U40 ( .A(n92), .Y(BNP_3_) );
  AOI22X1 U41 ( .A0(N208), .A1(n1), .B0(N102), .B1(n86), .Y(n92) );
  INVX1 U42 ( .A(n91), .Y(BNP_4_) );
  AOI22X1 U43 ( .A0(N209), .A1(n1), .B0(N103), .B1(n86), .Y(n91) );
  INVX1 U44 ( .A(n90), .Y(BNP_5_) );
  AOI22X1 U45 ( .A0(N210), .A1(n1), .B0(N104), .B1(n86), .Y(n90) );
  INVX1 U46 ( .A(n89), .Y(BNP_6_) );
  AOI22X1 U47 ( .A0(N211), .A1(n1), .B0(N105), .B1(n86), .Y(n89) );
  INVX1 U48 ( .A(n88), .Y(BNP_7_) );
  AOI22X1 U49 ( .A0(N212), .A1(n1), .B0(N106), .B1(n86), .Y(n88) );
  INVX1 U50 ( .A(N139), .Y(n2) );
  NAND2BX1 U51 ( .AN(UN), .B(n80), .Y(n79) );
  INVX1 U52 ( .A(n101), .Y(BNP_0_) );
  AOI22X1 U53 ( .A0(N205), .A1(n1), .B0(N99), .B1(n86), .Y(n101) );
  INVX1 U54 ( .A(N133), .Y(n6) );
  INVX1 U55 ( .A(N148), .Y(n3) );
  INVX1 U56 ( .A(n68), .Y(n42) );
  AOI22X1 U57 ( .A0(N133), .A1(n2), .B0(N133), .B1(N139), .Y(n68) );
  INVX1 U58 ( .A(N135), .Y(n7) );
  INVX1 U59 ( .A(N134), .Y(n4) );
  INVX1 U60 ( .A(n77), .Y(n43) );
  AOI22X1 U61 ( .A0(N148), .A1(n2), .B0(N148), .B1(N139), .Y(n77) );
  INVX1 U62 ( .A(n67), .Y(n39) );
  AOI22X1 U63 ( .A0(N60), .A1(n2), .B0(N44), .B1(N139), .Y(n67) );
  INVX1 U64 ( .A(n66), .Y(n38) );
  AOI22X1 U65 ( .A0(N61), .A1(n2), .B0(N45), .B1(N139), .Y(n66) );
  INVX1 U66 ( .A(n65), .Y(n37) );
  AOI22X1 U67 ( .A0(N62), .A1(n2), .B0(N46), .B1(N139), .Y(n65) );
  INVX1 U68 ( .A(n64), .Y(n36) );
  AOI22X1 U69 ( .A0(N63), .A1(n2), .B0(N47), .B1(N139), .Y(n64) );
  INVX1 U70 ( .A(n63), .Y(n35) );
  AOI22X1 U71 ( .A0(N64), .A1(n2), .B0(N48), .B1(N139), .Y(n63) );
  INVX1 U72 ( .A(n62), .Y(n34) );
  AOI22X1 U73 ( .A0(N65), .A1(n2), .B0(N49), .B1(N139), .Y(n62) );
  INVX1 U74 ( .A(n76), .Y(n33) );
  AOI22X1 U75 ( .A0(N165), .A1(n2), .B0(N149), .B1(N139), .Y(n76) );
  INVX1 U76 ( .A(n75), .Y(n32) );
  AOI22X1 U77 ( .A0(N166), .A1(n2), .B0(N150), .B1(N139), .Y(n75) );
  INVX1 U78 ( .A(n74), .Y(n31) );
  AOI22X1 U79 ( .A0(N167), .A1(n2), .B0(N151), .B1(N139), .Y(n74) );
  INVX1 U80 ( .A(n73), .Y(n30) );
  AOI22X1 U81 ( .A0(N168), .A1(n2), .B0(N152), .B1(N139), .Y(n73) );
  INVX1 U82 ( .A(n72), .Y(n29) );
  AOI22X1 U83 ( .A0(N169), .A1(n2), .B0(N153), .B1(N139), .Y(n72) );
  INVX1 U84 ( .A(n71), .Y(n28) );
  AOI22X1 U85 ( .A0(N170), .A1(n2), .B0(N154), .B1(N139), .Y(n71) );
  INVX1 U86 ( .A(n70), .Y(n27) );
  AOI22X1 U87 ( .A0(N171), .A1(n2), .B0(N155), .B1(N139), .Y(n70) );
  OAI2BB1X1 U88 ( .A0N(N50), .A1N(N139), .B0(n61), .Y(N74) );
  OAI2BB1X1 U89 ( .A0N(N156), .A1N(N139), .B0(n69), .Y(N181) );
  INVX1 U90 ( .A(N138), .Y(n8) );
  INVX1 U91 ( .A(N137), .Y(n5) );
  INVX1 U92 ( .A(N136), .Y(n9) );
  NOR4XL U93 ( .A(DQ[5]), .B(DQ[4]), .C(DQ[3]), .D(DQ[2]), .Y(n83) );
  AND2X1 U94 ( .A(sub_75_carry_6_), .B(n2), .Y(N50) );
  XOR2X1 U95 ( .A(n2), .B(sub_75_carry_6_), .Y(N49) );
  AND2X1 U96 ( .A(sub_75_carry_5_), .B(n8), .Y(sub_75_carry_6_) );
  XOR2X1 U97 ( .A(n8), .B(sub_75_carry_5_), .Y(N48) );
  AND2X1 U98 ( .A(sub_75_carry_4_), .B(n5), .Y(sub_75_carry_5_) );
  XOR2X1 U99 ( .A(n5), .B(sub_75_carry_4_), .Y(N47) );
  AND2X1 U100 ( .A(sub_75_carry_3_), .B(n9), .Y(sub_75_carry_4_) );
  XOR2X1 U102 ( .A(n9), .B(sub_75_carry_3_), .Y(N46) );
  AND2X1 U103 ( .A(sub_75_carry_2_), .B(n7), .Y(sub_75_carry_3_) );
  XOR2X1 U104 ( .A(n7), .B(sub_75_carry_2_), .Y(N45) );
  XOR2X1 U105 ( .A(n4), .B(n6), .Y(N44) );
  AND2X1 U106 ( .A(sub_75_2_carry[6]), .B(n2), .Y(sub_75_2_carry[7]) );
  XOR2X1 U107 ( .A(n2), .B(sub_75_2_carry[6]), .Y(N65) );
  AND2X1 U108 ( .A(sub_75_2_carry[5]), .B(n8), .Y(sub_75_2_carry[6]) );
  XOR2X1 U109 ( .A(n8), .B(sub_75_2_carry[5]), .Y(N64) );
  AND2X1 U110 ( .A(sub_75_2_carry[4]), .B(n5), .Y(sub_75_2_carry[5]) );
  XOR2X1 U111 ( .A(n5), .B(sub_75_2_carry[4]), .Y(N63) );
  AND2X1 U112 ( .A(sub_75_2_carry[3]), .B(n9), .Y(sub_75_2_carry[4]) );
  XOR2X1 U113 ( .A(n9), .B(sub_75_2_carry[3]), .Y(N62) );
  AND2X1 U114 ( .A(sub_75_2_carry[2]), .B(n7), .Y(sub_75_2_carry[3]) );
  XOR2X1 U115 ( .A(n7), .B(sub_75_2_carry[2]), .Y(N61) );
  XOR2X1 U116 ( .A(n4), .B(n6), .Y(N60) );
  AND2X1 U117 ( .A(sub_94_carry_7_), .B(n2), .Y(N156) );
  XOR2X1 U118 ( .A(n2), .B(sub_94_carry_7_), .Y(N155) );
  AND2X1 U119 ( .A(sub_94_carry_6_), .B(n8), .Y(sub_94_carry_7_) );
  XOR2X1 U120 ( .A(n8), .B(sub_94_carry_6_), .Y(N154) );
  AND2X1 U121 ( .A(sub_94_carry_5_), .B(n5), .Y(sub_94_carry_6_) );
  XOR2X1 U122 ( .A(n5), .B(sub_94_carry_5_), .Y(N153) );
  AND2X1 U123 ( .A(sub_94_carry_4_), .B(n9), .Y(sub_94_carry_5_) );
  XOR2X1 U124 ( .A(n9), .B(sub_94_carry_4_), .Y(N152) );
  AND2X1 U125 ( .A(sub_94_carry_3_), .B(n7), .Y(sub_94_carry_4_) );
  XOR2X1 U126 ( .A(n7), .B(sub_94_carry_3_), .Y(N151) );
  AND2X1 U127 ( .A(sub_94_carry_2_), .B(n4), .Y(sub_94_carry_3_) );
  XOR2X1 U128 ( .A(n4), .B(sub_94_carry_2_), .Y(N150) );
  XOR2X1 U129 ( .A(n6), .B(n3), .Y(N149) );
  AND2X1 U130 ( .A(sub_94_2_carry[7]), .B(n2), .Y(sub_94_2_carry[8]) );
  XOR2X1 U131 ( .A(n2), .B(sub_94_2_carry[7]), .Y(N171) );
  AND2X1 U132 ( .A(sub_94_2_carry[6]), .B(n8), .Y(sub_94_2_carry[7]) );
  XOR2X1 U133 ( .A(n8), .B(sub_94_2_carry[6]), .Y(N170) );
  AND2X1 U134 ( .A(sub_94_2_carry[5]), .B(n5), .Y(sub_94_2_carry[6]) );
  XOR2X1 U135 ( .A(n5), .B(sub_94_2_carry[5]), .Y(N169) );
  AND2X1 U136 ( .A(sub_94_2_carry[4]), .B(n9), .Y(sub_94_2_carry[5]) );
  XOR2X1 U137 ( .A(n9), .B(sub_94_2_carry[4]), .Y(N168) );
  AND2X1 U138 ( .A(sub_94_2_carry[3]), .B(n7), .Y(sub_94_2_carry[4]) );
  XOR2X1 U139 ( .A(n7), .B(sub_94_2_carry[3]), .Y(N167) );
  AND2X1 U140 ( .A(sub_94_2_carry[2]), .B(n4), .Y(sub_94_2_carry[3]) );
  XOR2X1 U141 ( .A(n4), .B(sub_94_2_carry[2]), .Y(N166) );
  XOR2X1 U142 ( .A(n6), .B(n3), .Y(N165) );
  UPB_11_DW01_add_5 add_1_root_add_0_root_add_78 ( .A({N139, N138, N137, N136, 
        N135, N134, N133, N148, BN[7:0]}), .B({n40, n40, n40, n40, n40, n40, 
        n40, n40, N74, n34, n35, n36, n37, n38, n39, n42}), .CI(1'b0), .SUM({
        N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86, N85, 
        N84, N83}) );
  UPB_11_DW01_add_4 add_0_root_add_0_root_add_78 ( .A({N98, N97, N96, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, N83}), .B({n26, n26, 
        n26, n26, n26, n26, n26, n26, N222, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .CI(1'b0), .SUM({N114, N113, N112, N111, N110, N109, N108, 
        N107, N106, N105, N104, N103, N102, N101, N100, N99}) );
  UPB_11_DW01_add_3 add_1_root_add_0_root_add_97 ( .A({N139, N138, N137, N136, 
        N135, N134, N133, N148, BN[7:0]}), .B({n41, n41, n41, n41, n41, n41, 
        n41, N181, n27, n28, n29, n30, n31, n32, n33, n43}), .CI(1'b0), .SUM({
        N204, N203, N202, N201, N200, N199, N198, N197, N196, N195, N194, N193, 
        N192, N191, N190, N189}) );
  UPB_11_DW01_add_2 add_0_root_add_0_root_add_97 ( .A({N204, N203, N202, N201, 
        N200, N199, N198, N197, N196, N195, N194, N193, N192, N191, N190, N189}), .B({n26, n26, n26, n26, n26, n26, n26, n26, N222, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM({N220, N219, N218, N217, N216, 
        N215, N214, N213, N212, N211, N210, N209, N208, N207, N206, N205}) );
endmodule

