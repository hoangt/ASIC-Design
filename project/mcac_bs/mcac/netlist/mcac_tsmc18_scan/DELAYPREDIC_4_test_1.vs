
module DELAYPREDIC_4_test_1 ( DQN, DQ, RATE, TR, reset, clk, DQN1, B, 
        scan_enable, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, 
        scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_si, 
        test_so, test_se );
  input [10:0] DQN;
  input [15:0] DQ;
  input [1:0] RATE;
  output [10:0] DQN1;
  output [15:0] B;
  input TR, reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, test_si, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_so;
  wire   n2, U;
  wire   [15:0] BNP;
  wire   [15:0] BNR;
  assign test_so = n2;

  BUFX3 U1 ( .A(n2), .Y(B[15]) );
  DELAY_020_11_4_test_1 delay1 ( .x(DQN), .reset(reset), .y(DQN1), .clk(clk), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0), .test_si(test_si), .test_se(test_se)
         );
  XORA_4 xora1 ( .DQn(DQN1), .DQ(DQ), .Un(U) );
  UPB_4 upb1 ( .UN(U), .RATE(RATE), .BN(B), .DQ(DQ), .BNP(BNP) );
  TRIGB_WIDTH16_4 trigb1 ( .TR(TR), .nP(BNP), .nR(BNR) );
  DELAY_RESET_STATE0_WIDTH16_4_test_1 delay2 ( .x(BNR), .reset(reset), .y({n2, 
        B[14:0]}), .clk(clk), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(
        1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .test_si(
        DQN1[10]), .test_se(test_se) );
endmodule

