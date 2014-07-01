
module FILTC_1_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n7, n8, n9, n10, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n36, n37,
         n38, n39, n44, n45, n47, n54, SUM_1_, SUM_2_, SUM_3_, SUM_4_, SUM_5_,
         SUM_6_, SUM_7_, SUM_8_, SUM_9_, B_0_, B_1_, B_2_, B_3_, B_4_, B_5_,
         B_6_, B_7_, B_8_, B_9_, A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, n90,
         SUM_0_, n92, n93, n94, n95;
  assign SUM[1] = SUM_1_;
  assign SUM[2] = SUM_2_;
  assign SUM[3] = SUM_3_;
  assign SUM[4] = SUM_4_;
  assign SUM[5] = SUM_5_;
  assign SUM[6] = SUM_6_;
  assign SUM[7] = SUM_7_;
  assign SUM[8] = SUM_8_;
  assign SUM[9] = SUM_9_;
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
  assign A_0_ = A[0];
  assign A_1_ = A[1];
  assign A_2_ = A[2];
  assign A_3_ = A[3];
  assign A_4_ = A[4];
  assign A_5_ = A[5];
  assign A_6_ = A[6];
  assign SUM[0] = SUM_0_;

  ADDFX2 U34 ( .A(A_4_), .B(B_4_), .CI(n30), .CO(n29), .S(SUM_4_) );
  ADDFX2 U57 ( .A(A_1_), .B(B_1_), .CI(n45), .CO(n44), .S(SUM_1_) );
  NAND2X2 U67 ( .A(A_6_), .B(B_6_), .Y(n24) );
  NOR2X4 U68 ( .A(A_5_), .B(B_5_), .Y(n27) );
  OAI21X2 U69 ( .A0(n20), .A1(n24), .B0(n21), .Y(n19) );
  NOR2X2 U70 ( .A(n23), .B(n20), .Y(n18) );
  NOR2X2 U71 ( .A(A_6_), .B(B_7_), .Y(n20) );
  NAND2X2 U72 ( .A(A_5_), .B(B_5_), .Y(n28) );
  OAI21X4 U73 ( .A0(n27), .A1(n1), .B0(n28), .Y(n26) );
  AOI21X2 U74 ( .A0(n18), .A1(n26), .B0(n19), .Y(n17) );
  OAI221XL U75 ( .A0(n3), .A1(n31), .B0(n90), .B1(n39), .C0(n36), .Y(n30) );
  INVX1 U76 ( .A(n95), .Y(n90) );
  NOR2BXL U77 ( .AN(n21), .B(n20), .Y(n93) );
  NAND2BX1 U78 ( .AN(n15), .B(n16), .Y(n5) );
  NAND2BX1 U79 ( .AN(n27), .B(n28), .Y(n8) );
  NAND2BXL U80 ( .AN(n23), .B(n24), .Y(n7) );
  OAI21X1 U81 ( .A0(n17), .A1(n15), .B0(n16), .Y(n14) );
  AND2X2 U82 ( .A(n92), .B(n47), .Y(SUM_0_) );
  OR2X2 U83 ( .A(A_0_), .B(B_0_), .Y(n92) );
  XOR2X1 U84 ( .A(n22), .B(n93), .Y(SUM_7_) );
  XOR2XL U85 ( .A(n7), .B(n25), .Y(SUM_6_) );
  NOR2X1 U86 ( .A(A_6_), .B(B_6_), .Y(n23) );
  NOR2XL U87 ( .A(A_2_), .B(B_2_), .Y(n38) );
  NAND2XL U88 ( .A(A_2_), .B(B_2_), .Y(n39) );
  NAND2XL U89 ( .A(A_3_), .B(B_3_), .Y(n36) );
  OR2XL U90 ( .A(A_3_), .B(B_3_), .Y(n95) );
  NAND2XL U91 ( .A(A_6_), .B(B_8_), .Y(n16) );
  INVX1 U92 ( .A(n26), .Y(n25) );
  INVX1 U93 ( .A(n29), .Y(n1) );
  OAI21XL U94 ( .A0(n25), .A1(n23), .B0(n24), .Y(n22) );
  XNOR2X1 U95 ( .A(n8), .B(n29), .Y(SUM_5_) );
  XNOR2X1 U96 ( .A(n14), .B(n4), .Y(SUM_9_) );
  NAND2X1 U97 ( .A(n94), .B(n13), .Y(n4) );
  XOR2X1 U98 ( .A(n17), .B(n5), .Y(SUM_8_) );
  XNOR2X1 U99 ( .A(n10), .B(n44), .Y(SUM_2_) );
  NAND2X1 U100 ( .A(n54), .B(n39), .Y(n10) );
  XNOR2X1 U101 ( .A(n37), .B(n9), .Y(SUM_3_) );
  NAND2X1 U102 ( .A(n95), .B(n36), .Y(n9) );
  OAI21XL U103 ( .A0(n3), .A1(n38), .B0(n39), .Y(n37) );
  INVX1 U104 ( .A(n44), .Y(n3) );
  INVX1 U105 ( .A(n38), .Y(n54) );
  NAND2X1 U106 ( .A(n95), .B(n54), .Y(n31) );
  NOR2X1 U107 ( .A(A_6_), .B(B_8_), .Y(n15) );
  NAND2X1 U108 ( .A(A_6_), .B(B_7_), .Y(n21) );
  NAND2XL U109 ( .A(A_6_), .B(B_9_), .Y(n13) );
  OR2XL U110 ( .A(A_6_), .B(B_9_), .Y(n94) );
  INVX1 U111 ( .A(n47), .Y(n45) );
  NAND2X1 U112 ( .A(A_0_), .B(B_0_), .Y(n47) );
endmodule

