/* 
* Removed test ports- Not required for this module
*
*
*////////////////////////////////////////////////
module ADAP_QUAN (
	   D,
	   Y,
	   I,
	   RATE
       );
                       // system clock
input [15:0]  D;
input [12:0]  Y;
input [1:0]   RATE;    

output [4:0]  I;

wire [10:0] DL;
wire [11:0] DLN;
wire DS;

LOG ADAP_QUAN_LOG(
	.D(D),
	.DS(DS),
	.DL(DL)
);

SUBTB ADAP_QUAN_SUBTB(
	.DL(DL),
	.Y(Y),
	.DLN(DLN)
);

QUAN ADAP_QUAN_QUAN(
	.DLN(DLN),
	.DS(DS),
	.I(I),
	.RATE(RATE)
);

endmodule // ADAP_QUAN
