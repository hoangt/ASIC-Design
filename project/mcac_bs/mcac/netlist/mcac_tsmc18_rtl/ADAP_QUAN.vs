
module ADAP_QUAN ( D, Y, I, RATE );
  input [15:0] D;
  input [12:0] Y;
  output [4:0] I;
  input [1:0] RATE;
  wire   DS;
  wire   [10:0] DL;
  wire   [11:0] DLN;

  LOG_1 ADAP_QUAN_LOG ( .D(D), .DL(DL), .DS(DS) );
  SUBTB_1 ADAP_QUAN_SUBTB ( .DL(DL), .DLN(DLN), .Y(Y) );
  QUAN ADAP_QUAN_QUAN ( .DLN(DLN), .DS(DS), .RATE(RATE), .I(I) );
endmodule

