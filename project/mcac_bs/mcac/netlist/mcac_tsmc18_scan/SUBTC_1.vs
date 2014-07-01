
module SUBTC_1 ( DMSP, DMLP, TDP, Y, AX );
  input [11:0] DMSP;
  input [13:0] DMLP;
  input [12:0] Y;
  input TDP;
  output AX;
  wire   N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         N9, N8, N7, N6, N5, N4, N15, N14, N13, N12, N11, N10, lt_64_A_10_,
         lt_64_A_7_, lt_64_A_6_, lt_64_A_5_, lt_64_A_4_, lt_64_A_3_,
         lt_64_A_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n56, n57, n58, n59, n60, n61, SYNOPSYS_UNCONNECTED__0;
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

  INVX1 U3 ( .A(TDP), .Y(n10) );
  AOI221X1 U4 ( .A0(n60), .A1(lt_64_A_10_), .B0(n1), .B1(n27), .C0(n26), .Y(
        n11) );
  INVX1 U5 ( .A(n40), .Y(n1) );
  NOR2X1 U6 ( .A(N19), .B(DIF[1]), .Y(sub_61_carry[2]) );
  OAI211X1 U7 ( .A0(n2), .A1(n36), .B0(n3), .C0(n30), .Y(n8) );
  INVX1 U8 ( .A(n5), .Y(n2) );
  NAND2X1 U9 ( .A(DMLP[8]), .B(n46), .Y(n32) );
  NAND2X1 U10 ( .A(n52), .B(n53), .Y(n26) );
  OR2X2 U11 ( .A(n29), .B(n36), .Y(n3) );
  INVX1 U12 ( .A(DIF[14]), .Y(n61) );
  AND2X2 U13 ( .A(sub_61_carry[11]), .B(n24), .Y(sub_61_carry[12]) );
  AND2X2 U14 ( .A(sub_61_carry[10]), .B(n23), .Y(sub_61_carry[11]) );
  AND2X2 U15 ( .A(sub_61_carry[9]), .B(n22), .Y(sub_61_carry[10]) );
  AND2X2 U16 ( .A(sub_61_carry[8]), .B(n21), .Y(sub_61_carry[9]) );
  AND2X2 U17 ( .A(sub_61_carry[7]), .B(n20), .Y(sub_61_carry[8]) );
  AND2X2 U18 ( .A(sub_61_carry[6]), .B(n19), .Y(sub_61_carry[7]) );
  AND2X2 U19 ( .A(sub_61_carry[5]), .B(n18), .Y(sub_61_carry[6]) );
  AND2X2 U20 ( .A(sub_61_carry[4]), .B(n17), .Y(sub_61_carry[5]) );
  AOI22XL U21 ( .A0(DIF[8]), .A1(n61), .B0(N27), .B1(DIF[14]), .Y(n43) );
  AOI22XL U22 ( .A0(DIF[4]), .A1(n61), .B0(N23), .B1(DIF[14]), .Y(n47) );
  AOI22XL U23 ( .A0(DIF[10]), .A1(n61), .B0(N29), .B1(DIF[14]), .Y(n54) );
  AOI22XL U24 ( .A0(DIF[6]), .A1(n61), .B0(N25), .B1(DIF[14]), .Y(n45) );
  AOI22XL U25 ( .A0(DIF[2]), .A1(n61), .B0(N21), .B1(DIF[14]), .Y(n49) );
  AOI22XL U26 ( .A0(DIF[1]), .A1(n61), .B0(N20), .B1(DIF[14]), .Y(n50) );
  AOI22XL U27 ( .A0(DIF[5]), .A1(n61), .B0(N24), .B1(DIF[14]), .Y(n46) );
  AOI22XL U28 ( .A0(DIF[7]), .A1(n61), .B0(N26), .B1(DIF[14]), .Y(n44) );
  AOI22XL U29 ( .A0(DIF[9]), .A1(n61), .B0(N28), .B1(DIF[14]), .Y(n42) );
  AOI22XL U30 ( .A0(DIF[11]), .A1(n61), .B0(N30), .B1(DIF[14]), .Y(n53) );
  AOI22XL U31 ( .A0(DIF[12]), .A1(n61), .B0(N31), .B1(DIF[14]), .Y(n52) );
  NAND2XL U32 ( .A(sub_61_carry[12]), .B(n25), .Y(n4) );
  OAI32XL U33 ( .A0(n39), .A1(DMLP[11]), .A2(n43), .B0(n42), .B1(DMLP[12]), 
        .Y(n27) );
  NAND2BXL U34 ( .AN(lt_64_A_7_), .B(DMLP[10]), .Y(n28) );
  AOI21XL U35 ( .A0(DMLP[5]), .A1(n49), .B0(n31), .Y(n33) );
  NAND2XL U36 ( .A(n43), .B(DMLP[11]), .Y(n9) );
  AOI22XL U37 ( .A0(N19), .A1(n61), .B0(N19), .B1(DIF[14]), .Y(n55) );
  INVXL U38 ( .A(DMLP[13]), .Y(n60) );
  INVXL U39 ( .A(DMLP[7]), .Y(n56) );
  INVXL U40 ( .A(DMLP[9]), .Y(n58) );
  INVXL U41 ( .A(DMLP[8]), .Y(n57) );
  INVXL U42 ( .A(DMLP[10]), .Y(n59) );
  AOI211XL U43 ( .A0(Y[10]), .A1(Y[9]), .B0(Y[12]), .C0(Y[11]), .Y(n6) );
  NAND4X2 U44 ( .A(n12), .B(n51), .C(n11), .D(n10), .Y(AX) );
  INVX1 U45 ( .A(DIF[1]), .Y(n14) );
  AOI22X1 U46 ( .A0(DIF[13]), .A1(n61), .B0(N32), .B1(DIF[14]), .Y(n51) );
  AOI31X1 U47 ( .A0(n9), .A1(n8), .A2(n7), .B0(n6), .Y(n12) );
  INVX1 U48 ( .A(n47), .Y(lt_64_A_4_) );
  INVX1 U49 ( .A(n45), .Y(lt_64_A_6_) );
  INVX1 U50 ( .A(n54), .Y(lt_64_A_10_) );
  NOR2X1 U51 ( .A(n40), .B(n39), .Y(n7) );
  INVX1 U52 ( .A(n48), .Y(lt_64_A_3_) );
  AOI22X1 U53 ( .A0(DIF[3]), .A1(n61), .B0(N22), .B1(DIF[14]), .Y(n48) );
  INVX1 U54 ( .A(DIF[7]), .Y(n20) );
  INVX1 U55 ( .A(DIF[8]), .Y(n21) );
  INVX1 U56 ( .A(DIF[9]), .Y(n22) );
  INVX1 U57 ( .A(n50), .Y(lt_64_A_1_) );
  INVX1 U58 ( .A(n46), .Y(lt_64_A_5_) );
  INVX1 U59 ( .A(n44), .Y(lt_64_A_7_) );
  XOR2X1 U60 ( .A(DIF[13]), .B(n4), .Y(N32) );
  INVX1 U61 ( .A(DIF[4]), .Y(n17) );
  INVX1 U62 ( .A(DIF[5]), .Y(n18) );
  INVX1 U63 ( .A(DIF[6]), .Y(n19) );
  INVX1 U64 ( .A(DIF[10]), .Y(n23) );
  INVX1 U65 ( .A(DIF[11]), .Y(n24) );
  INVX1 U66 ( .A(DIF[12]), .Y(n25) );
  INVX1 U67 ( .A(DIF[3]), .Y(n16) );
  INVX1 U68 ( .A(DIF[2]), .Y(n15) );
  NOR2X1 U69 ( .A(n37), .B(n38), .Y(n5) );
  INVX1 U70 ( .A(DMLP[4]), .Y(n41) );
  INVX1 U71 ( .A(N19), .Y(n13) );
  XOR2X1 U72 ( .A(n25), .B(sub_61_carry[12]), .Y(N31) );
  XOR2X1 U73 ( .A(n24), .B(sub_61_carry[11]), .Y(N30) );
  XOR2X1 U74 ( .A(n23), .B(sub_61_carry[10]), .Y(N29) );
  XOR2X1 U75 ( .A(n22), .B(sub_61_carry[9]), .Y(N28) );
  XOR2X1 U76 ( .A(n21), .B(sub_61_carry[8]), .Y(N27) );
  XOR2X1 U77 ( .A(n20), .B(sub_61_carry[7]), .Y(N26) );
  XOR2X1 U78 ( .A(n19), .B(sub_61_carry[6]), .Y(N25) );
  XOR2X1 U79 ( .A(n18), .B(sub_61_carry[5]), .Y(N24) );
  XOR2X1 U80 ( .A(n17), .B(sub_61_carry[4]), .Y(N23) );
  AND2X1 U81 ( .A(sub_61_carry[3]), .B(n16), .Y(sub_61_carry[4]) );
  XOR2X1 U82 ( .A(n16), .B(sub_61_carry[3]), .Y(N22) );
  AND2X1 U83 ( .A(sub_61_carry[2]), .B(n15), .Y(sub_61_carry[3]) );
  XOR2X1 U84 ( .A(n15), .B(sub_61_carry[2]), .Y(N21) );
  XOR2X1 U85 ( .A(n14), .B(n13), .Y(N20) );
  NOR2X1 U86 ( .A(n60), .B(lt_64_A_10_), .Y(n40) );
  AND2X1 U87 ( .A(DMLP[12]), .B(n42), .Y(n39) );
  AOI32X1 U88 ( .A0(lt_64_A_6_), .A1(n58), .A2(n28), .B0(n59), .B1(lt_64_A_7_), 
        .Y(n30) );
  OAI21XL U89 ( .A0(lt_64_A_6_), .A1(n58), .B0(n28), .Y(n36) );
  AOI32X1 U90 ( .A0(n32), .A1(n56), .A2(lt_64_A_4_), .B0(lt_64_A_5_), .B1(n57), 
        .Y(n29) );
  NOR2BX1 U91 ( .AN(DMLP[6]), .B(lt_64_A_3_), .Y(n31) );
  OAI32X1 U92 ( .A0(n49), .A1(DMLP[5]), .A2(n31), .B0(DMLP[6]), .B1(n48), .Y(
        n35) );
  OAI221XL U93 ( .A0(lt_64_A_4_), .A1(n56), .B0(n33), .B1(n35), .C0(n32), .Y(
        n38) );
  AOI2BB2X1 U94 ( .B0(DMLP[3]), .B1(n55), .A0N(n41), .A1N(lt_64_A_1_), .Y(n34)
         );
  AOI211X1 U95 ( .A0(lt_64_A_1_), .A1(n41), .B0(n35), .C0(n34), .Y(n37) );
  SUBTC_1_DW01_sub_1 sub_0_root_sub_0_root_sub_59 ( .A({1'b1, 1'b0, N15, N14, 
        N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, 1'b0, 1'b0}), .B({1'b0, 
        1'b0, DMLP}), .CI(1'b0), .DIFF({SYNOPSYS_UNCONNECTED__0, DIF, N19}) );
endmodule

