
module ADDC_1_DW01_add_1 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n18, n19,
         n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n33, n35, n36,
         n38, n40, n41, n42, n44, n46, n47, n48, n49, n51, n53, n54, n56, n58,
         n59, n60, n62, n64, n65, n66, n67, n69, n71, n72, n74, n76, n77, n78,
         n80, n82, n83, n84, n85, n86, n88, n90, n91, n92, n93, n95, n97, n98,
         SUM_1_, SUM_2_, SUM_3_, SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_,
         SUM_9_, SUM_10_, SUM_11_, SUM_12_, SUM_13_, SUM_14_, SUM_15_, B_0_,
         B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_, B_8_, B_9_, B_10_, B_11_,
         B_12_, B_13_, B_14_, A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, A_7_,
         A_8_, A_9_, A_10_, A_11_, A_12_, A_13_, A_14_, A_15_, n166, SUM_0_,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180;
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
  assign SUM[0] = SUM_0_;

  OAI21X4 U23 ( .A0(n30), .A1(n42), .B0(n31), .Y(n29) );
  AOI21X4 U131 ( .A0(n47), .A1(n178), .B0(n44), .Y(n42) );
  OAI21X4 U132 ( .A0(n48), .A1(n60), .B0(n49), .Y(n47) );
  OAI21X1 U133 ( .A0(n92), .A1(n95), .B0(n93), .Y(n91) );
  AOI21X2 U134 ( .A0(n65), .A1(n180), .B0(n62), .Y(n60) );
  AOI21X1 U135 ( .A0(n83), .A1(n177), .B0(n80), .Y(n78) );
  NAND2X1 U136 ( .A(n173), .B(n175), .Y(n66) );
  NAND2BXL U137 ( .AN(n92), .B(n93), .Y(n15) );
  AOI21X1 U138 ( .A0(n91), .A1(n179), .B0(n88), .Y(n86) );
  NAND2X1 U139 ( .A(n171), .B(n174), .Y(n30) );
  NAND2X1 U140 ( .A(A_5_), .B(B_5_), .Y(n76) );
  INVX1 U141 ( .A(n76), .Y(n74) );
  OR2X2 U142 ( .A(A_5_), .B(B_5_), .Y(n175) );
  NAND2X1 U143 ( .A(A_0_), .B(B_0_), .Y(n95) );
  OR2X2 U144 ( .A(A_12_), .B(B_12_), .Y(n171) );
  NAND2X1 U145 ( .A(n166), .B(n18), .Y(n1) );
  NAND2X1 U146 ( .A(A_15_), .B(B_14_), .Y(n18) );
  AOI21X1 U147 ( .A0(n29), .A1(n98), .B0(n26), .Y(n24) );
  INVX1 U148 ( .A(n64), .Y(n62) );
  NOR2X1 U149 ( .A(A_3_), .B(B_3_), .Y(n84) );
  NAND2X1 U150 ( .A(A_4_), .B(B_4_), .Y(n82) );
  NAND2X1 U151 ( .A(A_2_), .B(B_2_), .Y(n90) );
  NAND2X1 U152 ( .A(A_8_), .B(B_8_), .Y(n58) );
  OAI21X2 U153 ( .A0(n66), .A1(n78), .B0(n67), .Y(n65) );
  AOI21X1 U154 ( .A0(n173), .A1(n74), .B0(n69), .Y(n67) );
  INVX1 U155 ( .A(n71), .Y(n69) );
  INVX1 U156 ( .A(n58), .Y(n56) );
  NAND2X1 U157 ( .A(A_11_), .B(B_11_), .Y(n40) );
  INVX1 U158 ( .A(n40), .Y(n38) );
  OR2X2 U159 ( .A(A_11_), .B(B_11_), .Y(n174) );
  NOR2X2 U160 ( .A(A_13_), .B(B_13_), .Y(n27) );
  NAND2X1 U161 ( .A(A_13_), .B(B_13_), .Y(n28) );
  NAND2X1 U162 ( .A(A_14_), .B(B_14_), .Y(n23) );
  NOR2X2 U163 ( .A(A_14_), .B(B_14_), .Y(n22) );
  OAI21X2 U164 ( .A0(n22), .A1(n28), .B0(n23), .Y(n21) );
  OR2X2 U165 ( .A(B_14_), .B(A_15_), .Y(n166) );
  AND2X2 U166 ( .A(n170), .B(n95), .Y(SUM_0_) );
  OR2X2 U167 ( .A(A_8_), .B(B_8_), .Y(n176) );
  NAND2X1 U168 ( .A(n172), .B(n176), .Y(n48) );
  XOR2X4 U169 ( .A(n19), .B(n1), .Y(SUM_15_) );
  AOI21X4 U170 ( .A0(n20), .A1(n29), .B0(n21), .Y(n19) );
  AOI21X1 U171 ( .A0(n41), .A1(n174), .B0(n38), .Y(n36) );
  OR2XL U172 ( .A(A_0_), .B(B_0_), .Y(n170) );
  AOI21X2 U173 ( .A0(n171), .A1(n38), .B0(n33), .Y(n31) );
  XNOR2X1 U174 ( .A(n24), .B(n168), .Y(SUM_14_) );
  AND2X1 U175 ( .A(n97), .B(n23), .Y(n168) );
  AOI21XL U176 ( .A0(n59), .A1(n176), .B0(n56), .Y(n54) );
  NAND2XL U177 ( .A(n177), .B(n82), .Y(n12) );
  NAND2XL U178 ( .A(n172), .B(n53), .Y(n7) );
  NAND2XL U179 ( .A(n174), .B(n40), .Y(n5) );
  XOR2X1 U180 ( .A(n59), .B(n169), .Y(SUM_8_) );
  AND2X1 U181 ( .A(n176), .B(n58), .Y(n169) );
  NAND2XL U182 ( .A(n179), .B(n90), .Y(n14) );
  NAND2BXL U183 ( .AN(n84), .B(n85), .Y(n13) );
  NAND2XL U184 ( .A(n173), .B(n71), .Y(n10) );
  NAND2XL U185 ( .A(n175), .B(n76), .Y(n11) );
  XOR2XL U186 ( .A(n15), .B(n95), .Y(SUM_1_) );
  NAND2X1 U187 ( .A(A_12_), .B(B_12_), .Y(n35) );
  NAND2XL U188 ( .A(A_1_), .B(B_1_), .Y(n93) );
  NAND2X1 U189 ( .A(A_10_), .B(B_10_), .Y(n46) );
  INVXL U190 ( .A(n78), .Y(n77) );
  INVX1 U191 ( .A(n60), .Y(n59) );
  INVXL U192 ( .A(n42), .Y(n41) );
  INVX1 U193 ( .A(n35), .Y(n33) );
  INVX1 U194 ( .A(n90), .Y(n88) );
  OAI21X2 U195 ( .A0(n86), .A1(n84), .B0(n85), .Y(n83) );
  AOI21X1 U196 ( .A0(n172), .A1(n56), .B0(n51), .Y(n49) );
  INVX1 U197 ( .A(n53), .Y(n51) );
  INVX1 U198 ( .A(n46), .Y(n44) );
  INVX1 U199 ( .A(n82), .Y(n80) );
  AOI21X1 U200 ( .A0(n77), .A1(n175), .B0(n74), .Y(n72) );
  NOR2X2 U201 ( .A(n22), .B(n27), .Y(n20) );
  NAND2XL U202 ( .A(n98), .B(n28), .Y(n3) );
  INVXL U203 ( .A(n27), .Y(n98) );
  INVXL U204 ( .A(n22), .Y(n97) );
  XNOR2X1 U205 ( .A(n65), .B(n9), .Y(SUM_7_) );
  XOR2X1 U206 ( .A(n72), .B(n10), .Y(SUM_6_) );
  NAND2X1 U207 ( .A(n180), .B(n64), .Y(n9) );
  XOR2X1 U208 ( .A(n36), .B(n4), .Y(SUM_12_) );
  XNOR2X1 U209 ( .A(n29), .B(n3), .Y(SUM_13_) );
  NAND2X1 U210 ( .A(n171), .B(n35), .Y(n4) );
  XNOR2X1 U211 ( .A(n83), .B(n12), .Y(SUM_4_) );
  XNOR2X1 U212 ( .A(n77), .B(n11), .Y(SUM_5_) );
  XOR2X1 U213 ( .A(n54), .B(n7), .Y(SUM_9_) );
  XNOR2XL U214 ( .A(n14), .B(n91), .Y(SUM_2_) );
  XOR2XL U215 ( .A(n13), .B(n86), .Y(SUM_3_) );
  XNOR2X1 U216 ( .A(n47), .B(n6), .Y(SUM_10_) );
  XNOR2X1 U217 ( .A(n41), .B(n5), .Y(SUM_11_) );
  NAND2X1 U218 ( .A(n178), .B(n46), .Y(n6) );
  INVXL U219 ( .A(n28), .Y(n26) );
  NOR2X1 U220 ( .A(A_1_), .B(B_1_), .Y(n92) );
  OR2X2 U221 ( .A(A_9_), .B(B_9_), .Y(n172) );
  OR2X2 U222 ( .A(A_6_), .B(B_6_), .Y(n173) );
  NAND2X1 U223 ( .A(A_3_), .B(B_3_), .Y(n85) );
  NAND2X1 U224 ( .A(A_9_), .B(B_9_), .Y(n53) );
  NAND2X1 U225 ( .A(A_7_), .B(B_7_), .Y(n64) );
  NAND2X1 U226 ( .A(A_6_), .B(B_6_), .Y(n71) );
  OR2X2 U227 ( .A(A_4_), .B(B_4_), .Y(n177) );
  OR2X2 U228 ( .A(A_10_), .B(B_10_), .Y(n178) );
  OR2X2 U229 ( .A(A_2_), .B(B_2_), .Y(n179) );
  OR2X2 U230 ( .A(A_7_), .B(B_7_), .Y(n180) );
endmodule


module ADDC_1 ( DQ, SEZ, PK0, SIGPK );
  input [15:0] DQ;
  input [14:0] SEZ;
  output PK0, SIGPK;
  wire   N3, DQI_15_, N19, n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59;
  wire   [14:0] DQSEZ;
  assign N3 = DQ[0];
  assign SIGPK = N19;

  ADDC_1_DW01_add_1 add_57 ( .A({DQI_15_, n46, n47, n48, n49, n50, n51, n52, 
        n53, n54, n55, n56, n57, n58, n59, N3}), .B({SEZ[14], SEZ}), .CI(1'b0), 
        .SUM({PK0, DQSEZ}) );
  XOR2X2 U2 ( .A(DQ[14]), .B(n18), .Y(n46) );
  NAND2X1 U4 ( .A(n6), .B(n15), .Y(n17) );
  NOR2BX1 U5 ( .AN(n29), .B(n34), .Y(n30) );
  NOR2XL U6 ( .A(n9), .B(n34), .Y(n20) );
  OR2X2 U7 ( .A(n6), .B(n34), .Y(n2) );
  AND2X2 U8 ( .A(n17), .B(DQ[15]), .Y(n18) );
  NOR2X1 U9 ( .A(n13), .B(n34), .Y(n33) );
  NOR2X2 U10 ( .A(N3), .B(DQ[1]), .Y(n13) );
  NOR3X2 U11 ( .A(DQ[4]), .B(DQ[3]), .C(DQ[5]), .Y(n4) );
  NOR2BX2 U12 ( .AN(N3), .B(n34), .Y(n35) );
  NOR2X2 U13 ( .A(n7), .B(n34), .Y(n19) );
  NOR2BX4 U14 ( .AN(n7), .B(DQ[12]), .Y(n6) );
  NOR2X1 U15 ( .A(PK0), .B(DQSEZ[14]), .Y(n40) );
  INVX1 U16 ( .A(DQ[8]), .Y(n14) );
  NAND4X1 U17 ( .A(n39), .B(n38), .C(n37), .D(n36), .Y(n45) );
  XOR2X1 U18 ( .A(DQ[11]), .B(n20), .Y(n49) );
  XNOR2X1 U19 ( .A(DQ[13]), .B(n2), .Y(n47) );
  INVX1 U20 ( .A(DQ[13]), .Y(n15) );
  AND2X2 U21 ( .A(n8), .B(n14), .Y(n1) );
  INVX1 U22 ( .A(DQ[15]), .Y(n34) );
  NOR2X4 U23 ( .A(n45), .B(n44), .Y(N19) );
  NOR2XL U24 ( .A(DQ[14]), .B(n17), .Y(n16) );
  NOR2XL U25 ( .A(n8), .B(n34), .Y(n23) );
  INVXL U26 ( .A(DQ[3]), .Y(n27) );
  INVXL U27 ( .A(DQ[1]), .Y(n3) );
  NOR2X1 U28 ( .A(DQSEZ[0]), .B(DQSEZ[1]), .Y(n38) );
  NOR2BX4 U29 ( .AN(n12), .B(DQ[10]), .Y(n9) );
  NOR2BX4 U30 ( .AN(n9), .B(DQ[11]), .Y(n7) );
  NOR2BX4 U31 ( .AN(n25), .B(DQ[6]), .Y(n11) );
  NOR2XL U32 ( .A(n1), .B(n34), .Y(n22) );
  INVXL U33 ( .A(DQ[2]), .Y(n31) );
  NOR2XL U34 ( .A(n12), .B(n34), .Y(n21) );
  NOR2XL U35 ( .A(n11), .B(n34), .Y(n24) );
  NOR2XL U36 ( .A(n25), .B(n34), .Y(n26) );
  AND3X4 U37 ( .A(n4), .B(n3), .C(n5), .Y(n25) );
  NOR2X4 U38 ( .A(DQ[2]), .B(N3), .Y(n5) );
  XNOR2X1 U39 ( .A(DQ[5]), .B(n28), .Y(n55) );
  NAND4X2 U40 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(n44) );
  XOR2X1 U41 ( .A(DQ[12]), .B(n19), .Y(n48) );
  XOR2X1 U42 ( .A(DQ[2]), .B(n33), .Y(n58) );
  NOR2X1 U43 ( .A(n16), .B(n34), .Y(DQI_15_) );
  XOR2X1 U44 ( .A(DQ[10]), .B(n21), .Y(n50) );
  XOR2X1 U45 ( .A(DQ[8]), .B(n23), .Y(n52) );
  XOR2X1 U46 ( .A(DQ[9]), .B(n22), .Y(n51) );
  XOR2X1 U47 ( .A(DQ[6]), .B(n26), .Y(n54) );
  XOR2X1 U48 ( .A(DQ[7]), .B(n24), .Y(n53) );
  XOR2X1 U49 ( .A(DQ[3]), .B(n32), .Y(n57) );
  AOI21X1 U50 ( .A0(n13), .A1(n31), .B0(n34), .Y(n32) );
  NOR2BX1 U51 ( .AN(n11), .B(DQ[7]), .Y(n8) );
  NOR2BX4 U52 ( .AN(n1), .B(DQ[9]), .Y(n12) );
  XOR2X1 U53 ( .A(DQ[4]), .B(n30), .Y(n56) );
  XOR2X1 U54 ( .A(DQ[1]), .B(n35), .Y(n59) );
  OAI21XL U55 ( .A0(DQ[4]), .A1(n29), .B0(DQ[15]), .Y(n28) );
  NOR2X1 U56 ( .A(DQSEZ[6]), .B(DQSEZ[7]), .Y(n36) );
  NOR2X1 U57 ( .A(DQSEZ[12]), .B(DQSEZ[13]), .Y(n41) );
  NOR2X1 U58 ( .A(DQSEZ[4]), .B(DQSEZ[5]), .Y(n37) );
  NOR2X1 U59 ( .A(DQSEZ[8]), .B(DQSEZ[9]), .Y(n42) );
  NOR2X1 U60 ( .A(DQSEZ[2]), .B(DQSEZ[3]), .Y(n39) );
  NOR2X1 U61 ( .A(DQSEZ[10]), .B(DQSEZ[11]), .Y(n43) );
  NAND3BX1 U62 ( .AN(DQ[2]), .B(n27), .C(n13), .Y(n29) );
endmodule

