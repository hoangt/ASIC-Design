
module ADDC_1 ( DQ, SEZ, PK0, SIGPK );
  input [15:0] DQ;
  input [14:0] SEZ;
  output PK0, SIGPK;
  wire   N3, DQI_15_, N19, n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59;
  wire   [14:0] DQSEZ;
  assign N3 = DQ[0];
  assign SIGPK = N19;

  XOR2X2 U2 ( .A(DQ[14]), .B(n18), .Y(n46) );
  NAND2X1 U4 ( .A(n6), .B(n15), .Y(n17) );
  NOR2BX1 U5 ( .AN(n29), .B(n34), .Y(n30) );
  NOR2XL U6 ( .A(n9), .B(n34), .Y(n20) );
  OR2X2 U7 ( .A(n6), .B(n34), .Y(n2) );
  AND2X2 U8 ( .A(n17), .B(DQ[15]), .Y(n18) );
  NOR2X1 U9 ( .A(n13), .B(n34), .Y(n33) );
  NOR2X2 U10 ( .A(N3), .B(DQ[1]), .Y(n13) );
  NOR3X2 U11 ( .A(DQ[4]), .B(DQ[3]), .C(DQ[5]), .Y(n4) );
  NOR2BX2 U12 ( .AN(N3), .B(n34), .Y(n35) );
  NOR2X2 U13 ( .A(n7), .B(n34), .Y(n19) );
  NOR2BX4 U14 ( .AN(n7), .B(DQ[12]), .Y(n6) );
  NOR2X1 U15 ( .A(PK0), .B(DQSEZ[14]), .Y(n40) );
  INVX1 U16 ( .A(DQ[8]), .Y(n14) );
  NAND4X1 U17 ( .A(n39), .B(n38), .C(n37), .D(n36), .Y(n45) );
  XOR2X1 U18 ( .A(DQ[11]), .B(n20), .Y(n49) );
  XNOR2X1 U19 ( .A(DQ[13]), .B(n2), .Y(n47) );
  INVX1 U20 ( .A(DQ[13]), .Y(n15) );
  AND2X2 U21 ( .A(n8), .B(n14), .Y(n1) );
  INVX1 U22 ( .A(DQ[15]), .Y(n34) );
  NOR2X4 U23 ( .A(n45), .B(n44), .Y(N19) );
  NOR2XL U24 ( .A(DQ[14]), .B(n17), .Y(n16) );
  NOR2XL U25 ( .A(n8), .B(n34), .Y(n23) );
  INVXL U26 ( .A(DQ[3]), .Y(n27) );
  INVXL U27 ( .A(DQ[1]), .Y(n3) );
  NOR2X1 U28 ( .A(DQSEZ[0]), .B(DQSEZ[1]), .Y(n38) );
  NOR2BX4 U29 ( .AN(n12), .B(DQ[10]), .Y(n9) );
  NOR2BX4 U30 ( .AN(n9), .B(DQ[11]), .Y(n7) );
  NOR2BX4 U31 ( .AN(n25), .B(DQ[6]), .Y(n11) );
  NOR2XL U32 ( .A(n1), .B(n34), .Y(n22) );
  INVXL U33 ( .A(DQ[2]), .Y(n31) );
  NOR2XL U34 ( .A(n12), .B(n34), .Y(n21) );
  NOR2XL U35 ( .A(n11), .B(n34), .Y(n24) );
  NOR2XL U36 ( .A(n25), .B(n34), .Y(n26) );
  AND3X4 U37 ( .A(n4), .B(n3), .C(n5), .Y(n25) );
  NOR2X4 U38 ( .A(DQ[2]), .B(N3), .Y(n5) );
  XNOR2X1 U39 ( .A(DQ[5]), .B(n28), .Y(n55) );
  NAND4X2 U40 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(n44) );
  XOR2X1 U41 ( .A(DQ[12]), .B(n19), .Y(n48) );
  XOR2X1 U42 ( .A(DQ[2]), .B(n33), .Y(n58) );
  NOR2X1 U43 ( .A(n16), .B(n34), .Y(DQI_15_) );
  XOR2X1 U44 ( .A(DQ[10]), .B(n21), .Y(n50) );
  XOR2X1 U45 ( .A(DQ[8]), .B(n23), .Y(n52) );
  XOR2X1 U46 ( .A(DQ[9]), .B(n22), .Y(n51) );
  XOR2X1 U47 ( .A(DQ[6]), .B(n26), .Y(n54) );
  XOR2X1 U48 ( .A(DQ[7]), .B(n24), .Y(n53) );
  XOR2X1 U49 ( .A(DQ[3]), .B(n32), .Y(n57) );
  AOI21X1 U50 ( .A0(n13), .A1(n31), .B0(n34), .Y(n32) );
  NOR2BX1 U51 ( .AN(n11), .B(DQ[7]), .Y(n8) );
  NOR2BX4 U52 ( .AN(n1), .B(DQ[9]), .Y(n12) );
  XOR2X1 U53 ( .A(DQ[4]), .B(n30), .Y(n56) );
  XOR2X1 U54 ( .A(DQ[1]), .B(n35), .Y(n59) );
  OAI21XL U55 ( .A0(DQ[4]), .A1(n29), .B0(DQ[15]), .Y(n28) );
  NOR2X1 U56 ( .A(DQSEZ[6]), .B(DQSEZ[7]), .Y(n36) );
  NOR2X1 U57 ( .A(DQSEZ[12]), .B(DQSEZ[13]), .Y(n41) );
  NOR2X1 U58 ( .A(DQSEZ[4]), .B(DQSEZ[5]), .Y(n37) );
  NOR2X1 U59 ( .A(DQSEZ[8]), .B(DQSEZ[9]), .Y(n42) );
  NOR2X1 U60 ( .A(DQSEZ[2]), .B(DQSEZ[3]), .Y(n39) );
  NOR2X1 U61 ( .A(DQSEZ[10]), .B(DQSEZ[11]), .Y(n43) );
  NAND3BX1 U62 ( .AN(DQ[2]), .B(n27), .C(n13), .Y(n29) );
  ADDC_1_DW01_add_1 add_57 ( .A({DQI_15_, n46, n47, n48, n49, n50, n51, n52, 
        n53, n54, n55, n56, n57, n58, n59, N3}), .B({SEZ[14], SEZ}), .CI(1'b0), 
        .SUM({PK0, DQSEZ}) );
endmodule

