
module TONE_1 ( A2P, TDP );
  input [15:0] A2P;
  output TDP;
  wire   N1, n2, n3, n4, n5;

  OAI21X1 U3 ( .A0(A2P[10]), .A1(A2P[9]), .B0(A2P[12]), .Y(n3) );
  BUFX3 U4 ( .A(N1), .Y(TDP) );
  NAND3BX1 U5 ( .AN(A2P[13]), .B(n3), .C(n2), .Y(n5) );
  INVXL U6 ( .A(A2P[15]), .Y(n4) );
  NAND2X1 U7 ( .A(A2P[11]), .B(A2P[12]), .Y(n2) );
  AOI21X1 U8 ( .A0(A2P[14]), .A1(n5), .B0(n4), .Y(N1) );
endmodule

