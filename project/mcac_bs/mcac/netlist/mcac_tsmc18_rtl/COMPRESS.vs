
module COMPRESS_DW01_dec_8 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n16, n18, n19,
         n20, n23, n24, n27, n28, n29, n33, n34, n37, n38, n39, n42, n45, n46,
         n47, n49, n50, n51, n52, SUM_0_, SUM_1_, SUM_2_, SUM_3_, SUM_4_,
         SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_, SUM_10_, SUM_11_, SUM_12_,
         A_0_, A_12_, n86, n87, n88;
  assign n2 = A[11];
  assign n3 = A[10];
  assign n4 = A[9];
  assign n5 = A[8];
  assign n6 = A[7];
  assign n7 = A[6];
  assign n8 = A[5];
  assign n9 = A[4];
  assign n10 = A[3];
  assign n11 = A[2];
  assign n12 = A[1];
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
  assign A_0_ = A[0];
  assign A_12_ = A[12];

  XNOR2X4 U1 ( .A(n13), .B(A_12_), .Y(SUM_12_) );
  NAND2X4 U3 ( .A(n1), .B(n88), .Y(n13) );
  NOR2X4 U13 ( .A(n19), .B(n38), .Y(n1) );
  NAND2X4 U41 ( .A(n46), .B(n39), .Y(n38) );
  NOR2X2 U70 ( .A(n9), .B(n8), .Y(n39) );
  XOR2XL U71 ( .A(n51), .B(n11), .Y(SUM_2_) );
  INVX2 U72 ( .A(n11), .Y(n50) );
  NAND2BX1 U73 ( .AN(n12), .B(SUM_0_), .Y(n52) );
  NOR2X2 U74 ( .A(n47), .B(n52), .Y(n46) );
  NAND2BX1 U75 ( .AN(n10), .B(n50), .Y(n47) );
  INVXL U76 ( .A(n7), .Y(n34) );
  NOR2X2 U77 ( .A(n5), .B(n4), .Y(n20) );
  INVX1 U78 ( .A(A_0_), .Y(SUM_0_) );
  BUFX3 U79 ( .A(n8), .Y(n86) );
  INVX1 U80 ( .A(n2), .Y(n16) );
  XNOR2X1 U81 ( .A(n33), .B(n6), .Y(SUM_7_) );
  INVX1 U82 ( .A(n38), .Y(n37) );
  XNOR2XL U83 ( .A(n27), .B(n5), .Y(SUM_8_) );
  NOR2X2 U84 ( .A(n6), .B(n7), .Y(n28) );
  INVXL U85 ( .A(n28), .Y(n29) );
  NAND2XL U86 ( .A(n37), .B(n34), .Y(n33) );
  NAND2XL U87 ( .A(n24), .B(n37), .Y(n23) );
  XNOR2X1 U88 ( .A(n87), .B(n2), .Y(SUM_11_) );
  NAND2XL U89 ( .A(n1), .B(n18), .Y(n87) );
  XNOR2XL U90 ( .A(n49), .B(n10), .Y(SUM_3_) );
  NAND2XL U91 ( .A(n51), .B(n50), .Y(n49) );
  INVXL U92 ( .A(n52), .Y(n51) );
  INVX1 U93 ( .A(n3), .Y(n18) );
  AND2X2 U94 ( .A(n16), .B(n18), .Y(n88) );
  XOR2X1 U95 ( .A(n42), .B(n86), .Y(SUM_5_) );
  XOR2X1 U96 ( .A(n1), .B(n3), .Y(SUM_10_) );
  XOR2X1 U97 ( .A(n37), .B(n7), .Y(SUM_6_) );
  XNOR2XL U98 ( .A(n23), .B(n4), .Y(SUM_9_) );
  NOR2XL U99 ( .A(n29), .B(n5), .Y(n24) );
  NAND2XL U100 ( .A(n37), .B(n28), .Y(n27) );
  INVXL U101 ( .A(n46), .Y(n45) );
  XOR2X1 U102 ( .A(n12), .B(SUM_0_), .Y(SUM_1_) );
  XNOR2XL U103 ( .A(n45), .B(n9), .Y(SUM_4_) );
  NOR2XL U104 ( .A(n45), .B(n9), .Y(n42) );
  NAND2X2 U105 ( .A(n20), .B(n28), .Y(n19) );
endmodule


module COMPRESS_DW01_inc_7 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n4, n5, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n22, n23, n24, n25, n26, n28, n29, n30, n33, n34, n36,
         n38, n40, n41, n42, n43, n44, n45, n47, n48, n50, n51, n52, SUM_1_,
         SUM_2_, SUM_3_, SUM_4_, SUM_5_, SUM_6_, SUM_7_, SUM_8_, SUM_9_,
         SUM_10_, SUM_11_, SUM_12_, SUM_13_, SUM_14_, SUM_15_, A_0_, A_10_,
         A_13_, A_14_, A_15_, n89, n90;
  assign n5 = A[12];
  assign n9 = A[11];
  assign n17 = A[9];
  assign n20 = A[8];
  assign n26 = A[7];
  assign n30 = A[6];
  assign n36 = A[5];
  assign n40 = A[4];
  assign n45 = A[3];
  assign n48 = A[2];
  assign n52 = A[1];
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
  assign A_0_ = A[0];
  assign A_10_ = A[10];
  assign A_13_ = A[13];
  assign A_14_ = A[14];
  assign A_15_ = A[15];

  NAND2X4 U31 ( .A(n24), .B(n43), .Y(n23) );
  NOR2X4 U55 ( .A(n44), .B(n51), .Y(n43) );
  NAND2X1 U70 ( .A(n20), .B(n17), .Y(n16) );
  INVX1 U71 ( .A(A_10_), .Y(n13) );
  NOR2X2 U72 ( .A(n16), .B(n13), .Y(n12) );
  AND2X2 U73 ( .A(n12), .B(n22), .Y(n90) );
  INVX4 U74 ( .A(n23), .Y(n22) );
  NOR2XL U75 ( .A(n42), .B(n33), .Y(n89) );
  NOR2X2 U76 ( .A(n33), .B(n25), .Y(n24) );
  INVX4 U77 ( .A(n43), .Y(n42) );
  INVX1 U78 ( .A(n51), .Y(n50) );
  XOR2X1 U79 ( .A(n38), .B(n36), .Y(SUM_5_) );
  NOR2X1 U80 ( .A(n42), .B(n41), .Y(n38) );
  XOR2X1 U81 ( .A(n19), .B(n18), .Y(SUM_9_) );
  NAND2X2 U82 ( .A(n52), .B(A_0_), .Y(n51) );
  INVX1 U83 ( .A(A_13_), .Y(n3) );
  NOR2X1 U84 ( .A(n29), .B(n42), .Y(n28) );
  NAND2X1 U85 ( .A(n34), .B(n30), .Y(n29) );
  CLKINVX2 U86 ( .A(n9), .Y(n10) );
  XOR2X1 U87 ( .A(n14), .B(n13), .Y(SUM_10_) );
  NAND2X2 U88 ( .A(n48), .B(n45), .Y(n44) );
  NAND2X2 U89 ( .A(n40), .B(n36), .Y(n33) );
  NAND2X1 U90 ( .A(n50), .B(n48), .Y(n47) );
  XOR2X2 U91 ( .A(n4), .B(n3), .Y(SUM_13_) );
  NAND2X2 U92 ( .A(n30), .B(n26), .Y(n25) );
  NAND2X1 U93 ( .A(n7), .B(n5), .Y(n4) );
  XOR2X2 U94 ( .A(n89), .B(n30), .Y(SUM_6_) );
  XOR2X2 U95 ( .A(n28), .B(n26), .Y(SUM_7_) );
  NOR2X2 U96 ( .A(n8), .B(n23), .Y(n7) );
  XOR2XL U97 ( .A(n22), .B(n20), .Y(SUM_8_) );
  NAND2XL U98 ( .A(n22), .B(n15), .Y(n14) );
  INVXL U99 ( .A(n33), .Y(n34) );
  INVXL U100 ( .A(n40), .Y(n41) );
  INVXL U101 ( .A(n17), .Y(n18) );
  NAND2XL U102 ( .A(n22), .B(n20), .Y(n19) );
  XOR2X2 U103 ( .A(n7), .B(n5), .Y(SUM_12_) );
  XNOR2X2 U104 ( .A(n90), .B(n10), .Y(SUM_11_) );
  XNOR2XL U105 ( .A(n47), .B(n45), .Y(SUM_3_) );
  INVX1 U106 ( .A(n16), .Y(n15) );
  NAND2X1 U107 ( .A(n12), .B(n9), .Y(n8) );
  XOR2X1 U108 ( .A(n42), .B(n41), .Y(SUM_4_) );
  XOR2XL U109 ( .A(n50), .B(n48), .Y(SUM_2_) );
  XOR2X1 U110 ( .A(n1), .B(A_15_), .Y(SUM_15_) );
  ADDHXL U111 ( .A(A_14_), .B(n2), .CO(n1), .S(SUM_14_) );
  NOR2XL U112 ( .A(n4), .B(n3), .Y(n2) );
  XOR2X1 U113 ( .A(n52), .B(A_0_), .Y(SUM_1_) );
endmodule


module COMPRESS ( SR, LAW, SP );
  input [15:0] SR;
  output [7:0] SP;
  input LAW;
  wire   N10, IM_15_, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N40, IMp1_9_, IMp1_8_, IMp1_7_, IMp1_6_, IMp1_5_, IMp1_4_,
         IMp1_3_, IMp1_2_, IMp1_1_, IMp1_15_, IMp1_14_, IMp1_13_, IMp1_12_,
         IMp1_11_, IMp1_10_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132;
  wire   [12:0] IMAG;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign N10 = SR[0];

  IG711 inst_IG711 ( .LAW(n24), .is(n22), .imag(IMAG), .inv(SP) );
  COMPRESS_DW01_dec_8 sub_76 ( .A({1'b0, IMp1_15_, IMp1_14_, IMp1_13_, 
        IMp1_12_, IMp1_11_, IMp1_10_, IMp1_9_, IMp1_8_, IMp1_7_, IMp1_6_, 
        IMp1_5_, IMp1_4_, IMp1_3_, IMp1_2_, IMp1_1_}), .SUM({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, N40, N39, N38, N37, N36, N35, N34, N33, N32, 
        N31, N30, N29, N28}) );
  COMPRESS_DW01_inc_7 add_67 ( .A({IM_15_, n119, n120, n129, n131, n130, n121, 
        n122, n123, n124, n125, n126, n127, n128, n132, N10}), .SUM({IMp1_15_, 
        IMp1_14_, IMp1_13_, IMp1_12_, IMp1_11_, IMp1_10_, IMp1_9_, IMp1_8_, 
        IMp1_7_, IMp1_6_, IMp1_5_, IMp1_4_, IMp1_3_, IMp1_2_, IMp1_1_, 
        SYNOPSYS_UNCONNECTED__3}) );
  NAND2BX4 U3 ( .AN(SR[8]), .B(n54), .Y(n28) );
  MXI2X1 U4 ( .A(SR[1]), .B(n69), .S0(n21), .Y(n71) );
  INVX2 U6 ( .A(SR[3]), .Y(n26) );
  INVX1 U7 ( .A(n2), .Y(n4) );
  CLKBUFXL U8 ( .A(SR[4]), .Y(n2) );
  NAND2BX1 U9 ( .AN(n43), .B(n42), .Y(n108) );
  INVX1 U10 ( .A(SR[10]), .Y(n41) );
  NAND2X1 U11 ( .A(N31), .B(n115), .Y(n83) );
  NAND2X1 U12 ( .A(N33), .B(n115), .Y(n92) );
  INVX1 U13 ( .A(n108), .Y(n130) );
  NAND2BX2 U14 ( .AN(SR[12]), .B(n39), .Y(n32) );
  OR2XL U15 ( .A(n24), .B(n90), .Y(n1) );
  NOR2XL U16 ( .A(n24), .B(n118), .Y(IMAG[12]) );
  NOR2XL U17 ( .A(n46), .B(n41), .Y(n40) );
  INVX2 U18 ( .A(n29), .Y(n46) );
  AND2X2 U19 ( .A(LAW), .B(n22), .Y(n115) );
  NAND2XL U20 ( .A(n131), .B(n109), .Y(n110) );
  NAND2XL U21 ( .A(n3), .B(n68), .Y(n65) );
  INVX1 U22 ( .A(n26), .Y(n3) );
  NOR2XL U23 ( .A(n51), .B(n53), .Y(n52) );
  INVX2 U24 ( .A(n56), .Y(n51) );
  NAND4XL U25 ( .A(n1), .B(n92), .C(n91), .D(n116), .Y(IMAG[5]) );
  NOR2X1 U26 ( .A(n43), .B(n38), .Y(n37) );
  CLKINVX3 U27 ( .A(n30), .Y(n43) );
  OR2X2 U28 ( .A(n25), .B(n22), .Y(n113) );
  INVXL U29 ( .A(n23), .Y(n22) );
  NOR3XL U30 ( .A(LAW), .B(n46), .C(n14), .Y(n107) );
  NAND2BX1 U31 ( .AN(n23), .B(n32), .Y(n19) );
  NAND2BX1 U32 ( .AN(n90), .B(n109), .Y(n87) );
  INVX1 U33 ( .A(n113), .Y(n109) );
  NOR2X1 U34 ( .A(n46), .B(n14), .Y(n121) );
  OR2X2 U35 ( .A(n17), .B(n36), .Y(n118) );
  INVX1 U36 ( .A(n32), .Y(n36) );
  NOR3BX1 U37 ( .AN(n18), .B(SR[14]), .C(n23), .Y(IM_15_) );
  NOR2X2 U38 ( .A(n39), .B(n35), .Y(n34) );
  INVX1 U39 ( .A(n4), .Y(n5) );
  NAND3BX4 U40 ( .AN(SR[4]), .B(n26), .C(n62), .Y(n64) );
  MX2X4 U41 ( .A(SR[13]), .B(N40), .S0(n21), .Y(n16) );
  INVX8 U42 ( .A(n23), .Y(n21) );
  INVX4 U43 ( .A(n31), .Y(n39) );
  INVX1 U44 ( .A(n68), .Y(n62) );
  CLKINVX3 U45 ( .A(n64), .Y(n58) );
  INVX1 U46 ( .A(n75), .Y(n132) );
  NAND2X1 U47 ( .A(N30), .B(n115), .Y(n79) );
  CLKINVX3 U48 ( .A(n90), .Y(n125) );
  OR2X2 U49 ( .A(n54), .B(n10), .Y(n97) );
  INVX1 U50 ( .A(SR[9]), .Y(n45) );
  CLKINVX3 U51 ( .A(n97), .Y(n123) );
  CLKINVX3 U52 ( .A(n93), .Y(n124) );
  NAND4BXL U53 ( .AN(n6), .B(n12), .C(n117), .D(n20), .Y(IMAG[11]) );
  NAND4BX1 U54 ( .AN(n112), .B(n111), .C(n110), .D(n20), .Y(IMAG[10]) );
  NAND2BX1 U55 ( .AN(SR[11]), .B(n43), .Y(n31) );
  XNOR2X1 U56 ( .A(SR[13]), .B(n19), .Y(n120) );
  NAND2BX2 U57 ( .AN(SR[10]), .B(n46), .Y(n30) );
  INVX2 U58 ( .A(SR[5]), .Y(n60) );
  NAND2BX2 U59 ( .AN(SR[7]), .B(n51), .Y(n27) );
  MX2X1 U60 ( .A(SR[6]), .B(n55), .S0(n21), .Y(n15) );
  NAND2XL U61 ( .A(SR[6]), .B(n57), .Y(n55) );
  INVX2 U62 ( .A(SR[11]), .Y(n38) );
  INVX2 U63 ( .A(SR[12]), .Y(n35) );
  NAND2X1 U64 ( .A(n8), .B(n68), .Y(n78) );
  NAND2X1 U65 ( .A(n9), .B(n66), .Y(n82) );
  CLKINVX3 U66 ( .A(n78), .Y(n128) );
  NAND2X1 U67 ( .A(N36), .B(n115), .Y(n103) );
  NAND2X1 U68 ( .A(N35), .B(n115), .Y(n99) );
  NAND2X1 U69 ( .A(N34), .B(n115), .Y(n95) );
  NAND2X1 U70 ( .A(N39), .B(n115), .Y(n117) );
  NAND2X1 U71 ( .A(N38), .B(n115), .Y(n111) );
  NAND2X1 U72 ( .A(N37), .B(n115), .Y(n106) );
  CLKINVX3 U73 ( .A(n114), .Y(n131) );
  CLKINVX3 U74 ( .A(n118), .Y(n129) );
  MX2X2 U75 ( .A(n3), .B(n65), .S0(n21), .Y(n9) );
  MXI2X1 U76 ( .A(n41), .B(n40), .S0(n21), .Y(n42) );
  NAND2BX1 U77 ( .AN(n50), .B(n49), .Y(n101) );
  INVXL U78 ( .A(SR[8]), .Y(n48) );
  NAND2X1 U79 ( .A(n57), .B(n61), .Y(n90) );
  NOR2XL U80 ( .A(n24), .B(n97), .Y(n100) );
  NAND2XL U81 ( .A(n122), .B(n109), .Y(n98) );
  NAND2XL U82 ( .A(n121), .B(n109), .Y(n102) );
  NAND2XL U83 ( .A(n123), .B(n109), .Y(n94) );
  NOR2XL U84 ( .A(n24), .B(n93), .Y(n96) );
  NOR2XL U85 ( .A(n113), .B(n82), .Y(n81) );
  NOR2XL U86 ( .A(n118), .B(n113), .Y(n6) );
  NAND2XL U87 ( .A(n124), .B(n109), .Y(n91) );
  NOR2XL U88 ( .A(n113), .B(n86), .Y(n85) );
  INVX1 U89 ( .A(n25), .Y(n24) );
  NAND2X2 U90 ( .A(n7), .B(n64), .Y(n86) );
  MX2X1 U91 ( .A(n5), .B(n63), .S0(n21), .Y(n7) );
  MX2X1 U92 ( .A(SR[2]), .B(n67), .S0(n21), .Y(n8) );
  MX2X1 U93 ( .A(n53), .B(n52), .S0(n21), .Y(n10) );
  MXI2XL U94 ( .A(n48), .B(n47), .S0(n21), .Y(n49) );
  MX2X1 U95 ( .A(n45), .B(n44), .S0(n21), .Y(n14) );
  MX2X1 U96 ( .A(n38), .B(n37), .S0(n21), .Y(n13) );
  NAND2X4 U97 ( .A(n16), .B(n24), .Y(n116) );
  INVX4 U98 ( .A(SR[15]), .Y(n23) );
  NAND2XL U99 ( .A(n130), .B(n109), .Y(n105) );
  NOR2X1 U100 ( .A(n24), .B(n101), .Y(n104) );
  NOR2X1 U101 ( .A(n24), .B(n78), .Y(n80) );
  OR2X2 U102 ( .A(n24), .B(n114), .Y(n12) );
  NOR2X1 U103 ( .A(n24), .B(n86), .Y(n89) );
  NAND2X1 U104 ( .A(N32), .B(n115), .Y(n88) );
  NOR2XL U105 ( .A(n24), .B(n108), .Y(n112) );
  INVX1 U106 ( .A(n101), .Y(n122) );
  NOR2X1 U107 ( .A(n24), .B(n82), .Y(n84) );
  NAND2XL U108 ( .A(n58), .B(n60), .Y(n57) );
  INVX1 U109 ( .A(n86), .Y(n126) );
  INVX1 U110 ( .A(n82), .Y(n127) );
  MXI2XL U111 ( .A(n60), .B(n59), .S0(n21), .Y(n61) );
  NOR2XL U112 ( .A(n58), .B(n60), .Y(n59) );
  OAI22XL U113 ( .A0(n113), .A1(n78), .B0(n24), .B1(n75), .Y(n77) );
  NAND2X1 U114 ( .A(N29), .B(n115), .Y(n76) );
  NAND2XL U115 ( .A(SR[2]), .B(n70), .Y(n67) );
  NAND2XL U116 ( .A(n5), .B(n66), .Y(n63) );
  OR2X4 U117 ( .A(n39), .B(n13), .Y(n114) );
  OR2X4 U118 ( .A(SR[2]), .B(n70), .Y(n68) );
  INVX1 U119 ( .A(SR[7]), .Y(n53) );
  NOR2XL U120 ( .A(n54), .B(n48), .Y(n47) );
  NAND2BXL U121 ( .AN(SR[3]), .B(n62), .Y(n66) );
  NAND2XL U122 ( .A(n15), .B(n56), .Y(n93) );
  MX2X4 U123 ( .A(n35), .B(n34), .S0(n22), .Y(n17) );
  INVX1 U124 ( .A(LAW), .Y(n25) );
  NOR2BX1 U125 ( .AN(n36), .B(SR[13]), .Y(n18) );
  XOR2X1 U126 ( .A(SR[14]), .B(n33), .Y(n119) );
  NOR2X1 U127 ( .A(n18), .B(n23), .Y(n33) );
  NAND2X1 U128 ( .A(N10), .B(n25), .Y(n73) );
  NOR2XL U129 ( .A(n113), .B(n75), .Y(n74) );
  NAND2XL U130 ( .A(N28), .B(n115), .Y(n72) );
  NAND2XL U131 ( .A(SR[1]), .B(N10), .Y(n69) );
  OR2X4 U132 ( .A(SR[1]), .B(N10), .Y(n70) );
  INVX4 U133 ( .A(n28), .Y(n50) );
  NAND4BBX4 U134 ( .AN(n85), .BN(n84), .C(n83), .D(n20), .Y(IMAG[3]) );
  BUFX20 U135 ( .A(n116), .Y(n20) );
  NAND3BX4 U136 ( .AN(SR[6]), .B(n60), .C(n58), .Y(n56) );
  CLKINVX3 U137 ( .A(n27), .Y(n54) );
  NAND2BX4 U138 ( .AN(SR[9]), .B(n50), .Y(n29) );
  NOR2X2 U139 ( .A(n50), .B(n45), .Y(n44) );
  NAND2BX4 U140 ( .AN(n71), .B(n70), .Y(n75) );
  NAND4BX2 U141 ( .AN(n74), .B(n73), .C(n72), .D(n20), .Y(IMAG[0]) );
  NAND3BX4 U142 ( .AN(n77), .B(n76), .C(n20), .Y(IMAG[1]) );
  NAND4BBX2 U143 ( .AN(n81), .BN(n80), .C(n79), .D(n20), .Y(IMAG[2]) );
  NAND4BX2 U144 ( .AN(n89), .B(n88), .C(n87), .D(n20), .Y(IMAG[4]) );
  NAND4BX2 U145 ( .AN(n96), .B(n95), .C(n94), .D(n20), .Y(IMAG[6]) );
  NAND4BX2 U146 ( .AN(n100), .B(n99), .C(n98), .D(n20), .Y(IMAG[7]) );
  NAND4BX2 U147 ( .AN(n104), .B(n103), .C(n102), .D(n20), .Y(IMAG[8]) );
  NAND4BX2 U148 ( .AN(n107), .B(n106), .C(n105), .D(n20), .Y(IMAG[9]) );
endmodule

