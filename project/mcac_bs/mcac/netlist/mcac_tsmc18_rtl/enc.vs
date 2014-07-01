
module enc ( enc_s, reset, rate, clk, law, enc_i, enc_s_clk, enc_s_fs, 
        enc_i_clk, enc_i_fs, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, 
        scan_enable, test_mode, scan_out0, scan_out1, scan_out2, scan_out3, 
        scan_out4 );
  input [7:0] enc_s;
  input [1:0] rate;
  output [7:0] enc_i;
  input reset, clk, law, enc_s_clk, enc_s_fs, scan_in0, scan_in1, scan_in2,
         scan_in3, scan_in4, scan_enable, test_mode;
  output enc_i_clk, enc_i_fs, scan_out0, scan_out1, scan_out2, scan_out3,
         scan_out4;
  wire   enc_clk_buffout, enc_fs_buffout, dly_clk, sys_clk, td_w, tr_w,
         fa_done, wr_clk, rd_clk, inv_ch_clk_in, fa_start, enc_fs_buffin, n1,
         n2, n3, n4, n5;
  wire   [7:0] enc_s_w;
  wire   [4:0] enc_i_w;
  wire   [15:0] d_w;
  wire   [15:0] dq_w;
  wire   [14:0] se_w;
  wire   [12:0] y_w;
  wire   [18:0] yl_w;
  wire   [6:0] al_w;
  wire   [15:0] a2p_w;
  wire   [2:0] wr_add;
  wire   [2:0] rd_add;
  assign enc_i_clk = enc_clk_buffout;
  assign enc_i_fs = enc_fs_buffout;

  IN_REG_1 iIn_reg ( .data_in(enc_s), .load(inv_ch_clk_in), .reset(reset), 
        .data_out(enc_s_w), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(
        1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  IN_PCM enc_in_pcm ( .S(enc_s_w), .SE(se_w), .LAW(law), .D(d_w) );
  ADAP_QUAN iadap_quan ( .D(d_w), .Y(y_w), .I(enc_i_w), .RATE({n5, n4}) );
  I_ADAP_QUAN_1 iI_adap_quan ( .D(dq_w), .Y(y_w), .I({enc_i_w[4:2], n2, 
        enc_i_w[0]}), .RATE({n5, n4}) );
  ADAP_PRED_REC_SIG_1 iadap_pred_rec ( .DQ(dq_w), .RATE({n5, n4}), .clk(
        sys_clk), .dly_strb(dly_clk), .reset(reset), .TR(n1), .start_trig(
        fa_start), .SE(se_w), .A2(a2p_w), .done(fa_done), .test_mode(n3), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  QUAN_SCAL_FAC_ADAP_1 iQuan_Scal_fac ( .CLK(dly_clk), .IC({enc_i_w[4:2], n2, 
        enc_i_w[0]}), .RATE({n5, n4}), .AL(al_w), .YL(yl_w), .reset(reset), 
        .Y(y_w), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  ADAP_SPED_CTL_1 iadap_sped_ctl ( .I({enc_i_w[4:2], n2, enc_i_w[0]}), .RATE({
        n5, n4}), .TDP(td_w), .Y(y_w), .TR(n1), .reset(reset), .CLK(dly_clk), 
        .AL(al_w), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  TON_TRAN_DET_1 iton_tran_det ( .A2P(a2p_w), .reset(reset), .YL(yl_w), .DQ(
        dq_w), .TDP(td_w), .TR(tr_w), .clk(dly_clk), .scan_in0(1'b0), 
        .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), 
        .test_mode(n3), .scan_enable(1'b0) );
  CU_1 ienc_CU ( .reset(reset), .FSYNC_IN(enc_fs_buffin), .FSYNC_OUT(
        enc_fs_buffout), .NOT_CH_CLK_IN(inv_ch_clk_in), .CH_CLK_OUT(
        enc_clk_buffout), .clk(sys_clk), .FA_start(fa_start), .FA_done(fa_done), .delay_strobe(dly_clk), .scan_enable(1'b0), .test_mode(n3), .scan_in0(1'b0), 
        .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), 
        .RF_WR_ADDR(wr_add), .RF_RD_ADDR(rd_add), .RF_WR(wr_clk), .RF_RD(
        rd_clk) );
  CLOCK_GEN_1 iclock_gen ( .reset(reset), .clk(clk), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0), .sys_clk_buffered(sys_clk), .f_sync_in(enc_s_fs), 
        .f_sync_in_buffered(enc_fs_buffin), .f_sync_out_buffered(
        enc_fs_buffout), .ch_clk_in(enc_s_clk), .not_ch_clk_in_buffered(
        inv_ch_clk_in), .ch_clk_out_buffered(enc_clk_buffout), .test_mode(n3)
         );
  RF_1 irf ( .data_in({1'b0, 1'b0, 1'b0, enc_i_w[4:2], n2, enc_i_w[0]}), 
        .data_out(enc_i), .re_addr(rd_add), .wr_addr(wr_add), .wr_clk(wr_clk), 
        .re_clk(rd_clk), .reset(reset), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .scan_enable(1'b0)
         );
  BUFX16 U1 ( .A(enc_i_w[1]), .Y(n2) );
  BUFX3 U2 ( .A(tr_w), .Y(n1) );
  BUFX3 U3 ( .A(rate[1]), .Y(n5) );
  BUFX3 U4 ( .A(rate[0]), .Y(n4) );
  BUFX3 U5 ( .A(test_mode), .Y(n3) );
endmodule

