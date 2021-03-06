
module SUBTA_0_DW01_add_5 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n18,
         n21, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n56, n57, n60, n61, n62, n63, n65, n68, n69, n70, n71, n72,
         n73, n74, n77, n78, n79, n80, n81, n82, n83, n84, n85, n88, n89, n90,
         n91, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         SUM_0_, SUM_1_, SUM_2_, SUM_3_, SUM_4_, SUM_5_, SUM_6_, SUM_7_,
         SUM_8_, SUM_9_, SUM_10_, SUM_11_, SUM_12_, SUM_13_, SUM_14_, SUM_15_,
         B_0_, B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_, B_8_, B_9_, B_10_,
         B_11_, B_12_, B_13_, B_14_, B_15_, A_0_, A_1_, A_2_, A_3_, A_4_, A_5_,
         A_6_, A_7_, A_8_, A_9_, A_10_, A_11_, A_12_, A_13_, A_14_, A_15_,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202;
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
  AOI21X4 U46 ( .A0(n50), .A1(n63), .B0(n51), .Y(n2) );
  NOR2X4 U73 ( .A(n196), .B(A_9_), .Y(n68) );
  XOR2X4 U83 ( .A(n82), .B(n12), .Y(SUM_7_) );
  NOR2X4 U130 ( .A(B_3_), .B(A_3_), .Y(n107) );
  NAND2X4 U153 ( .A(n193), .B(A_4_), .Y(n102) );
  XOR2X2 U154 ( .A(n18), .B(n117), .Y(SUM_1_) );
  OAI21X1 U155 ( .A0(n194), .A1(n85), .B0(n88), .Y(n84) );
  INVX2 U156 ( .A(n91), .Y(n194) );
  XOR2X2 U157 ( .A(n98), .B(n14), .Y(SUM_5_) );
  INVX4 U158 ( .A(B_7_), .Y(n190) );
  CLKINVX4 U159 ( .A(n190), .Y(n191) );
  INVX2 U160 ( .A(B_4_), .Y(n192) );
  CLKINVX4 U161 ( .A(n192), .Y(n193) );
  XNOR2X4 U162 ( .A(n112), .B(n199), .Y(SUM_2_) );
  NOR2BX4 U163 ( .AN(n111), .B(n110), .Y(n199) );
  INVX4 U164 ( .A(n102), .Y(n100) );
  OAI21X2 U165 ( .A0(n114), .A1(n117), .B0(n115), .Y(n113) );
  NOR2X2 U166 ( .A(B_1_), .B(A_1_), .Y(n114) );
  INVX4 U167 ( .A(n113), .Y(n112) );
  AOI21X1 U168 ( .A0(n103), .A1(n90), .B0(n91), .Y(n89) );
  NOR2X2 U169 ( .A(n101), .B(n96), .Y(n90) );
  BUFX3 U170 ( .A(B_9_), .Y(n196) );
  NOR2X2 U171 ( .A(B_10_), .B(A_10_), .Y(n57) );
  NOR2X2 U172 ( .A(B_13_), .B(A_13_), .Y(n38) );
  NAND2X1 U173 ( .A(B_13_), .B(A_13_), .Y(n39) );
  NAND2X1 U174 ( .A(B_5_), .B(A_5_), .Y(n97) );
  OR2X2 U175 ( .A(B_14_), .B(A_14_), .Y(n201) );
  CLKINVX3 U176 ( .A(n104), .Y(n103) );
  NAND2BX1 U177 ( .AN(n85), .B(n88), .Y(n13) );
  NAND2BX1 U178 ( .AN(n96), .B(n97), .Y(n14) );
  NAND2BX1 U179 ( .AN(n80), .B(n81), .Y(n12) );
  NOR2BX1 U180 ( .AN(n117), .B(n116), .Y(SUM_0_) );
  XOR2X2 U181 ( .A(n70), .B(n10), .Y(SUM_9_) );
  NAND2BXL U182 ( .AN(n57), .B(n60), .Y(n9) );
  OAI21XL U183 ( .A0(n34), .A1(n2), .B0(n35), .Y(n33) );
  INVXL U184 ( .A(n37), .Y(n35) );
  AOI31X1 U185 ( .A0(n195), .A1(n1), .A2(n62), .B0(n56), .Y(n54) );
  INVX1 U186 ( .A(n57), .Y(n195) );
  NAND2BX1 U187 ( .AN(n52), .B(n53), .Y(n8) );
  NAND2BX1 U188 ( .AN(n38), .B(n39), .Y(n6) );
  NAND2BX1 U189 ( .AN(n68), .B(n69), .Y(n10) );
  NAND2BX1 U190 ( .AN(n107), .B(n108), .Y(n16) );
  AOI21X2 U191 ( .A0(n105), .A1(n113), .B0(n106), .Y(n104) );
  XNOR2X2 U192 ( .A(n103), .B(n198), .Y(SUM_4_) );
  NOR2X4 U193 ( .A(B_11_), .B(A_11_), .Y(n52) );
  AOI21X2 U194 ( .A0(n78), .A1(n91), .B0(n79), .Y(n77) );
  NAND2X2 U195 ( .A(B_0_), .B(A_0_), .Y(n117) );
  XNOR2X2 U196 ( .A(n1), .B(n11), .Y(SUM_8_) );
  NAND2X1 U197 ( .A(n71), .B(n74), .Y(n11) );
  NOR2X2 U198 ( .A(n110), .B(n107), .Y(n105) );
  OAI21X2 U199 ( .A0(n107), .A1(n111), .B0(n108), .Y(n106) );
  XOR2X2 U200 ( .A(n89), .B(n13), .Y(SUM_6_) );
  NOR2X2 U201 ( .A(n85), .B(n80), .Y(n78) );
  NOR2BX1 U202 ( .AN(n90), .B(n85), .Y(n83) );
  OAI21XL U203 ( .A0(n65), .A1(n57), .B0(n60), .Y(n56) );
  NAND2X1 U204 ( .A(B_10_), .B(A_10_), .Y(n60) );
  XNOR2X2 U205 ( .A(n109), .B(n16), .Y(SUM_3_) );
  OAI21XL U206 ( .A0(n112), .A1(n110), .B0(n111), .Y(n109) );
  XOR2X1 U207 ( .A(n40), .B(n6), .Y(SUM_13_) );
  NOR2X2 U208 ( .A(n191), .B(A_7_), .Y(n80) );
  NAND2X1 U209 ( .A(n202), .B(n21), .Y(n4) );
  CLKBUFX2 U210 ( .A(B_6_), .Y(n197) );
  OAI21X2 U211 ( .A0(n52), .A1(n60), .B0(n53), .Y(n51) );
  NOR2X4 U212 ( .A(B_2_), .B(A_2_), .Y(n110) );
  NOR2X2 U213 ( .A(n73), .B(n68), .Y(n62) );
  NAND2X2 U214 ( .A(n197), .B(A_6_), .Y(n88) );
  NAND2X4 U215 ( .A(B_2_), .B(A_2_), .Y(n111) );
  NAND2X1 U216 ( .A(B_15_), .B(A_15_), .Y(n21) );
  OR2X2 U217 ( .A(B_15_), .B(A_15_), .Y(n202) );
  NAND2X1 U218 ( .A(B_14_), .B(A_14_), .Y(n30) );
  NOR2X4 U219 ( .A(B_6_), .B(A_6_), .Y(n85) );
  OAI21X2 U220 ( .A0(n96), .A1(n102), .B0(n97), .Y(n91) );
  NAND2X2 U221 ( .A(n99), .B(n102), .Y(n198) );
  OAI21X2 U222 ( .A0(n80), .A1(n88), .B0(n81), .Y(n79) );
  XOR2X1 U223 ( .A(n47), .B(n7), .Y(SUM_12_) );
  NOR2X2 U224 ( .A(n57), .B(n52), .Y(n50) );
  INVX1 U225 ( .A(n101), .Y(n99) );
  INVX1 U226 ( .A(n73), .Y(n71) );
  XOR2X1 U227 ( .A(n54), .B(n8), .Y(SUM_11_) );
  XOR2X1 U228 ( .A(n61), .B(n9), .Y(SUM_10_) );
  NAND2X1 U229 ( .A(B_11_), .B(A_11_), .Y(n53) );
  NOR2X2 U230 ( .A(B_4_), .B(A_4_), .Y(n101) );
  NOR2X2 U231 ( .A(B_5_), .B(A_5_), .Y(n96) );
  INVX1 U232 ( .A(n30), .Y(n28) );
  AOI21X2 U233 ( .A0(n1), .A1(n23), .B0(n24), .Y(n22) );
  AOI21X1 U234 ( .A0(n1), .A1(n62), .B0(n63), .Y(n61) );
  OAI21X4 U235 ( .A0(n68), .A1(n74), .B0(n69), .Y(n63) );
  AOI21X2 U236 ( .A0(n37), .A1(n201), .B0(n28), .Y(n26) );
  NAND2BX1 U237 ( .AN(n114), .B(n115), .Y(n18) );
  NAND2X1 U238 ( .A(B_1_), .B(A_1_), .Y(n115) );
  NAND2X4 U239 ( .A(A_8_), .B(B_8_), .Y(n74) );
  OAI21X2 U240 ( .A0(n46), .A1(n38), .B0(n39), .Y(n37) );
  NAND2X2 U241 ( .A(n36), .B(n201), .Y(n25) );
  AOI21X2 U242 ( .A0(n1), .A1(n71), .B0(n72), .Y(n70) );
  NOR2X2 U243 ( .A(B_8_), .B(A_8_), .Y(n73) );
  OAI21X1 U244 ( .A0(n2), .A1(n25), .B0(n26), .Y(n24) );
  AOI21X1 U245 ( .A0(n1), .A1(n48), .B0(n49), .Y(n47) );
  AND2X1 U246 ( .A(n90), .B(n78), .Y(n200) );
  AOI21X2 U247 ( .A0(n83), .A1(n103), .B0(n84), .Y(n82) );
  NAND2X1 U248 ( .A(n191), .B(A_7_), .Y(n81) );
  NOR2X1 U249 ( .A(n3), .B(n25), .Y(n23) );
  AOI21X1 U250 ( .A0(n1), .A1(n41), .B0(n42), .Y(n40) );
  AOI21X2 U251 ( .A0(n103), .A1(n99), .B0(n100), .Y(n98) );
  INVXL U252 ( .A(n3), .Y(n48) );
  INVXL U253 ( .A(n36), .Y(n34) );
  AOI21XL U254 ( .A0(n1), .A1(n32), .B0(n33), .Y(n31) );
  NAND2BX1 U255 ( .AN(n43), .B(n46), .Y(n7) );
  NOR2XL U256 ( .A(B_0_), .B(A_0_), .Y(n116) );
  XOR2X1 U257 ( .A(n31), .B(n5), .Y(SUM_14_) );
  NAND2X2 U258 ( .A(n62), .B(n50), .Y(n3) );
  NOR2XL U259 ( .A(n3), .B(n34), .Y(n32) );
  NAND2XL U260 ( .A(n201), .B(n30), .Y(n5) );
  INVX1 U261 ( .A(n63), .Y(n65) );
  INVXL U262 ( .A(n2), .Y(n49) );
  INVX1 U263 ( .A(n74), .Y(n72) );
  OAI2BB1X4 U264 ( .A0N(n103), .A1N(n200), .B0(n77), .Y(n1) );
  NOR2X2 U265 ( .A(B_12_), .B(A_12_), .Y(n43) );
  NOR2X2 U266 ( .A(n43), .B(n38), .Y(n36) );
  NAND2X2 U267 ( .A(B_12_), .B(A_12_), .Y(n46) );
  NAND2X2 U268 ( .A(B_3_), .B(A_3_), .Y(n108) );
  NAND2X1 U269 ( .A(B_9_), .B(A_9_), .Y(n69) );
  OAI21XL U270 ( .A0(n2), .A1(n43), .B0(n46), .Y(n42) );
  NOR2XL U271 ( .A(n3), .B(n43), .Y(n41) );
endmodule


module SUBTA_0 ( SL, SE, D );
  input [13:0] SL;
  input [14:0] SE;
  output [15:0] D;
  wire   N9, N8, N7, N6, N5, N4, N3, N2, N16, N15, N14, N13, N12, N11, N10, N1,
         N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21;
  wire   SYNOPSYS_UNCONNECTED__0;
  assign N0 = SE[0];

  SUBTA_0_DW01_add_5 add_0_root_sub_0_root_sub_59 ( .A({N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .B({1'b0, 
        SL[13], SL[13], SL}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, D}) );
  INVX1 U3 ( .A(n8), .Y(N16) );
  NAND2X1 U4 ( .A(n7), .B(n21), .Y(n20) );
  NAND2X1 U5 ( .A(n1), .B(n19), .Y(n18) );
  NAND2X1 U6 ( .A(n3), .B(n15), .Y(n14) );
  NAND2X1 U7 ( .A(n4), .B(n13), .Y(n12) );
  NAND2X1 U8 ( .A(n5), .B(n11), .Y(n10) );
  NAND2X1 U9 ( .A(n2), .B(n17), .Y(n16) );
  NAND2X1 U10 ( .A(n6), .B(n9), .Y(n8) );
  XOR2X1 U11 ( .A(n9), .B(n6), .Y(N14) );
  XOR2X1 U12 ( .A(n21), .B(n7), .Y(N2) );
  XOR2X1 U13 ( .A(n15), .B(n3), .Y(N8) );
  XOR2X1 U14 ( .A(n19), .B(n1), .Y(N4) );
  XOR2X1 U15 ( .A(n11), .B(n5), .Y(N12) );
  XOR2X1 U16 ( .A(n13), .B(n4), .Y(N10) );
  XOR2X1 U17 ( .A(n17), .B(n2), .Y(N6) );
  NOR2X1 U18 ( .A(n20), .B(SE[3]), .Y(n1) );
  NOR2X1 U19 ( .A(n18), .B(SE[5]), .Y(n2) );
  NOR2X1 U20 ( .A(n16), .B(SE[7]), .Y(n3) );
  NOR2X1 U21 ( .A(n14), .B(SE[9]), .Y(n4) );
  NOR2X1 U22 ( .A(n12), .B(SE[11]), .Y(n5) );
  NOR2X1 U23 ( .A(n10), .B(SE[13]), .Y(n6) );
  NOR2X1 U24 ( .A(N0), .B(SE[1]), .Y(n7) );
  NOR2BX1 U25 ( .AN(n8), .B(SE[14]), .Y(N15) );
  INVX1 U26 ( .A(SE[2]), .Y(n21) );
  XOR2X1 U27 ( .A(n10), .B(SE[13]), .Y(N13) );
  XOR2X1 U28 ( .A(N0), .B(SE[1]), .Y(N1) );
  XOR2X1 U29 ( .A(n14), .B(SE[9]), .Y(N9) );
  XOR2X1 U30 ( .A(n20), .B(SE[3]), .Y(N3) );
  XOR2X1 U31 ( .A(n16), .B(SE[7]), .Y(N7) );
  XOR2X1 U32 ( .A(n18), .B(SE[5]), .Y(N5) );
  INVX1 U33 ( .A(SE[4]), .Y(n19) );
  INVX1 U34 ( .A(SE[8]), .Y(n15) );
  INVX1 U35 ( .A(SE[6]), .Y(n17) );
  XOR2X1 U36 ( .A(n12), .B(SE[11]), .Y(N11) );
  INVX1 U37 ( .A(SE[14]), .Y(n9) );
  INVX1 U38 ( .A(SE[10]), .Y(n13) );
  INVX1 U39 ( .A(SE[12]), .Y(n11) );
endmodule

