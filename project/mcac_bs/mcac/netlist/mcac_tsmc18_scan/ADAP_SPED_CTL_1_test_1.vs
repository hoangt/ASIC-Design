
module ADAP_SPED_CTL_1_test_1 ( I, RATE, TDP, Y, TR, reset, CLK, AL, 
        scan_enable, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, 
        scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_si, 
        test_so, test_se );
  input [4:0] I;
  input [1:0] RATE;
  input [12:0] Y;
  output [6:0] AL;
  input TDP, TR, reset, CLK, scan_enable, scan_in0, scan_in1, scan_in2,
         scan_in3, scan_in4, test_si, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_so;
  wire   AX, n1, n2;
  wire   [2:0] FI;
  wire   [11:0] DMS;
  wire   [11:0] DMSP;
  wire   [13:0] DML;
  wire   [13:0] DMLP;
  wire   [9:0] AP;
  wire   [9:0] APP;
  wire   [9:0] APR;
  assign test_so = DMS[11];

  INVX1 U1 ( .A(n2), .Y(n1) );
  INVX1 U2 ( .A(I[1]), .Y(n2) );
  FUNCTF_1 func ( .I({I[4:2], n1, I[0]}), .RATE(RATE), .FI(FI) );
  FILTA_1 filt ( .FI(FI), .DMS(DMS), .DMSP(DMSP) );
  DELAY_RESET_STATE0_WIDTH12_1_test_1 del ( .x(DMSP), .reset(reset), .y(DMS), 
        .clk(CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .test_si(AP[9]), 
        .test_se(test_se) );
  FILTB_1 filt_b ( .FI(FI), .DML(DML), .DMLP(DMLP) );
  DELAY_RESET_STATE0_WIDTH14_1_test_1 del2 ( .x(DMLP), .reset(reset), .y(DML), 
        .clk(CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .test_si(test_si), 
        .test_se(test_se) );
  SUBTC_1 sub1 ( .DMSP(DMSP), .DMLP(DMLP), .TDP(TDP), .Y(Y), .AX(AX) );
  FILTC_1 filt_c ( .AX(AX), .AP(AP), .APP(APP) );
  TRIGA_1 trig ( .TR(TR), .APP(APP), .APR(APR) );
  LIMA_1 lim ( .AP(AP), .AL(AL) );
  DELAY_RESET_STATE0_WIDTH10_1_test_1 del3 ( .x(APR), .reset(reset), .y(AP), 
        .clk(CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), .test_si(DML[13]), 
        .test_se(test_se) );
endmodule

