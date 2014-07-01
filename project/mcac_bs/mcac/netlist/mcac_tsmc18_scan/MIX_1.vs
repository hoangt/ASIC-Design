
module MIX_1 ( AL, YU, YL, Y );
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
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1,
         SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3,
         SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5,
         SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7,
         SYNOPSYS_UNCONNECTED__8;
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

  NOR2X1 U6 ( .A(n60), .B(n17), .Y(n61) );
  AND2X2 U7 ( .A(n15), .B(N18), .Y(n33) );
  NOR2X1 U9 ( .A(DIF[5]), .B(n24), .Y(n9) );
  OR2X2 U10 ( .A(n27), .B(DIF[4]), .Y(n24) );
  AND2X2 U11 ( .A(n38), .B(n15), .Y(n59) );
  INVX1 U12 ( .A(n15), .Y(n68) );
  INVX1 U13 ( .A(N18), .Y(n32) );
  INVX1 U14 ( .A(DIF[4]), .Y(n29) );
  XNOR2X1 U15 ( .A(DIF[8]), .B(n4), .Y(n85) );
  XNOR2X1 U16 ( .A(DIF[9]), .B(n3), .Y(n84) );
  INVX1 U17 ( .A(n41), .Y(n52) );
  INVX1 U18 ( .A(n43), .Y(n49) );
  OR2X2 U19 ( .A(n51), .B(n17), .Y(n6) );
  BUFX8 U20 ( .A(DIF[13]), .Y(n15) );
  XNOR2X2 U22 ( .A(DIF[2]), .B(n2), .Y(n91) );
  NOR2XL U23 ( .A(n14), .B(n17), .Y(n21) );
  NAND2BXL U24 ( .AN(PRODM[11]), .B(n51), .Y(n43) );
  NOR2X1 U25 ( .A(n13), .B(n17), .Y(n22) );
  NOR2BX1 U26 ( .AN(n15), .B(n9), .Y(n23) );
  OR2XL U27 ( .A(n12), .B(n17), .Y(n3) );
  OR2X2 U28 ( .A(n10), .B(n17), .Y(n5) );
  XOR2X1 U29 ( .A(n29), .B(n28), .Y(n89) );
  NAND2XL U30 ( .A(n15), .B(n27), .Y(n28) );
  NOR2X1 U31 ( .A(n56), .B(n17), .Y(n57) );
  NOR2XL U32 ( .A(n47), .B(n17), .Y(n48) );
  NAND2XL U34 ( .A(n15), .B(n30), .Y(n1) );
  NAND2XL U35 ( .A(n15), .B(n31), .Y(n2) );
  OR2X1 U36 ( .A(n11), .B(n17), .Y(n4) );
  XOR2X1 U37 ( .A(n26), .B(n25), .Y(n88) );
  NAND2XL U38 ( .A(n14), .B(n18), .Y(n19) );
  NOR2BX1 U39 ( .AN(n9), .B(DIF[6]), .Y(n10) );
  XNOR2X2 U40 ( .A(PRODM[11]), .B(n6), .Y(n73) );
  INVX1 U41 ( .A(n36), .Y(n62) );
  NAND2BX1 U42 ( .AN(PRODM[4]), .B(n64), .Y(n36) );
  INVX1 U43 ( .A(n39), .Y(n56) );
  NAND2BX1 U44 ( .AN(PRODM[7]), .B(n58), .Y(n39) );
  INVX1 U45 ( .A(n38), .Y(n58) );
  NAND2BX1 U46 ( .AN(PRODM[6]), .B(n60), .Y(n38) );
  INVX1 U47 ( .A(n37), .Y(n60) );
  NAND2BX1 U48 ( .AN(PRODM[5]), .B(n62), .Y(n37) );
  NAND2BX1 U49 ( .AN(PRODM[9]), .B(n54), .Y(n41) );
  INVX1 U50 ( .A(n42), .Y(n51) );
  NAND2BXL U51 ( .AN(PRODM[10]), .B(n52), .Y(n42) );
  INVX1 U52 ( .A(n40), .Y(n54) );
  NAND2BX1 U53 ( .AN(PRODM[8]), .B(n56), .Y(n40) );
  NOR2X1 U54 ( .A(PRODM[1]), .B(N32), .Y(n7) );
  INVX1 U55 ( .A(n34), .Y(n66) );
  NAND2BX1 U56 ( .AN(PRODM[2]), .B(n7), .Y(n34) );
  INVX1 U57 ( .A(n35), .Y(n64) );
  NAND2BX1 U58 ( .AN(PRODM[3]), .B(n66), .Y(n35) );
  INVX1 U59 ( .A(n44), .Y(n47) );
  NAND2BXL U60 ( .AN(PRODM[12]), .B(n49), .Y(n44) );
  XOR2X1 U61 ( .A(PRODM[13]), .B(n48), .Y(n71) );
  NOR3BX1 U62 ( .AN(n15), .B(DIF[12]), .C(n19), .Y(DIFM_13_) );
  INVX1 U63 ( .A(DIF[11]), .Y(n18) );
  XOR2X1 U64 ( .A(DIF[12]), .B(n20), .Y(n93) );
  XOR2X1 U65 ( .A(DIF[6]), .B(n23), .Y(n87) );
  XOR2X1 U66 ( .A(DIF[11]), .B(n21), .Y(n94) );
  XOR2X1 U67 ( .A(DIF[10]), .B(n22), .Y(n95) );
  NAND2XL U68 ( .A(n15), .B(n24), .Y(n25) );
  AND2X2 U69 ( .A(N32), .B(n15), .Y(n8) );
  NAND2BX1 U70 ( .AN(DIF[1]), .B(n32), .Y(n31) );
  OR2X2 U71 ( .A(DIF[2]), .B(n31), .Y(n30) );
  OR2X2 U72 ( .A(DIF[3]), .B(n30), .Y(n27) );
  NOR2BX1 U73 ( .AN(n10), .B(DIF[7]), .Y(n11) );
  NOR2BX1 U74 ( .AN(n11), .B(DIF[8]), .Y(n12) );
  NOR2BX1 U75 ( .AN(n12), .B(DIF[9]), .Y(n13) );
  NOR2BX1 U76 ( .AN(n13), .B(DIF[10]), .Y(n14) );
  NOR2X1 U77 ( .A(PRODM[13]), .B(n45), .Y(n46) );
  XOR2X1 U79 ( .A(PRODM[14]), .B(n46), .Y(n70) );
  INVX1 U80 ( .A(DIF[5]), .Y(n26) );
  XOR2X1 U81 ( .A(PRODM[2]), .B(n69), .Y(n82) );
  NOR2X1 U82 ( .A(n7), .B(n17), .Y(n69) );
  XOR2X1 U83 ( .A(PRODM[9]), .B(n55), .Y(n75) );
  XOR2X1 U84 ( .A(PRODM[8]), .B(n57), .Y(n76) );
  XOR2X1 U85 ( .A(PRODM[7]), .B(n59), .Y(n77) );
  XOR2X1 U86 ( .A(PRODM[5]), .B(n63), .Y(n79) );
  NOR2X1 U87 ( .A(n62), .B(n17), .Y(n63) );
  XOR2X1 U88 ( .A(PRODM[6]), .B(n61), .Y(n78) );
  XOR2X1 U89 ( .A(PRODM[3]), .B(n67), .Y(n81) );
  NOR2X1 U90 ( .A(n66), .B(n17), .Y(n67) );
  XOR2X1 U91 ( .A(PRODM[4]), .B(n65), .Y(n80) );
  NOR2X1 U92 ( .A(n64), .B(n17), .Y(n65) );
  XOR2X1 U93 ( .A(PRODM[1]), .B(n8), .Y(n83) );
  XOR2X1 U94 ( .A(PRODM[10]), .B(n53), .Y(n74) );
  XOR2X2 U95 ( .A(PRODM[12]), .B(n50), .Y(n72) );
  NOR2X2 U96 ( .A(n49), .B(n17), .Y(n50) );
  NOR2X2 U97 ( .A(n52), .B(n17), .Y(n53) );
  XNOR2X2 U1 ( .A(DIF[3]), .B(n1), .Y(n90) );
  MIX_1_DW01_add_0 add_60 ( .A({1'b0, 1'b0, YL[18:6]}), .B({n70, n71, n72, n73, 
        n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, N32}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, Y}) );
  MIX_1_DW_mult_uns_0 mult_58 ( .a({DIFM_13_, n93, n94, n95, n84, n85, n86, 
        n87, n88, n89, n90, n91, n92, N18}), .b(AL), .product({PRODM, N32, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7}) );
  MIX_1_DW01_sub_3 sub_0_root_sub_0_root_sub_55 ( .A({1'b1, 1'b0, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}), .B({1'b0, 1'b0, 
        YL[18:6]}), .CI(1'b0), .DIFF({SYNOPSYS_UNCONNECTED__8, DIF, N18}) );
  AND2X1 U2 ( .A(n19), .B(n15), .Y(n20) );
  NOR2X1 U3 ( .A(n54), .B(n68), .Y(n55) );
  NAND2XL U4 ( .A(n47), .B(n15), .Y(n45) );
  BUFX3 U5 ( .A(n68), .Y(n17) );
  XOR2X2 U8 ( .A(DIF[1]), .B(n33), .Y(n92) );
  XNOR2X1 U21 ( .A(DIF[7]), .B(n5), .Y(n86) );
endmodule

