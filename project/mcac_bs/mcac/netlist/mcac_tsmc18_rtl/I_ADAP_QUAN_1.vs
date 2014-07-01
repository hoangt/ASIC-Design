
module I_ADAP_QUAN_1 ( D, Y, I, RATE );
  output [15:0] D;
  input [12:0] Y;
  input [4:0] I;
  input [1:0] RATE;
  wire   DQS;
  wire   [11:0] RECONST_OUT;
  wire   [11:0] ADDA_OUT;

  RECONST_1 I_ADAP_QUAN_RECONST ( .I(I), .RATE(RATE), .DQLN(RECONST_OUT), 
        .DQS(DQS) );
  ADDA_1 I_ADAP_QUAN_ADDA ( .DQLN(RECONST_OUT), .Y(Y), .DQL(ADDA_OUT) );
  ANTILOG_1 I_ADAP_QUAN_ANTILOG ( .DQL(ADDA_OUT), .DQS(DQS), .DQ(D) );
endmodule

