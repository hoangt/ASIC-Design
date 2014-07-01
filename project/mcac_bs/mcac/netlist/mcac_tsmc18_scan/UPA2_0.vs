
module UPA2_0 ( PK0, PK1, PK2, A1, A2, SIGPK, A2T );
  input [15:0] A1;
  input [15:0] A2;
  output [15:0] A2T;
  input PK0, PK1, PK2, SIGPK;
  wire   PKS2, N31, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N48, N49,
         N50, N51, N52, N53, N54, N56, N57, N67, N68, N69, N70, N71, N72, N73,
         N74, ULA2_9_, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101,
         UA2_9_, UA2_8_, UA2_7_, UA2_6_, UA2_5_, UA2_4_, UA2_3_, UA2_2_,
         UA2_1_, UA2_15_, UA2_10_, UA2_0_, N84, N83, N82, N81, N80, N79, N78,
         N77, add_96_B_14_, add_96_B_15_, add_96_B_16_, sub_112_2_carry_2_,
         sub_112_2_carry_3_, sub_112_2_carry_4_, sub_112_2_carry_5_,
         sub_112_2_carry_6_, sub_112_2_carry_7_, sub_112_2_carry_8_,
         add_117_carry_1_, add_117_carry_2_, add_117_carry_3_,
         add_117_carry_4_, add_117_carry_5_, add_117_carry_6_,
         add_117_carry_7_, add_117_carry_8_, add_117_carry_9_,
         add_117_carry_10_, add_117_B_0_, add_117_B_1_, add_117_B_2_,
         add_117_B_3_, add_117_B_4_, add_117_B_5_, add_117_B_6_, add_117_B_7_,
         add_117_B_8_, add_117_B_10_, add_117_A_0_, add_117_A_1_, add_117_A_2_,
         add_117_A_3_, add_117_A_4_, add_117_A_5_, add_117_A_6_, add_117_A_7_,
         add_117_A_8_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, add_96_carry_16_;
  wire   [16:3] FA1;
  wire   [14:9] UGA2;
  wire   [9:2] sub_112_carry;
  wire   [15:7] sub_90_carry;
  assign N92 = A2[7];
  assign N84 = A2[15];
  assign N83 = A2[14];
  assign N82 = A2[13];
  assign N81 = A2[12];
  assign N80 = A2[11];
  assign N79 = A2[10];
  assign N78 = A2[9];
  assign N77 = A2[8];

  ADDFX2 U3 ( .A(add_117_A_8_), .B(add_117_B_8_), .CI(add_117_carry_8_), .CO(
        add_117_carry_9_), .S(UA2_8_) );
  XNOR2X1 U4 ( .A(FA1[16]), .B(sub_90_carry[15]), .Y(N44) );
  NOR2X1 U5 ( .A(FA1[16]), .B(sub_90_carry[15]), .Y(N45) );
  XOR3X2 U6 ( .A(UGA2[14]), .B(n34), .C(n15), .Y(UA2_15_) );
  OAI21XL U7 ( .A0(n33), .A1(UGA2[14]), .B0(N48), .Y(n1) );
  INVX1 U8 ( .A(n1), .Y(add_117_A_0_) );
  OAI21XL U9 ( .A0(n11), .A1(n13), .B0(N49), .Y(n2) );
  INVX1 U10 ( .A(n2), .Y(add_117_A_1_) );
  OAI21XL U11 ( .A0(n11), .A1(n13), .B0(N50), .Y(n3) );
  INVX1 U12 ( .A(n3), .Y(add_117_A_2_) );
  OAI21XL U13 ( .A0(n11), .A1(n13), .B0(N51), .Y(n4) );
  INVX1 U14 ( .A(n4), .Y(add_117_A_3_) );
  OAI21XL U15 ( .A0(n11), .A1(n13), .B0(N52), .Y(n5) );
  INVX1 U16 ( .A(n5), .Y(add_117_A_4_) );
  OAI21XL U17 ( .A0(n11), .A1(n13), .B0(N53), .Y(n6) );
  INVX1 U18 ( .A(n6), .Y(add_117_A_5_) );
  AOI21X1 U19 ( .A0(n47), .A1(n49), .B0(n48), .Y(n7) );
  INVX1 U20 ( .A(n7), .Y(n42) );
  OAI21XL U21 ( .A0(n11), .A1(n13), .B0(N54), .Y(n8) );
  INVX1 U22 ( .A(n8), .Y(add_117_A_6_) );
  OR2X2 U23 ( .A(FA1[3]), .B(N31), .Y(n12) );
  NOR2X1 U24 ( .A(N92), .B(N77), .Y(sub_112_2_carry_2_) );
  AOI2BB1X1 U25 ( .A0N(n11), .A1N(n13), .B0(add_96_B_14_), .Y(add_117_A_7_) );
  NOR4X1 U26 ( .A(FA1[6]), .B(FA1[5]), .C(FA1[4]), .D(n12), .Y(sub_90_carry[7]) );
  NOR2X1 U27 ( .A(N92), .B(N77), .Y(sub_112_carry[2]) );
  OAI21XL U28 ( .A0(n11), .A1(n13), .B0(N56), .Y(n9) );
  INVX1 U29 ( .A(n9), .Y(add_117_A_8_) );
  BUFX3 U30 ( .A(n33), .Y(n11) );
  ADDFX2 U31 ( .A(add_117_A_4_), .B(add_117_B_4_), .CI(add_117_carry_4_), .CO(
        add_117_carry_5_), .S(UA2_4_) );
  ADDFX2 U32 ( .A(UGA2[9]), .B(ULA2_9_), .CI(add_117_carry_9_), .CO(
        add_117_carry_10_), .S(UA2_9_) );
  XOR2X4 U33 ( .A(PK0), .B(PK1), .Y(n10) );
  AOI222X4 U34 ( .A0(add_117_carry_10_), .A1(add_117_B_10_), .B0(n13), .B1(
        add_117_carry_10_), .C0(n13), .C1(add_117_B_10_), .Y(n15) );
  NOR2XL U35 ( .A(SIGPK), .B(N57), .Y(n33) );
  ADDFX2 U36 ( .A(add_117_A_2_), .B(add_117_B_2_), .CI(add_117_carry_2_), .CO(
        add_117_carry_3_), .S(UA2_2_) );
  ADDFX2 U37 ( .A(add_117_A_5_), .B(add_117_B_5_), .CI(add_117_carry_5_), .CO(
        add_117_carry_6_), .S(UA2_5_) );
  ADDFX2 U38 ( .A(add_117_A_3_), .B(add_117_B_3_), .CI(add_117_carry_3_), .CO(
        add_117_carry_4_), .S(UA2_3_) );
  ADDFX1 U39 ( .A(add_117_A_1_), .B(add_117_B_1_), .CI(add_117_carry_1_), .CO(
        add_117_carry_2_), .S(UA2_1_) );
  BUFX8 U40 ( .A(UGA2[14]), .Y(n13) );
  ADDFHX1 U41 ( .A(PKS2), .B(add_96_B_15_), .CI(add_96_B_14_), .CO(
        add_96_carry_16_), .S(N56) );
  AND2X2 U42 ( .A(add_117_A_0_), .B(add_117_B_0_), .Y(add_117_carry_1_) );
  ADDFHX1 U43 ( .A(add_117_A_7_), .B(add_117_B_7_), .CI(add_117_carry_7_), 
        .CO(add_117_carry_8_), .S(UA2_7_) );
  NOR2BX1 U44 ( .AN(N57), .B(SIGPK), .Y(UGA2[14]) );
  INVX1 U45 ( .A(FA1[7]), .Y(n26) );
  INVX1 U46 ( .A(FA1[8]), .Y(n25) );
  INVX1 U47 ( .A(FA1[9]), .Y(n24) );
  INVX1 U48 ( .A(FA1[10]), .Y(n31) );
  INVX1 U49 ( .A(FA1[11]), .Y(n30) );
  INVX1 U50 ( .A(FA1[14]), .Y(n27) );
  XOR3X2 U51 ( .A(PKS2), .B(add_96_B_16_), .C(add_96_carry_16_), .Y(N57) );
  ADDFX2 U52 ( .A(add_117_A_6_), .B(add_117_B_6_), .CI(add_117_carry_6_), .CO(
        add_117_carry_7_), .S(UA2_6_) );
  INVX1 U53 ( .A(FA1[12]), .Y(n29) );
  INVX1 U54 ( .A(FA1[13]), .Y(n28) );
  OR2X2 U55 ( .A(sub_112_carry[9]), .B(N84), .Y(n34) );
  INVX1 U56 ( .A(N84), .Y(n23) );
  OAI21XL U57 ( .A0(A1[14]), .A1(A1[13]), .B0(n46), .Y(n37) );
  INVX1 U58 ( .A(N92), .Y(n32) );
  INVX1 U59 ( .A(N77), .Y(n16) );
  INVX1 U60 ( .A(N78), .Y(n17) );
  INVX1 U61 ( .A(N79), .Y(n18) );
  INVX1 U62 ( .A(N80), .Y(n19) );
  INVX1 U63 ( .A(N81), .Y(n20) );
  INVX1 U64 ( .A(N82), .Y(n21) );
  INVX1 U65 ( .A(N83), .Y(n22) );
  XOR2X1 U66 ( .A(add_117_B_0_), .B(add_117_A_0_), .Y(UA2_0_) );
  AND2X1 U67 ( .A(sub_112_2_carry_8_), .B(n23), .Y(N101) );
  XOR2X1 U68 ( .A(n23), .B(sub_112_2_carry_8_), .Y(N100) );
  AND2X1 U69 ( .A(sub_112_2_carry_7_), .B(n22), .Y(sub_112_2_carry_8_) );
  XOR2X1 U70 ( .A(n22), .B(sub_112_2_carry_7_), .Y(N99) );
  AND2X1 U71 ( .A(sub_112_2_carry_6_), .B(n21), .Y(sub_112_2_carry_7_) );
  XOR2X1 U72 ( .A(n21), .B(sub_112_2_carry_6_), .Y(N98) );
  AND2X1 U73 ( .A(sub_112_2_carry_5_), .B(n20), .Y(sub_112_2_carry_6_) );
  XOR2X1 U74 ( .A(n20), .B(sub_112_2_carry_5_), .Y(N97) );
  AND2X1 U75 ( .A(sub_112_2_carry_4_), .B(n19), .Y(sub_112_2_carry_5_) );
  XOR2X1 U76 ( .A(n19), .B(sub_112_2_carry_4_), .Y(N96) );
  AND2X1 U77 ( .A(sub_112_2_carry_3_), .B(n18), .Y(sub_112_2_carry_4_) );
  XOR2X1 U78 ( .A(n18), .B(sub_112_2_carry_3_), .Y(N95) );
  AND2X1 U79 ( .A(sub_112_2_carry_2_), .B(n17), .Y(sub_112_2_carry_3_) );
  XOR2X1 U80 ( .A(n17), .B(sub_112_2_carry_2_), .Y(N94) );
  XOR2X1 U81 ( .A(n16), .B(n32), .Y(N93) );
  AND2X1 U82 ( .A(sub_112_carry[8]), .B(n23), .Y(sub_112_carry[9]) );
  XOR2X1 U83 ( .A(n23), .B(sub_112_carry[8]), .Y(N74) );
  AND2X1 U84 ( .A(sub_112_carry[7]), .B(n22), .Y(sub_112_carry[8]) );
  XOR2X1 U85 ( .A(n22), .B(sub_112_carry[7]), .Y(N73) );
  AND2X1 U86 ( .A(sub_112_carry[6]), .B(n21), .Y(sub_112_carry[7]) );
  XOR2X1 U87 ( .A(n21), .B(sub_112_carry[6]), .Y(N72) );
  AND2X1 U88 ( .A(sub_112_carry[5]), .B(n20), .Y(sub_112_carry[6]) );
  XOR2X1 U89 ( .A(n20), .B(sub_112_carry[5]), .Y(N71) );
  AND2X1 U90 ( .A(sub_112_carry[4]), .B(n19), .Y(sub_112_carry[5]) );
  XOR2X1 U91 ( .A(n19), .B(sub_112_carry[4]), .Y(N70) );
  AND2X1 U92 ( .A(sub_112_carry[3]), .B(n18), .Y(sub_112_carry[4]) );
  XOR2X1 U93 ( .A(n18), .B(sub_112_carry[3]), .Y(N69) );
  AND2X1 U94 ( .A(sub_112_carry[2]), .B(n17), .Y(sub_112_carry[3]) );
  XOR2X1 U95 ( .A(n17), .B(sub_112_carry[2]), .Y(N68) );
  XOR2X1 U96 ( .A(n16), .B(n32), .Y(N67) );
  AND2X1 U97 ( .A(sub_90_carry[14]), .B(n27), .Y(sub_90_carry[15]) );
  XOR2X1 U98 ( .A(n27), .B(sub_90_carry[14]), .Y(N43) );
  AND2X1 U99 ( .A(sub_90_carry[13]), .B(n28), .Y(sub_90_carry[14]) );
  XOR2X1 U100 ( .A(n28), .B(sub_90_carry[13]), .Y(N42) );
  AND2X1 U101 ( .A(sub_90_carry[12]), .B(n29), .Y(sub_90_carry[13]) );
  XOR2X1 U102 ( .A(n29), .B(sub_90_carry[12]), .Y(N41) );
  AND2X1 U103 ( .A(sub_90_carry[11]), .B(n30), .Y(sub_90_carry[12]) );
  XOR2X1 U104 ( .A(n30), .B(sub_90_carry[11]), .Y(N40) );
  AND2X1 U105 ( .A(sub_90_carry[10]), .B(n31), .Y(sub_90_carry[11]) );
  XOR2X1 U106 ( .A(n31), .B(sub_90_carry[10]), .Y(N39) );
  AND2X1 U107 ( .A(sub_90_carry[9]), .B(n24), .Y(sub_90_carry[10]) );
  XOR2X1 U108 ( .A(n24), .B(sub_90_carry[9]), .Y(N38) );
  AND2X1 U109 ( .A(sub_90_carry[8]), .B(n25), .Y(sub_90_carry[9]) );
  XOR2X1 U110 ( .A(n25), .B(sub_90_carry[8]), .Y(N37) );
  AND2X1 U111 ( .A(sub_90_carry[7]), .B(n26), .Y(sub_90_carry[8]) );
  XOR2X1 U112 ( .A(n26), .B(sub_90_carry[7]), .Y(N36) );
  XOR2X1 U113 ( .A(add_117_carry_10_), .B(add_117_B_10_), .Y(n14) );
  XOR2X1 U114 ( .A(n13), .B(n14), .Y(UA2_10_) );
  MX2X1 U115 ( .A(N38), .B(FA1[9]), .S0(n10), .Y(N50) );
  MX2X1 U116 ( .A(N37), .B(FA1[8]), .S0(n10), .Y(N49) );
  MX2X1 U117 ( .A(N36), .B(FA1[7]), .S0(n10), .Y(N48) );
  MX2X1 U118 ( .A(N45), .B(FA1[16]), .S0(n10), .Y(add_96_B_16_) );
  MX2X1 U119 ( .A(N44), .B(FA1[16]), .S0(n10), .Y(add_96_B_15_) );
  MX2X1 U120 ( .A(N43), .B(FA1[14]), .S0(n10), .Y(add_96_B_14_) );
  MX2X1 U121 ( .A(N42), .B(FA1[13]), .S0(n10), .Y(N54) );
  MX2X1 U122 ( .A(N41), .B(FA1[12]), .S0(n10), .Y(N53) );
  MX2X1 U123 ( .A(N40), .B(FA1[11]), .S0(n10), .Y(N52) );
  MX2X1 U124 ( .A(N39), .B(FA1[10]), .S0(n10), .Y(N51) );
  MX2X1 U125 ( .A(N74), .B(N100), .S0(N84), .Y(add_117_B_8_) );
  MX2X1 U126 ( .A(N73), .B(N99), .S0(N84), .Y(add_117_B_7_) );
  MX2X1 U127 ( .A(N72), .B(N98), .S0(N84), .Y(add_117_B_6_) );
  MX2X1 U128 ( .A(N71), .B(N97), .S0(N84), .Y(add_117_B_5_) );
  MX2X1 U129 ( .A(N70), .B(N96), .S0(N84), .Y(add_117_B_4_) );
  MX2X1 U130 ( .A(N69), .B(N95), .S0(N84), .Y(add_117_B_3_) );
  MX2X1 U131 ( .A(N68), .B(N94), .S0(N84), .Y(add_117_B_2_) );
  MX2X1 U132 ( .A(N67), .B(N93), .S0(N84), .Y(add_117_B_1_) );
  INVX1 U133 ( .A(n34), .Y(add_117_B_10_) );
  MX2X1 U134 ( .A(N92), .B(N92), .S0(N84), .Y(add_117_B_0_) );
  OAI2BB1X1 U135 ( .A0N(N101), .A1N(N84), .B0(n34), .Y(ULA2_9_) );
  AND2X1 U136 ( .A(N57), .B(n13), .Y(UGA2[9]) );
  XOR2X1 U137 ( .A(PK2), .B(PK0), .Y(PKS2) );
  OAI21XL U138 ( .A0(n35), .A1(n36), .B0(n37), .Y(FA1[9]) );
  OAI21XL U139 ( .A0(n35), .A1(n38), .B0(n37), .Y(FA1[8]) );
  OAI21XL U140 ( .A0(n35), .A1(n39), .B0(n37), .Y(FA1[7]) );
  OAI21XL U141 ( .A0(n35), .A1(n40), .B0(n37), .Y(FA1[6]) );
  OAI2BB1X1 U142 ( .A0N(n41), .A1N(A1[3]), .B0(n37), .Y(FA1[5]) );
  OAI2BB1X1 U143 ( .A0N(n41), .A1N(A1[2]), .B0(n37), .Y(FA1[4]) );
  OAI2BB1X1 U144 ( .A0N(n41), .A1N(A1[1]), .B0(n37), .Y(FA1[3]) );
  NAND3BX1 U145 ( .AN(A1[0]), .B(n41), .C(n37), .Y(N31) );
  NAND2X1 U146 ( .A(n41), .B(n42), .Y(FA1[16]) );
  OAI21XL U147 ( .A0(n35), .A1(n43), .B0(n37), .Y(FA1[14]) );
  OAI2BB1X1 U148 ( .A0N(n41), .A1N(A1[11]), .B0(n37), .Y(FA1[13]) );
  OAI2BB1X1 U149 ( .A0N(n41), .A1N(A1[10]), .B0(n37), .Y(FA1[12]) );
  OAI21XL U150 ( .A0(n35), .A1(n44), .B0(n37), .Y(FA1[11]) );
  OAI21XL U151 ( .A0(n35), .A1(n45), .B0(n37), .Y(FA1[10]) );
  INVX1 U152 ( .A(A1[15]), .Y(n46) );
  INVX1 U153 ( .A(n41), .Y(n35) );
  NAND2X1 U154 ( .A(A1[15]), .B(n42), .Y(n41) );
  NOR3X1 U155 ( .A(n50), .B(A1[11]), .C(A1[10]), .Y(n49) );
  NAND3X1 U156 ( .A(n45), .B(n44), .C(n43), .Y(n50) );
  INVX1 U157 ( .A(A1[12]), .Y(n43) );
  INVX1 U158 ( .A(A1[9]), .Y(n44) );
  INVX1 U159 ( .A(A1[8]), .Y(n45) );
  NAND3X1 U160 ( .A(A1[14]), .B(A1[13]), .C(A1[15]), .Y(n48) );
  NOR4X1 U161 ( .A(A1[1]), .B(n51), .C(A1[3]), .D(A1[2]), .Y(n47) );
  NAND4X1 U162 ( .A(n40), .B(n39), .C(n38), .D(n36), .Y(n51) );
  INVX1 U163 ( .A(A1[7]), .Y(n36) );
  INVX1 U164 ( .A(A1[6]), .Y(n38) );
  INVX1 U165 ( .A(A1[5]), .Y(n39) );
  INVX1 U166 ( .A(A1[4]), .Y(n40) );
  UPA2_0_DW01_add_3 add_120 ( .A({N84, N83, N82, N81, N80, N79, N78, N77, N92, 
        A2[6:0]}), .B({UA2_15_, UA2_15_, UA2_15_, UA2_15_, UA2_15_, UA2_10_, 
        UA2_9_, UA2_8_, UA2_7_, UA2_6_, UA2_5_, UA2_4_, UA2_3_, UA2_2_, UA2_1_, 
        UA2_0_}), .CI(1'b0), .SUM(A2T) );
endmodule

