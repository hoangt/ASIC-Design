
module OUT_PCM ( reset, clk, SR, LAW, SE, I, Y, RATE, SD );
  input [15:0] SR;
  input [14:0] SE;
  input [4:0] I;
  input [12:0] Y;
  input [1:0] RATE;
  output [7:0] SD;
  input reset, clk, LAW;
  wire   SDX, n1, n2, n3, n4, n5;
  wire   [7:0] SP;
  wire   [13:0] DSX;
  wire   [15:0] DX;
  wire   [10:0] DLX;
  wire   [11:0] DLNX;

  COMPRESS OUT_PCM_COMPRESS ( .SR({SR[15:9], n1, SR[7:0]}), .LAW(n5), .SP(SP)
         );
  EXPAND_0 OUT_PCM_EXPAND ( .SIN(SP), .LAW(n5), .SOUT(DSX) );
  SUBTA_0 OUT_PCM_SUBTA ( .SL(DSX), .SE(SE), .D(DX) );
  LOG_0 OUT_PCM_LOG ( .D(DX), .DL(DLX), .DS(SDX) );
  SUBTB_0 OUT_PCM_SUBTB ( .DL(DLX), .DLN(DLNX), .Y(Y) );
  SYNC OUT_PCM_SYNC ( .I(I), .SP({SP[7:4], n4, SP[2], n2, SP[0]}), .DLNX(DLNX), 
        .DSX(SDX), .LAW(n5), .SD(SD), .RATE(RATE) );
  BUFX3 U1 ( .A(SR[8]), .Y(n1) );
  DLY1X1 U2 ( .A(SP[1]), .Y(n2) );
  CLKBUFXL U3 ( .A(LAW), .Y(n5) );
  INVXL U4 ( .A(SP[3]), .Y(n3) );
  INVX1 U5 ( .A(n3), .Y(n4) );
endmodule

