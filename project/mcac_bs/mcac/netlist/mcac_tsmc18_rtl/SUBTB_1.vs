
module SUBTB_1_DW01_add_5 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n17,
         n18, n19, n20, n21, n22, n24, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n37, n39, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n61, n62, n63, n64, n66, n69, n70,
         n71, n74, n75, n76, n77, n78, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n92, n95, n96, n97, n98, n99, n100, n101, n102, SUM_1_,
         SUM_2_, SUM_3_, SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_,
         SUM_10_, SUM_11_, B_0_, B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_,
         B_8_, B_9_, B_10_, A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, A_7_,
         A_8_, A_9_, A_10_, n148, n149, n150, n151, n152, SUM_0_, n154, n155,
         n156, n157;
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

  NOR2X4 U78 ( .A(n77), .B(n74), .Y(n3) );
  AOI21X4 U91 ( .A0(n80), .A1(n88), .B0(n81), .Y(n1) );
  OAI21X4 U93 ( .A0(n82), .A1(n86), .B0(n83), .Y(n81) );
  OAI21X4 U106 ( .A0(n89), .A1(n92), .B0(n90), .Y(n88) );
  INVX2 U119 ( .A(n1), .Y(n148) );
  CLKINVX4 U120 ( .A(n148), .Y(n149) );
  CLKBUFX3 U121 ( .A(B_0_), .Y(n150) );
  NOR2X2 U122 ( .A(B_1_), .B(A_1_), .Y(n89) );
  OAI21XL U123 ( .A0(n1), .A1(n43), .B0(n44), .Y(n42) );
  XOR2X2 U124 ( .A(n149), .B(n12), .Y(SUM_4_) );
  OAI21XL U125 ( .A0(n149), .A1(n19), .B0(n20), .Y(n18) );
  XNOR2X4 U126 ( .A(n84), .B(n13), .Y(SUM_3_) );
  NAND2X1 U127 ( .A(B_1_), .B(A_1_), .Y(n90) );
  NOR2X2 U128 ( .A(B_6_), .B(A_6_), .Y(n5) );
  NAND2X2 U129 ( .A(B_6_), .B(A_6_), .Y(n4) );
  NAND2X2 U130 ( .A(B_0_), .B(A_0_), .Y(n92) );
  OAI21X1 U131 ( .A0(n87), .A1(n85), .B0(n86), .Y(n84) );
  NOR2X2 U132 ( .A(n82), .B(n85), .Y(n80) );
  NAND2BX1 U133 ( .AN(n27), .B(n28), .Y(n6) );
  XNOR2X1 U134 ( .A(n42), .B(n7), .Y(SUM_9_) );
  NAND2X1 U135 ( .A(n97), .B(n3), .Y(n63) );
  INVX1 U136 ( .A(n5), .Y(n97) );
  INVX1 U137 ( .A(n77), .Y(n99) );
  OAI21X1 U138 ( .A0(n1), .A1(n63), .B0(n64), .Y(n62) );
  OAI21X2 U139 ( .A0(n1), .A1(n77), .B0(n78), .Y(n76) );
  CLKINVX3 U140 ( .A(B_2_), .Y(n151) );
  INVX4 U141 ( .A(n151), .Y(n152) );
  NOR2X4 U142 ( .A(B_3_), .B(A_3_), .Y(n82) );
  XOR2X2 U143 ( .A(n87), .B(n14), .Y(SUM_2_) );
  OAI21XL U144 ( .A0(n149), .A1(n30), .B0(n31), .Y(n29) );
  OAI21XL U145 ( .A0(n1), .A1(n54), .B0(n55), .Y(n53) );
  OAI21XL U146 ( .A0(n1), .A1(n70), .B0(n71), .Y(n69) );
  INVX1 U147 ( .A(n82), .Y(n100) );
  INVX4 U148 ( .A(n88), .Y(n87) );
  NAND2X2 U149 ( .A(n152), .B(A_2_), .Y(n86) );
  NAND2X1 U150 ( .A(n49), .B(n157), .Y(n34) );
  OAI21XL U151 ( .A0(n51), .A1(n61), .B0(n52), .Y(n50) );
  NOR2X2 U152 ( .A(B_5_), .B(A_5_), .Y(n74) );
  NOR2X2 U153 ( .A(B_2_), .B(A_2_), .Y(n85) );
  NAND2X1 U154 ( .A(B_3_), .B(A_3_), .Y(n83) );
  XNOR2X1 U155 ( .A(n29), .B(n6), .Y(SUM_10_) );
  OR2X2 U156 ( .A(A_9_), .B(B_9_), .Y(n157) );
  NOR2X1 U157 ( .A(B_8_), .B(A_8_), .Y(n51) );
  INVX1 U158 ( .A(n26), .Y(n24) );
  NOR2X2 U159 ( .A(B_4_), .B(A_4_), .Y(n77) );
  NAND2X2 U160 ( .A(B_4_), .B(A_4_), .Y(n78) );
  NAND2X1 U161 ( .A(n100), .B(n83), .Y(n13) );
  NAND2X1 U162 ( .A(n96), .B(n61), .Y(n9) );
  NOR2X1 U163 ( .A(n51), .B(n58), .Y(n49) );
  NOR2X1 U164 ( .A(n5), .B(n58), .Y(n56) );
  AND2X1 U165 ( .A(n155), .B(n92), .Y(SUM_0_) );
  NAND2X1 U166 ( .A(n3), .B(n21), .Y(n19) );
  AOI21XL U167 ( .A0(n21), .A1(n2), .B0(n22), .Y(n20) );
  NAND2X1 U168 ( .A(B_5_), .B(A_5_), .Y(n75) );
  XNOR2X1 U169 ( .A(n62), .B(n9), .Y(SUM_7_) );
  NAND2XL U170 ( .A(n3), .B(n56), .Y(n54) );
  NOR2X1 U171 ( .A(n5), .B(n156), .Y(n21) );
  OAI21XL U172 ( .A0(n37), .A1(n27), .B0(n28), .Y(n26) );
  OAI21XL U173 ( .A0(n4), .A1(n156), .B0(n24), .Y(n22) );
  OAI21X4 U174 ( .A0(n74), .A1(n78), .B0(n75), .Y(n2) );
  XOR2X2 U175 ( .A(n53), .B(n154), .Y(SUM_8_) );
  AND2X2 U176 ( .A(n95), .B(n52), .Y(n154) );
  AOI21XL U177 ( .A0(n56), .A1(n2), .B0(n57), .Y(n55) );
  OAI21XL U178 ( .A0(n4), .A1(n58), .B0(n61), .Y(n57) );
  XNOR2X1 U179 ( .A(n76), .B(n11), .Y(SUM_5_) );
  NAND2X1 U180 ( .A(n98), .B(n75), .Y(n11) );
  XNOR2X1 U181 ( .A(n69), .B(n10), .Y(SUM_6_) );
  AOI21XL U182 ( .A0(n32), .A1(n2), .B0(n33), .Y(n31) );
  AOI21XL U183 ( .A0(n45), .A1(n2), .B0(n46), .Y(n44) );
  INVXL U184 ( .A(n50), .Y(n48) );
  INVXL U185 ( .A(n51), .Y(n95) );
  NAND2XL U186 ( .A(n3), .B(n45), .Y(n43) );
  NAND2XL U187 ( .A(n157), .B(n41), .Y(n7) );
  INVXL U188 ( .A(n58), .Y(n96) );
  OR2XL U189 ( .A(n150), .B(A_0_), .Y(n155) );
  INVX1 U190 ( .A(n49), .Y(n47) );
  NAND2XL U191 ( .A(n3), .B(n32), .Y(n30) );
  INVX1 U192 ( .A(n2), .Y(n71) );
  INVXL U193 ( .A(n3), .Y(n70) );
  NAND2XL U194 ( .A(n101), .B(n86), .Y(n14) );
  INVXL U195 ( .A(n85), .Y(n101) );
  AOI21X1 U196 ( .A0(n50), .A1(n157), .B0(n39), .Y(n37) );
  INVX1 U197 ( .A(n41), .Y(n39) );
  NOR2XL U198 ( .A(n5), .B(n47), .Y(n45) );
  NOR2XL U199 ( .A(n5), .B(n34), .Y(n32) );
  OAI21XL U200 ( .A0(n4), .A1(n47), .B0(n48), .Y(n46) );
  OR2X2 U201 ( .A(n34), .B(n27), .Y(n156) );
  OAI21XL U202 ( .A0(n4), .A1(n34), .B0(n37), .Y(n33) );
  AOI21XL U203 ( .A0(n2), .A1(n97), .B0(n66), .Y(n64) );
  INVXL U204 ( .A(n4), .Y(n66) );
  NAND2XL U205 ( .A(n99), .B(n78), .Y(n12) );
  INVXL U206 ( .A(n74), .Y(n98) );
  NAND2XL U207 ( .A(n97), .B(n4), .Y(n10) );
  NOR2XL U208 ( .A(B_7_), .B(A_7_), .Y(n58) );
  NAND2XL U209 ( .A(B_7_), .B(A_7_), .Y(n61) );
  NAND2XL U210 ( .A(A_9_), .B(B_9_), .Y(n41) );
  NAND2XL U211 ( .A(B_8_), .B(A_8_), .Y(n52) );
  XOR2XL U212 ( .A(n15), .B(n92), .Y(SUM_1_) );
  NAND2XL U213 ( .A(n102), .B(n90), .Y(n15) );
  INVXL U214 ( .A(n89), .Y(n102) );
  XNOR2X2 U215 ( .A(n18), .B(n17), .Y(SUM_11_) );
  NAND2XL U216 ( .A(A_10_), .B(B_10_), .Y(n28) );
  NOR2X1 U217 ( .A(A_10_), .B(B_10_), .Y(n27) );
endmodule


module SUBTB_1 ( DL, DLN, Y );
  input [10:0] DL;
  output [11:0] DLN;
  input [12:0] Y;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N12, N11, N10, N1, N0, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   SYNOPSYS_UNCONNECTED__0;
  assign N0 = Y[2];

  SUBTB_1_DW01_add_5 add_0_root_sub_0_root_sub_45 ( .A({N12, N11, N10, N9, N8, 
        N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 1'b0, DL}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, DLN}) );
  NAND2BX1 U3 ( .AN(Y[7]), .B(n15), .Y(n5) );
  INVX1 U4 ( .A(n8), .Y(n11) );
  XNOR2XL U5 ( .A(Y[7]), .B(n15), .Y(N5) );
  NAND2BX1 U6 ( .AN(Y[9]), .B(n13), .Y(n7) );
  XNOR2X2 U7 ( .A(Y[12]), .B(n10), .Y(N10) );
  NAND2BXL U8 ( .AN(Y[12]), .B(n10), .Y(N11) );
  INVX1 U9 ( .A(N0), .Y(n19) );
  INVX1 U10 ( .A(n1), .Y(n18) );
  NAND2BX1 U11 ( .AN(Y[3]), .B(n19), .Y(n1) );
  INVX1 U12 ( .A(n9), .Y(n10) );
  NAND2BX1 U13 ( .AN(Y[11]), .B(n11), .Y(n9) );
  INVX1 U14 ( .A(n7), .Y(n12) );
  INVX1 U15 ( .A(n6), .Y(n13) );
  NAND2BX1 U16 ( .AN(Y[8]), .B(n14), .Y(n6) );
  INVX1 U17 ( .A(n5), .Y(n14) );
  INVX1 U18 ( .A(n4), .Y(n15) );
  NAND2BX1 U19 ( .AN(Y[6]), .B(n16), .Y(n4) );
  NAND2BX1 U20 ( .AN(Y[10]), .B(n12), .Y(n8) );
  INVX1 U21 ( .A(n3), .Y(n16) );
  NAND2BX1 U22 ( .AN(Y[5]), .B(n17), .Y(n3) );
  INVX1 U23 ( .A(n2), .Y(n17) );
  NAND2BX1 U24 ( .AN(Y[4]), .B(n18), .Y(n2) );
  XNOR2X1 U25 ( .A(Y[11]), .B(n11), .Y(N9) );
  XNOR2X1 U26 ( .A(Y[9]), .B(n13), .Y(N7) );
  XNOR2X1 U27 ( .A(Y[8]), .B(n14), .Y(N6) );
  XNOR2X1 U28 ( .A(Y[10]), .B(n12), .Y(N8) );
  INVX1 U29 ( .A(N11), .Y(N12) );
  XNOR2X1 U30 ( .A(Y[6]), .B(n16), .Y(N4) );
  XNOR2X1 U31 ( .A(Y[4]), .B(n18), .Y(N2) );
  XNOR2X1 U32 ( .A(Y[3]), .B(n19), .Y(N1) );
  XNOR2X1 U33 ( .A(Y[5]), .B(n17), .Y(N3) );
endmodule

