/*
Authors:
Levs Dolgovs

Revision History:
v0.1	Logic coded, should work, but not tested
v0.2	drh4327 corrected bit notation and shifting. Confirmed passes
*/

module ANTILOG ( //Function: Convert quantized difference signal from the logarithmic to the linear domain.
			DQL, //12-bit two's complement Log2(quantized difference signal)
			DQS, //(1-bit) Sign bit of quantized difference signal
			DQ   //16-bit signed magnitude Quantized difference signal (16, 24, 32 or 40 kbit/s operation)
       );

input [11:0] DQL;
input DQS;
output [15:0] DQ;

wire DS;				//sign bit
wire [3:0]  DEX;	//4-bit exponent. MSB ranges from 2^14 to 1
wire [6:0]  DMN;	//7-bit (unsigned) mantissa
wire [7:0]  DQT;	//
wire [14:0] DQMAG;

assign DS = DQL[11];			//sign bit DS = DQL >> 11
assign DEX = DQL[10:7];		//4-bit exponent DEX =(DQL >> 7) & 15
assign DMN = DQL[6:0];		//7-bit mantissa DMN = DQL & 127

//Convert mantissa to linear using approximation 2^x = 1+x :
//no idea what this comment means in the standart
//the calculations seem exact. maybe 2^x=1<<x ?
assign DQT = {1'b1, DMN};	//(1 << 7) + DMN		
assign DQMAG = (DS == 1'b0)?
//	((DQT << DEX) >> 3'd7) :
//	(DQT<< 7) >> (14 - DEX): //the double shift is to avoid shifting by a negative number?
	({DQT,7'd0}) >> (14 - DEX): //the double shift is to avoid shifting by a negative number?
	//using simple shift since mantissa is unsigned (should pad 0s from the right)
	15'b0;
	
assign DQ = {DQS, DQMAG};	//Attach sign bit to signed magnitude word (DQS << 15)+DQMAG: for16 SM DQ

endmodule // ANTILOG
