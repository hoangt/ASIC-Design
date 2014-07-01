
module SUBTC_1_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, DIFF_14_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16;
  wire   [14:3] carry;
  assign DIFF[0] = B[0];
  assign DIFF[14] = DIFF_14_;

  ADDFX2 U2_2 ( .A(A[2]), .B(n14), .CI(n1), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n13), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n11), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n12), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_12 ( .A(A[12]), .B(n4), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n7), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX1 U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFX1 U2_6 ( .A(A[6]), .B(n10), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX1 U2_10 ( .A(A[10]), .B(n6), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX1 U2_11 ( .A(A[11]), .B(n5), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n3), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  NOR2X1 U1 ( .A(B[1]), .B(B[0]), .Y(n1) );
  INVX1 U2 ( .A(B[13]), .Y(n3) );
  INVX1 U3 ( .A(carry[14]), .Y(DIFF_14_) );
  XOR2X1 U4 ( .A(n15), .B(n16), .Y(DIFF[1]) );
  INVX1 U5 ( .A(B[7]), .Y(n9) );
  INVX1 U6 ( .A(B[8]), .Y(n8) );
  INVX1 U7 ( .A(B[10]), .Y(n6) );
  INVX1 U8 ( .A(B[11]), .Y(n5) );
  INVX1 U9 ( .A(B[9]), .Y(n7) );
  INVX1 U10 ( .A(B[12]), .Y(n4) );
  INVX1 U11 ( .A(B[4]), .Y(n12) );
  INVX1 U12 ( .A(B[5]), .Y(n11) );
  INVX1 U13 ( .A(B[6]), .Y(n10) );
  INVX1 U14 ( .A(B[0]), .Y(n16) );
  INVX1 U15 ( .A(B[1]), .Y(n15) );
  INVX1 U16 ( .A(B[3]), .Y(n13) );
  INVX1 U17 ( .A(B[2]), .Y(n14) );
endmodule

