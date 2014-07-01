
module CU_0 ( reset, FSYNC_IN, FSYNC_OUT, NOT_CH_CLK_IN, CH_CLK_OUT, clk, 
        FA_start, FA_done, delay_strobe, scan_enable, test_mode, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4, RF_WR_ADDR, RF_RD_ADDR, RF_WR, RF_RD
 );
  output [2:0] RF_WR_ADDR;
  output [2:0] RF_RD_ADDR;
  input reset, FSYNC_IN, FSYNC_OUT, NOT_CH_CLK_IN, CH_CLK_OUT, clk, FA_done,
         scan_enable, test_mode, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4;
  output FA_start, delay_strobe, scan_out0, scan_out1, scan_out2, scan_out3,
         scan_out4, RF_WR, RF_RD;
  wire   delay_strobe_buff_in, delay_strobe_r, RF_WR_buff_in, RF_WR_r,
         RF_RD_buff_in, IN_WAIT_STATE, N18, N19, N20, N21, N22, out_wait_state,
         N32, N34, N37, N38, N39, N40, OUT_WRITE_STATE, N65, N75, N76, N77, n1,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n30, n31, n32, n33, n34, n35, n37, n38,
         n40, n42, n44, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74;
  wire   [4:0] IN_WAIT_CNT;
  wire   [4:0] OUT_WAIT_CNT;
  wire   [4:2] add_173_carry;
  wire   [4:2] add_131_carry;

  CLKBUFX20 delay_buf ( .A(delay_strobe_buff_in), .Y(delay_strobe) );
  CLKBUFX20 RF_buf1 ( .A(RF_WR_buff_in), .Y(RF_WR) );
  CLKBUFX20 RF_buf2 ( .A(RF_RD_buff_in), .Y(RF_RD) );
  AND2X2 C352 ( .A(NOT_CH_CLK_IN), .B(FSYNC_IN), .Y(N32) );
  AND2X2 U42 ( .A(n33), .B(n34), .Y(n40) );
  AND4X2 U47 ( .A(OUT_WAIT_CNT[4]), .B(OUT_WAIT_CNT[0]), .C(n31), .D(n12), .Y(
        n16) );
  CLKINVX4 U78 ( .A(CH_CLK_OUT), .Y(n66) );
  EDFFX1 RF_RD_r_reg ( .D(N65), .E(n5), .CK(clk), .QN(n1) );
  DFFRHQX1 delay_strobe_r_reg ( .D(n16), .CK(clk), .RN(n5), .Q(delay_strobe_r)
         );
  DFFRHQX1 RF_WR_r_reg ( .D(n15), .CK(clk), .RN(n5), .Q(RF_WR_r) );
  DFFRHQX1 OUT_WRITE_STATE_reg ( .D(CH_CLK_OUT), .CK(clk), .RN(n5), .Q(
        OUT_WRITE_STATE) );
  DFFRHQX1 FA_start_reg ( .D(n17), .CK(clk), .RN(n5), .Q(FA_start) );
  DFFRHQX1 IN_WAIT_STATE_reg ( .D(NOT_CH_CLK_IN), .CK(clk), .RN(n5), .Q(
        IN_WAIT_STATE) );
  DFFRHQX1 out_wait_state_reg ( .D(FA_done), .CK(clk), .RN(n5), .Q(
        out_wait_state) );
  JKFFRXL RF_in_state_reg_0_ ( .J(n16), .K(n63), .CK(clk), .RN(n5), .Q(
        RF_WR_ADDR[0]), .QN(n68) );
  DFFRHQX1 IN_WAIT_CNT_reg_4_ ( .D(n18), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[4])
         );
  DFFHQX1 OUT_WAIT_CNT_reg_4_ ( .D(n8), .CK(clk), .Q(OUT_WAIT_CNT[4]) );
  DFFHQX1 OUT_WAIT_CNT_reg_1_ ( .D(n9), .CK(clk), .Q(OUT_WAIT_CNT[1]) );
  DFFHQX1 OUT_WAIT_CNT_reg_0_ ( .D(n7), .CK(clk), .Q(OUT_WAIT_CNT[0]) );
  DFFHQX1 OUT_WAIT_CNT_reg_2_ ( .D(n10), .CK(clk), .Q(OUT_WAIT_CNT[2]) );
  DFFHQX1 OUT_WAIT_CNT_reg_3_ ( .D(n11), .CK(clk), .Q(OUT_WAIT_CNT[3]) );
  DFFRHQX1 IN_WAIT_CNT_reg_1_ ( .D(n73), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[1])
         );
  DFFRHQX1 IN_WAIT_CNT_reg_3_ ( .D(n71), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[3])
         );
  DFFRHQX1 IN_WAIT_CNT_reg_2_ ( .D(n72), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[2])
         );
  DFFRHQX1 IN_WAIT_CNT_reg_0_ ( .D(n74), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[0])
         );
  DFFRHQX1 RF_in_state_reg_2_ ( .D(n19), .CK(clk), .RN(n5), .Q(RF_WR_ADDR[2])
         );
  DFFRHQX1 RF_in_state_reg_1_ ( .D(n20), .CK(clk), .RN(n5), .Q(RF_WR_ADDR[1])
         );
  DFFNRX1 RF_STATE_OUT_reg_0_ ( .D(N75), .CKN(CH_CLK_OUT), .RN(n5), .Q(
        RF_RD_ADDR[0]) );
  DFFNRX1 RF_STATE_OUT_reg_2_ ( .D(N77), .CKN(CH_CLK_OUT), .RN(n5), .Q(
        RF_RD_ADDR[2]), .QN(n67) );
  DFFNRX1 RF_STATE_OUT_reg_1_ ( .D(N76), .CKN(CH_CLK_OUT), .RN(n5), .Q(
        RF_RD_ADDR[1]) );
  OAI31X1 U3 ( .A0(OUT_WAIT_CNT[3]), .A1(OUT_WAIT_CNT[2]), .A2(OUT_WAIT_CNT[1]), .B0(OUT_WAIT_CNT[4]), .Y(N34) );
  OAI21XL U4 ( .A0(n1), .A1(test_mode), .B0(n24), .Y(RF_RD_buff_in) );
  MX2X1 U5 ( .A(n59), .B(n60), .S0(OUT_WAIT_CNT[0]), .Y(n7) );
  INVX1 U6 ( .A(test_mode), .Y(n4) );
  INVX1 U7 ( .A(n34), .Y(n70) );
  NOR2BX1 U8 ( .AN(n55), .B(n60), .Y(n59) );
  INVX1 U9 ( .A(reset), .Y(n5) );
  NOR2X1 U10 ( .A(FSYNC_OUT), .B(RF_RD_ADDR[0]), .Y(N75) );
  OAI21XL U11 ( .A0(n23), .A1(n67), .B0(n22), .Y(N77) );
  NAND4BXL U12 ( .AN(FSYNC_OUT), .B(RF_RD_ADDR[1]), .C(RF_RD_ADDR[0]), .D(n67), 
        .Y(n22) );
  AOI2BB1X1 U13 ( .A0N(FSYNC_OUT), .A1N(RF_RD_ADDR[1]), .B0(N75), .Y(n23) );
  NOR2X1 U14 ( .A(FSYNC_OUT), .B(n21), .Y(N76) );
  XNOR2X1 U15 ( .A(RF_RD_ADDR[0]), .B(RF_RD_ADDR[1]), .Y(n21) );
  NAND2X1 U16 ( .A(IN_WAIT_CNT[4]), .B(n33), .Y(n34) );
  NAND2BX1 U17 ( .AN(IN_WAIT_STATE), .B(NOT_CH_CLK_IN), .Y(n33) );
  OAI2BB1X1 U18 ( .A0N(N22), .A1N(n40), .B0(n34), .Y(n18) );
  INVX1 U19 ( .A(n42), .Y(n71) );
  AOI22X1 U20 ( .A0(n70), .A1(IN_WAIT_CNT[3]), .B0(N21), .B1(n40), .Y(n42) );
  INVX1 U21 ( .A(n38), .Y(n72) );
  AOI22X1 U22 ( .A0(n70), .A1(IN_WAIT_CNT[2]), .B0(N20), .B1(n40), .Y(n38) );
  INVX1 U23 ( .A(n37), .Y(n73) );
  AOI22X1 U24 ( .A0(n70), .A1(IN_WAIT_CNT[1]), .B0(N19), .B1(n40), .Y(n37) );
  INVX1 U25 ( .A(n35), .Y(n74) );
  AOI22X1 U26 ( .A0(n70), .A1(IN_WAIT_CNT[0]), .B0(N18), .B1(n40), .Y(n35) );
  INVX1 U27 ( .A(IN_WAIT_CNT[0]), .Y(N18) );
  OAI32X1 U28 ( .A0(n65), .A1(n68), .A2(n13), .B0(n62), .B1(n14), .Y(n19) );
  NOR2BX1 U29 ( .AN(n65), .B(n64), .Y(n62) );
  OAI32X1 U30 ( .A0(n65), .A1(RF_WR_ADDR[1]), .A2(n68), .B0(n69), .B1(n13), 
        .Y(n20) );
  INVX1 U31 ( .A(n64), .Y(n69) );
  OAI21XL U32 ( .A0(RF_WR_ADDR[0]), .A1(n65), .B0(n63), .Y(n64) );
  NAND2BX1 U33 ( .AN(N32), .B(n65), .Y(n63) );
  NOR2X1 U34 ( .A(OUT_WRITE_STATE), .B(n66), .Y(N65) );
  OAI31X1 U35 ( .A0(n14), .A1(n68), .A2(n13), .B0(n16), .Y(n65) );
  INVX1 U36 ( .A(RF_WR_ADDR[1]), .Y(n13) );
  INVX1 U37 ( .A(RF_WR_ADDR[2]), .Y(n14) );
  ADDHXL U38 ( .A(IN_WAIT_CNT[1]), .B(IN_WAIT_CNT[0]), .CO(add_131_carry[2]), 
        .S(N19) );
  ADDHXL U39 ( .A(IN_WAIT_CNT[2]), .B(add_131_carry[2]), .CO(add_131_carry[3]), 
        .S(N20) );
  ADDHXL U40 ( .A(OUT_WAIT_CNT[1]), .B(OUT_WAIT_CNT[0]), .CO(add_173_carry[2]), 
        .S(N37) );
  ADDHXL U41 ( .A(OUT_WAIT_CNT[2]), .B(add_173_carry[2]), .CO(add_173_carry[3]), .S(N38) );
  NAND2BX1 U43 ( .AN(out_wait_state), .B(FA_done), .Y(n55) );
  INVX1 U44 ( .A(OUT_WAIT_CNT[1]), .Y(n12) );
  NOR2X1 U45 ( .A(OUT_WAIT_CNT[3]), .B(OUT_WAIT_CNT[2]), .Y(n31) );
  ADDHXL U46 ( .A(IN_WAIT_CNT[3]), .B(add_131_carry[3]), .CO(add_131_carry[4]), 
        .S(N21) );
  ADDHXL U48 ( .A(OUT_WAIT_CNT[3]), .B(add_173_carry[3]), .CO(add_173_carry[4]), .S(N39) );
  NAND2X1 U49 ( .A(n44), .B(n5), .Y(n60) );
  OAI2BB1X1 U50 ( .A0N(N34), .A1N(FA_done), .B0(n55), .Y(n44) );
  INVX1 U51 ( .A(n57), .Y(n9) );
  AOI22X1 U52 ( .A0(n60), .A1(OUT_WAIT_CNT[1]), .B0(N37), .B1(n59), .Y(n57) );
  INVX1 U53 ( .A(n58), .Y(n10) );
  AOI22X1 U54 ( .A0(n60), .A1(OUT_WAIT_CNT[2]), .B0(N38), .B1(n59), .Y(n58) );
  INVX1 U55 ( .A(n61), .Y(n11) );
  AOI22X1 U56 ( .A0(n60), .A1(OUT_WAIT_CNT[3]), .B0(N39), .B1(n59), .Y(n61) );
  INVX1 U57 ( .A(n56), .Y(n8) );
  AOI22X1 U58 ( .A0(n60), .A1(OUT_WAIT_CNT[4]), .B0(N40), .B1(n59), .Y(n56) );
  NOR3BX1 U59 ( .AN(OUT_WAIT_CNT[2]), .B(n30), .C(n12), .Y(n15) );
  NAND3BX1 U60 ( .AN(OUT_WAIT_CNT[4]), .B(OUT_WAIT_CNT[0]), .C(OUT_WAIT_CNT[3]), .Y(n30) );
  AND3X2 U61 ( .A(n6), .B(IN_WAIT_CNT[1]), .C(IN_WAIT_CNT[0]), .Y(n17) );
  INVX1 U62 ( .A(n32), .Y(n6) );
  NAND3BX1 U63 ( .AN(IN_WAIT_CNT[4]), .B(IN_WAIT_CNT[3]), .C(IN_WAIT_CNT[2]), 
        .Y(n32) );
  NAND2X1 U64 ( .A(test_mode), .B(clk), .Y(n24) );
  OAI2BB1X1 U65 ( .A0N(RF_WR_r), .A1N(n4), .B0(n24), .Y(RF_WR_buff_in) );
  OAI2BB1X1 U66 ( .A0N(delay_strobe_r), .A1N(n4), .B0(n24), .Y(
        delay_strobe_buff_in) );
  XOR2X1 U67 ( .A(add_131_carry[4]), .B(IN_WAIT_CNT[4]), .Y(N22) );
  XOR2X1 U68 ( .A(add_173_carry[4]), .B(OUT_WAIT_CNT[4]), .Y(N40) );
endmodule

