
module CU_1 ( reset, FSYNC_IN, FSYNC_OUT, NOT_CH_CLK_IN, CH_CLK_OUT, clk, 
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
         N32, N34, N37, N38, N39, N40, OUT_WRITE_STATE, N65, N75, N76, N77,
         n25, n26, n27, n28, n29, n36, n39, n41, n43, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n1,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [4:0] IN_WAIT_CNT;
  wire   [4:0] OUT_WAIT_CNT;
  wire   [4:2] add_173_carry;
  wire   [4:2] add_131_carry;

  CLKBUFX20 delay_buf ( .A(delay_strobe_buff_in), .Y(delay_strobe) );
  CLKBUFX20 RF_buf1 ( .A(RF_WR_buff_in), .Y(RF_WR) );
  CLKBUFX20 RF_buf2 ( .A(RF_RD_buff_in), .Y(RF_RD) );
  AND2X2 C352 ( .A(NOT_CH_CLK_IN), .B(FSYNC_IN), .Y(N32) );
  AND2X2 U42 ( .A(n64), .B(n63), .Y(n59) );
  AND4X2 U47 ( .A(OUT_WAIT_CNT[4]), .B(OUT_WAIT_CNT[0]), .C(n66), .D(n12), .Y(
        n76) );
  CLKINVX4 U78 ( .A(CH_CLK_OUT), .Y(n43) );
  EDFFX1 RF_RD_r_reg ( .D(N65), .E(n5), .CK(clk), .QN(n1) );
  DFFRHQX1 delay_strobe_r_reg ( .D(n76), .CK(clk), .RN(n5), .Q(delay_strobe_r)
         );
  DFFRHQX1 RF_WR_r_reg ( .D(n77), .CK(clk), .RN(n5), .Q(RF_WR_r) );
  DFFRHQX1 OUT_WRITE_STATE_reg ( .D(CH_CLK_OUT), .CK(clk), .RN(n5), .Q(
        OUT_WRITE_STATE) );
  DFFRHQX1 FA_start_reg ( .D(n75), .CK(clk), .RN(n5), .Q(FA_start) );
  DFFRHQX1 IN_WAIT_STATE_reg ( .D(NOT_CH_CLK_IN), .CK(clk), .RN(n5), .Q(
        IN_WAIT_STATE) );
  DFFRHQX1 out_wait_state_reg ( .D(FA_done), .CK(clk), .RN(n5), .Q(
        out_wait_state) );
  DFFRHQX1 IN_WAIT_CNT_reg_4_ ( .D(n74), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[4])
         );
  DFFHQX1 OUT_WAIT_CNT_reg_4_ ( .D(n7), .CK(clk), .Q(OUT_WAIT_CNT[4]) );
  DFFHQX1 OUT_WAIT_CNT_reg_1_ ( .D(n8), .CK(clk), .Q(OUT_WAIT_CNT[1]) );
  DFFHQX1 OUT_WAIT_CNT_reg_0_ ( .D(n6), .CK(clk), .Q(OUT_WAIT_CNT[0]) );
  DFFHQX1 OUT_WAIT_CNT_reg_2_ ( .D(n9), .CK(clk), .Q(OUT_WAIT_CNT[2]) );
  DFFHQX1 OUT_WAIT_CNT_reg_3_ ( .D(n10), .CK(clk), .Q(OUT_WAIT_CNT[3]) );
  DFFRHQX1 IN_WAIT_CNT_reg_1_ ( .D(n26), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[1])
         );
  JKFFRXL RF_in_state_reg_0_ ( .J(n76), .K(n47), .CK(clk), .RN(n5), .Q(
        RF_WR_ADDR[0]), .QN(n39) );
  DFFRHQX1 IN_WAIT_CNT_reg_3_ ( .D(n28), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[3])
         );
  DFFRHQX1 IN_WAIT_CNT_reg_2_ ( .D(n27), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[2])
         );
  DFFRHQX1 IN_WAIT_CNT_reg_0_ ( .D(n25), .CK(clk), .RN(n5), .Q(IN_WAIT_CNT[0])
         );
  DFFRHQX1 RF_in_state_reg_1_ ( .D(n72), .CK(clk), .RN(n5), .Q(RF_WR_ADDR[1])
         );
  DFFRHQX1 RF_in_state_reg_2_ ( .D(n73), .CK(clk), .RN(n5), .Q(RF_WR_ADDR[2])
         );
  DFFNRX1 RF_STATE_OUT_reg_0_ ( .D(N75), .CKN(CH_CLK_OUT), .RN(n5), .Q(
        RF_RD_ADDR[0]) );
  DFFNRX1 RF_STATE_OUT_reg_2_ ( .D(N77), .CKN(CH_CLK_OUT), .RN(n5), .Q(
        RF_RD_ADDR[2]), .QN(n41) );
  DFFNRX1 RF_STATE_OUT_reg_1_ ( .D(N76), .CKN(CH_CLK_OUT), .RN(n5), .Q(
        RF_RD_ADDR[1]) );
  OAI31X1 U3 ( .A0(OUT_WAIT_CNT[3]), .A1(OUT_WAIT_CNT[2]), .A2(OUT_WAIT_CNT[1]), .B0(OUT_WAIT_CNT[4]), .Y(N34) );
  MX2X1 U4 ( .A(n51), .B(n50), .S0(OUT_WAIT_CNT[0]), .Y(n6) );
  OAI21XL U5 ( .A0(n1), .A1(test_mode), .B0(n68), .Y(RF_RD_buff_in) );
  INVX1 U6 ( .A(test_mode), .Y(n4) );
  INVX1 U7 ( .A(n63), .Y(n29) );
  NOR2BX1 U8 ( .AN(n56), .B(n50), .Y(n51) );
  INVX1 U9 ( .A(reset), .Y(n5) );
  NOR2X1 U10 ( .A(FSYNC_OUT), .B(RF_RD_ADDR[0]), .Y(N75) );
  OAI21XL U11 ( .A0(n69), .A1(n41), .B0(n70), .Y(N77) );
  NAND4BXL U12 ( .AN(FSYNC_OUT), .B(RF_RD_ADDR[1]), .C(RF_RD_ADDR[0]), .D(n41), 
        .Y(n70) );
  AOI2BB1X1 U13 ( .A0N(FSYNC_OUT), .A1N(RF_RD_ADDR[1]), .B0(N75), .Y(n69) );
  NOR2X1 U14 ( .A(FSYNC_OUT), .B(n71), .Y(N76) );
  XNOR2X1 U15 ( .A(RF_RD_ADDR[0]), .B(RF_RD_ADDR[1]), .Y(n71) );
  NAND2X1 U16 ( .A(IN_WAIT_CNT[4]), .B(n64), .Y(n63) );
  NAND2BX1 U17 ( .AN(IN_WAIT_STATE), .B(NOT_CH_CLK_IN), .Y(n64) );
  OAI2BB1X1 U18 ( .A0N(N22), .A1N(n59), .B0(n63), .Y(n74) );
  INVX1 U19 ( .A(n58), .Y(n28) );
  AOI22X1 U20 ( .A0(n29), .A1(IN_WAIT_CNT[3]), .B0(N21), .B1(n59), .Y(n58) );
  INVX1 U21 ( .A(n60), .Y(n27) );
  AOI22X1 U22 ( .A0(n29), .A1(IN_WAIT_CNT[2]), .B0(N20), .B1(n59), .Y(n60) );
  INVX1 U23 ( .A(n61), .Y(n26) );
  AOI22X1 U24 ( .A0(n29), .A1(IN_WAIT_CNT[1]), .B0(N19), .B1(n59), .Y(n61) );
  INVX1 U25 ( .A(n62), .Y(n25) );
  AOI22X1 U26 ( .A0(n29), .A1(IN_WAIT_CNT[0]), .B0(N18), .B1(n59), .Y(n62) );
  INVX1 U27 ( .A(IN_WAIT_CNT[0]), .Y(N18) );
  OAI32X1 U28 ( .A0(n45), .A1(RF_WR_ADDR[1]), .A2(n39), .B0(n36), .B1(n13), 
        .Y(n72) );
  INVX1 U29 ( .A(n46), .Y(n36) );
  OAI21XL U30 ( .A0(RF_WR_ADDR[0]), .A1(n45), .B0(n47), .Y(n46) );
  NAND2BX1 U31 ( .AN(N32), .B(n45), .Y(n47) );
  OAI32X1 U32 ( .A0(n45), .A1(n39), .A2(n13), .B0(n48), .B1(n14), .Y(n73) );
  NOR2BX1 U33 ( .AN(n45), .B(n46), .Y(n48) );
  NOR2X1 U34 ( .A(OUT_WRITE_STATE), .B(n43), .Y(N65) );
  OAI31X1 U35 ( .A0(n14), .A1(n39), .A2(n13), .B0(n76), .Y(n45) );
  INVX1 U36 ( .A(RF_WR_ADDR[2]), .Y(n14) );
  INVX1 U37 ( .A(RF_WR_ADDR[1]), .Y(n13) );
  ADDHXL U38 ( .A(IN_WAIT_CNT[1]), .B(IN_WAIT_CNT[0]), .CO(add_131_carry[2]), 
        .S(N19) );
  ADDHXL U39 ( .A(IN_WAIT_CNT[2]), .B(add_131_carry[2]), .CO(add_131_carry[3]), 
        .S(N20) );
  ADDHXL U40 ( .A(OUT_WAIT_CNT[1]), .B(OUT_WAIT_CNT[0]), .CO(add_173_carry[2]), 
        .S(N37) );
  ADDHXL U41 ( .A(OUT_WAIT_CNT[2]), .B(add_173_carry[2]), .CO(add_173_carry[3]), .S(N38) );
  NAND2BX1 U43 ( .AN(out_wait_state), .B(FA_done), .Y(n56) );
  INVX1 U44 ( .A(OUT_WAIT_CNT[1]), .Y(n12) );
  NOR2X1 U45 ( .A(OUT_WAIT_CNT[3]), .B(OUT_WAIT_CNT[2]), .Y(n66) );
  ADDHXL U46 ( .A(IN_WAIT_CNT[3]), .B(add_131_carry[3]), .CO(add_131_carry[4]), 
        .S(N21) );
  ADDHXL U48 ( .A(OUT_WAIT_CNT[3]), .B(add_173_carry[3]), .CO(add_173_carry[4]), .S(N39) );
  NAND2X1 U49 ( .A(n57), .B(n5), .Y(n50) );
  OAI2BB1X1 U50 ( .A0N(N34), .A1N(FA_done), .B0(n56), .Y(n57) );
  INVX1 U51 ( .A(n53), .Y(n8) );
  AOI22X1 U52 ( .A0(n50), .A1(OUT_WAIT_CNT[1]), .B0(N37), .B1(n51), .Y(n53) );
  INVX1 U53 ( .A(n52), .Y(n9) );
  AOI22X1 U54 ( .A0(n50), .A1(OUT_WAIT_CNT[2]), .B0(N38), .B1(n51), .Y(n52) );
  INVX1 U55 ( .A(n49), .Y(n10) );
  AOI22X1 U56 ( .A0(n50), .A1(OUT_WAIT_CNT[3]), .B0(N39), .B1(n51), .Y(n49) );
  INVX1 U57 ( .A(n54), .Y(n7) );
  AOI22X1 U58 ( .A0(n50), .A1(OUT_WAIT_CNT[4]), .B0(N40), .B1(n51), .Y(n54) );
  NOR3BX1 U59 ( .AN(OUT_WAIT_CNT[2]), .B(n67), .C(n12), .Y(n77) );
  NAND3BX1 U60 ( .AN(OUT_WAIT_CNT[4]), .B(OUT_WAIT_CNT[0]), .C(OUT_WAIT_CNT[3]), .Y(n67) );
  AND3X2 U61 ( .A(n11), .B(IN_WAIT_CNT[1]), .C(IN_WAIT_CNT[0]), .Y(n75) );
  INVX1 U62 ( .A(n65), .Y(n11) );
  NAND3BX1 U63 ( .AN(IN_WAIT_CNT[4]), .B(IN_WAIT_CNT[3]), .C(IN_WAIT_CNT[2]), 
        .Y(n65) );
  NAND2X1 U64 ( .A(test_mode), .B(clk), .Y(n68) );
  OAI2BB1X1 U65 ( .A0N(RF_WR_r), .A1N(n4), .B0(n68), .Y(RF_WR_buff_in) );
  OAI2BB1X1 U66 ( .A0N(delay_strobe_r), .A1N(n4), .B0(n68), .Y(
        delay_strobe_buff_in) );
  XOR2X1 U67 ( .A(add_131_carry[4]), .B(IN_WAIT_CNT[4]), .Y(N22) );
  XOR2X1 U68 ( .A(add_173_carry[4]), .B(OUT_WAIT_CNT[4]), .Y(N40) );
endmodule

