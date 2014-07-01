
module UPA1_0_DW01_add_1 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module UPA1_0 ( PK0, PK1, A1, SIGPK, A1T );
  input [15:0] A1;
  output [15:0] A1T;
  input PK0, PK1, SIGPK;
  wire   N8, N9, N10, N11, N12, N13, N14, ULA1_8_, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, UA1_9_, UA1_8_, UA1_7_, UA1_6_, UA1_5_, UA1_4_,
         UA1_3_, UA1_2_, UA1_1_, UA1_15_, UA1_14_, UA1_13_, UA1_12_, UA1_11_,
         UA1_10_, UA1_0_, N23, N22, N21, N20, N19, N18, N17, sub_60_2_carry_2_,
         sub_60_2_carry_3_, sub_60_2_carry_4_, sub_60_2_carry_5_,
         sub_60_2_carry_6_, sub_60_2_carry_7_, add_66_carry_10_,
         add_66_carry_11_, add_66_carry_12_, add_66_carry_13_,
         add_66_carry_14_, add_66_carry_15_, add_66_carry_9_, add_66_B_6_,
         add_66_B_7_, add_66_B_9_, add_66_A_6_, n1, n2, n3, n4, n5, n6, n7, n8,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n20;
  wire   [9:7] UGA1;
  wire   [7:2] sub_60_carry;
  wire   [8:7] add_66_carry;
  assign N32 = A1[8];
  assign N23 = A1[15];
  assign N22 = A1[14];
  assign N21 = A1[13];
  assign N20 = A1[12];
  assign N19 = A1[11];
  assign N18 = A1[10];
  assign N17 = A1[9];

  AND2X2 U24 ( .A(n10), .B(add_66_A_6_), .Y(UGA1[9]) );
  UPA1_0_DW01_add_1 add_68 ( .A({N23, N22, N21, N20, N19, N18, N17, N32, 
        A1[7:0]}), .B({UA1_15_, UA1_14_, UA1_13_, UA1_12_, UA1_11_, UA1_10_, 
        UA1_9_, UA1_8_, UA1_7_, UA1_6_, UA1_5_, UA1_4_, UA1_3_, UA1_2_, UA1_1_, 
        UA1_0_}), .CI(1'b0), .SUM(A1T) );
  NOR2X1 U3 ( .A(N32), .B(N17), .Y(sub_60_2_carry_2_) );
  OR2X2 U4 ( .A(sub_60_carry[7]), .B(N23), .Y(n20) );
  NOR2X1 U5 ( .A(N32), .B(N17), .Y(sub_60_carry[2]) );
  NOR2X1 U6 ( .A(SIGPK), .B(n17), .Y(add_66_carry[7]) );
  INVXL U7 ( .A(SIGPK), .Y(add_66_A_6_) );
  NOR2XL U8 ( .A(SIGPK), .B(n10), .Y(UGA1[7]) );
  INVX1 U9 ( .A(n20), .Y(add_66_B_9_) );
  ADDFX2 U10 ( .A(UGA1[9]), .B(add_66_B_9_), .CI(add_66_carry_9_), .CO(
        add_66_carry_10_), .S(UA1_9_) );
  ADDFX2 U11 ( .A(UGA1[9]), .B(add_66_B_9_), .CI(add_66_carry_10_), .CO(
        add_66_carry_11_), .S(UA1_10_) );
  ADDFX2 U12 ( .A(UGA1[9]), .B(add_66_B_9_), .CI(add_66_carry_11_), .CO(
        add_66_carry_12_), .S(UA1_11_) );
  ADDFX2 U13 ( .A(UGA1[9]), .B(add_66_B_9_), .CI(add_66_carry_12_), .CO(
        add_66_carry_13_), .S(UA1_12_) );
  ADDFX2 U14 ( .A(UGA1[9]), .B(add_66_B_9_), .CI(add_66_carry_13_), .CO(
        add_66_carry_14_), .S(UA1_13_) );
  ADDFX2 U15 ( .A(UGA1[9]), .B(add_66_B_9_), .CI(add_66_carry_14_), .CO(
        add_66_carry_15_), .S(UA1_14_) );
  XOR3X2 U16 ( .A(UGA1[9]), .B(add_66_B_9_), .C(add_66_carry_15_), .Y(UA1_15_)
         );
  ADDFX2 U17 ( .A(UGA1[9]), .B(ULA1_8_), .CI(add_66_carry[8]), .CO(
        add_66_carry_9_), .S(UA1_8_) );
  OAI2BB1X1 U18 ( .A0N(N40), .A1N(N23), .B0(n20), .Y(ULA1_8_) );
  ADDFX2 U19 ( .A(UGA1[7]), .B(add_66_B_7_), .CI(add_66_carry[7]), .CO(
        add_66_carry[8]), .S(UA1_7_) );
  INVX1 U20 ( .A(n18), .Y(add_66_B_7_) );
  INVX1 U21 ( .A(N23), .Y(n8) );
  AOI22X1 U22 ( .A0(N14), .A1(n8), .B0(N39), .B1(N23), .Y(n18) );
  AOI22X1 U23 ( .A0(N8), .A1(n8), .B0(N33), .B1(N23), .Y(n12) );
  INVX1 U25 ( .A(n17), .Y(add_66_B_6_) );
  AOI22X1 U26 ( .A0(N13), .A1(n8), .B0(N38), .B1(N23), .Y(n17) );
  XOR2XL U27 ( .A(PK1), .B(PK0), .Y(n10) );
  INVX1 U28 ( .A(n11), .Y(UA1_0_) );
  AOI22X1 U29 ( .A0(N32), .A1(n8), .B0(N32), .B1(N23), .Y(n11) );
  INVX1 U30 ( .A(N32), .Y(n6) );
  INVX1 U31 ( .A(n16), .Y(UA1_5_) );
  AOI22X1 U32 ( .A0(N12), .A1(n8), .B0(N37), .B1(N23), .Y(n16) );
  INVX1 U33 ( .A(N19), .Y(n3) );
  INVX1 U34 ( .A(N18), .Y(n2) );
  INVX1 U35 ( .A(N17), .Y(n1) );
  INVX1 U36 ( .A(N20), .Y(n4) );
  INVX1 U37 ( .A(n13), .Y(UA1_2_) );
  AOI22X1 U38 ( .A0(N9), .A1(n8), .B0(N34), .B1(N23), .Y(n13) );
  INVX1 U39 ( .A(n14), .Y(UA1_3_) );
  AOI22X1 U40 ( .A0(N10), .A1(n8), .B0(N35), .B1(N23), .Y(n14) );
  INVX1 U41 ( .A(n15), .Y(UA1_4_) );
  AOI22X1 U42 ( .A0(N11), .A1(n8), .B0(N36), .B1(N23), .Y(n15) );
  INVX1 U43 ( .A(n12), .Y(UA1_1_) );
  INVX1 U44 ( .A(N22), .Y(n7) );
  INVX1 U45 ( .A(N21), .Y(n5) );
  XOR2X1 U46 ( .A(add_66_B_6_), .B(add_66_A_6_), .Y(UA1_6_) );
  AND2X1 U47 ( .A(sub_60_2_carry_7_), .B(n8), .Y(N40) );
  XOR2X1 U48 ( .A(n8), .B(sub_60_2_carry_7_), .Y(N39) );
  AND2X1 U49 ( .A(sub_60_2_carry_6_), .B(n7), .Y(sub_60_2_carry_7_) );
  XOR2X1 U50 ( .A(n7), .B(sub_60_2_carry_6_), .Y(N38) );
  AND2X1 U51 ( .A(sub_60_2_carry_5_), .B(n5), .Y(sub_60_2_carry_6_) );
  XOR2X1 U52 ( .A(n5), .B(sub_60_2_carry_5_), .Y(N37) );
  AND2X1 U53 ( .A(sub_60_2_carry_4_), .B(n4), .Y(sub_60_2_carry_5_) );
  XOR2X1 U54 ( .A(n4), .B(sub_60_2_carry_4_), .Y(N36) );
  AND2X1 U55 ( .A(sub_60_2_carry_3_), .B(n3), .Y(sub_60_2_carry_4_) );
  XOR2X1 U56 ( .A(n3), .B(sub_60_2_carry_3_), .Y(N35) );
  AND2X1 U57 ( .A(sub_60_2_carry_2_), .B(n2), .Y(sub_60_2_carry_3_) );
  XOR2X1 U58 ( .A(n2), .B(sub_60_2_carry_2_), .Y(N34) );
  XOR2X1 U59 ( .A(n1), .B(n6), .Y(N33) );
  XOR2X1 U60 ( .A(n8), .B(sub_60_carry[7]), .Y(N14) );
  AND2X1 U61 ( .A(sub_60_carry[6]), .B(n7), .Y(sub_60_carry[7]) );
  XOR2X1 U62 ( .A(n7), .B(sub_60_carry[6]), .Y(N13) );
  AND2X1 U63 ( .A(sub_60_carry[5]), .B(n5), .Y(sub_60_carry[6]) );
  XOR2X1 U64 ( .A(n5), .B(sub_60_carry[5]), .Y(N12) );
  AND2X1 U65 ( .A(sub_60_carry[4]), .B(n4), .Y(sub_60_carry[5]) );
  XOR2X1 U66 ( .A(n4), .B(sub_60_carry[4]), .Y(N11) );
  AND2X1 U67 ( .A(sub_60_carry[3]), .B(n3), .Y(sub_60_carry[4]) );
  XOR2X1 U68 ( .A(n3), .B(sub_60_carry[3]), .Y(N10) );
  AND2X1 U69 ( .A(sub_60_carry[2]), .B(n2), .Y(sub_60_carry[3]) );
  XOR2X1 U70 ( .A(n2), .B(sub_60_carry[2]), .Y(N9) );
  XOR2X1 U71 ( .A(n1), .B(n6), .Y(N8) );
endmodule

