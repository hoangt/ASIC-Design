
module TRANS_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [20:0] A;
  input [20:0] B;
  output [20:0] SUM;
  input CI;
  output CO;
  wire   carry_9_, carry_8_, carry_7_, carry_6_, carry_5_, carry_4_, carry_3_,
         carry_2_, carry_20_, carry_1_, carry_19_, carry_18_, carry_17_,
         carry_16_, carry_15_, carry_14_, carry_13_, carry_12_, carry_11_,
         carry_10_;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry_1_), .CO(carry_2_), .S(SUM[1])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry_8_), .CO(carry_9_), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry_7_), .CO(carry_8_), .S(SUM[7])
         );
  ADDFX2 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry_16_), .CO(carry_17_), .S(
        SUM[16]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry_6_), .CO(carry_7_), .S(SUM[6])
         );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry_15_), .CO(carry_16_), .S(
        SUM[15]) );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry_5_), .CO(carry_6_), .S(SUM[5])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry_14_), .CO(carry_15_), .S(
        SUM[14]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry_3_), .CO(carry_4_), .S(SUM[3])
         );
  ADDFX2 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry_18_), .CO(carry_19_), .S(
        SUM[18]) );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry_4_), .CO(carry_5_), .S(SUM[4])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry_2_), .CO(carry_3_), .S(SUM[2])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry_9_), .CO(carry_10_), .S(SUM[9])
         );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry_12_), .CO(carry_13_), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry_11_), .CO(carry_12_), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry_10_), .CO(carry_11_), .S(
        SUM[10]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry_13_), .CO(carry_14_), .S(
        SUM[13]) );
  ADDFX2 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry_17_), .CO(carry_18_), .S(
        SUM[17]) );
  ADDFX2 U1_19 ( .A(A[19]), .B(B[19]), .CI(carry_19_), .CO(carry_20_), .S(
        SUM[19]) );
  XOR2X1 U1 ( .A(A[20]), .B(carry_20_), .Y(SUM[20]) );
  AND2X1 U2 ( .A(B[0]), .B(A[0]), .Y(carry_1_) );
endmodule

