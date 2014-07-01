
module LIMC_0 ( A2T, A2P );
  input [15:0] A2T;
  output [15:0] A2P;
  wire   A2T_15_, A2P_13_, A2P_12_, A2P_11_, A2P_10_, A2P_9_, A2P_8_, A2P_7_,
         A2P_6_, A2P_5_, A2P_4_, A2P_3_, A2P_2_, A2P_1_, A2P_0_, A2P_14_, n2,
         n3, n4, n5;
  assign A2T_15_ = A2T[15];
  assign A2P[13] = A2P_13_;
  assign A2P[12] = A2P_12_;
  assign A2P[11] = A2P_11_;
  assign A2P[10] = A2P_10_;
  assign A2P[9] = A2P_9_;
  assign A2P[8] = A2P_8_;
  assign A2P[7] = A2P_7_;
  assign A2P[6] = A2P_6_;
  assign A2P[5] = A2P_5_;
  assign A2P[4] = A2P_4_;
  assign A2P[3] = A2P_3_;
  assign A2P[2] = A2P_2_;
  assign A2P[1] = A2P_1_;
  assign A2P[0] = A2P_0_;
  assign A2P[14] = A2P_14_;
  assign A2P[15] = A2P_14_;

  AND2X4 U3 ( .A(A2T[0]), .B(n2), .Y(A2P_0_) );
  INVX2 U4 ( .A(n3), .Y(n4) );
  AND2X2 U5 ( .A(A2T[1]), .B(n2), .Y(A2P_1_) );
  AND2X2 U6 ( .A(A2T[2]), .B(n2), .Y(A2P_2_) );
  NAND2BXL U7 ( .AN(A2T[12]), .B(n2), .Y(A2P_12_) );
  CLKBUFX3 U8 ( .A(A2T_15_), .Y(A2P_14_) );
  MXI2X4 U9 ( .A(n4), .B(n5), .S0(A2T_15_), .Y(n2) );
  AND2X1 U10 ( .A(A2T[9]), .B(n2), .Y(A2P_9_) );
  AND2X1 U11 ( .A(A2T[8]), .B(n2), .Y(A2P_8_) );
  AND2X1 U12 ( .A(A2T[7]), .B(n2), .Y(A2P_7_) );
  AND2X1 U13 ( .A(A2T[6]), .B(n2), .Y(A2P_6_) );
  AND2X1 U14 ( .A(A2T[5]), .B(n2), .Y(A2P_5_) );
  AND2X1 U15 ( .A(A2T[4]), .B(n2), .Y(A2P_4_) );
  AND2X1 U16 ( .A(A2T[3]), .B(n2), .Y(A2P_3_) );
  OAI2BB2X1 U17 ( .B0(A2T_15_), .B1(n3), .A0N(A2T[13]), .A1N(n2), .Y(A2P_13_)
         );
  AND2X1 U18 ( .A(A2T[11]), .B(n2), .Y(A2P_11_) );
  AND2X1 U19 ( .A(A2T[10]), .B(n2), .Y(A2P_10_) );
  AOI22X1 U20 ( .A0(A2T[14]), .A1(A2T[12]), .B0(A2T[14]), .B1(A2T[13]), .Y(n5)
         );
  AOI21X1 U21 ( .A0(A2T[12]), .A1(A2T[13]), .B0(A2T[14]), .Y(n3) );
endmodule

