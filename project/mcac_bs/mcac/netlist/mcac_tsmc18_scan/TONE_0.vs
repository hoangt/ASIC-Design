
module TONE_0 ( A2P, TDP );
  input [15:0] A2P;
  output TDP;
  wire   N0, N1, n1, n2, n3;
  assign TDP = N1;

  AND2X2 U7 ( .A(N0), .B(A2P[15]), .Y(N1) );
  AOI211XL U3 ( .A0(A2P[12]), .A1(A2P[11]), .B0(n3), .C0(A2P[13]), .Y(n2) );
  INVX1 U4 ( .A(n1), .Y(n3) );
  OAI21XL U5 ( .A0(A2P[10]), .A1(A2P[9]), .B0(A2P[12]), .Y(n1) );
  NAND3BX1 U6 ( .AN(n2), .B(A2P[14]), .C(A2P[15]), .Y(N0) );
endmodule

