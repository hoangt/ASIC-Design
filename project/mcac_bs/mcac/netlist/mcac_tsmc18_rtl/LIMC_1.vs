
module LIMC_1 ( A2T, A2P );
  input [15:0] A2T;
  output [15:0] A2P;
  wire   A2T_15_, A2P_13_, A2P_12_, n28, A2P_10_, n29, A2P_8_, n30, n31,
         A2P_5_, A2P_4_, A2P_3_, A2P_2_, A2P_1_, A2P_0_, n1, n2, A2P_6_,
         A2P_9_, A2P_11_, A2P_7_, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  assign A2P[14] = A2T_15_;
  assign A2P[15] = A2T_15_;
  assign A2T_15_ = A2T[15];
  assign A2P[13] = A2P_13_;
  assign A2P[12] = A2P_12_;
  assign A2P[10] = A2P_10_;
  assign A2P[8] = A2P_8_;
  assign A2P[5] = A2P_5_;
  assign A2P[4] = A2P_4_;
  assign A2P[3] = A2P_3_;
  assign A2P[2] = A2P_2_;
  assign A2P[1] = A2P_1_;
  assign A2P[0] = A2P_0_;
  assign A2P[6] = A2P_6_;
  assign A2P[9] = A2P_9_;
  assign A2P[11] = A2P_11_;
  assign A2P[7] = A2P_7_;

  NAND2BX2 U3 ( .AN(A2T[12]), .B(n27), .Y(A2P_12_) );
  INVX1 U4 ( .A(A2T[13]), .Y(n1) );
  BUFX3 U5 ( .A(n28), .Y(A2P_11_) );
  INVX1 U6 ( .A(n1), .Y(n2) );
  BUFX8 U7 ( .A(n31), .Y(A2P_6_) );
  NOR2X1 U8 ( .A(A2T[12]), .B(A2T[13]), .Y(n9) );
  NOR2X4 U9 ( .A(n8), .B(n17), .Y(A2P_5_) );
  INVX1 U10 ( .A(A2T[5]), .Y(n17) );
  NOR2X2 U11 ( .A(n8), .B(n20), .Y(A2P_8_) );
  BUFX3 U12 ( .A(n29), .Y(A2P_9_) );
  NOR2X1 U13 ( .A(n8), .B(n21), .Y(n29) );
  NOR2XL U14 ( .A(n8), .B(n23), .Y(n28) );
  NOR2X4 U15 ( .A(n8), .B(n15), .Y(A2P_3_) );
  NOR2X2 U16 ( .A(n8), .B(n18), .Y(n31) );
  BUFX4 U17 ( .A(n30), .Y(A2P_7_) );
  AND2X2 U18 ( .A(A2T[12]), .B(A2T[13]), .Y(n7) );
  NOR2X1 U19 ( .A(A2T_15_), .B(n7), .Y(n11) );
  BUFX20 U20 ( .A(n24), .Y(n8) );
  NOR2XL U21 ( .A(n8), .B(n19), .Y(n30) );
  INVX1 U22 ( .A(n8), .Y(n27) );
  OAI21XL U23 ( .A0(A2T[14]), .A1(n7), .B0(n25), .Y(n26) );
  INVXL U24 ( .A(A2T_15_), .Y(n25) );
  INVX1 U25 ( .A(A2T[9]), .Y(n21) );
  INVX1 U26 ( .A(A2T[0]), .Y(n12) );
  INVX1 U27 ( .A(A2T[2]), .Y(n14) );
  INVX1 U28 ( .A(A2T[11]), .Y(n23) );
  INVX1 U29 ( .A(A2T[1]), .Y(n13) );
  INVX1 U30 ( .A(A2T[8]), .Y(n20) );
  INVX1 U31 ( .A(A2T[4]), .Y(n16) );
  INVX1 U32 ( .A(A2T[3]), .Y(n15) );
  NOR2X2 U33 ( .A(n8), .B(n22), .Y(A2P_10_) );
  INVX1 U34 ( .A(A2T[10]), .Y(n22) );
  INVX1 U35 ( .A(A2T[7]), .Y(n19) );
  INVX1 U36 ( .A(A2T[6]), .Y(n18) );
  NOR2BX4 U37 ( .AN(A2T_15_), .B(n9), .Y(n10) );
  MXI2X4 U38 ( .A(n11), .B(n10), .S0(A2T[14]), .Y(n24) );
  NOR2X4 U39 ( .A(n8), .B(n12), .Y(A2P_0_) );
  NOR2X4 U40 ( .A(n8), .B(n13), .Y(A2P_1_) );
  NOR2X4 U41 ( .A(n8), .B(n14), .Y(A2P_2_) );
  NOR2X4 U42 ( .A(n8), .B(n16), .Y(A2P_4_) );
  OAI2BB1X4 U43 ( .A0N(n27), .A1N(n2), .B0(n26), .Y(A2P_13_) );
endmodule

