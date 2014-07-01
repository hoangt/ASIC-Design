
module CLOCK_GEN_0_test_1 ( reset, clk, scan_enable, scan_in0, scan_in1, 
        scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, 
        scan_out3, scan_out4, sys_clk_buffered, f_sync_in, f_sync_in_buffered, 
        f_sync_out_buffered, ch_clk_in, not_ch_clk_in_buffered, 
        ch_clk_out_buffered, test_mode, test_si, test_so, test_se );
  input reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, f_sync_in, ch_clk_in, test_mode, test_si, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4,
         sys_clk_buffered, f_sync_in_buffered, f_sync_out_buffered,
         not_ch_clk_in_buffered, ch_clk_out_buffered, test_so;
  wire   not_ch_clk_int, f_sync_in_int, FSYNC_STATE, N14, N15, N16, N17, N18,
         N19, N20, N21, f_sync_in_buf_in, f_sync_out_buf_in, n13, n14, n27,
         n28, n58, net83874, net83893, net114842, n2, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n15, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26,
         n36, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n29, n30, n31, n32, n3, n1,
         n18;
  wire   [7:0] CLK_GEN_COUNTER;
  wire   [3:0] FSYNC_COUNTER;
  assign test_so = not_ch_clk_int;

  CLKBUFX20 f_sync_in_buf ( .A(f_sync_in_buf_in), .Y(f_sync_in_buffered) );
  CLKBUFX20 f_sync_out_buf ( .A(f_sync_out_buf_in), .Y(f_sync_out_buffered) );
  CLKBUFX20 not_ch_clk_buf ( .A(net83893), .Y(not_ch_clk_in_buffered) );
  CLKBUFX20 ch_clk_out_buf ( .A(net83874), .Y(ch_clk_out_buffered) );
  CLKBUFX20 main_clk_buf ( .A(clk), .Y(sys_clk_buffered) );
  AND4X2 U35 ( .A(n69), .B(CLK_GEN_COUNTER[7]), .C(CLK_GEN_COUNTER[3]), .D(n91), .Y(n96) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(net83893) );
  NAND2BX1 U6 ( .AN(test_mode), .B(not_ch_clk_int), .Y(n6) );
  NAND2X1 U7 ( .A(n7), .B(n5), .Y(f_sync_in_buf_in) );
  NAND2BX1 U8 ( .AN(test_mode), .B(f_sync_in_int), .Y(n5) );
  NOR3X1 U9 ( .A(n95), .B(reset), .C(n22), .Y(n2) );
  NAND2BX4 U12 ( .AN(n4), .B(clk), .Y(net114842) );
  OAI21X4 U13 ( .A0(test_mode), .A1(n14), .B0(net114842), .Y(f_sync_out_buf_in) );
  NAND2X1 U14 ( .A(test_mode), .B(clk), .Y(n7) );
  INVX1 U15 ( .A(n74), .Y(n21) );
  NAND2X1 U16 ( .A(n94), .B(n8), .Y(n74) );
  NOR3X1 U17 ( .A(n2), .B(n96), .C(n75), .Y(n89) );
  NOR3X1 U18 ( .A(n75), .B(n21), .C(n26), .Y(n78) );
  INVX1 U19 ( .A(n75), .Y(n23) );
  AOI21X1 U20 ( .A0(n26), .A1(n23), .B0(n21), .Y(n76) );
  AOI21X1 U21 ( .A0(n96), .A1(n22), .B0(n95), .Y(n94) );
  INVX1 U22 ( .A(n80), .Y(n22) );
  NOR2X1 U23 ( .A(reset), .B(n64), .Y(n65) );
  INVX1 U24 ( .A(reset), .Y(n8) );
  NOR3X1 U25 ( .A(FSYNC_STATE), .B(reset), .C(n64), .Y(n95) );
  OAI21XL U26 ( .A0(FSYNC_STATE), .A1(n64), .B0(n8), .Y(n75) );
  OAI32X1 U27 ( .A0(n75), .A1(FSYNC_COUNTER[0]), .A2(n21), .B0(n26), .B1(n74), 
        .Y(n67) );
  NAND2X1 U28 ( .A(n23), .B(n70), .Y(n80) );
  NAND4X1 U29 ( .A(FSYNC_COUNTER[3]), .B(n26), .C(n97), .D(n36), .Y(n70) );
  OAI21XL U30 ( .A0(FSYNC_COUNTER[1]), .A1(n75), .B0(n76), .Y(n77) );
  INVX1 U31 ( .A(f_sync_in), .Y(n64) );
  OAI21XL U32 ( .A0(n96), .A1(n95), .B0(n27), .Y(n28) );
  NAND2X1 U33 ( .A(n94), .B(n93), .Y(n27) );
  NAND4X1 U34 ( .A(CLK_GEN_COUNTER[2]), .B(n22), .C(CLK_GEN_COUNTER[5]), .D(
        n92), .Y(n93) );
  OAI21XL U36 ( .A0(n82), .A1(n14), .B0(n24), .Y(n68) );
  INVX1 U37 ( .A(n95), .Y(n24) );
  NOR3X1 U38 ( .A(n81), .B(n80), .C(n26), .Y(n82) );
  NAND3X1 U39 ( .A(n36), .B(n25), .C(n97), .Y(n81) );
  OAI21XL U40 ( .A0(n72), .A1(n25), .B0(n71), .Y(n66) );
  AOI21X1 U41 ( .A0(n23), .A1(n36), .B0(n77), .Y(n72) );
  NAND4X1 U42 ( .A(FSYNC_COUNTER[2]), .B(FSYNC_COUNTER[1]), .C(n78), .D(n25), 
        .Y(n71) );
  INVX1 U43 ( .A(n90), .Y(n20) );
  AOI22X1 U44 ( .A0(CLK_GEN_COUNTER[6]), .A1(n2), .B0(N20), .B1(n89), .Y(n90)
         );
  INVX1 U45 ( .A(n88), .Y(n19) );
  AOI22X1 U46 ( .A0(CLK_GEN_COUNTER[5]), .A1(n2), .B0(N19), .B1(n89), .Y(n88)
         );
  INVX1 U47 ( .A(n87), .Y(n17) );
  AOI22X1 U48 ( .A0(n2), .A1(CLK_GEN_COUNTER[4]), .B0(N18), .B1(n89), .Y(n87)
         );
  INVX1 U49 ( .A(n86), .Y(n16) );
  AOI22X1 U50 ( .A0(CLK_GEN_COUNTER[3]), .A1(n2), .B0(N17), .B1(n89), .Y(n86)
         );
  INVX1 U51 ( .A(n85), .Y(n15) );
  AOI22X1 U52 ( .A0(CLK_GEN_COUNTER[2]), .A1(n2), .B0(N16), .B1(n89), .Y(n85)
         );
  INVX1 U53 ( .A(n84), .Y(n12) );
  AOI22X1 U54 ( .A0(n2), .A1(CLK_GEN_COUNTER[1]), .B0(N15), .B1(n89), .Y(n84)
         );
  INVX1 U55 ( .A(n83), .Y(n11) );
  AOI22X1 U56 ( .A0(n2), .A1(CLK_GEN_COUNTER[0]), .B0(N14), .B1(n89), .Y(n83)
         );
  INVX1 U57 ( .A(n73), .Y(n10) );
  AOI22X1 U58 ( .A0(CLK_GEN_COUNTER[7]), .A1(n2), .B0(N21), .B1(n89), .Y(n73)
         );
  INVX1 U59 ( .A(n79), .Y(n9) );
  AOI32X1 U60 ( .A0(FSYNC_COUNTER[1]), .A1(n36), .A2(n78), .B0(n77), .B1(
        FSYNC_COUNTER[2]), .Y(n79) );
  NOR2X1 U61 ( .A(CLK_GEN_COUNTER[5]), .B(CLK_GEN_COUNTER[2]), .Y(n69) );
  NOR4BX1 U62 ( .AN(CLK_GEN_COUNTER[6]), .B(CLK_GEN_COUNTER[0]), .C(
        CLK_GEN_COUNTER[1]), .D(CLK_GEN_COUNTER[4]), .Y(n91) );
  INVX1 U66 ( .A(ch_clk_in), .Y(n63) );
  SDFFXL FSYNC_COUNTER_reg_1_ ( .D(n31), .SI(FSYNC_COUNTER[0]), .SE(test_se), 
        .CK(clk), .Q(FSYNC_COUNTER[1]), .QN(n97) );
  SDFFXL f_sync_out_int_reg ( .D(n68), .SI(f_sync_in_int), .SE(test_se), .CK(
        clk), .Q(n30), .QN(n14) );
  SDFFXL ch_clk_out_int_reg ( .D(n58), .SI(FSYNC_STATE), .SE(test_se), .CK(clk), .Q(n29), .QN(n13) );
  MXI2X1 U1 ( .A(n32), .B(n76), .S0(FSYNC_COUNTER[1]), .Y(n31) );
  INVX1 U2 ( .A(n78), .Y(n32) );
  CLOCK_GEN_0_DW01_inc_0 add_86 ( .A(CLK_GEN_COUNTER), .SUM({N21, N20, N19, 
        N18, N17, N16, N15, N14}) );
  OAI21XL U4 ( .A0(n27), .A1(n13), .B0(n28), .Y(n58) );
  INVX1 U3 ( .A(test_mode), .Y(n4) );
  OAI21X4 U11 ( .A0(n13), .A1(test_mode), .B0(n3), .Y(net83874) );
  NAND2BX4 U10 ( .AN(n4), .B(clk), .Y(n3) );
  SDFFXL f_sync_in_int_reg ( .D(f_sync_in), .SI(n29), .SE(test_se), .CK(clk), 
        .Q(f_sync_in_int) );
  SDFFXL not_ch_clk_int_reg ( .D(n63), .SI(n30), .SE(test_se), .CK(clk), .Q(
        not_ch_clk_int) );
  SDFFXL FSYNC_STATE_reg ( .D(n65), .SI(n25), .SE(test_se), .CK(clk), .Q(
        FSYNC_STATE) );
  SDFFXL FSYNC_COUNTER_reg_0_ ( .D(n67), .SI(CLK_GEN_COUNTER[7]), .SE(test_se), 
        .CK(clk), .Q(FSYNC_COUNTER[0]), .QN(n26) );
  SDFFXL FSYNC_COUNTER_reg_3_ ( .D(n66), .SI(FSYNC_COUNTER[2]), .SE(test_se), 
        .CK(clk), .Q(FSYNC_COUNTER[3]), .QN(n25) );
  SDFFXL FSYNC_COUNTER_reg_2_ ( .D(n9), .SI(FSYNC_COUNTER[1]), .SE(test_se), 
        .CK(clk), .Q(FSYNC_COUNTER[2]), .QN(n36) );
  SDFFXL CLK_GEN_COUNTER_reg_7_ ( .D(n10), .SI(CLK_GEN_COUNTER[6]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[7]), .QN(n1) );
  SDFFXL CLK_GEN_COUNTER_reg_6_ ( .D(n20), .SI(CLK_GEN_COUNTER[5]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[6]) );
  SDFFXL CLK_GEN_COUNTER_reg_5_ ( .D(n19), .SI(CLK_GEN_COUNTER[4]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[5]) );
  SDFFXL CLK_GEN_COUNTER_reg_4_ ( .D(n17), .SI(CLK_GEN_COUNTER[3]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[4]) );
  SDFFXL CLK_GEN_COUNTER_reg_3_ ( .D(n16), .SI(CLK_GEN_COUNTER[2]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[3]), .QN(n18) );
  SDFFXL CLK_GEN_COUNTER_reg_2_ ( .D(n15), .SI(CLK_GEN_COUNTER[1]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[2]) );
  SDFFXL CLK_GEN_COUNTER_reg_1_ ( .D(n12), .SI(CLK_GEN_COUNTER[0]), .SE(
        test_se), .CK(clk), .Q(CLK_GEN_COUNTER[1]) );
  SDFFXL CLK_GEN_COUNTER_reg_0_ ( .D(n11), .SI(test_si), .SE(test_se), .CK(clk), .Q(CLK_GEN_COUNTER[0]) );
  AND3X2 U63 ( .A(n91), .B(n1), .C(n18), .Y(n92) );
endmodule

