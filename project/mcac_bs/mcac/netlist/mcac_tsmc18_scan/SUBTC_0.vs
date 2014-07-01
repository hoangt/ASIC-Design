
module SUBTC_0 ( DMSP, DMLP, TDP, Y, AX );
  input [11:0] DMSP;
  input [13:0] DMLP;
  input [12:0] Y;
  input TDP;
  output AX;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N9, N8, N7, N6, N5, N4, N15, N14, N13, N12, N11, N10,
         lt_64_A_10_, lt_64_A_7_, lt_64_A_6_, lt_64_A_5_, lt_64_A_4_,
         lt_64_A_3_, lt_64_A_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n56, n57, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, SYNOPSYS_UNCONNECTED__0;
  wire   [14:1] DIF;
  wire   [12:2] sub_61_carry;
  assign N9 = DMSP[5];
  assign N8 = DMSP[4];
  assign N7 = DMSP[3];
  assign N6 = DMSP[2];
  assign N5 = DMSP[1];
  assign N4 = DMSP[0];
  assign N15 = DMSP[11];
  assign N14 = DMSP[10];
  assign N13 = DMSP[9];
  assign N12 = DMSP[8];
  assign N11 = DMSP[7];
  assign N10 = DMSP[6];

  NAND2X1 U3 ( .A(DMLP[8]), .B(n72), .Y(n23) );
  OAI211X1 U4 ( .A0(n31), .A1(n56), .B0(n67), .C0(n18), .Y(n35) );
  NOR2X1 U5 ( .A(N19), .B(DIF[1]), .Y(sub_61_carry[2]) );
  OAI21XL U6 ( .A0(n27), .A1(n20), .B0(n21), .Y(n34) );
  NAND3BX1 U7 ( .AN(TDP), .B(N33), .C(N34), .Y(AX) );
  INVX1 U8 ( .A(DIF[14]), .Y(n57) );
  INVX1 U9 ( .A(DIF[1]), .Y(n3) );
  INVX1 U10 ( .A(n15), .Y(N33) );
  AOI22X1 U11 ( .A0(DIF[13]), .A1(n57), .B0(N32), .B1(DIF[14]), .Y(n67) );
  AOI22X1 U12 ( .A0(DIF[9]), .A1(n57), .B0(N28), .B1(DIF[14]), .Y(n76) );
  AOI22X1 U13 ( .A0(DIF[11]), .A1(n57), .B0(N30), .B1(DIF[14]), .Y(n65) );
  AOI22X1 U14 ( .A0(DIF[12]), .A1(n57), .B0(N31), .B1(DIF[14]), .Y(n66) );
  AOI22X1 U15 ( .A0(DIF[8]), .A1(n57), .B0(N27), .B1(DIF[14]), .Y(n75) );
  AOI22X1 U16 ( .A0(DIF[2]), .A1(n57), .B0(N21), .B1(DIF[14]), .Y(n69) );
  INVX1 U17 ( .A(n64), .Y(lt_64_A_10_) );
  AOI22X1 U18 ( .A0(DIF[10]), .A1(n57), .B0(N29), .B1(DIF[14]), .Y(n64) );
  INVX1 U19 ( .A(n71), .Y(lt_64_A_4_) );
  AOI22X1 U20 ( .A0(DIF[4]), .A1(n57), .B0(N23), .B1(DIF[14]), .Y(n71) );
  INVX1 U21 ( .A(n73), .Y(lt_64_A_6_) );
  AOI22X1 U22 ( .A0(DIF[6]), .A1(n57), .B0(N25), .B1(DIF[14]), .Y(n73) );
  XOR2X1 U23 ( .A(DIF[13]), .B(n1), .Y(N32) );
  NAND2X1 U24 ( .A(sub_61_carry[12]), .B(n14), .Y(n1) );
  INVX1 U25 ( .A(n70), .Y(lt_64_A_3_) );
  AOI22X1 U26 ( .A0(DIF[3]), .A1(n57), .B0(N22), .B1(DIF[14]), .Y(n70) );
  INVX1 U27 ( .A(DIF[9]), .Y(n11) );
  INVX1 U28 ( .A(DIF[7]), .Y(n9) );
  INVX1 U29 ( .A(DIF[10]), .Y(n12) );
  INVX1 U30 ( .A(DIF[8]), .Y(n10) );
  INVX1 U31 ( .A(DIF[11]), .Y(n13) );
  INVX1 U32 ( .A(DIF[12]), .Y(n14) );
  INVX1 U33 ( .A(n68), .Y(lt_64_A_1_) );
  AOI22X1 U34 ( .A0(DIF[1]), .A1(n57), .B0(N20), .B1(DIF[14]), .Y(n68) );
  INVX1 U35 ( .A(n72), .Y(lt_64_A_5_) );
  AOI22X1 U36 ( .A0(DIF[5]), .A1(n57), .B0(N24), .B1(DIF[14]), .Y(n72) );
  INVX1 U37 ( .A(n74), .Y(lt_64_A_7_) );
  AOI22X1 U38 ( .A0(DIF[7]), .A1(n57), .B0(N26), .B1(DIF[14]), .Y(n74) );
  NAND2X1 U39 ( .A(n66), .B(n65), .Y(n16) );
  INVX1 U40 ( .A(DIF[4]), .Y(n6) );
  INVX1 U41 ( .A(DIF[5]), .Y(n7) );
  INVX1 U42 ( .A(DIF[6]), .Y(n8) );
  INVX1 U43 ( .A(DIF[3]), .Y(n5) );
  INVX1 U44 ( .A(DIF[2]), .Y(n4) );
  INVX1 U45 ( .A(DMLP[10]), .Y(n40) );
  AOI22X1 U46 ( .A0(N19), .A1(n57), .B0(N19), .B1(DIF[14]), .Y(n63) );
  INVX1 U47 ( .A(n17), .Y(n56) );
  INVX1 U48 ( .A(DMLP[13]), .Y(n41) );
  INVX1 U49 ( .A(DMLP[7]), .Y(n37) );
  INVX1 U50 ( .A(DMLP[9]), .Y(n39) );
  INVX1 U51 ( .A(N19), .Y(n2) );
  INVX1 U52 ( .A(DMLP[8]), .Y(n38) );
  INVX1 U53 ( .A(DMLP[4]), .Y(n36) );
  XOR2X1 U54 ( .A(n14), .B(sub_61_carry[12]), .Y(N31) );
  AND2X1 U55 ( .A(sub_61_carry[11]), .B(n13), .Y(sub_61_carry[12]) );
  XOR2X1 U56 ( .A(n13), .B(sub_61_carry[11]), .Y(N30) );
  AND2X1 U57 ( .A(sub_61_carry[10]), .B(n12), .Y(sub_61_carry[11]) );
  XOR2X1 U58 ( .A(n12), .B(sub_61_carry[10]), .Y(N29) );
  AND2X1 U59 ( .A(sub_61_carry[9]), .B(n11), .Y(sub_61_carry[10]) );
  XOR2X1 U60 ( .A(n11), .B(sub_61_carry[9]), .Y(N28) );
  AND2X1 U61 ( .A(sub_61_carry[8]), .B(n10), .Y(sub_61_carry[9]) );
  XOR2X1 U62 ( .A(n10), .B(sub_61_carry[8]), .Y(N27) );
  AND2X1 U63 ( .A(sub_61_carry[7]), .B(n9), .Y(sub_61_carry[8]) );
  XOR2X1 U64 ( .A(n9), .B(sub_61_carry[7]), .Y(N26) );
  AND2X1 U65 ( .A(sub_61_carry[6]), .B(n8), .Y(sub_61_carry[7]) );
  XOR2X1 U66 ( .A(n8), .B(sub_61_carry[6]), .Y(N25) );
  AND2X1 U67 ( .A(sub_61_carry[5]), .B(n7), .Y(sub_61_carry[6]) );
  XOR2X1 U68 ( .A(n7), .B(sub_61_carry[5]), .Y(N24) );
  AND2X1 U69 ( .A(sub_61_carry[4]), .B(n6), .Y(sub_61_carry[5]) );
  XOR2X1 U70 ( .A(n6), .B(sub_61_carry[4]), .Y(N23) );
  AND2X1 U71 ( .A(sub_61_carry[3]), .B(n5), .Y(sub_61_carry[4]) );
  XOR2X1 U72 ( .A(n5), .B(sub_61_carry[3]), .Y(N22) );
  AND2X1 U73 ( .A(sub_61_carry[2]), .B(n4), .Y(sub_61_carry[3]) );
  XOR2X1 U74 ( .A(n4), .B(sub_61_carry[2]), .Y(N21) );
  XOR2X1 U75 ( .A(n3), .B(n2), .Y(N20) );
  AOI211X1 U76 ( .A0(Y[9]), .A1(Y[10]), .B0(Y[12]), .C0(Y[11]), .Y(n15) );
  NOR2X1 U77 ( .A(n41), .B(lt_64_A_10_), .Y(n31) );
  AOI21X1 U78 ( .A0(n41), .A1(lt_64_A_10_), .B0(n16), .Y(n18) );
  AND2X1 U79 ( .A(DMLP[12]), .B(n76), .Y(n30) );
  OAI32X1 U80 ( .A0(n30), .A1(DMLP[11]), .A2(n75), .B0(n76), .B1(DMLP[12]), 
        .Y(n17) );
  NAND2BX1 U81 ( .AN(lt_64_A_7_), .B(DMLP[10]), .Y(n19) );
  AOI32X1 U82 ( .A0(lt_64_A_6_), .A1(n39), .A2(n19), .B0(n40), .B1(lt_64_A_7_), 
        .Y(n21) );
  OAI21XL U83 ( .A0(lt_64_A_6_), .A1(n39), .B0(n19), .Y(n27) );
  AOI32X1 U84 ( .A0(n23), .A1(n37), .A2(lt_64_A_4_), .B0(lt_64_A_5_), .B1(n38), 
        .Y(n20) );
  NOR2BX1 U85 ( .AN(DMLP[6]), .B(lt_64_A_3_), .Y(n22) );
  AOI21X1 U86 ( .A0(DMLP[5]), .A1(n69), .B0(n22), .Y(n24) );
  OAI32X1 U87 ( .A0(n69), .A1(DMLP[5]), .A2(n22), .B0(DMLP[6]), .B1(n70), .Y(
        n26) );
  OAI221XL U88 ( .A0(lt_64_A_4_), .A1(n37), .B0(n24), .B1(n26), .C0(n23), .Y(
        n29) );
  AOI2BB2X1 U89 ( .B0(DMLP[3]), .B1(n63), .A0N(n36), .A1N(lt_64_A_1_), .Y(n25)
         );
  AOI211X1 U90 ( .A0(lt_64_A_1_), .A1(n36), .B0(n26), .C0(n25), .Y(n28) );
  NOR3X1 U91 ( .A(n29), .B(n28), .C(n27), .Y(n33) );
  AOI211X1 U92 ( .A0(DMLP[11]), .A1(n75), .B0(n31), .C0(n30), .Y(n32) );
  OAI32X1 U93 ( .A0(n35), .A1(n34), .A2(n33), .B0(n32), .B1(n35), .Y(N34) );
  SUBTC_0_DW01_sub_1 sub_0_root_sub_0_root_sub_59 ( .A({1'b1, 1'b0, N15, N14, 
        N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, 1'b0, 1'b0}), .B({1'b0, 
        1'b0, DMLP}), .CI(1'b0), .DIFF({SYNOPSYS_UNCONNECTED__0, DIF, N19}) );
endmodule

