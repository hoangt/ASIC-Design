
module MIX_0 ( AL, YU, YL, Y );
  input [6:0] AL;
  input [12:0] YU;
  input [18:0] YL;
  output [12:0] Y;
  wire   N18, DIFM_13_, N32, N9, N8, N7, N6, N5, N4, N3, N2, N14, N13, N12,
         N11, N10, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1,
         SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3,
         SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5,
         SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7,
         SYNOPSYS_UNCONNECTED__8, n16, n97;
  wire   [13:1] DIF;
  wire   [14:1] PRODM;
  assign N9 = YU[7];
  assign N8 = YU[6];
  assign N7 = YU[5];
  assign N6 = YU[4];
  assign N5 = YU[3];
  assign N4 = YU[2];
  assign N3 = YU[1];
  assign N2 = YU[0];
  assign N14 = YU[12];
  assign N13 = YU[11];
  assign N12 = YU[10];
  assign N11 = YU[9];
  assign N10 = YU[8];

  CLKINVX3 U3 ( .A(n1), .Y(n2) );
  INVX1 U5 ( .A(DIF[11]), .Y(n33) );
  NAND2XL U6 ( .A(n30), .B(n62), .Y(n26) );
  NOR2BX2 U7 ( .AN(n23), .B(PRODM[9]), .Y(n6) );
  NOR2X1 U10 ( .A(n35), .B(n31), .Y(n21) );
  INVX2 U11 ( .A(n34), .Y(n35) );
  XNOR2X1 U12 ( .A(PRODM[1]), .B(n74), .Y(n88) );
  NOR2X1 U13 ( .A(PRODM[3]), .B(PRODM[4]), .Y(n52) );
  XOR2X2 U14 ( .A(DIF[10]), .B(n37), .Y(n96) );
  CLKINVX3 U15 ( .A(n12), .Y(n13) );
  INVX1 U16 ( .A(DIFM_13_), .Y(n12) );
  BUFX8 U17 ( .A(n72), .Y(n31) );
  XNOR2X1 U18 ( .A(DIF[8]), .B(n40), .Y(n1) );
  OAI21X1 U19 ( .A0(n47), .A1(DIF[3]), .B0(n30), .Y(n46) );
  XOR2X4 U20 ( .A(DIF[5]), .B(n45), .Y(n92) );
  NOR3X2 U22 ( .A(PRODM[8]), .B(PRODM[7]), .C(n59), .Y(n23) );
  XOR2X1 U23 ( .A(PRODM[11]), .B(n57), .Y(n78) );
  INVX1 U24 ( .A(N18), .Y(n49) );
  BUFX3 U25 ( .A(n38), .Y(n11) );
  INVX1 U26 ( .A(n62), .Y(n65) );
  NAND3BX2 U27 ( .AN(PRODM[5]), .B(n70), .C(n52), .Y(n62) );
  NAND2BX1 U28 ( .AN(PRODM[6]), .B(n65), .Y(n59) );
  XOR2X1 U29 ( .A(PRODM[10]), .B(n58), .Y(n79) );
  AOI21X1 U30 ( .A0(n66), .A1(n70), .B0(n31), .Y(n67) );
  CLKINVX3 U31 ( .A(n4), .Y(n8) );
  XOR2X1 U32 ( .A(PRODM[12]), .B(n14), .Y(n77) );
  BUFX8 U33 ( .A(DIF[13]), .Y(n30) );
  XNOR2X1 U34 ( .A(DIF[1]), .B(n50), .Y(n3) );
  XNOR2X1 U35 ( .A(DIF[12]), .B(n21), .Y(n4) );
  XOR2X1 U36 ( .A(DIF[4]), .B(n46), .Y(n5) );
  XNOR2X2 U37 ( .A(DIF[3]), .B(n18), .Y(n93) );
  OR2X2 U38 ( .A(n41), .B(n31), .Y(n19) );
  NOR2X2 U40 ( .A(n23), .B(n31), .Y(n15) );
  NOR2X1 U41 ( .A(n24), .B(n31), .Y(n14) );
  NOR2X2 U42 ( .A(n70), .B(n31), .Y(n71) );
  AND2X2 U43 ( .A(n30), .B(n20), .Y(n45) );
  BUFX4 U44 ( .A(n85), .Y(n7) );
  XNOR2X2 U45 ( .A(DIF[2]), .B(n17), .Y(n94) );
  NOR2X2 U46 ( .A(n27), .B(n31), .Y(n36) );
  NOR2X2 U47 ( .A(n29), .B(n31), .Y(n37) );
  CLKINVX4 U48 ( .A(n5), .Y(n9) );
  CLKINVX4 U49 ( .A(n3), .Y(n10) );
  NOR2X1 U50 ( .A(n60), .B(n31), .Y(n61) );
  NOR2X1 U51 ( .A(PRODM[7]), .B(n59), .Y(n60) );
  NOR2XL U52 ( .A(n25), .B(n31), .Y(n57) );
  NOR2X1 U53 ( .A(n6), .B(n31), .Y(n58) );
  NOR2X1 U54 ( .A(n63), .B(n31), .Y(n64) );
  AOI21X1 U55 ( .A0(n70), .A1(n68), .B0(n31), .Y(n69) );
  NOR2XL U56 ( .A(n22), .B(n31), .Y(n73) );
  NOR2X1 U57 ( .A(n39), .B(n31), .Y(n40) );
  NOR3BXL U58 ( .AN(n30), .B(DIF[12]), .C(n34), .Y(DIFM_13_) );
  NOR2X1 U59 ( .A(PRODM[3]), .B(PRODM[4]), .Y(n66) );
  XOR2X1 U60 ( .A(PRODM[5]), .B(n67), .Y(n84) );
  NOR2XL U62 ( .A(n28), .B(n31), .Y(n38) );
  XOR2X2 U63 ( .A(DIF[11]), .B(n36), .Y(n95) );
  NAND2XL U64 ( .A(n30), .B(n47), .Y(n18) );
  NAND2X4 U65 ( .A(n27), .B(n33), .Y(n34) );
  NAND2XL U66 ( .A(n30), .B(n48), .Y(n17) );
  NOR2X4 U67 ( .A(PRODM[1]), .B(N32), .Y(n22) );
  NOR2BX1 U68 ( .AN(n6), .B(PRODM[10]), .Y(n25) );
  INVXL U69 ( .A(PRODM[3]), .Y(n68) );
  XOR2X1 U70 ( .A(PRODM[4]), .B(n69), .Y(n85) );
  XOR2X1 U71 ( .A(PRODM[2]), .B(n73), .Y(n87) );
  XOR2X1 U72 ( .A(PRODM[7]), .B(n64), .Y(n82) );
  NOR2XL U73 ( .A(PRODM[6]), .B(n62), .Y(n63) );
  XOR2X1 U74 ( .A(PRODM[9]), .B(n15), .Y(n80) );
  NOR2BXL U75 ( .AN(n55), .B(n31), .Y(n56) );
  XNOR2X2 U76 ( .A(n97), .B(n19), .Y(n90) );
  OR2X4 U77 ( .A(DIF[2]), .B(n48), .Y(n47) );
  NOR2BX4 U78 ( .AN(n29), .B(DIF[10]), .Y(n27) );
  OR3XL U79 ( .A(n47), .B(DIF[4]), .C(DIF[3]), .Y(n20) );
  NOR2BX1 U80 ( .AN(n25), .B(PRODM[11]), .Y(n24) );
  INVX4 U81 ( .A(n51), .Y(n70) );
  NAND2BX2 U82 ( .AN(PRODM[2]), .B(n22), .Y(n51) );
  NAND2X1 U83 ( .A(n24), .B(n53), .Y(n55) );
  INVX1 U84 ( .A(PRODM[12]), .Y(n53) );
  XNOR2X1 U85 ( .A(PRODM[6]), .B(n26), .Y(n83) );
  XOR2X1 U86 ( .A(PRODM[8]), .B(n61), .Y(n81) );
  XOR2X2 U87 ( .A(PRODM[3]), .B(n71), .Y(n86) );
  XOR2X1 U88 ( .A(PRODM[13]), .B(n56), .Y(n76) );
  NOR2BX1 U89 ( .AN(n30), .B(n49), .Y(n50) );
  NAND2XL U90 ( .A(N32), .B(n30), .Y(n74) );
  INVX1 U91 ( .A(n30), .Y(n72) );
  NOR2BX4 U92 ( .AN(n28), .B(DIF[9]), .Y(n29) );
  NOR3BX1 U93 ( .AN(n30), .B(PRODM[13]), .C(n55), .Y(n54) );
  XOR2X1 U94 ( .A(PRODM[14]), .B(n54), .Y(n75) );
  XOR2X4 U97 ( .A(DIF[9]), .B(n11), .Y(n89) );
  NOR2X4 U98 ( .A(n43), .B(n31), .Y(n44) );
  XOR2X4 U99 ( .A(DIF[6]), .B(n44), .Y(n91) );
  MIX_0_DW01_sub_3 sub_0_root_sub_0_root_sub_55 ( .A({1'b1, 1'b0, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}), .B({1'b0, 1'b0, 
        YL[18:6]}), .CI(1'b0), .DIFF({SYNOPSYS_UNCONNECTED__0, DIF, N18}) );
  MIX_0_DW01_add_10 add_60 ( .A({1'b0, 1'b0, YL[18:6]}), .B({n75, n76, n77, 
        n78, n79, n80, n81, n82, n83, n84, n7, n86, n87, n88, N32}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, Y}) );
  MIX_0_DW_mult_uns_7 mult_58 ( .a({n13, n8, n95, n96, n89, n2, n90, n91, n92, 
        n9, n93, n94, n10, N18}), .b(AL), .product({PRODM, N32, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8}) );
  OR2X4 U1 ( .A(DIF[4]), .B(DIF[3]), .Y(n42) );
  INVX4 U2 ( .A(n32), .Y(n39) );
  INVX1 U4 ( .A(DIF[7]), .Y(n16) );
  NAND2BX2 U8 ( .AN(DIF[7]), .B(n41), .Y(n32) );
  INVX1 U9 ( .A(n16), .Y(n97) );
  NOR2BX4 U21 ( .AN(n39), .B(DIF[8]), .Y(n28) );
  NOR3X1 U39 ( .A(n42), .B(DIF[5]), .C(n47), .Y(n43) );
  NAND2BX1 U61 ( .AN(DIF[1]), .B(n49), .Y(n48) );
  NOR4X2 U95 ( .A(DIF[6]), .B(DIF[5]), .C(n47), .D(n42), .Y(n41) );
endmodule

