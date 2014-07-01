
module IN_PCM ( S, SE, LAW, D );
  input [7:0] S;
  input [14:0] SE;
  output [15:0] D;
  input LAW;

  wire   [13:0] SL;

  EXPAND_1 IEXPAND ( .SIN(S), .LAW(LAW), .SOUT(SL) );
  SUBTA_1 ISUBTA ( .SL(SL), .SE(SE), .D(D) );
endmodule

