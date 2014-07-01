
module QUAN_SCAL_FAC_ADAP_1 ( CLK, IC, RATE, AL, YL, reset, Y, scan_enable, 
        scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4 );
  input [4:0] IC;
  input [1:0] RATE;
  input [6:0] AL;
  output [18:0] YL;
  output [12:0] Y;
  input CLK, reset, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;

  wire   [11:0] WI;
  wire   [12:0] YUT;
  wire   [12:0] YUP;
  wire   [12:0] YU;
  wire   [18:0] YLP;

  FUNCTW_1 iFUNCTW ( .I(IC), .RATE(RATE), .WI(WI) );
  FILTD_1 iFILTD ( .WI(WI), .Y(Y), .YUT(YUT) );
  LIMB_1 iLIMB ( .YUP(YUP), .YUT(YUT) );
  DELAY_0220_13_1 iDELAY_1 ( .x(YUP), .reset(reset), .y(YU), .clk(CLK), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  FILTE_1 iFILTE ( .YUP(YUP), .YL(YL), .YLP(YLP) );
  DELAY_08800_19_1 iDELAY_2 ( .x(YLP), .reset(reset), .y(YL), .clk(CLK), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  MIX_1 iMIX ( .AL(AL), .YU(YU), .YL(YL), .Y(Y) );
endmodule

