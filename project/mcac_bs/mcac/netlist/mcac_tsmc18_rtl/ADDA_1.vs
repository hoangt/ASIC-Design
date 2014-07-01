
module ADDA_1_DW01_add_6 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n5, n6, n7, n8, n9, n10, n11, n14, n22, n23, n24, n25, n26,
         n27, n28, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n45, n46, n47, n48, n53, n54, n55, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n74, n77, n81, n84,
         SUM_1_, SUM_2_, SUM_3_, SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_,
         SUM_9_, SUM_10_, SUM_11_, B_0_, B_1_, B_2_, B_3_, B_4_, B_5_, B_6_,
         B_7_, B_8_, B_9_, B_10_, A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_,
         A_7_, A_8_, A_9_, A_10_, A_11_, SUM_0_, n132, n133, n134, n135, n136,
         n137, n138;
  assign SUM[1] = SUM_1_;
  assign SUM[2] = SUM_2_;
  assign SUM[3] = SUM_3_;
  assign SUM[4] = SUM_4_;
  assign SUM[5] = SUM_5_;
  assign SUM[6] = SUM_6_;
  assign SUM[7] = SUM_7_;
  assign SUM[8] = SUM_8_;
  assign SUM[9] = SUM_9_;
  assign SUM[10] = SUM_10_;
  assign SUM[11] = SUM_11_;
  assign B_0_ = B[0];
  assign B_1_ = B[1];
  assign B_2_ = B[2];
  assign B_3_ = B[3];
  assign B_4_ = B[4];
  assign B_5_ = B[5];
  assign B_6_ = B[6];
  assign B_7_ = B[7];
  assign B_8_ = B[8];
  assign B_9_ = B[9];
  assign B_10_ = B[10];
  assign A_0_ = A[0];
  assign A_1_ = A[1];
  assign A_2_ = A[2];
  assign A_3_ = A[3];
  assign A_4_ = A[4];
  assign A_5_ = A[5];
  assign A_6_ = A[6];
  assign A_7_ = A[7];
  assign A_8_ = A[8];
  assign A_9_ = A[9];
  assign A_10_ = A[10];
  assign A_11_ = A[11];
  assign SUM[0] = SUM_0_;

  XOR2X4 U31 ( .A(n39), .B(n5), .Y(SUM_7_) );
  AOI21X4 U42 ( .A0(n40), .A1(n60), .B0(n41), .Y(n39) );
  NOR2X4 U61 ( .A(A_5_), .B(B_5_), .Y(n53) );
  NAND2X1 U101 ( .A(n35), .B(n47), .Y(n33) );
  OAI21X2 U102 ( .A0(n53), .A1(n59), .B0(n54), .Y(n48) );
  AOI31X4 U103 ( .A0(n134), .A1(n24), .A2(n138), .B0(n137), .Y(n14) );
  NOR2BX2 U104 ( .AN(n47), .B(n42), .Y(n40) );
  NOR2X2 U105 ( .A(n53), .B(n58), .Y(n47) );
  NAND2X1 U106 ( .A(A_1_), .B(B_1_), .Y(n72) );
  NOR2X2 U107 ( .A(A_7_), .B(B_7_), .Y(n37) );
  NAND2BX1 U108 ( .AN(n37), .B(n38), .Y(n5) );
  NAND2BX1 U109 ( .AN(n64), .B(n65), .Y(n9) );
  NAND2BX1 U110 ( .AN(n53), .B(n54), .Y(n7) );
  AND2X1 U111 ( .A(n135), .B(n74), .Y(SUM_0_) );
  OAI21X2 U112 ( .A0(n33), .A1(n61), .B0(n34), .Y(n134) );
  NAND2BXL U113 ( .AN(n67), .B(n68), .Y(n10) );
  NAND2BX1 U114 ( .AN(n26), .B(n27), .Y(n3) );
  OAI21X1 U115 ( .A0(n64), .A1(n68), .B0(n65), .Y(n63) );
  NOR2X2 U116 ( .A(A_3_), .B(B_3_), .Y(n64) );
  NAND2X2 U117 ( .A(A_0_), .B(B_0_), .Y(n74) );
  NAND2X1 U118 ( .A(A_3_), .B(B_3_), .Y(n65) );
  NOR2X1 U119 ( .A(A_9_), .B(B_9_), .Y(n26) );
  NAND2X1 U120 ( .A(n133), .B(n45), .Y(n41) );
  AOI21X1 U121 ( .A0(n77), .A1(n134), .B0(n30), .Y(n28) );
  XOR2X2 U122 ( .A(n134), .B(n136), .Y(SUM_8_) );
  XOR2X2 U123 ( .A(n28), .B(n3), .Y(SUM_9_) );
  AOI21X2 U124 ( .A0(n70), .A1(n62), .B0(n63), .Y(n61) );
  OAI21X2 U125 ( .A0(n71), .A1(n74), .B0(n72), .Y(n70) );
  NOR2X1 U126 ( .A(n37), .B(n42), .Y(n35) );
  NOR2X1 U127 ( .A(A_4_), .B(B_4_), .Y(n58) );
  NOR2X1 U128 ( .A(n67), .B(n64), .Y(n62) );
  NAND2X1 U129 ( .A(A_6_), .B(B_6_), .Y(n45) );
  NAND2X1 U130 ( .A(A_2_), .B(B_2_), .Y(n68) );
  NOR2X2 U131 ( .A(A_2_), .B(B_2_), .Y(n67) );
  NAND2X1 U132 ( .A(n48), .B(n132), .Y(n133) );
  NOR2X2 U133 ( .A(A_6_), .B(B_6_), .Y(n42) );
  INVX1 U134 ( .A(n42), .Y(n132) );
  OR2X2 U135 ( .A(A_10_), .B(B_10_), .Y(n138) );
  NAND2X1 U136 ( .A(A_10_), .B(B_10_), .Y(n22) );
  NAND2X2 U137 ( .A(A_5_), .B(B_5_), .Y(n54) );
  NAND2XL U138 ( .A(A_8_), .B(B_8_), .Y(n32) );
  NOR2X1 U139 ( .A(A_8_), .B(B_8_), .Y(n31) );
  XNOR2X1 U140 ( .A(n14), .B(A_11_), .Y(SUM_11_) );
  AND2X2 U141 ( .A(n77), .B(n32), .Y(n136) );
  NAND2XL U142 ( .A(n81), .B(n59), .Y(n8) );
  NAND2XL U143 ( .A(n132), .B(n45), .Y(n6) );
  XOR2X1 U144 ( .A(n23), .B(n2), .Y(SUM_10_) );
  NAND2XL U145 ( .A(n138), .B(n22), .Y(n2) );
  AOI21XL U146 ( .A0(n134), .A1(n24), .B0(n25), .Y(n23) );
  INVXL U147 ( .A(n59), .Y(n57) );
  INVXL U148 ( .A(n71), .Y(n84) );
  NAND2XL U149 ( .A(A_9_), .B(B_9_), .Y(n27) );
  OR2XL U150 ( .A(A_0_), .B(B_0_), .Y(n135) );
  INVXL U151 ( .A(n70), .Y(n69) );
  AOI21XL U152 ( .A0(n35), .A1(n48), .B0(n36), .Y(n34) );
  OAI21XL U153 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  OAI21XL U154 ( .A0(n32), .A1(n26), .B0(n27), .Y(n25) );
  NOR2X1 U155 ( .A(n31), .B(n26), .Y(n24) );
  XNOR2X1 U156 ( .A(n60), .B(n8), .Y(SUM_4_) );
  XOR2XL U157 ( .A(n11), .B(n74), .Y(SUM_1_) );
  NAND2X1 U158 ( .A(n84), .B(n72), .Y(n11) );
  XOR2X1 U159 ( .A(n69), .B(n10), .Y(SUM_2_) );
  XOR2X1 U160 ( .A(n55), .B(n7), .Y(SUM_5_) );
  AOI21XL U161 ( .A0(n60), .A1(n81), .B0(n57), .Y(n55) );
  XOR2X1 U162 ( .A(n46), .B(n6), .Y(SUM_6_) );
  AOI21XL U163 ( .A0(n60), .A1(n47), .B0(n48), .Y(n46) );
  XNOR2X1 U164 ( .A(n66), .B(n9), .Y(SUM_3_) );
  OAI21XL U165 ( .A0(n69), .A1(n67), .B0(n68), .Y(n66) );
  INVXL U166 ( .A(n58), .Y(n81) );
  INVX1 U167 ( .A(n31), .Y(n77) );
  INVX1 U168 ( .A(n32), .Y(n30) );
  OAI2BB1X1 U169 ( .A0N(n25), .A1N(n138), .B0(n22), .Y(n137) );
  NAND2X2 U170 ( .A(A_4_), .B(B_4_), .Y(n59) );
  NOR2X2 U171 ( .A(A_1_), .B(B_1_), .Y(n71) );
  NAND2XL U172 ( .A(A_7_), .B(B_7_), .Y(n38) );
  INVX4 U173 ( .A(n61), .Y(n60) );
endmodule


module ADDA_1 ( DQLN, Y, DQL );
  input [11:0] DQLN;
  input [12:0] Y;
  output [11:0] DQL;

  wire   SYNOPSYS_UNCONNECTED__0;

  ADDA_1_DW01_add_6 add_44 ( .A({1'b0, DQLN}), .B({1'b0, 1'b0, Y[12:2]}), .CI(
        1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, DQL}) );
endmodule

