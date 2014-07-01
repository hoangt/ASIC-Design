
module RF_0_test_1 ( data_in, data_out, re_addr, wr_addr, wr_clk, re_clk, 
        reset, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, 
        scan_out1, scan_out2, scan_out3, scan_out4, scan_enable, test_si2, 
        test_si1, test_so1, test_se );
  input [7:0] data_in;
  output [7:0] data_out;
  input [2:0] re_addr;
  input [2:0] wr_addr;
  input wr_clk, re_clk, reset, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, scan_enable, test_si2, test_si1, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_so1;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163;
  wire   [63:0] reg_w;
  wire   [7:0] mux_w;
  assign test_so1 = reg_w[63];

  MX2XL U3 ( .A(reg_w[50]), .B(data_in[2]), .S0(n4), .Y(n35) );
  MX2X1 U4 ( .A(reg_w[53]), .B(data_in[5]), .S0(n4), .Y(n59) );
  MX2X1 U5 ( .A(reg_w[29]), .B(data_in[5]), .S0(n3), .Y(n62) );
  MX2X1 U6 ( .A(reg_w[45]), .B(data_in[5]), .S0(n1), .Y(n60) );
  MX2X1 U7 ( .A(reg_w[13]), .B(data_in[5]), .S0(n2), .Y(n64) );
  MX2X1 U8 ( .A(reg_w[21]), .B(data_in[5]), .S0(n10), .Y(n63) );
  MX2X1 U9 ( .A(reg_w[37]), .B(data_in[5]), .S0(n13), .Y(n61) );
  MX2XL U10 ( .A(reg_w[26]), .B(data_in[2]), .S0(n3), .Y(n38) );
  MX2XL U11 ( .A(reg_w[28]), .B(data_in[4]), .S0(n3), .Y(n54) );
  MX2XL U12 ( .A(reg_w[30]), .B(data_in[6]), .S0(n3), .Y(n70) );
  MX2XL U13 ( .A(reg_w[24]), .B(data_in[0]), .S0(n3), .Y(n78) );
  MX2XL U14 ( .A(reg_w[27]), .B(data_in[3]), .S0(n3), .Y(n46) );
  MX2XL U15 ( .A(reg_w[25]), .B(data_in[1]), .S0(n3), .Y(n30) );
  MX2XL U16 ( .A(reg_w[31]), .B(data_in[7]), .S0(n3), .Y(n22) );
  INVX1 U17 ( .A(reset), .Y(n6) );
  INVX1 U18 ( .A(reset), .Y(n5) );
  MX2XL U19 ( .A(reg_w[44]), .B(data_in[4]), .S0(n1), .Y(n52) );
  MX2XL U20 ( .A(reg_w[42]), .B(data_in[2]), .S0(n1), .Y(n36) );
  MX2XL U21 ( .A(reg_w[43]), .B(data_in[3]), .S0(n1), .Y(n44) );
  MX2XL U22 ( .A(reg_w[46]), .B(data_in[6]), .S0(n1), .Y(n68) );
  MX2XL U23 ( .A(reg_w[41]), .B(data_in[1]), .S0(n1), .Y(n28) );
  MX2XL U24 ( .A(reg_w[47]), .B(data_in[7]), .S0(n1), .Y(n20) );
  MX2XL U25 ( .A(reg_w[40]), .B(data_in[0]), .S0(n1), .Y(n76) );
  MX2XL U26 ( .A(reg_w[12]), .B(data_in[4]), .S0(n2), .Y(n56) );
  MX2XL U27 ( .A(reg_w[10]), .B(data_in[2]), .S0(n2), .Y(n40) );
  MX2XL U28 ( .A(reg_w[11]), .B(data_in[3]), .S0(n2), .Y(n48) );
  MX2XL U29 ( .A(reg_w[14]), .B(data_in[6]), .S0(n2), .Y(n72) );
  MX2XL U30 ( .A(reg_w[9]), .B(data_in[1]), .S0(n2), .Y(n32) );
  MX2XL U31 ( .A(reg_w[15]), .B(data_in[7]), .S0(n2), .Y(n24) );
  MX2XL U32 ( .A(reg_w[8]), .B(data_in[0]), .S0(n2), .Y(n80) );
  MX2XL U33 ( .A(reg_w[20]), .B(data_in[4]), .S0(n10), .Y(n55) );
  MX2XL U34 ( .A(reg_w[18]), .B(data_in[2]), .S0(n10), .Y(n39) );
  MX2XL U35 ( .A(reg_w[19]), .B(data_in[3]), .S0(n10), .Y(n47) );
  MX2XL U36 ( .A(reg_w[22]), .B(data_in[6]), .S0(n10), .Y(n71) );
  MX2XL U37 ( .A(reg_w[17]), .B(data_in[1]), .S0(n10), .Y(n31) );
  MX2XL U38 ( .A(reg_w[23]), .B(data_in[7]), .S0(n10), .Y(n23) );
  MX2XL U39 ( .A(reg_w[16]), .B(data_in[0]), .S0(n10), .Y(n79) );
  MX2XL U40 ( .A(reg_w[36]), .B(data_in[4]), .S0(n13), .Y(n53) );
  MX2XL U41 ( .A(reg_w[34]), .B(data_in[2]), .S0(n13), .Y(n37) );
  MX2XL U42 ( .A(reg_w[35]), .B(data_in[3]), .S0(n13), .Y(n45) );
  MX2XL U43 ( .A(reg_w[38]), .B(data_in[6]), .S0(n13), .Y(n69) );
  MX2XL U44 ( .A(reg_w[33]), .B(data_in[1]), .S0(n13), .Y(n29) );
  MX2XL U45 ( .A(reg_w[39]), .B(data_in[7]), .S0(n13), .Y(n21) );
  MX2XL U46 ( .A(reg_w[32]), .B(data_in[0]), .S0(n13), .Y(n77) );
  MX2XL U47 ( .A(reg_w[4]), .B(data_in[4]), .S0(n8), .Y(n57) );
  MX2XL U48 ( .A(reg_w[60]), .B(data_in[4]), .S0(n17), .Y(n50) );
  MX2XL U49 ( .A(reg_w[2]), .B(data_in[2]), .S0(n8), .Y(n41) );
  MX2XL U50 ( .A(reg_w[58]), .B(data_in[2]), .S0(n17), .Y(n34) );
  MX2XL U51 ( .A(reg_w[5]), .B(data_in[5]), .S0(n8), .Y(n65) );
  MX2XL U52 ( .A(reg_w[61]), .B(data_in[5]), .S0(n17), .Y(n58) );
  MX2XL U53 ( .A(reg_w[3]), .B(data_in[3]), .S0(n8), .Y(n49) );
  MX2XL U54 ( .A(reg_w[59]), .B(data_in[3]), .S0(n17), .Y(n42) );
  MX2XL U55 ( .A(reg_w[6]), .B(data_in[6]), .S0(n8), .Y(n73) );
  MX2XL U56 ( .A(reg_w[62]), .B(data_in[6]), .S0(n17), .Y(n66) );
  MX2XL U57 ( .A(reg_w[1]), .B(data_in[1]), .S0(n8), .Y(n33) );
  MX2XL U58 ( .A(reg_w[57]), .B(data_in[1]), .S0(n17), .Y(n26) );
  MX2XL U59 ( .A(reg_w[7]), .B(data_in[7]), .S0(n8), .Y(n25) );
  MX2XL U60 ( .A(reg_w[63]), .B(data_in[7]), .S0(n17), .Y(n18) );
  MX2XL U61 ( .A(reg_w[0]), .B(data_in[0]), .S0(n8), .Y(n81) );
  MX2XL U62 ( .A(reg_w[56]), .B(data_in[0]), .S0(n17), .Y(n74) );
  MX2XL U63 ( .A(reg_w[52]), .B(data_in[4]), .S0(n4), .Y(n51) );
  MX2XL U64 ( .A(reg_w[51]), .B(data_in[3]), .S0(n4), .Y(n43) );
  MX2XL U65 ( .A(reg_w[54]), .B(data_in[6]), .S0(n4), .Y(n67) );
  MX2XL U66 ( .A(reg_w[49]), .B(data_in[1]), .S0(n4), .Y(n27) );
  MX2XL U67 ( .A(reg_w[55]), .B(data_in[7]), .S0(n4), .Y(n19) );
  MX2XL U68 ( .A(reg_w[48]), .B(data_in[0]), .S0(n4), .Y(n75) );
  NOR3X1 U69 ( .A(re_addr[0]), .B(re_addr[2]), .C(n123), .Y(n155) );
  NOR3X1 U70 ( .A(re_addr[1]), .B(re_addr[2]), .C(re_addr[0]), .Y(n153) );
  NOR3X1 U71 ( .A(n123), .B(re_addr[2]), .C(n82), .Y(n154) );
  NOR3X1 U72 ( .A(re_addr[1]), .B(re_addr[2]), .C(n82), .Y(n152) );
  AND3X2 U73 ( .A(re_addr[1]), .B(n82), .C(re_addr[2]), .Y(n159) );
  AND3X2 U74 ( .A(n82), .B(n123), .C(re_addr[2]), .Y(n157) );
  AND3X2 U75 ( .A(re_addr[2]), .B(re_addr[1]), .C(re_addr[0]), .Y(n158) );
  AND3X2 U76 ( .A(re_addr[2]), .B(n123), .C(re_addr[0]), .Y(n156) );
  AOI22X1 U77 ( .A0(n155), .A1(reg_w[16]), .B0(n154), .B1(reg_w[24]), .Y(n126)
         );
  AOI22X1 U78 ( .A0(n155), .A1(reg_w[17]), .B0(n154), .B1(reg_w[25]), .Y(n130)
         );
  AOI22X1 U79 ( .A0(n155), .A1(reg_w[18]), .B0(n154), .B1(reg_w[26]), .Y(n134)
         );
  AOI22X1 U80 ( .A0(n155), .A1(reg_w[19]), .B0(n154), .B1(reg_w[27]), .Y(n138)
         );
  AOI22X1 U81 ( .A0(n155), .A1(reg_w[20]), .B0(n154), .B1(reg_w[28]), .Y(n142)
         );
  AOI22X1 U82 ( .A0(n155), .A1(reg_w[21]), .B0(n154), .B1(reg_w[29]), .Y(n146)
         );
  AOI22X1 U83 ( .A0(n155), .A1(reg_w[22]), .B0(n154), .B1(reg_w[30]), .Y(n150)
         );
  AOI22X1 U84 ( .A0(n155), .A1(reg_w[23]), .B0(n154), .B1(reg_w[31]), .Y(n162)
         );
  INVX1 U85 ( .A(re_addr[1]), .Y(n123) );
  INVX1 U86 ( .A(re_addr[0]), .Y(n82) );
  NAND4X1 U87 ( .A(n127), .B(n126), .C(n125), .D(n124), .Y(mux_w[0]) );
  AOI22X1 U88 ( .A0(n159), .A1(reg_w[48]), .B0(n158), .B1(reg_w[56]), .Y(n124)
         );
  AOI22X1 U89 ( .A0(n157), .A1(reg_w[32]), .B0(n156), .B1(reg_w[40]), .Y(n125)
         );
  AOI22X1 U90 ( .A0(n153), .A1(reg_w[0]), .B0(n152), .B1(reg_w[8]), .Y(n127)
         );
  NAND4X1 U91 ( .A(n131), .B(n130), .C(n129), .D(n128), .Y(mux_w[1]) );
  AOI22X1 U92 ( .A0(n159), .A1(reg_w[49]), .B0(n158), .B1(reg_w[57]), .Y(n128)
         );
  AOI22X1 U93 ( .A0(n157), .A1(reg_w[33]), .B0(n156), .B1(reg_w[41]), .Y(n129)
         );
  AOI22X1 U94 ( .A0(n153), .A1(reg_w[1]), .B0(n152), .B1(reg_w[9]), .Y(n131)
         );
  NAND4X1 U95 ( .A(n135), .B(n134), .C(n133), .D(n132), .Y(mux_w[2]) );
  AOI22X1 U96 ( .A0(n159), .A1(reg_w[50]), .B0(n158), .B1(reg_w[58]), .Y(n132)
         );
  AOI22X1 U97 ( .A0(n157), .A1(reg_w[34]), .B0(n156), .B1(reg_w[42]), .Y(n133)
         );
  AOI22X1 U98 ( .A0(n153), .A1(reg_w[2]), .B0(n152), .B1(reg_w[10]), .Y(n135)
         );
  NAND4X1 U99 ( .A(n139), .B(n138), .C(n137), .D(n136), .Y(mux_w[3]) );
  AOI22X1 U100 ( .A0(n159), .A1(reg_w[51]), .B0(n158), .B1(reg_w[59]), .Y(n136) );
  AOI22X1 U101 ( .A0(n157), .A1(reg_w[35]), .B0(n156), .B1(reg_w[43]), .Y(n137) );
  AOI22X1 U102 ( .A0(n153), .A1(reg_w[3]), .B0(n152), .B1(reg_w[11]), .Y(n139)
         );
  NAND4X1 U103 ( .A(n143), .B(n142), .C(n141), .D(n140), .Y(mux_w[4]) );
  AOI22X1 U104 ( .A0(n159), .A1(reg_w[52]), .B0(n158), .B1(reg_w[60]), .Y(n140) );
  AOI22X1 U105 ( .A0(n157), .A1(reg_w[36]), .B0(n156), .B1(reg_w[44]), .Y(n141) );
  AOI22X1 U106 ( .A0(n153), .A1(reg_w[4]), .B0(n152), .B1(reg_w[12]), .Y(n143)
         );
  NAND4X1 U107 ( .A(n147), .B(n146), .C(n145), .D(n144), .Y(mux_w[5]) );
  AOI22X1 U108 ( .A0(n159), .A1(reg_w[53]), .B0(n158), .B1(reg_w[61]), .Y(n144) );
  AOI22X1 U109 ( .A0(n157), .A1(reg_w[37]), .B0(n156), .B1(reg_w[45]), .Y(n145) );
  AOI22X1 U110 ( .A0(n153), .A1(reg_w[5]), .B0(n152), .B1(reg_w[13]), .Y(n147)
         );
  NAND4X1 U111 ( .A(n151), .B(n150), .C(n149), .D(n148), .Y(mux_w[6]) );
  AOI22X1 U112 ( .A0(n159), .A1(reg_w[54]), .B0(n158), .B1(reg_w[62]), .Y(n148) );
  AOI22X1 U113 ( .A0(n157), .A1(reg_w[38]), .B0(n156), .B1(reg_w[46]), .Y(n149) );
  AOI22X1 U114 ( .A0(n153), .A1(reg_w[6]), .B0(n152), .B1(reg_w[14]), .Y(n151)
         );
  NAND4X1 U115 ( .A(n163), .B(n162), .C(n161), .D(n160), .Y(mux_w[7]) );
  AOI22X1 U116 ( .A0(n159), .A1(reg_w[55]), .B0(n158), .B1(reg_w[63]), .Y(n160) );
  AOI22X1 U117 ( .A0(n157), .A1(reg_w[39]), .B0(n156), .B1(reg_w[47]), .Y(n161) );
  AOI22X1 U118 ( .A0(n153), .A1(reg_w[7]), .B0(n152), .B1(reg_w[15]), .Y(n163)
         );
  AND3X2 U119 ( .A(wr_addr[0]), .B(wr_addr[2]), .C(n14), .Y(n1) );
  INVX1 U120 ( .A(n9), .Y(n10) );
  NAND3BX1 U121 ( .AN(wr_addr[0]), .B(wr_addr[1]), .C(n11), .Y(n9) );
  INVX1 U122 ( .A(n16), .Y(n17) );
  NAND2BX1 U123 ( .AN(n15), .B(wr_addr[0]), .Y(n16) );
  INVX1 U124 ( .A(n7), .Y(n8) );
  NAND3BX1 U125 ( .AN(wr_addr[0]), .B(n14), .C(n11), .Y(n7) );
  INVX1 U126 ( .A(wr_addr[1]), .Y(n14) );
  INVX1 U127 ( .A(wr_addr[2]), .Y(n11) );
  NAND2X1 U128 ( .A(wr_addr[2]), .B(wr_addr[1]), .Y(n15) );
  AND3X2 U129 ( .A(wr_addr[0]), .B(n14), .C(n11), .Y(n2) );
  AND3X2 U130 ( .A(wr_addr[0]), .B(wr_addr[1]), .C(n11), .Y(n3) );
  INVX1 U131 ( .A(n12), .Y(n13) );
  NAND3BX1 U132 ( .AN(wr_addr[0]), .B(wr_addr[2]), .C(n14), .Y(n12) );
  NOR2X1 U133 ( .A(wr_addr[0]), .B(n15), .Y(n4) );
  SDFFRHQXL reg_w_reg_63_ ( .D(n18), .SI(reg_w[62]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[63]) );
  SDFFRHQXL reg_w_reg_62_ ( .D(n66), .SI(reg_w[61]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[62]) );
  SDFFRHQXL reg_w_reg_61_ ( .D(n58), .SI(reg_w[60]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[61]) );
  SDFFRHQXL reg_w_reg_60_ ( .D(n50), .SI(reg_w[59]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[60]) );
  SDFFRHQXL reg_w_reg_59_ ( .D(n42), .SI(reg_w[58]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[59]) );
  SDFFRHQXL reg_w_reg_58_ ( .D(n34), .SI(reg_w[57]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[58]) );
  SDFFRHQXL reg_w_reg_57_ ( .D(n26), .SI(reg_w[56]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[57]) );
  SDFFRHQXL reg_w_reg_56_ ( .D(n74), .SI(reg_w[55]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[56]) );
  SDFFRHQXL reg_w_reg_47_ ( .D(n20), .SI(reg_w[46]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[47]) );
  SDFFRHQXL reg_w_reg_46_ ( .D(n68), .SI(reg_w[45]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[46]) );
  SDFFRHQXL reg_w_reg_45_ ( .D(n60), .SI(reg_w[44]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[45]) );
  SDFFRHQXL reg_w_reg_44_ ( .D(n52), .SI(reg_w[43]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[44]) );
  SDFFRHQXL reg_w_reg_43_ ( .D(n44), .SI(reg_w[42]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[43]) );
  SDFFRHQXL reg_w_reg_42_ ( .D(n36), .SI(reg_w[41]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[42]) );
  SDFFRHQXL reg_w_reg_41_ ( .D(n28), .SI(reg_w[40]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[41]) );
  SDFFRHQXL reg_w_reg_40_ ( .D(n76), .SI(reg_w[39]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[40]) );
  SDFFRHQXL reg_w_reg_31_ ( .D(n22), .SI(reg_w[30]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[31]) );
  SDFFRHQXL reg_w_reg_30_ ( .D(n70), .SI(reg_w[29]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[30]) );
  SDFFRHQXL reg_w_reg_29_ ( .D(n62), .SI(reg_w[28]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[29]) );
  SDFFRHQXL reg_w_reg_28_ ( .D(n54), .SI(reg_w[27]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[28]) );
  SDFFRHQXL reg_w_reg_27_ ( .D(n46), .SI(reg_w[26]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[27]) );
  SDFFRHQXL reg_w_reg_26_ ( .D(n38), .SI(reg_w[25]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[26]) );
  SDFFRHQXL reg_w_reg_25_ ( .D(n30), .SI(reg_w[24]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[25]) );
  SDFFRHQXL reg_w_reg_24_ ( .D(n78), .SI(reg_w[23]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[24]) );
  SDFFRHQXL reg_w_reg_15_ ( .D(n24), .SI(reg_w[14]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[15]) );
  SDFFRHQXL reg_w_reg_14_ ( .D(n72), .SI(reg_w[13]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[14]) );
  SDFFRHQXL reg_w_reg_13_ ( .D(n64), .SI(reg_w[12]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[13]) );
  SDFFRHQXL reg_w_reg_12_ ( .D(n56), .SI(reg_w[11]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[12]) );
  SDFFRHQXL reg_w_reg_11_ ( .D(n48), .SI(reg_w[10]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[11]) );
  SDFFRHQXL reg_w_reg_10_ ( .D(n40), .SI(reg_w[9]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[10]) );
  SDFFRHQXL reg_w_reg_9_ ( .D(n32), .SI(reg_w[8]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[9]) );
  SDFFRHQXL reg_w_reg_8_ ( .D(n80), .SI(reg_w[7]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[8]) );
  SDFFRHQXL reg_w_reg_55_ ( .D(n19), .SI(reg_w[54]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[55]) );
  SDFFRHQXL reg_w_reg_54_ ( .D(n67), .SI(reg_w[53]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[54]) );
  SDFFRHQXL reg_w_reg_53_ ( .D(n59), .SI(reg_w[52]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[53]) );
  SDFFRHQXL reg_w_reg_52_ ( .D(n51), .SI(reg_w[51]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[52]) );
  SDFFRHQXL reg_w_reg_51_ ( .D(n43), .SI(reg_w[50]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[51]) );
  SDFFRHQXL reg_w_reg_50_ ( .D(n35), .SI(reg_w[49]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[50]) );
  SDFFRHQXL reg_w_reg_49_ ( .D(n27), .SI(reg_w[48]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[49]) );
  SDFFRHQXL reg_w_reg_48_ ( .D(n75), .SI(reg_w[47]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[48]) );
  SDFFRHQXL reg_w_reg_39_ ( .D(n21), .SI(reg_w[38]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[39]) );
  SDFFRHQXL reg_w_reg_38_ ( .D(n69), .SI(reg_w[37]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[38]) );
  SDFFRHQXL reg_w_reg_37_ ( .D(n61), .SI(reg_w[36]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[37]) );
  SDFFRHQXL reg_w_reg_36_ ( .D(n53), .SI(reg_w[35]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[36]) );
  SDFFRHQXL reg_w_reg_35_ ( .D(n45), .SI(reg_w[34]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[35]) );
  SDFFRHQXL reg_w_reg_34_ ( .D(n37), .SI(reg_w[33]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[34]) );
  SDFFRHQXL reg_w_reg_33_ ( .D(n29), .SI(reg_w[32]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[33]) );
  SDFFRHQXL reg_w_reg_32_ ( .D(n77), .SI(reg_w[31]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[32]) );
  SDFFRHQXL reg_w_reg_23_ ( .D(n23), .SI(reg_w[22]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[23]) );
  SDFFRHQXL reg_w_reg_22_ ( .D(n71), .SI(reg_w[21]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[22]) );
  SDFFRHQXL reg_w_reg_21_ ( .D(n63), .SI(reg_w[20]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[21]) );
  SDFFRHQXL reg_w_reg_20_ ( .D(n55), .SI(reg_w[19]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[20]) );
  SDFFRHQXL reg_w_reg_19_ ( .D(n47), .SI(reg_w[18]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[19]) );
  SDFFRHQXL reg_w_reg_18_ ( .D(n39), .SI(reg_w[17]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[18]) );
  SDFFRHQXL reg_w_reg_17_ ( .D(n31), .SI(reg_w[16]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[17]) );
  SDFFRHQXL reg_w_reg_16_ ( .D(n79), .SI(reg_w[15]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[16]) );
  SDFFRHQXL reg_w_reg_7_ ( .D(n25), .SI(reg_w[6]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[7]) );
  SDFFRHQXL reg_w_reg_6_ ( .D(n73), .SI(reg_w[5]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[6]) );
  SDFFRHQXL reg_w_reg_5_ ( .D(n65), .SI(reg_w[4]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[5]) );
  SDFFRHQXL reg_w_reg_4_ ( .D(n57), .SI(reg_w[3]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[4]) );
  SDFFRHQXL reg_w_reg_3_ ( .D(n49), .SI(reg_w[2]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[3]) );
  SDFFRHQXL reg_w_reg_2_ ( .D(n41), .SI(reg_w[1]), .SE(test_se), .CK(wr_clk), 
        .RN(n5), .Q(reg_w[2]) );
  SDFFRHQXL reg_w_reg_1_ ( .D(n33), .SI(reg_w[0]), .SE(test_se), .CK(wr_clk), 
        .RN(n6), .Q(reg_w[1]) );
  SDFFRHQXL reg_w_reg_0_ ( .D(n81), .SI(data_out[6]), .SE(test_se), .CK(wr_clk), .RN(n5), .Q(reg_w[0]) );
  SDFFRHQXL data_out_reg_7_ ( .D(mux_w[7]), .SI(test_si2), .SE(test_se), .CK(
        re_clk), .RN(n6), .Q(data_out[7]) );
  SDFFRHQXL data_out_reg_6_ ( .D(mux_w[6]), .SI(data_out[5]), .SE(test_se), 
        .CK(re_clk), .RN(n5), .Q(data_out[6]) );
  SDFFRHQXL data_out_reg_5_ ( .D(mux_w[5]), .SI(data_out[4]), .SE(test_se), 
        .CK(re_clk), .RN(n6), .Q(data_out[5]) );
  SDFFRHQXL data_out_reg_4_ ( .D(mux_w[4]), .SI(data_out[3]), .SE(test_se), 
        .CK(re_clk), .RN(n5), .Q(data_out[4]) );
  SDFFRHQXL data_out_reg_3_ ( .D(mux_w[3]), .SI(data_out[2]), .SE(test_se), 
        .CK(re_clk), .RN(n6), .Q(data_out[3]) );
  SDFFRHQXL data_out_reg_2_ ( .D(mux_w[2]), .SI(data_out[1]), .SE(test_se), 
        .CK(re_clk), .RN(n5), .Q(data_out[2]) );
  SDFFRHQXL data_out_reg_1_ ( .D(mux_w[1]), .SI(data_out[0]), .SE(test_se), 
        .CK(re_clk), .RN(n6), .Q(data_out[1]) );
  SDFFRHQXL data_out_reg_0_ ( .D(mux_w[0]), .SI(test_si1), .SE(test_se), .CK(
        re_clk), .RN(n5), .Q(data_out[0]) );
endmodule

