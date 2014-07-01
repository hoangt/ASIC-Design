
module ADDC_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  XOR3X2 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .Y(SUM[15]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ADDC_0 ( DQ, SEZ, PK0, SIGPK );
  input [15:0] DQ;
  input [14:0] SEZ;
  output PK0, SIGPK;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         DQI_15_, N19, n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;
  wire   [14:0] DQSEZ;
  wire   [14:2] sub_54_carry;
  assign N3 = DQ[0];
  assign SIGPK = N19;

  AND4X2 U5 ( .A(n71), .B(n70), .C(n69), .D(n68), .Y(N19) );
  AND2X2 U21 ( .A(n1), .B(DQ[15]), .Y(DQI_15_) );
  ADDC_0_DW01_add_0 add_57 ( .A({DQI_15_, n20, n21, n22, n23, n24, n25, n26, 
        n27, n47, n48, n49, n50, n51, n52, n19}), .B({SEZ[14], SEZ}), .CI(1'b0), .SUM({PK0, DQSEZ}) );
  INVX1 U2 ( .A(n59), .Y(n52) );
  NOR2BX1 U4 ( .AN(sub_54_carry[7]), .B(DQ[7]), .Y(sub_54_carry[8]) );
  CLKINVXL U6 ( .A(DQ[8]), .Y(n4) );
  AOI22XL U7 ( .A0(DQ[9]), .A1(n2), .B0(N12), .B1(DQ[15]), .Y(n67) );
  INVX1 U8 ( .A(DQ[1]), .Y(n12) );
  INVX1 U9 ( .A(n58), .Y(n20) );
  INVX1 U10 ( .A(DQ[11]), .Y(n16) );
  NAND2X1 U11 ( .A(sub_54_carry[14]), .B(n13), .Y(n1) );
  INVXL U12 ( .A(DQ[12]), .Y(n15) );
  INVXL U13 ( .A(DQ[13]), .Y(n14) );
  INVXL U14 ( .A(DQ[2]), .Y(n11) );
  INVXL U15 ( .A(DQ[3]), .Y(n9) );
  INVXL U16 ( .A(DQ[4]), .Y(n8) );
  INVXL U17 ( .A(DQ[10]), .Y(n17) );
  INVXL U18 ( .A(DQ[9]), .Y(n3) );
  INVXL U19 ( .A(DQ[5]), .Y(n7) );
  INVXL U20 ( .A(DQ[7]), .Y(n5) );
  INVXL U22 ( .A(DQ[6]), .Y(n6) );
  AOI22XL U23 ( .A0(DQ[14]), .A1(n2), .B0(N17), .B1(DQ[15]), .Y(n58) );
  AOI22XL U24 ( .A0(DQ[11]), .A1(n2), .B0(N14), .B1(DQ[15]), .Y(n55) );
  INVX1 U25 ( .A(n57), .Y(n21) );
  INVX1 U26 ( .A(n53), .Y(n19) );
  AOI22XL U27 ( .A0(DQ[1]), .A1(n2), .B0(N4), .B1(DQ[15]), .Y(n59) );
  INVXL U28 ( .A(N3), .Y(n18) );
  INVX1 U29 ( .A(DQ[14]), .Y(n13) );
  INVX1 U30 ( .A(DQ[15]), .Y(n2) );
  NOR4X1 U31 ( .A(DQSEZ[6]), .B(DQSEZ[5]), .C(DQSEZ[4]), .D(DQSEZ[3]), .Y(n69)
         );
  NOR4X1 U32 ( .A(DQSEZ[12]), .B(DQSEZ[11]), .C(DQSEZ[10]), .D(DQSEZ[0]), .Y(
        n71) );
  NOR4X1 U33 ( .A(DQSEZ[2]), .B(DQSEZ[1]), .C(DQSEZ[14]), .D(DQSEZ[13]), .Y(
        n70) );
  NOR4X1 U34 ( .A(PK0), .B(DQSEZ[9]), .C(DQSEZ[8]), .D(DQSEZ[7]), .Y(n68) );
  INVX1 U35 ( .A(n60), .Y(n51) );
  INVX1 U36 ( .A(n56), .Y(n22) );
  AOI22X1 U37 ( .A0(DQ[12]), .A1(n2), .B0(N15), .B1(DQ[15]), .Y(n56) );
  AOI22XL U38 ( .A0(DQ[13]), .A1(n2), .B0(N16), .B1(DQ[15]), .Y(n57) );
  INVX1 U39 ( .A(n63), .Y(n48) );
  AOI22XL U40 ( .A0(DQ[5]), .A1(n2), .B0(N8), .B1(DQ[15]), .Y(n63) );
  INVX1 U41 ( .A(n55), .Y(n23) );
  INVX1 U42 ( .A(n54), .Y(n24) );
  AOI22XL U43 ( .A0(DQ[10]), .A1(n2), .B0(N13), .B1(DQ[15]), .Y(n54) );
  INVX1 U44 ( .A(n65), .Y(n27) );
  AOI22XL U45 ( .A0(DQ[7]), .A1(n2), .B0(N10), .B1(DQ[15]), .Y(n65) );
  INVX1 U46 ( .A(n66), .Y(n26) );
  AOI22XL U47 ( .A0(DQ[8]), .A1(n2), .B0(N11), .B1(DQ[15]), .Y(n66) );
  INVX1 U48 ( .A(n67), .Y(n25) );
  INVX1 U49 ( .A(n64), .Y(n47) );
  AOI22XL U50 ( .A0(DQ[6]), .A1(n2), .B0(N9), .B1(DQ[15]), .Y(n64) );
  INVX1 U51 ( .A(n62), .Y(n49) );
  AOI22XL U52 ( .A0(DQ[4]), .A1(n2), .B0(N7), .B1(DQ[15]), .Y(n62) );
  INVX1 U53 ( .A(n61), .Y(n50) );
  AOI22XL U54 ( .A0(DQ[3]), .A1(n2), .B0(N6), .B1(DQ[15]), .Y(n61) );
  AOI22XL U55 ( .A0(N3), .A1(n2), .B0(N3), .B1(DQ[15]), .Y(n53) );
  AOI22XL U56 ( .A0(DQ[2]), .A1(n2), .B0(N5), .B1(DQ[15]), .Y(n60) );
  XOR2X1 U57 ( .A(n13), .B(sub_54_carry[14]), .Y(N17) );
  AND2X1 U58 ( .A(sub_54_carry[13]), .B(n14), .Y(sub_54_carry[14]) );
  XOR2X1 U59 ( .A(n14), .B(sub_54_carry[13]), .Y(N16) );
  AND2X1 U60 ( .A(sub_54_carry[12]), .B(n15), .Y(sub_54_carry[13]) );
  XOR2X1 U61 ( .A(n15), .B(sub_54_carry[12]), .Y(N15) );
  AND2X1 U62 ( .A(sub_54_carry[11]), .B(n16), .Y(sub_54_carry[12]) );
  XOR2X1 U63 ( .A(n16), .B(sub_54_carry[11]), .Y(N14) );
  AND2X1 U64 ( .A(sub_54_carry[10]), .B(n17), .Y(sub_54_carry[11]) );
  XOR2X1 U65 ( .A(n17), .B(sub_54_carry[10]), .Y(N13) );
  AND2X1 U66 ( .A(sub_54_carry[9]), .B(n3), .Y(sub_54_carry[10]) );
  XOR2X1 U67 ( .A(n3), .B(sub_54_carry[9]), .Y(N12) );
  AND2X1 U68 ( .A(sub_54_carry[8]), .B(n4), .Y(sub_54_carry[9]) );
  XOR2X1 U69 ( .A(n4), .B(sub_54_carry[8]), .Y(N11) );
  XOR2X1 U70 ( .A(n5), .B(sub_54_carry[7]), .Y(N10) );
  AND2X1 U71 ( .A(sub_54_carry[6]), .B(n6), .Y(sub_54_carry[7]) );
  XOR2X1 U72 ( .A(n6), .B(sub_54_carry[6]), .Y(N9) );
  AND2X1 U73 ( .A(sub_54_carry[5]), .B(n7), .Y(sub_54_carry[6]) );
  XOR2X1 U74 ( .A(n7), .B(sub_54_carry[5]), .Y(N8) );
  AND2X1 U75 ( .A(sub_54_carry[4]), .B(n8), .Y(sub_54_carry[5]) );
  XOR2X1 U76 ( .A(n8), .B(sub_54_carry[4]), .Y(N7) );
  AND2X1 U77 ( .A(sub_54_carry[3]), .B(n9), .Y(sub_54_carry[4]) );
  XOR2X1 U78 ( .A(n9), .B(sub_54_carry[3]), .Y(N6) );
  AND2X1 U79 ( .A(sub_54_carry[2]), .B(n11), .Y(sub_54_carry[3]) );
  XOR2X1 U80 ( .A(n11), .B(sub_54_carry[2]), .Y(N5) );
  AND2X1 U81 ( .A(n18), .B(n12), .Y(sub_54_carry[2]) );
  XOR2X1 U82 ( .A(n12), .B(n18), .Y(N4) );
endmodule

