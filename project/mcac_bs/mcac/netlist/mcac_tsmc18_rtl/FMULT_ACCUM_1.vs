
module FMULT_ACCUM_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   SUM_0_;
  wire   [7:2] carry;
  assign SUM[0] = SUM_0_;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  INVX1 U1 ( .A(A[0]), .Y(SUM_0_) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module FMULT_ACCUM_1 ( reset, clk, start, done, A1, A2, B1, B2, B3, B4, B5, B6, 
        SR1, SR2, DQ1, DQ2, DQ3, DQ4, DQ5, DQ6, WAn, SE, SEZ, test_mode, 
        scan_enable, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, 
        scan_out0, scan_out1, scan_out2, scan_out3, scan_out4 );
  input [15:0] A1;
  input [15:0] A2;
  input [15:0] B1;
  input [15:0] B2;
  input [15:0] B3;
  input [15:0] B4;
  input [15:0] B5;
  input [15:0] B6;
  input [10:0] SR1;
  input [10:0] SR2;
  input [10:0] DQ1;
  input [10:0] DQ2;
  input [10:0] DQ3;
  input [10:0] DQ4;
  input [10:0] DQ5;
  input [10:0] DQ6;
  output [15:0] WAn;
  output [14:0] SE;
  output [14:0] SEZ;
  input reset, clk, start, test_mode, scan_enable, scan_in0, scan_in1,
         scan_in2, scan_in3, scan_in4;
  output done, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   LD_SEI_w, LD_SEZI_w, SHIFT_EXP, SHIFT_MANT, INIT_SR, LD_OUT_SR,
         CLR_CARRY, CLR_ACCUM, SHIFT_EXP_int, SHIFT_MANT_int, N83, N85, N86,
         N87, N88, N89, N90, N91, N92, N106, N109, N125, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35;
  wire   [15:0] mux_tc_out;
  wire   [10:0] mux_fl_out;
  wire   [2:0] mux_sel;
  wire   [7:0] count;

  OR4X2 U27 ( .A(count[2]), .B(count[3]), .C(count[5]), .D(count[6]), .Y(n64)
         );
  FMULT_1 FMULT_BS ( .clk(clk), .reset(reset), .scan_enable(1'b0), .scan_in0(
        1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(
        1'b0), .An(mux_tc_out), .SRn(mux_fl_out), .WAn(WAn), .SHIFT_EXP(
        SHIFT_EXP), .SHIFT_MANT(SHIFT_MANT), .INIT_SR(INIT_SR), .LD_OUT_SR(
        LD_OUT_SR) );
  ACCUM_1 ACCUM_BS ( .a(WAn[0]), .clk(clk), .sei_en(LD_SEI_w), .sezi_en(
        LD_SEZI_w), .m1_sel(CLR_CARRY), .m2_sel(CLR_ACCUM), .sei(SE), .sezi(
        SEZ), .reset(reset), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0), .test_mode(test_mode), .scan_enable(
        1'b0) );
  FMULT_ACCUM_1_DW01_inc_0 add_181 ( .A(count), .SUM({N92, N91, N90, N89, N88, 
        N87, N86, N85}) );
  EDFFX1 SHIFT_MANT_int_reg ( .D(N109), .E(n19), .CK(clk), .Q(SHIFT_MANT_int)
         );
  EDFFX1 LD_SEZI_reg ( .D(n188), .E(n19), .CK(clk), .QN(n2) );
  EDFFX1 LD_SEI_reg ( .D(n187), .E(n19), .CK(clk), .QN(n1) );
  EDFFX1 SHIFT_EXP_int_reg ( .D(N106), .E(n19), .CK(clk), .Q(SHIFT_EXP_int) );
  EDFFX1 CLR_ACCUM_reg ( .D(n189), .E(n19), .CK(clk), .Q(CLR_ACCUM) );
  EDFFX1 CLR_CARRY_reg ( .D(N125), .E(n19), .CK(clk), .Q(CLR_CARRY) );
  EDFFX1 INIT_SR_int_reg ( .D(n190), .E(n19), .CK(clk), .Q(INIT_SR) );
  DFFRHQX1 done_reg ( .D(n12), .CK(clk), .RN(n19), .Q(done) );
  EDFFX1 LD_OUT_SR_int_reg ( .D(N125), .E(n19), .CK(clk), .Q(LD_OUT_SR) );
  DFFRHQX1 count_reg_0_ ( .D(n21), .CK(clk), .RN(n19), .Q(count[0]) );
  DFFRHQX1 count_reg_7_ ( .D(n22), .CK(clk), .RN(n19), .Q(count[7]) );
  DFFRHQX1 count_reg_1_ ( .D(n28), .CK(clk), .RN(n19), .Q(count[1]) );
  DFFRHQX1 count_reg_2_ ( .D(n27), .CK(clk), .RN(n19), .Q(count[2]) );
  DFFRHQX1 count_reg_4_ ( .D(n25), .CK(clk), .RN(n19), .Q(count[4]) );
  DFFRHQX1 count_reg_6_ ( .D(n23), .CK(clk), .RN(n19), .Q(count[6]) );
  DFFRHQX1 count_reg_5_ ( .D(n24), .CK(clk), .RN(n19), .Q(count[5]) );
  DFFRHQX1 count_reg_3_ ( .D(n26), .CK(clk), .RN(n19), .Q(count[3]) );
  DFFRHQX1 mux_sel_reg_0_ ( .D(count[4]), .CK(clk), .RN(n19), .Q(mux_sel[0])
         );
  DFFRHQX1 mux_sel_reg_1_ ( .D(count[5]), .CK(clk), .RN(n19), .Q(mux_sel[1])
         );
  DFFRHQX1 mux_sel_reg_2_ ( .D(count[6]), .CK(clk), .RN(n19), .Q(mux_sel[2])
         );
  OAI21XL U3 ( .A0(n1), .A1(test_mode), .B0(n184), .Y(LD_SEI_w) );
  OAI21XL U4 ( .A0(n2), .A1(test_mode), .B0(n184), .Y(LD_SEZI_w) );
  OAI31X1 U5 ( .A0(count[3]), .A1(count[2]), .A2(count[1]), .B0(count[4]), .Y(
        n3) );
  INVX1 U6 ( .A(n3), .Y(n20) );
  AND3X2 U7 ( .A(mux_sel[1]), .B(mux_sel[0]), .C(mux_sel[2]), .Y(n4) );
  AND3X2 U8 ( .A(mux_sel[0]), .B(n31), .C(mux_sel[2]), .Y(n5) );
  NOR3X2 U9 ( .A(mux_sel[1]), .B(mux_sel[2]), .C(n32), .Y(n6) );
  NOR3X2 U10 ( .A(n32), .B(mux_sel[2]), .C(n31), .Y(n7) );
  NOR3X2 U11 ( .A(mux_sel[0]), .B(mux_sel[2]), .C(n31), .Y(n8) );
  AND3X2 U12 ( .A(mux_sel[1]), .B(n32), .C(mux_sel[2]), .Y(n9) );
  AND3X2 U13 ( .A(n32), .B(n31), .C(mux_sel[2]), .Y(n10) );
  NOR3X2 U14 ( .A(mux_sel[1]), .B(mux_sel[2]), .C(mux_sel[0]), .Y(n11) );
  NOR2X1 U15 ( .A(N83), .B(start), .Y(n12) );
  INVX1 U16 ( .A(n67), .Y(n29) );
  INVX1 U17 ( .A(reset), .Y(n19) );
  AOI22X1 U18 ( .A0(B4[15]), .A1(n7), .B0(B3[15]), .B1(n8), .Y(n113) );
  NAND4X1 U19 ( .A(n112), .B(n113), .C(n114), .D(n115), .Y(mux_tc_out[15]) );
  AOI22X1 U20 ( .A0(B6[15]), .A1(n5), .B0(B5[15]), .B1(n10), .Y(n114) );
  AOI22X1 U21 ( .A0(B2[15]), .A1(n6), .B0(B1[15]), .B1(n11), .Y(n112) );
  NAND4X1 U22 ( .A(n30), .B(n35), .C(n34), .D(n33), .Y(n67) );
  NOR3X1 U23 ( .A(n35), .B(n34), .C(n30), .Y(n185) );
  NOR2BX1 U24 ( .AN(n185), .B(n33), .Y(N125) );
  NOR2X1 U25 ( .A(n29), .B(n186), .Y(N109) );
  AOI31X1 U26 ( .A0(n35), .A1(n34), .A2(n30), .B0(n33), .Y(n186) );
  NAND4X1 U28 ( .A(n136), .B(n137), .C(n138), .D(n139), .Y(mux_tc_out[0]) );
  NAND4X1 U29 ( .A(n108), .B(n109), .C(n110), .D(n111), .Y(mux_tc_out[1]) );
  NAND4X1 U30 ( .A(n104), .B(n105), .C(n106), .D(n107), .Y(mux_tc_out[2]) );
  AOI22X1 U31 ( .A0(B2[2]), .A1(n6), .B0(B1[2]), .B1(n11), .Y(n104) );
  AOI22X1 U32 ( .A0(B4[2]), .A1(n7), .B0(B3[2]), .B1(n8), .Y(n105) );
  AOI22X1 U33 ( .A0(B6[2]), .A1(n5), .B0(B5[2]), .B1(n10), .Y(n106) );
  NAND4X1 U34 ( .A(n100), .B(n101), .C(n102), .D(n103), .Y(mux_tc_out[3]) );
  AOI22X1 U35 ( .A0(B2[3]), .A1(n6), .B0(B1[3]), .B1(n11), .Y(n100) );
  AOI22X1 U36 ( .A0(B4[3]), .A1(n7), .B0(B3[3]), .B1(n8), .Y(n101) );
  AOI22X1 U37 ( .A0(B6[3]), .A1(n5), .B0(B5[3]), .B1(n10), .Y(n102) );
  NAND4X1 U38 ( .A(n96), .B(n97), .C(n98), .D(n99), .Y(mux_tc_out[4]) );
  AOI22X1 U39 ( .A0(B2[4]), .A1(n6), .B0(B1[4]), .B1(n11), .Y(n96) );
  AOI22X1 U40 ( .A0(B4[4]), .A1(n7), .B0(B3[4]), .B1(n8), .Y(n97) );
  AOI22X1 U41 ( .A0(B6[4]), .A1(n5), .B0(B5[4]), .B1(n10), .Y(n98) );
  NAND4X1 U42 ( .A(n92), .B(n93), .C(n94), .D(n95), .Y(mux_tc_out[5]) );
  AOI22X1 U43 ( .A0(B2[5]), .A1(n6), .B0(B1[5]), .B1(n11), .Y(n92) );
  AOI22X1 U44 ( .A0(B4[5]), .A1(n7), .B0(B3[5]), .B1(n8), .Y(n93) );
  AOI22X1 U45 ( .A0(B6[5]), .A1(n5), .B0(B5[5]), .B1(n10), .Y(n94) );
  INVX1 U46 ( .A(mux_sel[0]), .Y(n32) );
  INVX1 U47 ( .A(mux_sel[1]), .Y(n31) );
  AOI22X1 U48 ( .A0(A1[2]), .A1(n4), .B0(A2[2]), .B1(n9), .Y(n107) );
  AOI22X1 U49 ( .A0(A1[3]), .A1(n4), .B0(A2[3]), .B1(n9), .Y(n103) );
  AOI22X1 U50 ( .A0(A1[4]), .A1(n4), .B0(A2[4]), .B1(n9), .Y(n99) );
  AOI22X1 U51 ( .A0(A1[5]), .A1(n4), .B0(A2[5]), .B1(n9), .Y(n95) );
  NAND4X1 U52 ( .A(n84), .B(n85), .C(n86), .D(n87), .Y(mux_tc_out[7]) );
  AOI22X1 U53 ( .A0(B2[7]), .A1(n6), .B0(B1[7]), .B1(n11), .Y(n84) );
  AOI22X1 U54 ( .A0(B4[7]), .A1(n7), .B0(B3[7]), .B1(n8), .Y(n85) );
  AOI22X1 U55 ( .A0(B6[7]), .A1(n5), .B0(B5[7]), .B1(n10), .Y(n86) );
  NAND4X1 U56 ( .A(n132), .B(n133), .C(n134), .D(n135), .Y(mux_tc_out[10]) );
  AOI22X1 U57 ( .A0(B2[10]), .A1(n6), .B0(B1[10]), .B1(n11), .Y(n132) );
  AOI22X1 U58 ( .A0(B4[10]), .A1(n7), .B0(B3[10]), .B1(n8), .Y(n133) );
  AOI22X1 U59 ( .A0(B6[10]), .A1(n5), .B0(B5[10]), .B1(n10), .Y(n134) );
  NAND4X1 U60 ( .A(n128), .B(n129), .C(n130), .D(n131), .Y(mux_tc_out[11]) );
  AOI22X1 U61 ( .A0(B2[11]), .A1(n6), .B0(B1[11]), .B1(n11), .Y(n128) );
  AOI22X1 U62 ( .A0(B4[11]), .A1(n7), .B0(B3[11]), .B1(n8), .Y(n129) );
  AOI22X1 U63 ( .A0(B6[11]), .A1(n5), .B0(B5[11]), .B1(n10), .Y(n130) );
  NAND4X1 U64 ( .A(n80), .B(n81), .C(n82), .D(n83), .Y(mux_tc_out[8]) );
  AOI22X1 U65 ( .A0(B2[8]), .A1(n6), .B0(B1[8]), .B1(n11), .Y(n80) );
  AOI22X1 U66 ( .A0(B4[8]), .A1(n7), .B0(B3[8]), .B1(n8), .Y(n81) );
  AOI22X1 U67 ( .A0(B6[8]), .A1(n5), .B0(B5[8]), .B1(n10), .Y(n82) );
  NAND4X1 U68 ( .A(n88), .B(n89), .C(n90), .D(n91), .Y(mux_tc_out[6]) );
  AOI22X1 U69 ( .A0(B2[6]), .A1(n6), .B0(B1[6]), .B1(n11), .Y(n88) );
  AOI22X1 U70 ( .A0(B4[6]), .A1(n7), .B0(B3[6]), .B1(n8), .Y(n89) );
  AOI22X1 U71 ( .A0(B6[6]), .A1(n5), .B0(B5[6]), .B1(n10), .Y(n90) );
  AOI22X1 U72 ( .A0(B6[9]), .A1(n5), .B0(B5[9]), .B1(n10), .Y(n70) );
  NAND4X1 U73 ( .A(n68), .B(n69), .C(n70), .D(n71), .Y(mux_tc_out[9]) );
  AOI22X1 U74 ( .A0(B2[9]), .A1(n6), .B0(B1[9]), .B1(n11), .Y(n68) );
  AOI22X1 U75 ( .A0(B4[9]), .A1(n7), .B0(B3[9]), .B1(n8), .Y(n69) );
  AOI22X1 U76 ( .A0(A1[9]), .A1(n4), .B0(A2[9]), .B1(n9), .Y(n71) );
  AOI22X1 U77 ( .A0(A1[10]), .A1(n4), .B0(A2[10]), .B1(n9), .Y(n135) );
  AOI22X1 U78 ( .A0(A1[11]), .A1(n4), .B0(A2[11]), .B1(n9), .Y(n131) );
  AOI22X1 U79 ( .A0(A1[7]), .A1(n4), .B0(A2[7]), .B1(n9), .Y(n87) );
  AOI22X1 U80 ( .A0(A1[8]), .A1(n4), .B0(A2[8]), .B1(n9), .Y(n83) );
  AOI22X1 U81 ( .A0(A1[6]), .A1(n4), .B0(A2[6]), .B1(n9), .Y(n91) );
  NAND4X1 U82 ( .A(n124), .B(n125), .C(n126), .D(n127), .Y(mux_tc_out[12]) );
  AOI22X1 U83 ( .A0(B2[12]), .A1(n6), .B0(B1[12]), .B1(n11), .Y(n124) );
  AOI22X1 U84 ( .A0(B4[12]), .A1(n7), .B0(B3[12]), .B1(n8), .Y(n125) );
  AOI22X1 U85 ( .A0(B6[12]), .A1(n5), .B0(B5[12]), .B1(n10), .Y(n126) );
  NAND4X1 U86 ( .A(n120), .B(n121), .C(n122), .D(n123), .Y(mux_tc_out[13]) );
  AOI22X1 U87 ( .A0(B2[13]), .A1(n6), .B0(B1[13]), .B1(n11), .Y(n120) );
  AOI22X1 U88 ( .A0(B4[13]), .A1(n7), .B0(B3[13]), .B1(n8), .Y(n121) );
  AOI22X1 U89 ( .A0(B6[13]), .A1(n5), .B0(B5[13]), .B1(n10), .Y(n122) );
  NAND4X1 U90 ( .A(n116), .B(n117), .C(n118), .D(n119), .Y(mux_tc_out[14]) );
  AOI22X1 U91 ( .A0(B2[14]), .A1(n6), .B0(B1[14]), .B1(n11), .Y(n116) );
  AOI22X1 U92 ( .A0(B4[14]), .A1(n7), .B0(B3[14]), .B1(n8), .Y(n117) );
  AOI22X1 U93 ( .A0(B6[14]), .A1(n5), .B0(B5[14]), .B1(n10), .Y(n118) );
  AOI22X1 U94 ( .A0(A1[15]), .A1(n4), .B0(A2[15]), .B1(n9), .Y(n115) );
  AOI22X1 U95 ( .A0(A1[12]), .A1(n4), .B0(A2[12]), .B1(n9), .Y(n127) );
  AOI22X1 U96 ( .A0(A1[13]), .A1(n4), .B0(A2[13]), .B1(n9), .Y(n123) );
  AOI22X1 U97 ( .A0(A1[14]), .A1(n4), .B0(A2[14]), .B1(n9), .Y(n119) );
  NAND4X1 U98 ( .A(n180), .B(n181), .C(n182), .D(n183), .Y(mux_fl_out[0]) );
  AOI22X1 U99 ( .A0(DQ2[0]), .A1(n6), .B0(DQ1[0]), .B1(n11), .Y(n180) );
  AOI22X1 U100 ( .A0(DQ4[0]), .A1(n7), .B0(DQ3[0]), .B1(n8), .Y(n181) );
  AOI22X1 U101 ( .A0(SR1[4]), .A1(n4), .B0(SR2[4]), .B1(n9), .Y(n163) );
  AOI22X1 U102 ( .A0(DQ6[4]), .A1(n5), .B0(DQ5[4]), .B1(n10), .Y(n162) );
  AOI22X1 U103 ( .A0(SR1[0]), .A1(n4), .B0(SR2[0]), .B1(n9), .Y(n183) );
  AOI22X1 U104 ( .A0(SR1[1]), .A1(n4), .B0(SR2[1]), .B1(n9), .Y(n175) );
  AOI22X1 U105 ( .A0(SR1[2]), .A1(n4), .B0(SR2[2]), .B1(n9), .Y(n171) );
  AOI22X1 U106 ( .A0(SR1[10]), .A1(n4), .B0(SR2[10]), .B1(n9), .Y(n179) );
  AOI22X1 U107 ( .A0(SR1[3]), .A1(n4), .B0(SR2[3]), .B1(n9), .Y(n167) );
  AOI22X1 U108 ( .A0(DQ4[1]), .A1(n7), .B0(DQ3[1]), .B1(n8), .Y(n173) );
  AOI22X1 U109 ( .A0(DQ4[2]), .A1(n7), .B0(DQ3[2]), .B1(n8), .Y(n169) );
  AOI22X1 U110 ( .A0(DQ4[10]), .A1(n7), .B0(DQ3[10]), .B1(n8), .Y(n177) );
  AOI22X1 U111 ( .A0(DQ4[3]), .A1(n7), .B0(DQ3[3]), .B1(n8), .Y(n165) );
  AOI22X1 U112 ( .A0(DQ4[4]), .A1(n7), .B0(DQ3[4]), .B1(n8), .Y(n161) );
  AOI22X1 U113 ( .A0(DQ2[1]), .A1(n6), .B0(DQ1[1]), .B1(n11), .Y(n172) );
  AOI22X1 U114 ( .A0(DQ6[0]), .A1(n5), .B0(DQ5[0]), .B1(n10), .Y(n182) );
  AOI22X1 U115 ( .A0(DQ6[1]), .A1(n5), .B0(DQ5[1]), .B1(n10), .Y(n174) );
  AOI22X1 U116 ( .A0(DQ6[2]), .A1(n5), .B0(DQ5[2]), .B1(n10), .Y(n170) );
  AOI22X1 U117 ( .A0(DQ6[3]), .A1(n5), .B0(DQ5[3]), .B1(n10), .Y(n166) );
  NAND4X1 U118 ( .A(n176), .B(n177), .C(n178), .D(n179), .Y(mux_fl_out[10]) );
  AOI22X1 U119 ( .A0(DQ2[10]), .A1(n6), .B0(DQ1[10]), .B1(n11), .Y(n176) );
  AOI22X1 U120 ( .A0(DQ6[10]), .A1(n5), .B0(DQ5[10]), .B1(n10), .Y(n178) );
  NAND4X1 U121 ( .A(n156), .B(n157), .C(n158), .D(n159), .Y(mux_fl_out[5]) );
  AOI22X1 U122 ( .A0(DQ2[5]), .A1(n6), .B0(DQ1[5]), .B1(n11), .Y(n156) );
  NAND4X1 U123 ( .A(n168), .B(n169), .C(n170), .D(n171), .Y(mux_fl_out[2]) );
  AOI22X1 U124 ( .A0(DQ2[2]), .A1(n6), .B0(DQ1[2]), .B1(n11), .Y(n168) );
  NAND4X1 U125 ( .A(n164), .B(n165), .C(n166), .D(n167), .Y(mux_fl_out[3]) );
  AOI22X1 U126 ( .A0(DQ2[3]), .A1(n6), .B0(DQ1[3]), .B1(n11), .Y(n164) );
  NAND4X1 U127 ( .A(n160), .B(n161), .C(n162), .D(n163), .Y(mux_fl_out[4]) );
  AOI22X1 U128 ( .A0(DQ2[4]), .A1(n6), .B0(DQ1[4]), .B1(n11), .Y(n160) );
  NAND4X1 U129 ( .A(n172), .B(n173), .C(n174), .D(n175), .Y(mux_fl_out[1]) );
  NOR4X1 U130 ( .A(count[4]), .B(count[7]), .C(count[6]), .D(count[5]), .Y(
        n189) );
  INVX1 U131 ( .A(count[1]), .Y(n35) );
  INVX1 U132 ( .A(count[3]), .Y(n33) );
  INVX1 U133 ( .A(count[0]), .Y(n30) );
  INVX1 U134 ( .A(count[2]), .Y(n34) );
  AOI22X1 U135 ( .A0(SR1[5]), .A1(n4), .B0(SR2[5]), .B1(n9), .Y(n159) );
  AOI22X1 U136 ( .A0(SR1[6]), .A1(n4), .B0(SR2[6]), .B1(n9), .Y(n155) );
  AOI22X1 U137 ( .A0(SR1[7]), .A1(n4), .B0(SR2[7]), .B1(n9), .Y(n151) );
  AOI22X1 U138 ( .A0(SR1[8]), .A1(n4), .B0(SR2[8]), .B1(n9), .Y(n147) );
  AOI22X1 U139 ( .A0(SR1[9]), .A1(n4), .B0(SR2[9]), .B1(n9), .Y(n143) );
  AOI22X1 U140 ( .A0(DQ6[5]), .A1(n5), .B0(DQ5[5]), .B1(n10), .Y(n158) );
  AOI22X1 U141 ( .A0(DQ6[6]), .A1(n5), .B0(DQ5[6]), .B1(n10), .Y(n154) );
  AOI22X1 U142 ( .A0(DQ6[7]), .A1(n5), .B0(DQ5[7]), .B1(n10), .Y(n150) );
  AOI22X1 U143 ( .A0(DQ6[8]), .A1(n5), .B0(DQ5[8]), .B1(n10), .Y(n146) );
  AOI22X1 U144 ( .A0(DQ6[9]), .A1(n5), .B0(DQ5[9]), .B1(n10), .Y(n142) );
  AOI22X1 U145 ( .A0(DQ4[5]), .A1(n7), .B0(DQ3[5]), .B1(n8), .Y(n157) );
  AOI22X1 U146 ( .A0(DQ4[6]), .A1(n7), .B0(DQ3[6]), .B1(n8), .Y(n153) );
  AOI22X1 U147 ( .A0(DQ4[7]), .A1(n7), .B0(DQ3[7]), .B1(n8), .Y(n149) );
  AOI22X1 U148 ( .A0(DQ4[8]), .A1(n7), .B0(DQ3[8]), .B1(n8), .Y(n145) );
  NOR3X1 U149 ( .A(n185), .B(count[3]), .C(n29), .Y(N106) );
  NOR3BX1 U150 ( .AN(count[4]), .B(n66), .C(n67), .Y(n188) );
  NAND3BX1 U151 ( .AN(count[7]), .B(count[6]), .C(count[5]), .Y(n66) );
  OAI31X1 U152 ( .A0(n20), .A1(count[6]), .A2(count[5]), .B0(count[7]), .Y(N83) );
  NOR2X1 U153 ( .A(n64), .B(n65), .Y(n187) );
  NAND4X1 U154 ( .A(count[7]), .B(count[4]), .C(n30), .D(n35), .Y(n65) );
  NAND4X1 U155 ( .A(n140), .B(n141), .C(n142), .D(n143), .Y(mux_fl_out[9]) );
  AOI22X1 U156 ( .A0(DQ2[9]), .A1(n6), .B0(DQ1[9]), .B1(n11), .Y(n140) );
  AOI22X1 U157 ( .A0(DQ4[9]), .A1(n7), .B0(DQ3[9]), .B1(n8), .Y(n141) );
  INVX1 U158 ( .A(n59), .Y(n26) );
  AOI22X1 U159 ( .A0(n12), .A1(count[3]), .B0(N88), .B1(N83), .Y(n59) );
  INVX1 U160 ( .A(n57), .Y(n24) );
  AOI22X1 U161 ( .A0(n12), .A1(count[5]), .B0(N90), .B1(N83), .Y(n57) );
  INVX1 U162 ( .A(n56), .Y(n23) );
  AOI22X1 U163 ( .A0(n12), .A1(count[6]), .B0(N91), .B1(N83), .Y(n56) );
  INVX1 U164 ( .A(n58), .Y(n25) );
  AOI22X1 U165 ( .A0(n12), .A1(count[4]), .B0(N89), .B1(N83), .Y(n58) );
  INVX1 U166 ( .A(n60), .Y(n27) );
  AOI22X1 U167 ( .A0(n12), .A1(count[2]), .B0(N87), .B1(N83), .Y(n60) );
  INVX1 U168 ( .A(n62), .Y(n22) );
  AOI22X1 U169 ( .A0(n12), .A1(count[7]), .B0(N92), .B1(N83), .Y(n62) );
  INVX1 U170 ( .A(n61), .Y(n28) );
  AOI22X1 U171 ( .A0(n12), .A1(count[1]), .B0(N86), .B1(N83), .Y(n61) );
  INVX1 U172 ( .A(n63), .Y(n21) );
  AOI22X1 U173 ( .A0(n12), .A1(count[0]), .B0(N85), .B1(N83), .Y(n63) );
  NAND4X1 U174 ( .A(n152), .B(n153), .C(n154), .D(n155), .Y(mux_fl_out[6]) );
  AOI22X1 U175 ( .A0(DQ2[6]), .A1(n6), .B0(DQ1[6]), .B1(n11), .Y(n152) );
  NAND4X1 U176 ( .A(n148), .B(n149), .C(n150), .D(n151), .Y(mux_fl_out[7]) );
  AOI22X1 U177 ( .A0(DQ2[7]), .A1(n6), .B0(DQ1[7]), .B1(n11), .Y(n148) );
  NAND4X1 U178 ( .A(n144), .B(n145), .C(n146), .D(n147), .Y(mux_fl_out[8]) );
  AOI22X1 U179 ( .A0(DQ2[8]), .A1(n6), .B0(DQ1[8]), .B1(n11), .Y(n144) );
  NOR4BX1 U180 ( .AN(count[0]), .B(count[3]), .C(count[2]), .D(count[1]), .Y(
        n190) );
  NAND2X1 U181 ( .A(test_mode), .B(clk), .Y(n184) );
  AOI22X1 U182 ( .A0(B6[0]), .A1(n5), .B0(B5[0]), .B1(n10), .Y(n138) );
  AOI22X1 U183 ( .A0(B4[0]), .A1(n7), .B0(B3[0]), .B1(n8), .Y(n137) );
  AOI22X1 U184 ( .A0(B2[0]), .A1(n6), .B0(B1[0]), .B1(n11), .Y(n136) );
  AOI22X1 U185 ( .A0(A1[0]), .A1(n4), .B0(A2[0]), .B1(n9), .Y(n139) );
  AOI22X1 U186 ( .A0(A1[1]), .A1(n4), .B0(A2[1]), .B1(n9), .Y(n111) );
  AOI22X1 U187 ( .A0(B6[1]), .A1(n5), .B0(B5[1]), .B1(n10), .Y(n110) );
  AOI22X1 U188 ( .A0(B4[1]), .A1(n7), .B0(B3[1]), .B1(n8), .Y(n109) );
  AOI22X1 U189 ( .A0(B2[1]), .A1(n6), .B0(B1[1]), .B1(n11), .Y(n108) );
  OAI2BB1X1 U190 ( .A0N(clk), .A1N(SHIFT_MANT_int), .B0(n184), .Y(SHIFT_MANT)
         );
  OAI2BB1X1 U191 ( .A0N(SHIFT_EXP_int), .A1N(clk), .B0(n184), .Y(SHIFT_EXP) );
endmodule

