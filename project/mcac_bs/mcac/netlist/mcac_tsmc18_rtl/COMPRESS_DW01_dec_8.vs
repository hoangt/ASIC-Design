
module COMPRESS_DW01_dec_8 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n16, n18, n19,
         n20, n23, n24, n27, n28, n29, n33, n34, n37, n38, n39, n42, n45, n46,
         n47, n49, n50, n51, n52, SUM_0_, SUM_1_, SUM_2_, SUM_3_, SUM_4_,
         SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_, SUM_10_, SUM_11_, SUM_12_,
         A_0_, A_12_, n86, n87, n88;
  assign n2 = A[11];
  assign n3 = A[10];
  assign n4 = A[9];
  assign n5 = A[8];
  assign n6 = A[7];
  assign n7 = A[6];
  assign n8 = A[5];
  assign n9 = A[4];
  assign n10 = A[3];
  assign n11 = A[2];
  assign n12 = A[1];
  assign SUM[0] = SUM_0_;
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
  assign A_0_ = A[0];
  assign A_12_ = A[12];

  XNOR2X4 U1 ( .A(n13), .B(A_12_), .Y(SUM_12_) );
  NAND2X4 U3 ( .A(n1), .B(n88), .Y(n13) );
  NOR2X4 U13 ( .A(n19), .B(n38), .Y(n1) );
  NAND2X4 U41 ( .A(n46), .B(n39), .Y(n38) );
  NOR2X2 U70 ( .A(n9), .B(n8), .Y(n39) );
  XOR2XL U71 ( .A(n51), .B(n11), .Y(SUM_2_) );
  INVX2 U72 ( .A(n11), .Y(n50) );
  NAND2BX1 U73 ( .AN(n12), .B(SUM_0_), .Y(n52) );
  NOR2X2 U74 ( .A(n47), .B(n52), .Y(n46) );
  NAND2BX1 U75 ( .AN(n10), .B(n50), .Y(n47) );
  INVXL U76 ( .A(n7), .Y(n34) );
  NOR2X2 U77 ( .A(n5), .B(n4), .Y(n20) );
  INVX1 U78 ( .A(A_0_), .Y(SUM_0_) );
  BUFX3 U79 ( .A(n8), .Y(n86) );
  INVX1 U80 ( .A(n2), .Y(n16) );
  XNOR2X1 U81 ( .A(n33), .B(n6), .Y(SUM_7_) );
  INVX1 U82 ( .A(n38), .Y(n37) );
  XNOR2XL U83 ( .A(n27), .B(n5), .Y(SUM_8_) );
  NOR2X2 U84 ( .A(n6), .B(n7), .Y(n28) );
  INVXL U85 ( .A(n28), .Y(n29) );
  NAND2XL U86 ( .A(n37), .B(n34), .Y(n33) );
  NAND2XL U87 ( .A(n24), .B(n37), .Y(n23) );
  XNOR2X1 U88 ( .A(n87), .B(n2), .Y(SUM_11_) );
  NAND2XL U89 ( .A(n1), .B(n18), .Y(n87) );
  XNOR2XL U90 ( .A(n49), .B(n10), .Y(SUM_3_) );
  NAND2XL U91 ( .A(n51), .B(n50), .Y(n49) );
  INVXL U92 ( .A(n52), .Y(n51) );
  INVX1 U93 ( .A(n3), .Y(n18) );
  AND2X2 U94 ( .A(n16), .B(n18), .Y(n88) );
  XOR2X1 U95 ( .A(n42), .B(n86), .Y(SUM_5_) );
  XOR2X1 U96 ( .A(n1), .B(n3), .Y(SUM_10_) );
  XOR2X1 U97 ( .A(n37), .B(n7), .Y(SUM_6_) );
  XNOR2XL U98 ( .A(n23), .B(n4), .Y(SUM_9_) );
  NOR2XL U99 ( .A(n29), .B(n5), .Y(n24) );
  NAND2XL U100 ( .A(n37), .B(n28), .Y(n27) );
  INVXL U101 ( .A(n46), .Y(n45) );
  XOR2X1 U102 ( .A(n12), .B(SUM_0_), .Y(SUM_1_) );
  XNOR2XL U103 ( .A(n45), .B(n9), .Y(SUM_4_) );
  NOR2XL U104 ( .A(n45), .B(n9), .Y(n42) );
  NAND2X2 U105 ( .A(n20), .B(n28), .Y(n19) );
endmodule

