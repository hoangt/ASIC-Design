//Module created by Sadiq Pasha sp8776@rit.edu
//inverse adaptive quantizer

module I_ADAP_QUAN (
	   D,
	   Y,
	   I,
	   RATE
       );


input 
    [4:0]I;
input
    [12:0]Y;
input
    [1:0]RATE;
output 
    [15:0]D;
wire [11:0]RECONST_OUT;
wire DQS;
wire [11:0]ADDA_OUT;

RECONST I_ADAP_QUAN_RECONST(
	.I(I),
	.RATE(RATE),
	.DQLN(RECONST_OUT),
	.DQS(DQS)
);

ADDA I_ADAP_QUAN_ADDA(
	.DQLN(RECONST_OUT),
	.Y(Y),
	.DQL(ADDA_OUT)
);

ANTILOG I_ADAP_QUAN_ANTILOG(
	.DQL(ADDA_OUT),
	.DQS(DQS),
	.DQ(D)
);
endmodule
