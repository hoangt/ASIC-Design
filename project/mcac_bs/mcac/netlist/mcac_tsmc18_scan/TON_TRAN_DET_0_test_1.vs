
module TON_TRAN_DET_0_test_1 ( A2P, reset, YL, DQ, TDP, TR, clk, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4, test_mode, scan_enable, test_so, 
        test_se );
  input [15:0] A2P;
  input [18:0] YL;
  input [15:0] DQ;
  input reset, clk, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4,
         test_mode, scan_enable, test_se;
  output TDP, TR, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4,
         test_so;
  wire   w_tdr, w_td;
  assign test_so = w_td;

  TONE_0 ton_tran_det_TONE ( .A2P(A2P), .TDP(TDP) );
  TRIGB_0 ton_tran_det_TRIGB ( .TR(TR), .nP(TDP), .nR(w_tdr) );
  DELAY_WIDTH1_0_test_1 ton_tran_det_DELAY ( .x(w_tdr), .reset(reset), .y(w_td), .clk(clk), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(
        1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .test_si(YL[18]), .test_se(
        test_se) );
  TRANS_0 ton_tran_det_TRANS ( .TD(w_td), .YL(YL), .DQ(DQ), .TR(TR) );
endmodule

