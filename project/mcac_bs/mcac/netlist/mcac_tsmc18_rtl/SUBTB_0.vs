
module SUBTB_0_DW01_add_2 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n8, n9, n10, n11, n13, n14, n15, n17, n18, n19,
         n20, n21, n22, n24, n26, n27, n28, n29, n30, n31, n32, n33, n34, n37,
         n39, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n61, n62, n63, n64, n66, n69, n70, n71, n74,
         n75, n76, n77, n78, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n92, n93, n96, n97, n98, n99, n100, n101, SUM_1_, SUM_2_, SUM_3_,
         SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_, SUM_10_, SUM_11_,
         B_0_, B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_, B_8_, B_9_, B_10_,
         A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, A_7_, A_8_, A_9_, A_10_,
         n148, n149, n150, SUM_0_, n152, n153, n154, n155, n156, n157;
  assign n17 = A[12];
  assign SUM[1] = SUM_1_;
  assign SUM[2] = SUM_2_;
  assign SUM[3] = SUM_3_;
  assign SUM[4] = SUM_4_;
  assign SUM[5] = SUM_5_;
  assign SUM[6] = SUM_6_;
  assign SUM[7] = SUM_7_;
  assign SUM[8] = SUM_8_;
  assign SUM[9] = SUM_9_;
  assign SUM[10] = SUM_10_;
  assign SUM[11] = SUM_11_;
  assign B_0_ = B[0];
  assign B_1_ = B[1];
  assign B_2_ = B[2];
  assign B_3_ = B[3];
  assign B_4_ = B[4];
  assign B_5_ = B[5];
  assign B_6_ = B[6];
  assign B_7_ = B[7];
  assign B_8_ = B[8];
  assign B_9_ = B[9];
  assign B_10_ = B[10];
  assign A_0_ = A[0];
  assign A_1_ = A[1];
  assign A_2_ = A[2];
  assign A_3_ = A[3];
  assign A_4_ = A[4];
  assign A_5_ = A[5];
  assign A_6_ = A[6];
  assign A_7_ = A[7];
  assign A_8_ = A[8];
  assign A_9_ = A[9];
  assign A_10_ = A[10];
  assign SUM[0] = SUM_0_;

  XNOR2X4 U6 ( .A(n150), .B(n17), .Y(SUM_11_) );
  XNOR2X4 U38 ( .A(n53), .B(n8), .Y(SUM_8_) );
  NOR2X4 U78 ( .A(n77), .B(n74), .Y(n3) );
  NOR2X4 U82 ( .A(B_5_), .B(A_5_), .Y(n74) );
  XNOR2X4 U90 ( .A(n84), .B(n13), .Y(SUM_3_) );
  AOI21X4 U91 ( .A0(n80), .A1(n88), .B0(n81), .Y(n1) );
  NOR2X4 U92 ( .A(n82), .B(n85), .Y(n80) );
  OAI21X4 U93 ( .A0(n82), .A1(n86), .B0(n83), .Y(n81) );
  NOR2X4 U102 ( .A(B_2_), .B(A_2_), .Y(n85) );
  OAI21X4 U106 ( .A0(n89), .A1(n92), .B0(n90), .Y(n88) );
  NAND2X4 U115 ( .A(B_0_), .B(A_0_), .Y(n92) );
  NOR2X4 U119 ( .A(B_3_), .B(A_3_), .Y(n82) );
  OAI21X2 U120 ( .A0(n87), .A1(n85), .B0(n86), .Y(n84) );
  INVX1 U121 ( .A(n88), .Y(n87) );
  OAI21X2 U122 ( .A0(n1), .A1(n77), .B0(n78), .Y(n76) );
  OAI21X1 U123 ( .A0(n1), .A1(n43), .B0(n44), .Y(n42) );
  OAI21XL U124 ( .A0(n1), .A1(n30), .B0(n31), .Y(n29) );
  OAI21X1 U125 ( .A0(n1), .A1(n19), .B0(n20), .Y(n18) );
  AOI21X1 U126 ( .A0(n56), .A1(n2), .B0(n57), .Y(n55) );
  OAI21X1 U127 ( .A0(n148), .A1(n58), .B0(n61), .Y(n57) );
  INVX2 U128 ( .A(n5), .Y(n97) );
  NOR2X1 U129 ( .A(n5), .B(n156), .Y(n21) );
  OAI21X2 U130 ( .A0(n1), .A1(n54), .B0(n55), .Y(n53) );
  XOR2X1 U131 ( .A(n15), .B(n92), .Y(SUM_1_) );
  AOI21X1 U132 ( .A0(n97), .A1(n2), .B0(n66), .Y(n64) );
  INVXL U133 ( .A(n148), .Y(n66) );
  NAND2XL U134 ( .A(n3), .B(n45), .Y(n43) );
  AND2X1 U135 ( .A(n153), .B(n92), .Y(SUM_0_) );
  NAND2BX1 U136 ( .AN(n89), .B(n90), .Y(n15) );
  AOI21X1 U137 ( .A0(n21), .A1(n2), .B0(n22), .Y(n20) );
  NAND2X1 U138 ( .A(n97), .B(n148), .Y(n10) );
  BUFX4 U139 ( .A(n4), .Y(n148) );
  NOR2X2 U140 ( .A(B_4_), .B(A_4_), .Y(n77) );
  NOR2X4 U141 ( .A(B_1_), .B(A_1_), .Y(n89) );
  NOR2X1 U142 ( .A(n5), .B(n34), .Y(n32) );
  NOR2X1 U143 ( .A(n5), .B(n58), .Y(n56) );
  NAND2XL U144 ( .A(n98), .B(n75), .Y(n11) );
  INVX1 U145 ( .A(n77), .Y(n99) );
  XOR2X2 U146 ( .A(n29), .B(n155), .Y(SUM_10_) );
  INVXL U147 ( .A(n27), .Y(n93) );
  NOR2X2 U148 ( .A(B_6_), .B(A_6_), .Y(n5) );
  XOR2X4 U149 ( .A(n1), .B(n152), .Y(SUM_4_) );
  OAI21X2 U150 ( .A0(n1), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X2 U151 ( .A(n76), .B(n11), .Y(SUM_5_) );
  OAI21X2 U152 ( .A0(n148), .A1(n156), .B0(n24), .Y(n22) );
  XOR2X2 U153 ( .A(n87), .B(n14), .Y(SUM_2_) );
  NAND2X2 U154 ( .A(B_5_), .B(A_5_), .Y(n75) );
  XNOR2X2 U155 ( .A(n69), .B(n10), .Y(SUM_6_) );
  XNOR2X4 U156 ( .A(n62), .B(n9), .Y(SUM_7_) );
  OAI21X2 U157 ( .A0(n1), .A1(n63), .B0(n64), .Y(n62) );
  BUFX4 U158 ( .A(n42), .Y(n149) );
  BUFX4 U159 ( .A(n18), .Y(n150) );
  OAI21XL U160 ( .A0(n148), .A1(n47), .B0(n48), .Y(n46) );
  NAND2X2 U161 ( .A(B_1_), .B(A_1_), .Y(n90) );
  NAND2X1 U162 ( .A(B_3_), .B(A_3_), .Y(n83) );
  NAND2X2 U163 ( .A(B_2_), .B(A_2_), .Y(n86) );
  NAND2X2 U164 ( .A(n99), .B(n78), .Y(n152) );
  NAND2XL U165 ( .A(n3), .B(n97), .Y(n63) );
  INVXL U166 ( .A(n49), .Y(n47) );
  NAND2XL U167 ( .A(n100), .B(n83), .Y(n13) );
  OAI21X4 U168 ( .A0(n74), .A1(n78), .B0(n75), .Y(n2) );
  INVXL U169 ( .A(n50), .Y(n48) );
  NAND2BX1 U170 ( .AN(n51), .B(n52), .Y(n8) );
  AND2X1 U171 ( .A(n93), .B(n28), .Y(n155) );
  AND2X1 U172 ( .A(n157), .B(n41), .Y(n154) );
  NAND2XL U173 ( .A(n96), .B(n61), .Y(n9) );
  INVXL U174 ( .A(n58), .Y(n96) );
  OR2XL U175 ( .A(B_0_), .B(A_0_), .Y(n153) );
  INVX1 U176 ( .A(n3), .Y(n70) );
  NAND2XL U177 ( .A(n3), .B(n21), .Y(n19) );
  NAND2X1 U178 ( .A(n3), .B(n56), .Y(n54) );
  NAND2XL U179 ( .A(n3), .B(n32), .Y(n30) );
  INVX1 U180 ( .A(n2), .Y(n71) );
  OAI21XL U181 ( .A0(n148), .A1(n34), .B0(n37), .Y(n33) );
  INVX1 U182 ( .A(n26), .Y(n24) );
  OAI21XL U183 ( .A0(n37), .A1(n27), .B0(n28), .Y(n26) );
  XOR2X4 U184 ( .A(n149), .B(n154), .Y(SUM_9_) );
  NAND2XL U185 ( .A(n101), .B(n86), .Y(n14) );
  INVXL U186 ( .A(n85), .Y(n101) );
  AOI21X1 U187 ( .A0(n50), .A1(n157), .B0(n39), .Y(n37) );
  INVX1 U188 ( .A(n41), .Y(n39) );
  OAI21XL U189 ( .A0(n61), .A1(n51), .B0(n52), .Y(n50) );
  NAND2X1 U190 ( .A(n49), .B(n157), .Y(n34) );
  NOR2X1 U191 ( .A(n58), .B(n51), .Y(n49) );
  NOR2X1 U192 ( .A(n5), .B(n47), .Y(n45) );
  OR2X2 U193 ( .A(n34), .B(n27), .Y(n156) );
  INVXL U194 ( .A(n74), .Y(n98) );
  INVXL U195 ( .A(n82), .Y(n100) );
  NAND2X1 U196 ( .A(A_6_), .B(B_6_), .Y(n4) );
  NOR2XL U197 ( .A(B_7_), .B(A_7_), .Y(n58) );
  NOR2XL U198 ( .A(B_8_), .B(A_8_), .Y(n51) );
  NAND2XL U199 ( .A(B_7_), .B(A_7_), .Y(n61) );
  NAND2XL U200 ( .A(B_8_), .B(A_8_), .Y(n52) );
  OR2XL U201 ( .A(B_9_), .B(A_9_), .Y(n157) );
  NAND2XL U202 ( .A(B_9_), .B(A_9_), .Y(n41) );
  AOI21XL U203 ( .A0(n32), .A1(n2), .B0(n33), .Y(n31) );
  AOI21X1 U204 ( .A0(n45), .A1(n2), .B0(n46), .Y(n44) );
  NAND2X2 U205 ( .A(B_4_), .B(A_4_), .Y(n78) );
  NAND2XL U206 ( .A(B_10_), .B(A_10_), .Y(n28) );
  NOR2XL U207 ( .A(B_10_), .B(A_10_), .Y(n27) );
endmodule


module SUBTB_0 ( DL, DLN, Y );
  input [10:0] DL;
  output [11:0] DLN;
  input [12:0] Y;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N12, N11, N10, N1, N0, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;
  wire   SYNOPSYS_UNCONNECTED__0;
  assign N0 = Y[2];

  SUBTB_0_DW01_add_2 add_0_root_sub_0_root_sub_45 ( .A({N12, N11, N10, N9, N8, 
        N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 1'b0, DL}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, DLN}) );
  INVX1 U3 ( .A(N11), .Y(N12) );
  NOR2XL U4 ( .A(Y[5]), .B(n8), .Y(n1) );
  XOR2XL U5 ( .A(n8), .B(Y[5]), .Y(N3) );
  INVX1 U6 ( .A(N0), .Y(n10) );
  NOR2XL U7 ( .A(Y[8]), .B(n6), .Y(n2) );
  NAND2BX1 U8 ( .AN(Y[3]), .B(n10), .Y(n9) );
  NAND2BX1 U9 ( .AN(Y[6]), .B(n1), .Y(n7) );
  NAND2BX1 U10 ( .AN(Y[9]), .B(n2), .Y(n5) );
  XNOR2X1 U11 ( .A(Y[9]), .B(n2), .Y(N7) );
  XOR2XL U12 ( .A(n5), .B(Y[10]), .Y(N8) );
  XOR2XL U13 ( .A(n4), .B(Y[11]), .Y(N9) );
  OR2X2 U14 ( .A(Y[4]), .B(n9), .Y(n8) );
  OR2XL U15 ( .A(Y[7]), .B(n7), .Y(n6) );
  OR2XL U16 ( .A(Y[10]), .B(n5), .Y(n4) );
  OR2XL U17 ( .A(Y[11]), .B(n4), .Y(n3) );
  XOR2XL U18 ( .A(n3), .B(Y[12]), .Y(N10) );
  XNOR2X1 U19 ( .A(Y[3]), .B(n10), .Y(N1) );
  XOR2XL U20 ( .A(n6), .B(Y[8]), .Y(N6) );
  XOR2XL U21 ( .A(n7), .B(Y[7]), .Y(N5) );
  XOR2X1 U22 ( .A(n9), .B(Y[4]), .Y(N2) );
  XNOR2X1 U23 ( .A(Y[6]), .B(n1), .Y(N4) );
  OR2XL U24 ( .A(Y[12]), .B(n3), .Y(N11) );
endmodule

