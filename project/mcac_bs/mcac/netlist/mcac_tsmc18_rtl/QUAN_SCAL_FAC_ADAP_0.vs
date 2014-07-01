
module QUAN_SCAL_FAC_ADAP_0 ( CLK, IC, RATE, AL, YL, reset, Y, scan_enable, 
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
  wire   n3, n4;
  wire   [11:0] WI;
  wire   [12:0] YUT;
  wire   [12:0] YUP;
  wire   [12:0] YU;
  wire   [18:0] YLP;

  FUNCTW_0 iFUNCTW ( .I(IC), .RATE(RATE), .WI(WI) );
  FILTD_0 iFILTD ( .WI(WI), .Y(Y), .YUT(YUT) );
  LIMB_0 iLIMB ( .YUP(YUP), .YUT(YUT) );
  DELAY_0220_13_0 iDELAY_1 ( .x(YUP), .reset(reset), .y(YU), .clk(CLK), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  FILTE_0 iFILTE ( .YUP(YUP), .YL(YL), .YLP(YLP) );
  DELAY_08800_19_0 iDELAY_2 ( .x(YLP), .reset(reset), .y({YL[18:14], n3, 
        YL[12:8], n4, YL[6:0]}), .clk(CLK), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  MIX_0 iMIX ( .AL(AL), .YU(YU), .YL({YL[18:14], n3, YL[12:8], n4, YL[6:0]}), 
        .Y(Y) );
  CLKBUFXL U1 ( .A(n3), .Y(YL[13]) );
  BUFX3 U2 ( .A(n4), .Y(YL[7]) );
endmodule

