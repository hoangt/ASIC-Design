/*
* Removed test ports- Not required.
*
*
*/
module OUT_PCM (
           reset,
           clk,
	   SR,
	   LAW,
	   SE,
	   I,
           Y,
	   RATE,
	   SD
       );

input
    reset,                      // system reset
    clk;                        // system clock
input [15:0] SR;
input LAW;
input [14:0] SE;
input [12:0] Y;
input [4:0] I;
input [1:0] RATE;

output [7:0] SD;

wire [7:0] SP;
wire [13:0] DSX;
wire [15:0] DX;
wire SDX;
wire [10:0] DLX;
wire [11:0] DLNX;

COMPRESS OUT_PCM_COMPRESS(
		.SR(SR),
		.LAW(LAW),
		.SP(SP)
);

EXPAND OUT_PCM_EXPAND(
	       .SIN(SP),
	       .LAW(LAW),
	       .SOUT(DSX)
);

SUBTA OUT_PCM_SUBTA(
	       .SL(DSX),
	       .SE(SE),
	       .D(DX)
);

LOG OUT_PCM_LOG( 
		.D(DX),
		.DL(DLX),
		.DS(SDX)
);

SUBTB OUT_PCM_SUBTB(
	        .DL(DLX),
	        .Y(Y),
	        .DLN(DLNX)
);

SYNC OUT_PCM_SYNC(
		 .I(I),
	         .RATE(RATE),
		 .SP(SP),
		 .DLNX(DLNX),
		 .DSX(SDX),
		 .LAW(LAW),
		 .SD(SD)
);
		  
endmodule // OUT_PCM



