
module ADDB_1 ( DQ, SE, SR );
  input [15:0] DQ;
  input [14:0] SE;
  output [15:0] SR;
  wire   N3, DQI_15_, n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46;
  assign N3 = DQ[0];

  NOR2BX1 U2 ( .AN(N3), .B(n31), .Y(n32) );
  NOR2X1 U4 ( .A(DQ[3]), .B(n27), .Y(n25) );
  OAI21XL U5 ( .A0(n1), .A1(DQ[14]), .B0(DQ[15]), .Y(n2) );
  INVX1 U6 ( .A(n3), .Y(n1) );
  INVX1 U7 ( .A(n2), .Y(DQI_15_) );
  NOR2X1 U8 ( .A(N3), .B(DQ[1]), .Y(n14) );
  NOR2BXL U9 ( .AN(n4), .B(DQ[13]), .Y(n3) );
  INVXL U10 ( .A(DQ[15]), .Y(n31) );
  NOR2BXL U11 ( .AN(n8), .B(DQ[9]), .Y(n9) );
  NOR2BXL U12 ( .AN(n10), .B(DQ[11]), .Y(n11) );
  NOR2BXL U13 ( .AN(n9), .B(DQ[10]), .Y(n10) );
  NOR2BXL U14 ( .AN(n7), .B(DQ[8]), .Y(n8) );
  NOR2BXL U15 ( .AN(n13), .B(DQ[6]), .Y(n5) );
  INVXL U16 ( .A(DQ[3]), .Y(n28) );
  NOR2BXL U17 ( .AN(n12), .B(DQ[5]), .Y(n13) );
  NOR2BXL U18 ( .AN(n25), .B(DQ[4]), .Y(n12) );
  NOR2BX1 U19 ( .AN(n11), .B(DQ[12]), .Y(n4) );
  NOR2BX1 U20 ( .AN(n5), .B(DQ[7]), .Y(n7) );
  XOR2X1 U21 ( .A(DQ[14]), .B(n15), .Y(n33) );
  NOR2X1 U22 ( .A(n3), .B(n31), .Y(n15) );
  XOR2X1 U23 ( .A(n29), .B(n28), .Y(n44) );
  NAND2X1 U24 ( .A(DQ[15]), .B(n27), .Y(n29) );
  XOR2X1 U25 ( .A(DQ[1]), .B(n32), .Y(n46) );
  XOR2X1 U26 ( .A(DQ[6]), .B(n23), .Y(n41) );
  NOR2X1 U27 ( .A(n13), .B(n31), .Y(n23) );
  XOR2X1 U28 ( .A(DQ[9]), .B(n20), .Y(n38) );
  NOR2X1 U29 ( .A(n8), .B(n31), .Y(n20) );
  XOR2X1 U30 ( .A(DQ[10]), .B(n19), .Y(n37) );
  NOR2X1 U31 ( .A(n9), .B(n31), .Y(n19) );
  XOR2X1 U32 ( .A(DQ[11]), .B(n18), .Y(n36) );
  NOR2X1 U33 ( .A(n10), .B(n31), .Y(n18) );
  XOR2X1 U34 ( .A(DQ[4]), .B(n26), .Y(n43) );
  NOR2X1 U35 ( .A(n25), .B(n31), .Y(n26) );
  XOR2X1 U36 ( .A(DQ[5]), .B(n24), .Y(n42) );
  NOR2X1 U37 ( .A(n12), .B(n31), .Y(n24) );
  XOR2X1 U38 ( .A(DQ[7]), .B(n22), .Y(n40) );
  NOR2X1 U39 ( .A(n5), .B(n31), .Y(n22) );
  XOR2X1 U40 ( .A(DQ[8]), .B(n21), .Y(n39) );
  NOR2X1 U41 ( .A(n7), .B(n31), .Y(n21) );
  XOR2X1 U42 ( .A(DQ[12]), .B(n17), .Y(n35) );
  NOR2X1 U43 ( .A(n11), .B(n31), .Y(n17) );
  XOR2X1 U44 ( .A(DQ[13]), .B(n16), .Y(n34) );
  NOR2X1 U45 ( .A(n4), .B(n31), .Y(n16) );
  NOR2X1 U46 ( .A(n14), .B(n31), .Y(n30) );
  XOR2X1 U47 ( .A(DQ[2]), .B(n30), .Y(n45) );
  NAND2BX1 U48 ( .AN(DQ[2]), .B(n14), .Y(n27) );
  ADDB_1_DW01_add_0 add_83 ( .A({DQI_15_, n33, n34, n35, n36, n37, n38, n39, 
        n40, n41, n42, n43, n44, n45, n46, N3}), .B({SE[14], SE}), .CI(1'b0), 
        .SUM(SR) );
endmodule

