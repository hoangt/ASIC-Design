
module ADDB_0_DW01_add_6 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n6, n7, n9, n11, n12, n14, n15, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n31, n33, n34, n35, n36, n37, n38, n41,
         n42, n43, n44, n46, n48, n49, n50, n51, n52, n53, n54, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n69, n71, n72, n73, n74, n75,
         n76, n79, n80, n81, n82, n84, n86, n87, n89, n91, n92, n93, n95, n97,
         n98, n99, n100, n102, SUM_2_, SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_,
         SUM_9_, SUM_10_, SUM_11_, SUM_12_, SUM_13_, SUM_14_, SUM_15_, B_0_,
         B_1_, B_2_, B_3_, B_4_, B_5_, B_6_, B_7_, B_8_, B_9_, B_10_, B_11_,
         B_12_, B_13_, B_14_, A_0_, A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, A_7_,
         A_8_, A_9_, A_10_, A_11_, A_12_, A_13_, A_14_, A_15_, n173, n174,
         SUM_0_, SUM_1_, SUM_3_, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193;
  assign SUM[2] = SUM_2_;
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
  assign SUM[1] = SUM_1_;
  assign SUM[3] = SUM_3_;

  OAI21X4 U7 ( .A0(n22), .A1(n20), .B0(n21), .Y(n19) );
  AOI21X4 U13 ( .A0(n23), .A1(n42), .B0(n24), .Y(n22) );
  NAND2X4 U39 ( .A(A_11_), .B(B_11_), .Y(n36) );
  OAI21X4 U42 ( .A0(n60), .A1(n43), .B0(n44), .Y(n42) );
  NOR2X4 U53 ( .A(n52), .B(n57), .Y(n50) );
  AOI21X4 U69 ( .A0(n61), .A1(n80), .B0(n62), .Y(n60) );
  OAI21X4 U87 ( .A0(n79), .A1(n73), .B0(n74), .Y(n72) );
  NAND2X4 U95 ( .A(A_5_), .B(B_5_), .Y(n74) );
  AOI21X4 U117 ( .A0(n98), .A1(n189), .B0(n95), .Y(n93) );
  INVX1 U138 ( .A(n60), .Y(n59) );
  XOR2X2 U139 ( .A(n59), .B(n183), .Y(SUM_8_) );
  NAND2X2 U140 ( .A(A_8_), .B(B_8_), .Y(n58) );
  NOR2X2 U141 ( .A(A_9_), .B(B_9_), .Y(n52) );
  NAND2X2 U142 ( .A(n50), .B(n188), .Y(n43) );
  OAI21X2 U143 ( .A0(n52), .A1(n58), .B0(n53), .Y(n51) );
  AOI21X2 U144 ( .A0(n51), .A1(n188), .B0(n46), .Y(n44) );
  INVX1 U145 ( .A(n48), .Y(n46) );
  NOR2BX1 U146 ( .AN(n58), .B(n57), .Y(n183) );
  OAI21X2 U147 ( .A0(n29), .A1(n25), .B0(n26), .Y(n24) );
  NOR2X2 U148 ( .A(n28), .B(n25), .Y(n23) );
  NAND2BX1 U149 ( .AN(n63), .B(n64), .Y(n9) );
  AOI21X1 U150 ( .A0(n59), .A1(n50), .B0(n51), .Y(n49) );
  NAND2BX1 U151 ( .AN(n99), .B(n100), .Y(n15) );
  NAND2BX1 U152 ( .AN(n25), .B(n26), .Y(n3) );
  NAND2BX1 U153 ( .AN(n20), .B(n21), .Y(n2) );
  NOR2BXL U154 ( .AN(n36), .B(n35), .Y(n182) );
  XNOR2X2 U155 ( .A(n65), .B(n9), .Y(SUM_7_) );
  OAI21XL U156 ( .A0(n60), .A1(n57), .B0(n58), .Y(n173) );
  INVX1 U157 ( .A(n173), .Y(n54) );
  XOR2X1 U158 ( .A(n54), .B(n7), .Y(SUM_9_) );
  INVX1 U159 ( .A(n35), .Y(n37) );
  NAND2X1 U160 ( .A(n75), .B(n187), .Y(n66) );
  CLKINVX3 U161 ( .A(n73), .Y(n75) );
  NOR2X2 U162 ( .A(A_14_), .B(B_14_), .Y(n20) );
  NOR2X2 U163 ( .A(A_7_), .B(B_7_), .Y(n63) );
  NOR2X4 U164 ( .A(A_5_), .B(B_5_), .Y(n73) );
  XNOR2X2 U165 ( .A(n14), .B(n98), .Y(SUM_2_) );
  NAND2XL U166 ( .A(n189), .B(n97), .Y(n14) );
  INVX1 U167 ( .A(n97), .Y(n95) );
  NOR2X2 U168 ( .A(A_8_), .B(B_8_), .Y(n57) );
  NOR2X2 U169 ( .A(n66), .B(n63), .Y(n61) );
  NAND2X2 U170 ( .A(A_3_), .B(B_3_), .Y(n91) );
  AOI21X1 U171 ( .A0(n186), .A1(n89), .B0(n84), .Y(n82) );
  NAND2X1 U172 ( .A(n186), .B(n185), .Y(n81) );
  NAND2X1 U173 ( .A(A_4_), .B(B_4_), .Y(n86) );
  OR2X2 U174 ( .A(A_3_), .B(B_3_), .Y(n185) );
  INVX1 U175 ( .A(n91), .Y(n89) );
  OR2X2 U176 ( .A(A_4_), .B(B_4_), .Y(n186) );
  CLKINVX3 U177 ( .A(n93), .Y(n92) );
  NAND2BX1 U178 ( .AN(A_15_), .B(n193), .Y(n192) );
  XOR2X1 U179 ( .A(n49), .B(n6), .Y(SUM_10_) );
  AOI21X2 U180 ( .A0(n187), .A1(n76), .B0(n69), .Y(n67) );
  NAND2X1 U181 ( .A(n191), .B(n37), .Y(n28) );
  AOI21X2 U182 ( .A0(n191), .A1(n38), .B0(n31), .Y(n29) );
  INVX1 U183 ( .A(n36), .Y(n38) );
  INVX1 U184 ( .A(n33), .Y(n31) );
  XOR2X1 U185 ( .A(n34), .B(n178), .Y(SUM_12_) );
  INVX2 U186 ( .A(n174), .Y(SUM_1_) );
  NAND2X1 U187 ( .A(A_14_), .B(B_14_), .Y(n21) );
  XNOR2X1 U188 ( .A(n15), .B(n102), .Y(n174) );
  OAI21X2 U189 ( .A0(n67), .A1(n63), .B0(n64), .Y(n62) );
  NOR2X2 U190 ( .A(A_11_), .B(B_11_), .Y(n35) );
  NAND2X2 U191 ( .A(A_12_), .B(B_12_), .Y(n33) );
  NOR2X2 U192 ( .A(A_1_), .B(B_1_), .Y(n99) );
  NAND2X2 U193 ( .A(A_2_), .B(B_2_), .Y(n97) );
  OAI21X2 U194 ( .A0(n99), .A1(n102), .B0(n100), .Y(n98) );
  NAND2BX2 U195 ( .AN(A_2_), .B(n190), .Y(n189) );
  XNOR2X1 U196 ( .A(n41), .B(n182), .Y(SUM_11_) );
  CLKINVX3 U197 ( .A(n74), .Y(n76) );
  INVX1 U198 ( .A(n71), .Y(n69) );
  NAND2X1 U199 ( .A(A_7_), .B(B_7_), .Y(n64) );
  NOR2X2 U200 ( .A(A_13_), .B(B_13_), .Y(n25) );
  NAND2X1 U201 ( .A(A_13_), .B(B_13_), .Y(n26) );
  XOR2X2 U202 ( .A(n87), .B(n12), .Y(SUM_4_) );
  XOR2X2 U203 ( .A(n79), .B(n11), .Y(SUM_5_) );
  AND2X2 U204 ( .A(n192), .B(n18), .Y(n184) );
  NAND2X1 U205 ( .A(A_15_), .B(B_14_), .Y(n18) );
  AND2X2 U206 ( .A(n179), .B(n102), .Y(SUM_0_) );
  OAI21X2 U207 ( .A0(n79), .A1(n66), .B0(n67), .Y(n65) );
  AOI21X1 U208 ( .A0(n92), .A1(n185), .B0(n89), .Y(n87) );
  INVX4 U209 ( .A(n80), .Y(n79) );
  OAI21X2 U210 ( .A0(n81), .A1(n93), .B0(n82), .Y(n80) );
  NAND2X1 U211 ( .A(A_9_), .B(B_9_), .Y(n53) );
  XOR2X2 U212 ( .A(n180), .B(n92), .Y(SUM_3_) );
  NAND2BX1 U213 ( .AN(n52), .B(n53), .Y(n7) );
  NAND2XL U214 ( .A(n186), .B(n86), .Y(n12) );
  NAND2XL U215 ( .A(n188), .B(n48), .Y(n6) );
  AND2X1 U216 ( .A(n191), .B(n33), .Y(n178) );
  OR2XL U217 ( .A(A_0_), .B(B_0_), .Y(n179) );
  INVX1 U218 ( .A(B_2_), .Y(n190) );
  INVX1 U219 ( .A(B_14_), .Y(n193) );
  INVXL U220 ( .A(n42), .Y(n41) );
  AND2X1 U221 ( .A(n185), .B(n91), .Y(n180) );
  XNOR2X1 U222 ( .A(n27), .B(n3), .Y(SUM_13_) );
  OAI21XL U223 ( .A0(n41), .A1(n28), .B0(n29), .Y(n27) );
  XOR2X4 U224 ( .A(n72), .B(n181), .Y(SUM_6_) );
  AND2X1 U225 ( .A(n187), .B(n71), .Y(n181) );
  OAI21XL U226 ( .A0(n41), .A1(n35), .B0(n36), .Y(n34) );
  INVX1 U227 ( .A(n86), .Y(n84) );
  NAND2XL U228 ( .A(n75), .B(n74), .Y(n11) );
  XOR2X1 U229 ( .A(n22), .B(n2), .Y(SUM_14_) );
  NAND2XL U230 ( .A(A_0_), .B(B_0_), .Y(n102) );
  XOR2X4 U231 ( .A(n19), .B(n184), .Y(SUM_15_) );
  OR2X4 U232 ( .A(A_6_), .B(B_6_), .Y(n187) );
  OR2X4 U233 ( .A(A_10_), .B(B_10_), .Y(n188) );
  NAND2X2 U234 ( .A(A_1_), .B(B_1_), .Y(n100) );
  NAND2X2 U235 ( .A(A_10_), .B(B_10_), .Y(n48) );
  OR2X4 U236 ( .A(A_12_), .B(B_12_), .Y(n191) );
  NAND2X2 U237 ( .A(A_6_), .B(B_6_), .Y(n71) );
endmodule


module ADDB_0 ( DQ, SE, SR );
  input [15:0] DQ;
  input [14:0] SE;
  output [15:0] SR;
  wire   N3, DQI_15_, n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61;
  assign N3 = DQ[0];

  ADDB_0_DW01_add_6 add_83 ( .A({DQI_15_, n48, n49, n50, n51, n52, n53, n54, 
        n55, n56, n57, n58, n59, n60, n61, N3}), .B({SE[14], SE}), .CI(1'b0), 
        .SUM(SR) );
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
  AND2X2 U37 ( .A(n20), .B(n5), .Y(n22) );
  INVX1 U38 ( .A(n13), .Y(n5) );
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
endmodule

