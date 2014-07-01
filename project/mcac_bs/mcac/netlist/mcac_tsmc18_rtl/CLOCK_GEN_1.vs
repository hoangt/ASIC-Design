
module CLOCK_GEN_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   SUM_0_;
  wire   [7:2] carry;
  assign SUM[0] = SUM_0_;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX1 U1 ( .A(A[0]), .Y(SUM_0_) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLOCK_GEN_1 ( reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, 
        scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, 
        scan_out4, sys_clk_buffered, f_sync_in, f_sync_in_buffered, 
        f_sync_out_buffered, ch_clk_in, not_ch_clk_in_buffered, 
        ch_clk_out_buffered, test_mode );
  input reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, f_sync_in, ch_clk_in, test_mode;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4,
         sys_clk_buffered, f_sync_in_buffered, f_sync_out_buffered,
         not_ch_clk_in_buffered, ch_clk_out_buffered;
  wire   not_ch_clk_int, f_sync_in_int, FSYNC_STATE, N14, N15, N16, N17, N18,
         N19, N20, N21, f_sync_in_buf_in, f_sync_out_buf_in, n13, n14, n18,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, net83868, net83883, net114780, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n15, n16, n17, n19, n20,
         n21, n22, n23, n24, n25, n26, n36, n63, n64;
  wire   [7:0] CLK_GEN_COUNTER;
  wire   [3:0] FSYNC_COUNTER;

  CLKBUFX20 f_sync_in_buf ( .A(f_sync_in_buf_in), .Y(f_sync_in_buffered) );
  CLKBUFX20 f_sync_out_buf ( .A(f_sync_out_buf_in), .Y(f_sync_out_buffered) );
  CLKBUFX20 not_ch_clk_buf ( .A(net83883), .Y(not_ch_clk_in_buffered) );
  CLKBUFX20 ch_clk_out_buf ( .A(net83868), .Y(ch_clk_out_buffered) );
  CLKBUFX20 main_clk_buf ( .A(clk), .Y(sys_clk_buffered) );
  AND4X2 U35 ( .A(n57), .B(CLK_GEN_COUNTER[7]), .C(CLK_GEN_COUNTER[3]), .D(n34), .Y(n29) );
  CLOCK_GEN_1_DW01_inc_0 add_86 ( .A(CLK_GEN_COUNTER), .SUM({N21, N20, N19, 
        N18, N17, N16, N15, N14}) );
  DFFHQX1 not_ch_clk_int_reg ( .D(n63), .CK(clk), .Q(not_ch_clk_int) );
  DFFHQX1 f_sync_in_int_reg ( .D(f_sync_in), .CK(clk), .Q(f_sync_in_int) );
  JKFFX1 FSYNC_COUNTER_reg_1_ ( .J(n48), .K(n50), .CK(clk), .Q(
        FSYNC_COUNTER[1]), .QN(n18) );
  DFFHQX1 FSYNC_COUNTER_reg_3_ ( .D(n61), .CK(clk), .Q(FSYNC_COUNTER[3]) );
  DFFHQX1 FSYNC_COUNTER_reg_0_ ( .D(n60), .CK(clk), .Q(FSYNC_COUNTER[0]) );
  DFFHQX1 FSYNC_COUNTER_reg_2_ ( .D(n9), .CK(clk), .Q(FSYNC_COUNTER[2]) );
  DFFHQX1 FSYNC_STATE_reg ( .D(n62), .CK(clk), .Q(FSYNC_STATE) );
  DFFHQX1 CLK_GEN_COUNTER_reg_6_ ( .D(n20), .CK(clk), .Q(CLK_GEN_COUNTER[6])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_7_ ( .D(n10), .CK(clk), .Q(CLK_GEN_COUNTER[7])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_1_ ( .D(n12), .CK(clk), .Q(CLK_GEN_COUNTER[1])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_4_ ( .D(n17), .CK(clk), .Q(CLK_GEN_COUNTER[4])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_3_ ( .D(n16), .CK(clk), .Q(CLK_GEN_COUNTER[3])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_0_ ( .D(n11), .CK(clk), .Q(CLK_GEN_COUNTER[0])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_2_ ( .D(n15), .CK(clk), .Q(CLK_GEN_COUNTER[2])
         );
  DFFHQX1 CLK_GEN_COUNTER_reg_5_ ( .D(n19), .CK(clk), .Q(CLK_GEN_COUNTER[5])
         );
  DFFX1 f_sync_out_int_reg ( .D(n59), .CK(clk), .QN(n14) );
  DFFX1 ch_clk_out_int_reg ( .D(n58), .CK(clk), .QN(n13) );
  INVX1 U3 ( .A(test_mode), .Y(n4) );
  OAI21XL U4 ( .A0(n27), .A1(n13), .B0(n28), .Y(n58) );
  NAND2X1 U5 ( .A(n7), .B(n6), .Y(net83883) );
  NAND2BX1 U6 ( .AN(test_mode), .B(not_ch_clk_int), .Y(n6) );
  NAND2X1 U7 ( .A(n7), .B(n5), .Y(f_sync_in_buf_in) );
  NAND2BX1 U8 ( .AN(test_mode), .B(f_sync_in_int), .Y(n5) );
  NOR3X1 U9 ( .A(n30), .B(reset), .C(n22), .Y(n2) );
  NAND2BX4 U10 ( .AN(n4), .B(clk), .Y(n3) );
  OAI21X4 U11 ( .A0(n13), .A1(test_mode), .B0(n3), .Y(net83868) );
  NAND2BX4 U12 ( .AN(n4), .B(clk), .Y(net114780) );
  OAI21X4 U13 ( .A0(test_mode), .A1(n14), .B0(net114780), .Y(f_sync_out_buf_in) );
  NAND2X1 U14 ( .A(test_mode), .B(clk), .Y(n7) );
  INVX1 U15 ( .A(n52), .Y(n21) );
  NAND2X1 U16 ( .A(n31), .B(n8), .Y(n52) );
  NOR3X1 U17 ( .A(n2), .B(n29), .C(n51), .Y(n37) );
  NOR3X1 U18 ( .A(n51), .B(n21), .C(n26), .Y(n48) );
  INVX1 U19 ( .A(n51), .Y(n23) );
  AOI21X1 U20 ( .A0(n26), .A1(n23), .B0(n21), .Y(n50) );
  AOI21X1 U21 ( .A0(n29), .A1(n22), .B0(n30), .Y(n31) );
  INVX1 U22 ( .A(n46), .Y(n22) );
  NOR2X1 U23 ( .A(reset), .B(n64), .Y(n62) );
  INVX1 U24 ( .A(reset), .Y(n8) );
  NOR3X1 U25 ( .A(FSYNC_STATE), .B(reset), .C(n64), .Y(n30) );
  OAI21XL U26 ( .A0(FSYNC_STATE), .A1(n64), .B0(n8), .Y(n51) );
  OAI32X1 U27 ( .A0(n51), .A1(FSYNC_COUNTER[0]), .A2(n21), .B0(n26), .B1(n52), 
        .Y(n60) );
  NAND2X1 U28 ( .A(n23), .B(n56), .Y(n46) );
  NAND4X1 U29 ( .A(FSYNC_COUNTER[3]), .B(n26), .C(n18), .D(n36), .Y(n56) );
  OAI21XL U30 ( .A0(FSYNC_COUNTER[1]), .A1(n51), .B0(n50), .Y(n49) );
  INVX1 U31 ( .A(f_sync_in), .Y(n64) );
  OAI21XL U32 ( .A0(n29), .A1(n30), .B0(n27), .Y(n28) );
  NAND2X1 U33 ( .A(n31), .B(n32), .Y(n27) );
  NAND4X1 U34 ( .A(CLK_GEN_COUNTER[2]), .B(n22), .C(CLK_GEN_COUNTER[5]), .D(
        n33), .Y(n32) );
  OAI21XL U36 ( .A0(n44), .A1(n14), .B0(n24), .Y(n59) );
  INVX1 U37 ( .A(n30), .Y(n24) );
  NOR3X1 U38 ( .A(n45), .B(n46), .C(n26), .Y(n44) );
  NAND3X1 U39 ( .A(n36), .B(n25), .C(n18), .Y(n45) );
  OAI21XL U40 ( .A0(n54), .A1(n25), .B0(n55), .Y(n61) );
  AOI21X1 U41 ( .A0(n23), .A1(n36), .B0(n49), .Y(n54) );
  NAND4X1 U42 ( .A(FSYNC_COUNTER[2]), .B(FSYNC_COUNTER[1]), .C(n48), .D(n25), 
        .Y(n55) );
  INVX1 U43 ( .A(n35), .Y(n20) );
  AOI22X1 U44 ( .A0(CLK_GEN_COUNTER[6]), .A1(n2), .B0(N20), .B1(n37), .Y(n35)
         );
  INVX1 U45 ( .A(n38), .Y(n19) );
  AOI22X1 U46 ( .A0(CLK_GEN_COUNTER[5]), .A1(n2), .B0(N19), .B1(n37), .Y(n38)
         );
  INVX1 U47 ( .A(n39), .Y(n17) );
  AOI22X1 U48 ( .A0(n2), .A1(CLK_GEN_COUNTER[4]), .B0(N18), .B1(n37), .Y(n39)
         );
  INVX1 U49 ( .A(n40), .Y(n16) );
  AOI22X1 U50 ( .A0(CLK_GEN_COUNTER[3]), .A1(n2), .B0(N17), .B1(n37), .Y(n40)
         );
  INVX1 U51 ( .A(n41), .Y(n15) );
  AOI22X1 U52 ( .A0(CLK_GEN_COUNTER[2]), .A1(n2), .B0(N16), .B1(n37), .Y(n41)
         );
  INVX1 U53 ( .A(n42), .Y(n12) );
  AOI22X1 U54 ( .A0(n2), .A1(CLK_GEN_COUNTER[1]), .B0(N15), .B1(n37), .Y(n42)
         );
  INVX1 U55 ( .A(n43), .Y(n11) );
  AOI22X1 U56 ( .A0(n2), .A1(CLK_GEN_COUNTER[0]), .B0(N14), .B1(n37), .Y(n43)
         );
  INVX1 U57 ( .A(n53), .Y(n10) );
  AOI22X1 U58 ( .A0(CLK_GEN_COUNTER[7]), .A1(n2), .B0(N21), .B1(n37), .Y(n53)
         );
  INVX1 U59 ( .A(n47), .Y(n9) );
  AOI32X1 U60 ( .A0(FSYNC_COUNTER[1]), .A1(n36), .A2(n48), .B0(n49), .B1(
        FSYNC_COUNTER[2]), .Y(n47) );
  NOR2X1 U61 ( .A(CLK_GEN_COUNTER[5]), .B(CLK_GEN_COUNTER[2]), .Y(n57) );
  NOR4BX1 U62 ( .AN(CLK_GEN_COUNTER[6]), .B(CLK_GEN_COUNTER[0]), .C(
        CLK_GEN_COUNTER[1]), .D(CLK_GEN_COUNTER[4]), .Y(n34) );
  INVX1 U63 ( .A(FSYNC_COUNTER[0]), .Y(n26) );
  NOR3BX1 U64 ( .AN(n34), .B(CLK_GEN_COUNTER[7]), .C(CLK_GEN_COUNTER[3]), .Y(
        n33) );
  INVX1 U65 ( .A(FSYNC_COUNTER[2]), .Y(n36) );
  INVX1 U66 ( .A(ch_clk_in), .Y(n63) );
  INVX1 U67 ( .A(FSYNC_COUNTER[3]), .Y(n25) );
endmodule

