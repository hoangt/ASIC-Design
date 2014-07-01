
module ADDA_0_DW01_add_11 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17, n18,
         n20, n21, n22, n23, n25, n27, n29, n30, n32, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n49, n51, n52, n54, n56,
         n57, n58, n60, n62, n63, n64, n65, n67, n69, SUM_1_, SUM_2_, SUM_3_,
         SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_, SUM_10_, SUM_11_,
         B_0_, B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_, B_8_, B_9_, B_10_,
         A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, A_7_, A_8_, A_9_, A_10_,
         A_11_, n124, n125, n126, n127, n128, SUM_0_, n130, n131, n132, n133;
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

  XOR2X4 U1 ( .A(n13), .B(n12), .Y(SUM_11_) );
  NOR2X4 U9 ( .A(B_10_), .B(A_10_), .Y(n16) );
  XNOR2X4 U11 ( .A(n23), .B(n2), .Y(SUM_9_) );
  AOI21X4 U12 ( .A0(n23), .A1(n69), .B0(n20), .Y(n18) );
  NOR2X4 U17 ( .A(B_9_), .B(A_9_), .Y(n21) );
  NAND2X4 U18 ( .A(B_9_), .B(A_9_), .Y(n22) );
  XOR2X4 U19 ( .A(n30), .B(n3), .Y(SUM_8_) );
  XNOR2X4 U29 ( .A(n35), .B(n4), .Y(SUM_7_) );
  NAND2X4 U33 ( .A(n124), .B(n34), .Y(n4) );
  AOI21X4 U39 ( .A0(n37), .A1(n45), .B0(n38), .Y(n36) );
  NOR2X4 U40 ( .A(n39), .B(n42), .Y(n37) );
  OAI21X4 U41 ( .A0(n39), .A1(n43), .B0(n40), .Y(n38) );
  NOR2X4 U44 ( .A(B_6_), .B(A_6_), .Y(n39) );
  NOR2X4 U50 ( .A(B_5_), .B(A_5_), .Y(n42) );
  NAND2X4 U51 ( .A(A_5_), .B(B_5_), .Y(n43) );
  OAI21X4 U54 ( .A0(n46), .A1(n58), .B0(n47), .Y(n45) );
  AOI21X4 U56 ( .A0(n125), .A1(n54), .B0(n49), .Y(n47) );
  AOI21X4 U73 ( .A0(n63), .A1(n131), .B0(n60), .Y(n58) );
  XNOR2X2 U94 ( .A(n41), .B(n5), .Y(SUM_6_) );
  NAND2BX1 U95 ( .AN(n64), .B(n65), .Y(n10) );
  NOR2BX1 U96 ( .AN(n43), .B(n42), .Y(n128) );
  AOI21X1 U97 ( .A0(n32), .A1(n127), .B0(n27), .Y(n25) );
  CLKINVX2 U98 ( .A(n34), .Y(n32) );
  INVX1 U99 ( .A(n29), .Y(n27) );
  AOI21XL U100 ( .A0(n57), .A1(n132), .B0(n54), .Y(n52) );
  AND2X2 U101 ( .A(n126), .B(n67), .Y(SUM_0_) );
  NOR2BX4 U102 ( .AN(n17), .B(n16), .Y(n133) );
  NOR2X1 U103 ( .A(n16), .B(n21), .Y(n14) );
  AOI21X4 U104 ( .A0(n35), .A1(n124), .B0(n32), .Y(n30) );
  INVX8 U105 ( .A(n36), .Y(n35) );
  OAI21X1 U106 ( .A0(n16), .A1(n22), .B0(n17), .Y(n15) );
  NAND2X1 U107 ( .A(B_3_), .B(A_3_), .Y(n56) );
  INVX1 U108 ( .A(n56), .Y(n54) );
  NAND2X2 U109 ( .A(B_7_), .B(A_7_), .Y(n34) );
  OR2X4 U110 ( .A(B_7_), .B(A_7_), .Y(n124) );
  NAND2X2 U111 ( .A(B_4_), .B(A_4_), .Y(n51) );
  NAND2X1 U112 ( .A(B_8_), .B(A_8_), .Y(n29) );
  INVX1 U113 ( .A(n22), .Y(n20) );
  NAND2X2 U114 ( .A(n69), .B(n22), .Y(n2) );
  OR2X4 U115 ( .A(B_4_), .B(A_4_), .Y(n125) );
  OR2X2 U116 ( .A(B_0_), .B(A_0_), .Y(n126) );
  OR2X4 U117 ( .A(B_8_), .B(A_8_), .Y(n127) );
  INVX2 U118 ( .A(n62), .Y(n60) );
  OAI21X2 U119 ( .A0(n64), .A1(n67), .B0(n65), .Y(n63) );
  AND2X1 U120 ( .A(n127), .B(n124), .Y(n130) );
  NAND2X1 U121 ( .A(B_2_), .B(A_2_), .Y(n62) );
  NAND2X2 U122 ( .A(n127), .B(n29), .Y(n3) );
  NAND2BX1 U123 ( .AN(n39), .B(n40), .Y(n5) );
  NAND2XL U124 ( .A(n131), .B(n62), .Y(n9) );
  XNOR2X1 U125 ( .A(n44), .B(n128), .Y(SUM_5_) );
  NAND2XL U126 ( .A(n132), .B(n56), .Y(n8) );
  XOR2XL U127 ( .A(n10), .B(n67), .Y(SUM_1_) );
  NAND2X2 U128 ( .A(B_10_), .B(A_10_), .Y(n17) );
  INVXL U129 ( .A(n45), .Y(n44) );
  INVXL U130 ( .A(n58), .Y(n57) );
  OAI21XL U131 ( .A0(n44), .A1(n42), .B0(n43), .Y(n41) );
  XOR2X1 U132 ( .A(n52), .B(n7), .Y(SUM_4_) );
  NAND2XL U133 ( .A(n125), .B(n51), .Y(n7) );
  INVX1 U134 ( .A(n51), .Y(n49) );
  XNOR2XL U135 ( .A(n9), .B(n63), .Y(SUM_2_) );
  XNOR2X1 U136 ( .A(n57), .B(n8), .Y(SUM_3_) );
  OAI2BB1X4 U137 ( .A0N(n130), .A1N(n35), .B0(n25), .Y(n23) );
  NAND2X1 U138 ( .A(B_0_), .B(A_0_), .Y(n67) );
  NOR2X1 U139 ( .A(B_1_), .B(A_1_), .Y(n64) );
  NAND2X1 U140 ( .A(B_1_), .B(A_1_), .Y(n65) );
  NAND2X2 U141 ( .A(B_6_), .B(A_6_), .Y(n40) );
  OR2X2 U142 ( .A(B_2_), .B(A_2_), .Y(n131) );
  OR2X2 U143 ( .A(B_3_), .B(A_3_), .Y(n132) );
  XNOR2X4 U144 ( .A(n18), .B(n133), .Y(SUM_10_) );
  INVX1 U145 ( .A(A_11_), .Y(n12) );
  AOI21X2 U146 ( .A0(n23), .A1(n14), .B0(n15), .Y(n13) );
  NAND2X2 U147 ( .A(n125), .B(n132), .Y(n46) );
  CLKINVX4 U148 ( .A(n21), .Y(n69) );
endmodule


module ADDA_0 ( DQLN, Y, DQL );
  input [11:0] DQLN;
  input [12:0] Y;
  output [11:0] DQL;

  wire   SYNOPSYS_UNCONNECTED__0;

  ADDA_0_DW01_add_11 add_44 ( .A({1'b0, DQLN}), .B({1'b0, 1'b0, Y[12:2]}), 
        .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, DQL}) );
endmodule

