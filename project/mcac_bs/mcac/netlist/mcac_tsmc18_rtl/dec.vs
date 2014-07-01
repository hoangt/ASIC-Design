
module dec ( dec_s, reset, rate, clk, law, dec_i, dec_s_clk, dec_s_fs, 
        dec_i_clk, dec_i_fs, test_mode, scan_in0, scan_in1, scan_in2, scan_in3, 
        scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, 
        scan_enable );
  output [7:0] dec_s;
  input [1:0] rate;
  input [7:0] dec_i;
  input reset, clk, law, dec_i_clk, dec_i_fs, test_mode, scan_in0, scan_in1,
         scan_in2, scan_in3, scan_in4, scan_enable;
  output dec_s_clk, dec_s_fs, scan_out0, scan_out1, scan_out2, scan_out3,
         scan_out4;
  wire   dly_clk, sys_clk, td_w, tr_w, fa_done, dec_fs_buffin, inv_ch_clk_in,
         fa_start, wr_clk, rd_clk, n1, n2;
  wire   [15:0] dq_w;
  wire   [15:0] sr_w;
  wire   [14:0] se_w;
  wire   [12:0] y_w;
  wire   [18:0] yl_w;
  wire   [6:0] al_w;
  wire   [15:0] a2p_w;
  wire   [7:0] dec_s_w;
  wire   [2:0] rd_add;
  wire   [2:0] wr_add;
  wire   [4:0] I_reg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2;

  IN_REG_0 iIn_reg ( .data_in(dec_i), .load(inv_ch_clk_in), .reset(reset), 
        .data_out({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, I_reg}), .scan_enable(1'b0), .scan_in0(1'b0), 
        .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  I_ADAP_QUAN_0 top_dec_I_ADAP_QUAN ( .D(dq_w), .Y(y_w), .I(I_reg), .RATE({n2, 
        rate[0]}) );
  ADAP_PRED_REC_SIG_0 top_dec_ADAP_PRED_REC_SIG ( .DQ(dq_w), .RATE({n2, 
        rate[0]}), .clk(sys_clk), .dly_strb(dly_clk), .reset(reset), .TR(tr_w), 
        .start_trig(fa_start), .SE(se_w), .A2(a2p_w), .SR(sr_w), .done(fa_done), .test_mode(n1), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  TON_TRAN_DET_0 top_dec_TON_TRAN_DET ( .A2P(a2p_w), .reset(reset), .YL(yl_w), 
        .DQ(dq_w), .TDP(td_w), .TR(tr_w), .clk(dly_clk), .scan_in0(1'b0), 
        .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), 
        .test_mode(n1), .scan_enable(1'b0) );
  ADAP_SPED_CTL_0 top_dec_ADAP_SPED_CTL ( .I(I_reg), .RATE({n2, rate[0]}), 
        .TDP(td_w), .Y(y_w), .TR(tr_w), .reset(reset), .CLK(dly_clk), .AL(al_w), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  QUAN_SCAL_FAC_ADAP_0 top_dec_QUAN_SCAL_FAC_ADAP ( .CLK(dly_clk), .IC(I_reg), 
        .RATE({n2, rate[0]}), .AL(al_w), .YL(yl_w), .reset(reset), .Y(y_w), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  OUT_PCM top_dec_OUT_PCM ( .reset(reset), .clk(clk), .SR(sr_w), .LAW(law), 
        .SE(se_w), .I(I_reg), .Y(y_w), .RATE({n2, rate[0]}), .SD(dec_s_w) );
  CU_0 idec_CU ( .reset(reset), .FSYNC_IN(dec_fs_buffin), .FSYNC_OUT(dec_s_fs), 
        .NOT_CH_CLK_IN(inv_ch_clk_in), .CH_CLK_OUT(dec_s_clk), .clk(sys_clk), 
        .FA_start(fa_start), .FA_done(fa_done), .delay_strobe(dly_clk), 
        .scan_enable(1'b0), .test_mode(n1), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .RF_WR_ADDR(wr_add), 
        .RF_RD_ADDR(rd_add), .RF_WR(wr_clk), .RF_RD(rd_clk) );
  CLOCK_GEN_0 dec_clock_gen ( .reset(reset), .clk(clk), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0), .sys_clk_buffered(sys_clk), .f_sync_in(dec_i_fs), 
        .f_sync_in_buffered(dec_fs_buffin), .f_sync_out_buffered(dec_s_fs), 
        .ch_clk_in(dec_i_clk), .not_ch_clk_in_buffered(inv_ch_clk_in), 
        .ch_clk_out_buffered(dec_s_clk), .test_mode(n1) );
  RF_0 dec_rf ( .data_in(dec_s_w), .data_out(dec_s), .re_addr(rd_add), 
        .wr_addr(wr_add), .wr_clk(wr_clk), .re_clk(rd_clk), .reset(reset), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0), .scan_enable(1'b0) );
  BUFX3 U1 ( .A(rate[1]), .Y(n2) );
  BUFX3 U2 ( .A(test_mode), .Y(n1) );
endmodule

