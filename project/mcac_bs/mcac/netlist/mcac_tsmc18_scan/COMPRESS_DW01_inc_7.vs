
module COMPRESS_DW01_inc_7 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n4, n5, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n22, n23, n24, n25, n26, n28, n29, n30, n33, n34, n36,
         n38, n40, n41, n42, n43, n44, n45, n47, n48, n50, n51, n52, SUM_1_,
         SUM_2_, SUM_3_, SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_,
         SUM_10_, SUM_11_, SUM_12_, SUM_13_, SUM_14_, SUM_15_, A_0_, A_10_,
         A_13_, A_14_, A_15_, n89, n90;
  assign n5 = A[12];
  assign n9 = A[11];
  assign n17 = A[9];
  assign n20 = A[8];
  assign n26 = A[7];
  assign n30 = A[6];
  assign n36 = A[5];
  assign n40 = A[4];
  assign n45 = A[3];
  assign n48 = A[2];
  assign n52 = A[1];
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
  assign SUM[12] = SUM_12_;
  assign SUM[13] = SUM_13_;
  assign SUM[14] = SUM_14_;
  assign SUM[15] = SUM_15_;
  assign A_0_ = A[0];
  assign A_10_ = A[10];
  assign A_13_ = A[13];
  assign A_14_ = A[14];
  assign A_15_ = A[15];

  NAND2X4 U31 ( .A(n24), .B(n43), .Y(n23) );
  NOR2X4 U55 ( .A(n44), .B(n51), .Y(n43) );
  NAND2X1 U70 ( .A(n20), .B(n17), .Y(n16) );
  INVX1 U71 ( .A(A_10_), .Y(n13) );
  NOR2X2 U72 ( .A(n16), .B(n13), .Y(n12) );
  AND2X2 U73 ( .A(n12), .B(n22), .Y(n90) );
  INVX4 U74 ( .A(n23), .Y(n22) );
  NOR2XL U75 ( .A(n42), .B(n33), .Y(n89) );
  NOR2X2 U76 ( .A(n33), .B(n25), .Y(n24) );
  INVX4 U77 ( .A(n43), .Y(n42) );
  INVX1 U78 ( .A(n51), .Y(n50) );
  XOR2X1 U79 ( .A(n38), .B(n36), .Y(SUM_5_) );
  NOR2X1 U80 ( .A(n42), .B(n41), .Y(n38) );
  XOR2X1 U81 ( .A(n19), .B(n18), .Y(SUM_9_) );
  NAND2X2 U82 ( .A(n52), .B(A_0_), .Y(n51) );
  INVX1 U83 ( .A(A_13_), .Y(n3) );
  NOR2X1 U84 ( .A(n29), .B(n42), .Y(n28) );
  NAND2X1 U85 ( .A(n34), .B(n30), .Y(n29) );
  CLKINVX2 U86 ( .A(n9), .Y(n10) );
  XOR2X1 U87 ( .A(n14), .B(n13), .Y(SUM_10_) );
  NAND2X2 U88 ( .A(n48), .B(n45), .Y(n44) );
  NAND2X2 U89 ( .A(n40), .B(n36), .Y(n33) );
  NAND2X1 U90 ( .A(n50), .B(n48), .Y(n47) );
  XOR2X2 U91 ( .A(n4), .B(n3), .Y(SUM_13_) );
  NAND2X2 U92 ( .A(n30), .B(n26), .Y(n25) );
  NAND2X1 U93 ( .A(n7), .B(n5), .Y(n4) );
  XOR2X2 U94 ( .A(n89), .B(n30), .Y(SUM_6_) );
  XOR2X2 U95 ( .A(n28), .B(n26), .Y(SUM_7_) );
  NOR2X2 U96 ( .A(n8), .B(n23), .Y(n7) );
  XOR2XL U97 ( .A(n22), .B(n20), .Y(SUM_8_) );
  NAND2XL U98 ( .A(n22), .B(n15), .Y(n14) );
  INVXL U99 ( .A(n33), .Y(n34) );
  INVXL U100 ( .A(n40), .Y(n41) );
  INVXL U101 ( .A(n17), .Y(n18) );
  NAND2XL U102 ( .A(n22), .B(n20), .Y(n19) );
  XOR2X2 U103 ( .A(n7), .B(n5), .Y(SUM_12_) );
  XNOR2X2 U104 ( .A(n90), .B(n10), .Y(SUM_11_) );
  XNOR2XL U105 ( .A(n47), .B(n45), .Y(SUM_3_) );
  INVX1 U106 ( .A(n16), .Y(n15) );
  NAND2X1 U107 ( .A(n12), .B(n9), .Y(n8) );
  XOR2X1 U108 ( .A(n42), .B(n41), .Y(SUM_4_) );
  XOR2XL U109 ( .A(n50), .B(n48), .Y(SUM_2_) );
  XOR2X1 U110 ( .A(n1), .B(A_15_), .Y(SUM_15_) );
  ADDHXL U111 ( .A(A_14_), .B(n2), .CO(n1), .S(SUM_14_) );
  NOR2XL U112 ( .A(n4), .B(n3), .Y(n2) );
  XOR2X1 U113 ( .A(n52), .B(A_0_), .Y(SUM_1_) );
endmodule

