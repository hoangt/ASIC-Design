
module UPA1_1 ( PK0, PK1, A1, SIGPK, A1T );
  input [15:0] A1;
  output [15:0] A1T;
  input PK0, PK1, SIGPK;
  wire   N32, UA1_9_, UA1_8_, UA1_7_, UA1_6_, UA1_5_, UA1_4_, UA1_3_, UA1_2_,
         UA1_1_, UA1_15_, UA1_14_, UA1_13_, UA1_12_, UA1_11_, UA1_10_, N23,
         N22, N21, N20, N19, N18, N17, sub_60_2_carry_2_, sub_60_2_carry_3_,
         sub_60_2_carry_4_, sub_60_2_carry_5_, sub_60_2_carry_6_, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37;
  wire   [7:2] sub_60_carry;
  assign N32 = A1[8];
  assign N23 = A1[15];
  assign N22 = A1[14];
  assign N21 = A1[13];
  assign N20 = A1[12];
  assign N19 = A1[11];
  assign N18 = A1[10];
  assign N17 = A1[9];

  OAI21XL U3 ( .A0(n1), .A1(n20), .B0(n18), .Y(UA1_10_) );
  INVX1 U4 ( .A(n19), .Y(n1) );
  OAI21XL U5 ( .A0(n2), .A1(n20), .B0(n18), .Y(UA1_11_) );
  INVX1 U6 ( .A(n19), .Y(n2) );
  OAI21XL U7 ( .A0(n3), .A1(n20), .B0(n18), .Y(UA1_12_) );
  INVX1 U8 ( .A(n19), .Y(n3) );
  OAI21XL U9 ( .A0(n4), .A1(n20), .B0(n18), .Y(UA1_13_) );
  INVX1 U10 ( .A(n19), .Y(n4) );
  OAI21XL U11 ( .A0(n5), .A1(n20), .B0(n18), .Y(UA1_9_) );
  INVX1 U12 ( .A(n19), .Y(n5) );
  NOR2X1 U13 ( .A(N32), .B(N17), .Y(sub_60_carry[2]) );
  OAI21XL U14 ( .A0(n6), .A1(n20), .B0(n18), .Y(UA1_14_) );
  INVX1 U15 ( .A(n19), .Y(n6) );
  NOR2X1 U16 ( .A(N32), .B(N17), .Y(sub_60_2_carry_2_) );
  OAI21XL U17 ( .A0(n7), .A1(n20), .B0(n18), .Y(UA1_15_) );
  INVX1 U18 ( .A(n19), .Y(n7) );
  OAI21XL U19 ( .A0(n15), .A1(n22), .B0(n14), .Y(n20) );
  INVX1 U20 ( .A(n23), .Y(n13) );
  NAND2X1 U21 ( .A(n19), .B(n18), .Y(n21) );
  MXI2X1 U22 ( .A(sub_60_carry[7]), .B(n9), .S0(N23), .Y(n8) );
  XNOR2XL U23 ( .A(n21), .B(n20), .Y(UA1_8_) );
  NAND2XL U24 ( .A(n8), .B(n13), .Y(n14) );
  XOR3X2 U25 ( .A(n8), .B(n22), .C(n23), .Y(UA1_7_) );
  NAND2BX1 U26 ( .AN(n17), .B(n10), .Y(n18) );
  NAND2BX1 U27 ( .AN(SIGPK), .B(n24), .Y(n22) );
  NOR2X1 U28 ( .A(n8), .B(n13), .Y(n15) );
  OR2XL U29 ( .A(SIGPK), .B(n16), .Y(n17) );
  NAND2BX1 U30 ( .AN(SIGPK), .B(n16), .Y(n23) );
  NAND2BX1 U31 ( .AN(n10), .B(n17), .Y(n19) );
  XNOR2XL U32 ( .A(PK1), .B(PK0), .Y(n16) );
  XNOR2X1 U33 ( .A(SIGPK), .B(n24), .Y(UA1_6_) );
  NAND2X1 U34 ( .A(sub_60_2_carry_6_), .B(n33), .Y(n9) );
  NOR2X1 U35 ( .A(sub_60_carry[7]), .B(N23), .Y(n10) );
  INVX1 U36 ( .A(N22), .Y(n33) );
  INVX1 U37 ( .A(N21), .Y(n34) );
  INVX1 U38 ( .A(N20), .Y(n35) );
  INVX1 U39 ( .A(N19), .Y(n36) );
  INVX1 U40 ( .A(N18), .Y(n37) );
  XOR2X1 U41 ( .A(N17), .B(N32), .Y(UA1_1_) );
  MXI2X1 U42 ( .A(n30), .B(n29), .S0(N23), .Y(UA1_3_) );
  XOR2X1 U43 ( .A(sub_60_2_carry_3_), .B(N19), .Y(n29) );
  XOR2X1 U44 ( .A(sub_60_carry[3]), .B(N19), .Y(n30) );
  MXI2X1 U45 ( .A(n12), .B(n11), .S0(N23), .Y(n24) );
  XOR2X1 U46 ( .A(sub_60_2_carry_6_), .B(N22), .Y(n11) );
  XOR2X1 U47 ( .A(sub_60_carry[6]), .B(N22), .Y(n12) );
  MXI2X1 U48 ( .A(n26), .B(n25), .S0(N23), .Y(UA1_5_) );
  XOR2X1 U49 ( .A(sub_60_2_carry_5_), .B(N21), .Y(n25) );
  XOR2X1 U50 ( .A(sub_60_carry[5]), .B(N21), .Y(n26) );
  MXI2X1 U51 ( .A(n28), .B(n27), .S0(N23), .Y(UA1_4_) );
  XOR2X1 U52 ( .A(sub_60_2_carry_4_), .B(N20), .Y(n27) );
  XOR2X1 U53 ( .A(sub_60_carry[4]), .B(N20), .Y(n28) );
  MXI2X1 U54 ( .A(n32), .B(n31), .S0(N23), .Y(UA1_2_) );
  XOR2X1 U55 ( .A(sub_60_2_carry_2_), .B(N18), .Y(n31) );
  XOR2X1 U56 ( .A(sub_60_carry[2]), .B(N18), .Y(n32) );
  AND2X1 U57 ( .A(sub_60_2_carry_5_), .B(n34), .Y(sub_60_2_carry_6_) );
  AND2X1 U58 ( .A(sub_60_2_carry_4_), .B(n35), .Y(sub_60_2_carry_5_) );
  AND2X1 U59 ( .A(sub_60_2_carry_3_), .B(n36), .Y(sub_60_2_carry_4_) );
  AND2X1 U60 ( .A(sub_60_2_carry_2_), .B(n37), .Y(sub_60_2_carry_3_) );
  AND2X1 U61 ( .A(sub_60_carry[6]), .B(n33), .Y(sub_60_carry[7]) );
  AND2X1 U62 ( .A(sub_60_carry[5]), .B(n34), .Y(sub_60_carry[6]) );
  AND2X1 U63 ( .A(sub_60_carry[4]), .B(n35), .Y(sub_60_carry[5]) );
  AND2X1 U64 ( .A(sub_60_carry[3]), .B(n36), .Y(sub_60_carry[4]) );
  AND2X1 U65 ( .A(sub_60_carry[2]), .B(n37), .Y(sub_60_carry[3]) );
  UPA1_1_DW01_add_1 add_68 ( .A({N23, N22, N21, N20, N19, N18, N17, N32, 
        A1[7:0]}), .B({UA1_15_, UA1_14_, UA1_13_, UA1_12_, UA1_11_, UA1_10_, 
        UA1_9_, UA1_8_, UA1_7_, UA1_6_, UA1_5_, UA1_4_, UA1_3_, UA1_2_, UA1_1_, 
        N32}), .CI(1'b0), .SUM(A1T) );
endmodule

