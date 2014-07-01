
module SUBTA_1_DW01_add_2 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n21, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n56, n57, n60, n61, n62, n63, n65, n68, n69, n70,
         n71, n72, n73, n74, n77, n78, n79, n80, n81, n82, n84, n85, n88, n89,
         n90, n91, n93, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n121, n122, SUM_0_, SUM_1_, SUM_2_, SUM_3_, SUM_4_, SUM_5_,
         SUM_6_, SUM_7_, SUM_8_, SUM_9_, SUM_10_, SUM_11_, SUM_12_, SUM_13_,
         SUM_14_, SUM_15_, B_0_, B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_,
         B_8_, B_9_, B_10_, B_11_, B_12_, B_13_, B_14_, B_15_, A_0_, A_1_,
         A_2_, A_3_, A_4_, A_5_, A_6_, A_7_, A_8_, A_9_, A_10_, A_11_, A_12_,
         A_13_, A_14_, A_15_, n190, n191, n192, n193, n194, n195;
  assign SUM[0] = SUM_0_;
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
  assign SUM[12] = SUM_12_;
  assign SUM[13] = SUM_13_;
  assign SUM[14] = SUM_14_;
  assign SUM[15] = SUM_15_;
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
  assign B_11_ = B[11];
  assign B_12_ = B[12];
  assign B_13_ = B[13];
  assign B_14_ = B[14];
  assign B_15_ = B[15];
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
  assign A_11_ = A[11];
  assign A_12_ = A[12];
  assign A_13_ = A[13];
  assign A_14_ = A[14];
  assign A_15_ = A[15];

  XOR2X4 U2 ( .A(n22), .B(n4), .Y(SUM_15_) );
  AOI21X4 U8 ( .A0(n1), .A1(n23), .B0(n24), .Y(n22) );
  AOI21X4 U46 ( .A0(n50), .A1(n63), .B0(n51), .Y(n2) );
  INVX2 U153 ( .A(n43), .Y(n121) );
  OAI21X1 U154 ( .A0(n2), .A1(n43), .B0(n46), .Y(n42) );
  NOR2X4 U155 ( .A(B_12_), .B(A_12_), .Y(n43) );
  NOR2X2 U156 ( .A(n43), .B(n38), .Y(n36) );
  XOR2X1 U157 ( .A(n40), .B(n6), .Y(SUM_13_) );
  XOR2X1 U158 ( .A(n31), .B(n192), .Y(SUM_14_) );
  NOR2X2 U159 ( .A(B_9_), .B(A_9_), .Y(n68) );
  NOR2X1 U160 ( .A(B_13_), .B(A_13_), .Y(n38) );
  NAND2X2 U161 ( .A(n36), .B(n194), .Y(n25) );
  NOR2BX1 U162 ( .AN(n117), .B(n116), .Y(SUM_0_) );
  AOI31X1 U163 ( .A0(n190), .A1(n103), .A2(n90), .B0(n84), .Y(n82) );
  INVX1 U164 ( .A(n85), .Y(n190) );
  NOR2XL U165 ( .A(n34), .B(n3), .Y(n32) );
  NAND2BX1 U166 ( .AN(n80), .B(n81), .Y(n12) );
  NAND2BX1 U167 ( .AN(n96), .B(n97), .Y(n14) );
  NAND2BX1 U168 ( .AN(n38), .B(n39), .Y(n6) );
  AOI31X1 U169 ( .A0(n191), .A1(n1), .A2(n62), .B0(n56), .Y(n54) );
  OAI21XL U170 ( .A0(n34), .A1(n2), .B0(n35), .Y(n33) );
  NAND2BX1 U171 ( .AN(n114), .B(n115), .Y(n18) );
  INVXL U172 ( .A(n57), .Y(n191) );
  NAND2BX1 U173 ( .AN(n107), .B(n108), .Y(n16) );
  NAND2BXL U174 ( .AN(n68), .B(n69), .Y(n10) );
  XOR2X1 U175 ( .A(n47), .B(n7), .Y(SUM_12_) );
  NAND2BX1 U176 ( .AN(n110), .B(n111), .Y(n17) );
  NAND2BXL U177 ( .AN(n85), .B(n88), .Y(n13) );
  OAI21X1 U178 ( .A0(n52), .A1(n60), .B0(n53), .Y(n51) );
  NAND3X1 U179 ( .A(n103), .B(n90), .C(n78), .Y(n193) );
  NOR2X1 U180 ( .A(n85), .B(n80), .Y(n78) );
  NOR2X2 U181 ( .A(B_6_), .B(A_6_), .Y(n85) );
  NAND2X2 U182 ( .A(n62), .B(n50), .Y(n3) );
  AOI21X1 U183 ( .A0(n1), .A1(n32), .B0(n33), .Y(n31) );
  NOR2X2 U184 ( .A(n57), .B(n52), .Y(n50) );
  NOR2X1 U185 ( .A(B_10_), .B(A_10_), .Y(n57) );
  NAND2X1 U186 ( .A(B_0_), .B(A_0_), .Y(n117) );
  NOR2X2 U187 ( .A(B_11_), .B(A_11_), .Y(n52) );
  NAND2X1 U188 ( .A(B_11_), .B(A_11_), .Y(n53) );
  NOR2X1 U189 ( .A(B_3_), .B(A_3_), .Y(n107) );
  AOI21X1 U190 ( .A0(n37), .A1(n194), .B0(n28), .Y(n26) );
  AOI21X1 U191 ( .A0(n78), .A1(n91), .B0(n79), .Y(n77) );
  XOR2X2 U192 ( .A(n70), .B(n10), .Y(SUM_9_) );
  OAI21X2 U193 ( .A0(n46), .A1(n38), .B0(n39), .Y(n37) );
  XOR2X1 U194 ( .A(n61), .B(n9), .Y(SUM_10_) );
  OAI21X2 U195 ( .A0(n68), .A1(n74), .B0(n69), .Y(n63) );
  INVX1 U196 ( .A(n73), .Y(n71) );
  INVX1 U197 ( .A(n74), .Y(n72) );
  XOR2X1 U198 ( .A(n98), .B(n14), .Y(SUM_5_) );
  NAND2X1 U199 ( .A(B_9_), .B(A_9_), .Y(n69) );
  XOR2X2 U200 ( .A(n54), .B(n8), .Y(SUM_11_) );
  NAND2X1 U201 ( .A(n122), .B(n53), .Y(n8) );
  NOR2X1 U202 ( .A(n73), .B(n68), .Y(n62) );
  NAND2X1 U203 ( .A(B_4_), .B(A_4_), .Y(n102) );
  NOR2X1 U204 ( .A(B_5_), .B(A_5_), .Y(n96) );
  OAI21XL U205 ( .A0(n114), .A1(n117), .B0(n115), .Y(n113) );
  NAND2X1 U206 ( .A(B_2_), .B(A_2_), .Y(n111) );
  NOR2X1 U207 ( .A(B_2_), .B(A_2_), .Y(n110) );
  OAI21XL U208 ( .A0(n96), .A1(n102), .B0(n97), .Y(n91) );
  OAI21X2 U209 ( .A0(n2), .A1(n25), .B0(n26), .Y(n24) );
  NOR2X2 U210 ( .A(n3), .B(n25), .Y(n23) );
  INVX1 U211 ( .A(n104), .Y(n103) );
  OAI21XL U212 ( .A0(n80), .A1(n88), .B0(n81), .Y(n79) );
  NAND2XL U213 ( .A(B_15_), .B(A_14_), .Y(n30) );
  NOR2X1 U214 ( .A(n101), .B(n96), .Y(n90) );
  NOR2X1 U215 ( .A(B_4_), .B(A_4_), .Y(n101) );
  NAND2X2 U216 ( .A(B_12_), .B(A_12_), .Y(n46) );
  AOI21XL U217 ( .A0(n1), .A1(n62), .B0(n63), .Y(n61) );
  OR2X2 U218 ( .A(B_14_), .B(A_14_), .Y(n194) );
  NAND2BX1 U219 ( .AN(n57), .B(n60), .Y(n9) );
  NAND2XL U220 ( .A(n71), .B(n74), .Y(n11) );
  XNOR2X1 U221 ( .A(n1), .B(n11), .Y(SUM_8_) );
  NAND2X1 U222 ( .A(n194), .B(n30), .Y(n192) );
  NOR2XL U223 ( .A(n110), .B(n107), .Y(n105) );
  NAND2XL U224 ( .A(B_6_), .B(A_6_), .Y(n88) );
  XOR2X1 U225 ( .A(n82), .B(n12), .Y(SUM_7_) );
  NAND2XL U226 ( .A(B_5_), .B(A_5_), .Y(n97) );
  NAND2XL U227 ( .A(B_1_), .B(A_1_), .Y(n115) );
  NAND2X1 U228 ( .A(B_13_), .B(A_13_), .Y(n39) );
  NOR2XL U229 ( .A(B_0_), .B(A_0_), .Y(n116) );
  NAND2X4 U230 ( .A(n193), .B(n77), .Y(n1) );
  AOI21X2 U231 ( .A0(n1), .A1(n48), .B0(n49), .Y(n47) );
  INVX1 U232 ( .A(n3), .Y(n48) );
  XOR2X1 U233 ( .A(n112), .B(n17), .Y(SUM_2_) );
  XOR2X1 U234 ( .A(n89), .B(n13), .Y(SUM_6_) );
  AOI21X1 U235 ( .A0(n103), .A1(n90), .B0(n91), .Y(n89) );
  INVX1 U236 ( .A(n30), .Y(n28) );
  INVXL U237 ( .A(n37), .Y(n35) );
  XNOR2X1 U238 ( .A(n103), .B(n15), .Y(SUM_4_) );
  NAND2X1 U239 ( .A(n99), .B(n102), .Y(n15) );
  OAI21XL U240 ( .A0(n93), .A1(n85), .B0(n88), .Y(n84) );
  INVX1 U241 ( .A(n91), .Y(n93) );
  OAI21XL U242 ( .A0(n65), .A1(n57), .B0(n60), .Y(n56) );
  INVXL U243 ( .A(n63), .Y(n65) );
  NOR2XL U244 ( .A(n3), .B(n43), .Y(n41) );
  INVX1 U245 ( .A(n101), .Y(n99) );
  INVXL U246 ( .A(n36), .Y(n34) );
  INVXL U247 ( .A(n2), .Y(n49) );
  INVX1 U248 ( .A(n102), .Y(n100) );
  AOI21X1 U249 ( .A0(n105), .A1(n113), .B0(n106), .Y(n104) );
  OAI21XL U250 ( .A0(n107), .A1(n111), .B0(n108), .Y(n106) );
  AOI21X1 U251 ( .A0(n103), .A1(n99), .B0(n100), .Y(n98) );
  NAND2X1 U252 ( .A(B_10_), .B(A_10_), .Y(n60) );
  NAND2X1 U253 ( .A(B_8_), .B(A_8_), .Y(n74) );
  NOR2X1 U254 ( .A(B_8_), .B(A_8_), .Y(n73) );
  AOI21X1 U255 ( .A0(n1), .A1(n71), .B0(n72), .Y(n70) );
  XNOR2X1 U256 ( .A(n109), .B(n16), .Y(SUM_3_) );
  OAI21XL U257 ( .A0(n112), .A1(n110), .B0(n111), .Y(n109) );
  INVXL U258 ( .A(n52), .Y(n122) );
  AOI21X1 U259 ( .A0(n1), .A1(n41), .B0(n42), .Y(n40) );
  INVX1 U260 ( .A(n113), .Y(n112) );
  NAND2X1 U261 ( .A(n195), .B(n21), .Y(n4) );
  NOR2X2 U262 ( .A(B_7_), .B(A_7_), .Y(n80) );
  NOR2X1 U263 ( .A(B_1_), .B(A_1_), .Y(n114) );
  XOR2X1 U264 ( .A(n18), .B(n117), .Y(SUM_1_) );
  NAND2XL U265 ( .A(B_7_), .B(A_7_), .Y(n81) );
  NAND2X1 U266 ( .A(B_3_), .B(A_3_), .Y(n108) );
  NAND2XL U267 ( .A(B_15_), .B(A_15_), .Y(n21) );
  OR2XL U268 ( .A(B_15_), .B(A_15_), .Y(n195) );
  NAND2XL U269 ( .A(n121), .B(n46), .Y(n7) );
endmodule


module SUBTA_1 ( SL, SE, D );
  input [13:0] SL;
  input [14:0] SE;
  output [15:0] D;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N16, N15, N14, N13, N12, N11, N10, N1,
         N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21;
  wire   SYNOPSYS_UNCONNECTED__0;
  assign N0 = SE[0];

  SUBTA_1_DW01_add_2 add_0_root_sub_0_root_sub_59 ( .A({N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 
        SL[13], SL[13], SL}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, D}) );
  XOR2X1 U3 ( .A(n11), .B(n5), .Y(N12) );
  XOR2X1 U4 ( .A(n17), .B(n2), .Y(N6) );
  INVX1 U5 ( .A(SE[4]), .Y(n19) );
  INVX1 U6 ( .A(SE[2]), .Y(n21) );
  INVX1 U7 ( .A(SE[6]), .Y(n17) );
  INVX1 U8 ( .A(SE[8]), .Y(n15) );
  INVX1 U9 ( .A(SE[10]), .Y(n13) );
  INVX1 U10 ( .A(SE[12]), .Y(n11) );
  INVX1 U11 ( .A(SE[14]), .Y(n9) );
  NOR2X1 U12 ( .A(n16), .B(SE[7]), .Y(n3) );
  XOR2XL U13 ( .A(n19), .B(n1), .Y(N4) );
  XOR2XL U14 ( .A(n13), .B(n4), .Y(N10) );
  XOR2XL U15 ( .A(n21), .B(n7), .Y(N2) );
  NAND2XL U16 ( .A(n6), .B(n9), .Y(n8) );
  XOR2XL U17 ( .A(N0), .B(SE[1]), .Y(N1) );
  INVX1 U18 ( .A(n8), .Y(N16) );
  NAND2X1 U19 ( .A(n7), .B(n21), .Y(n20) );
  NAND2X1 U20 ( .A(n1), .B(n19), .Y(n18) );
  NAND2X1 U21 ( .A(n2), .B(n17), .Y(n16) );
  NAND2X1 U22 ( .A(n3), .B(n15), .Y(n14) );
  NAND2X1 U23 ( .A(n4), .B(n13), .Y(n12) );
  NAND2X1 U24 ( .A(n5), .B(n11), .Y(n10) );
  XOR2X1 U25 ( .A(n9), .B(n6), .Y(N14) );
  XOR2X1 U26 ( .A(n15), .B(n3), .Y(N8) );
  NOR2BX1 U27 ( .AN(n8), .B(SE[14]), .Y(N15) );
  NOR2X1 U28 ( .A(n20), .B(SE[3]), .Y(n1) );
  NOR2X1 U29 ( .A(n18), .B(SE[5]), .Y(n2) );
  NOR2X1 U30 ( .A(n14), .B(SE[9]), .Y(n4) );
  NOR2X1 U31 ( .A(n12), .B(SE[11]), .Y(n5) );
  NOR2X1 U32 ( .A(n10), .B(SE[13]), .Y(n6) );
  NOR2X1 U33 ( .A(N0), .B(SE[1]), .Y(n7) );
  XOR2X1 U34 ( .A(n10), .B(SE[13]), .Y(N13) );
  XOR2X1 U35 ( .A(n14), .B(SE[9]), .Y(N9) );
  XOR2X1 U36 ( .A(n16), .B(SE[7]), .Y(N7) );
  XOR2X1 U37 ( .A(n12), .B(SE[11]), .Y(N11) );
  XOR2X1 U38 ( .A(n18), .B(SE[5]), .Y(N5) );
  XOR2X1 U39 ( .A(n20), .B(SE[3]), .Y(N3) );
endmodule

