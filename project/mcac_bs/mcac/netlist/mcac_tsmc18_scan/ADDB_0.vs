
module ADDB_0 ( DQ, SE, SR );
  input [15:0] DQ;
  input [14:0] SE;
  output [15:0] SR;
  wire   N3, DQI_15_, n1, n2, n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61;
  assign N3 = DQ[0];

  INVX2 U2 ( .A(DQ[2]), .Y(n43) );
  NOR2X2 U4 ( .A(DQ[3]), .B(DQ[2]), .Y(n41) );
  INVX2 U5 ( .A(n40), .Y(n45) );
  INVX1 U6 ( .A(n20), .Y(n21) );
  XOR2X1 U7 ( .A(DQ[9]), .B(n27), .Y(n53) );
  XOR2X2 U8 ( .A(DQ[14]), .B(n8), .Y(n48) );
  AOI31X1 U9 ( .A0(n30), .A1(n26), .A2(n10), .B0(n13), .Y(n27) );
  INVX2 U10 ( .A(n33), .Y(n30) );
  AOI21X2 U11 ( .A0(n45), .A1(n43), .B0(n13), .Y(n44) );
  NOR2X2 U12 ( .A(n9), .B(n13), .Y(n8) );
  NAND3XL U13 ( .A(n24), .B(n17), .C(n18), .Y(n19) );
  AND2X4 U14 ( .A(n40), .B(DQ[15]), .Y(n46) );
  OR2X2 U15 ( .A(n19), .B(DQ[12]), .Y(n20) );
  OAI31X1 U16 ( .A0(n33), .A1(n32), .A2(DQ[6]), .B0(DQ[15]), .Y(n1) );
  INVX1 U17 ( .A(n1), .Y(n31) );
  OAI21XL U18 ( .A0(n2), .A1(DQ[14]), .B0(DQ[15]), .Y(n3) );
  INVX1 U19 ( .A(n9), .Y(n2) );
  INVX1 U20 ( .A(n3), .Y(DQI_15_) );
  OR2X4 U21 ( .A(DQ[8]), .B(DQ[7]), .Y(n25) );
  XOR2X1 U22 ( .A(n46), .B(DQ[2]), .Y(n60) );
  XOR2X2 U23 ( .A(DQ[3]), .B(n44), .Y(n59) );
  XOR2X1 U24 ( .A(DQ[8]), .B(n29), .Y(n54) );
  AOI31XL U25 ( .A0(n30), .A1(n28), .A2(n10), .B0(n13), .Y(n29) );
  XOR2X1 U26 ( .A(DQ[7]), .B(n31), .Y(n55) );
  BUFX3 U27 ( .A(DQ[1]), .Y(n4) );
  NAND4BX2 U28 ( .AN(n25), .B(n30), .C(n10), .D(n15), .Y(n16) );
  XOR2X2 U29 ( .A(DQ[13]), .B(n22), .Y(n49) );
  NOR3X4 U30 ( .A(DQ[2]), .B(DQ[6]), .C(DQ[5]), .Y(n10) );
  INVX8 U31 ( .A(DQ[9]), .Y(n15) );
  XOR2X2 U32 ( .A(DQ[5]), .B(n38), .Y(n57) );
  INVXL U33 ( .A(n25), .Y(n26) );
  INVX4 U34 ( .A(DQ[3]), .Y(n14) );
  INVX1 U35 ( .A(DQ[10]), .Y(n17) );
  INVX1 U36 ( .A(DQ[11]), .Y(n18) );
  AND2X2 U37 ( .A(n20), .B(DQ[15]), .Y(n22) );
  AND2X2 U39 ( .A(n19), .B(DQ[15]), .Y(n23) );
  NOR2BX4 U40 ( .AN(N3), .B(n13), .Y(n47) );
  AND2X2 U41 ( .A(n24), .B(n17), .Y(n7) );
  OAI21X2 U42 ( .A0(n33), .A1(n32), .B0(DQ[15]), .Y(n34) );
  OR2X2 U43 ( .A(DQ[2]), .B(DQ[5]), .Y(n32) );
  XOR2X2 U44 ( .A(n4), .B(n47), .Y(n61) );
  XOR2X2 U45 ( .A(DQ[4]), .B(n42), .Y(n58) );
  AOI21X2 U46 ( .A0(n41), .A1(n45), .B0(n13), .Y(n42) );
  OR2X2 U47 ( .A(n7), .B(n13), .Y(n11) );
  NOR2BX4 U48 ( .AN(n21), .B(DQ[13]), .Y(n9) );
  INVX1 U49 ( .A(DQ[15]), .Y(n13) );
  INVXL U50 ( .A(DQ[6]), .Y(n35) );
  NAND2BX2 U51 ( .AN(N3), .B(n39), .Y(n40) );
  INVXL U52 ( .A(DQ[7]), .Y(n28) );
  NOR2XL U53 ( .A(n4), .B(DQ[2]), .Y(n36) );
  XNOR2X4 U54 ( .A(DQ[11]), .B(n11), .Y(n51) );
  XNOR2X1 U55 ( .A(DQ[10]), .B(n12), .Y(n52) );
  OR2XL U56 ( .A(n24), .B(n13), .Y(n12) );
  NOR3XL U57 ( .A(N3), .B(DQ[4]), .C(DQ[3]), .Y(n37) );
  XOR2X2 U58 ( .A(n35), .B(n34), .Y(n56) );
  NAND4BBX4 U59 ( .AN(DQ[4]), .BN(N3), .C(n14), .D(n39), .Y(n33) );
  INVX8 U60 ( .A(DQ[1]), .Y(n39) );
  CLKINVX3 U61 ( .A(n16), .Y(n24) );
  XOR2X4 U62 ( .A(n23), .B(DQ[12]), .Y(n50) );
  AOI21X2 U63 ( .A0(n37), .A1(n36), .B0(n13), .Y(n38) );
  ADDB_0_DW01_add_6 add_83 ( .A({DQI_15_, n48, n49, n50, n51, n52, n53, n54, 
        n55, n56, n57, n58, n59, n60, n61, N3}), .B({SE[14], SE}), .CI(1'b0), 
        .SUM(SR) );
endmodule

