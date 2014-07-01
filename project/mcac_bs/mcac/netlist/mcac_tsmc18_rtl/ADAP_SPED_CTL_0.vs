
module ADAP_SPED_CTL_0 ( I, RATE, TDP, Y, TR, reset, CLK, AL, scan_enable, 
        scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4 );
  input [4:0] I;
  input [1:0] RATE;
  input [12:0] Y;
  output [6:0] AL;
  input TDP, TR, reset, CLK, scan_enable, scan_in0, scan_in1, scan_in2,
         scan_in3, scan_in4;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   AX;
  wire   [2:0] FI;
  wire   [11:0] DMS;
  wire   [11:0] DMSP;
  wire   [13:0] DML;
  wire   [13:0] DMLP;
  wire   [9:0] AP;
  wire   [9:0] APP;
  wire   [9:0] APR;

  FUNCTF_0 func ( .I(I), .RATE(RATE), .FI(FI) );
  FILTA_0 filt ( .FI(FI), .DMS(DMS), .DMSP(DMSP) );
  DELAY_RESET_STATE0_WIDTH12_0 del ( .x(DMSP), .reset(reset), .y(DMS), .clk(
        CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(
        1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  FILTB_0 filt_b ( .FI(FI), .DML(DML), .DMLP(DMLP) );
  DELAY_RESET_STATE0_WIDTH14_0 del2 ( .x(DMLP), .reset(reset), .y(DML), .clk(
        CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(
        1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  SUBTC_0 sub1 ( .DMSP(DMSP), .DMLP(DMLP), .TDP(TDP), .Y(Y), .AX(AX) );
  FILTC_0 filt_c ( .AX(AX), .AP(AP), .APP(APP) );
  TRIGA_0 trig ( .TR(TR), .APP(APP), .APR(APR) );
  LIMA_0 lim ( .AP(AP), .AL(AL) );
  DELAY_RESET_STATE0_WIDTH10_0 del3 ( .x(APR), .reset(reset), .y(AP), .clk(CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
endmodule

