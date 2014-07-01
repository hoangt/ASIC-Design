/* G711.v
*
* Module: module_G711
*
* Authors:
* Abhishek Ramesh-RTL
* Manoj Kodali-Verification
* 
*
* Description:
* Decode PCM to sign and magnitude
* 
*
* Revision History:
* _Rev #_	_Author(s)_	         _Date_		_Changes_
* 1.00		Abhishek Ramesh		02/23/2014	Module Started
* 1.10		Levs			03/30/2014	Module verified
*/

////////////////////////////////////////////
/////// Module Declaration//////////////////
module G711 (
	LAW,
	PCM,
	mag //sgn is used in mag already, and not used in any other module, or in C model
	);

///////////////////////////////////////////
////////////// Inputs /////////////////////
input [7:0] PCM;		//Incoming PCM signal 8 bit
input LAW;			//select,  ulaw=0; Alaw=1
 

/////////////////////////////////////////
///////////// Outputs ///////////////////
output [13:0] mag;		//14bit output magnitude

///////////////////////////////////////////
///// Wire and Register Instantiations/////
wire [7:0] PCM1;
wire [7:0] q;
wire [15:0] s;
wire [7:0] bias ;
wire [13:0] mag;
wire [7:0] a1;
wire [13:0] mag1;
wire [13:0] mag2;
wire sgn;

///////////////////////////////////////////
///////////////// LOGIC////////////////////

assign PCM1=(LAW==0)?(~PCM):(PCM^8'h55);		//Test LAW=1 (A law) or LAW=0(u law) and then perform operation
//!aLaw -> pcm ^= 0x55;
//aLaw  -> pcm ^= 0xff;

assign q=(8'h0F&PCM1);//q = 0x0f & pcm;
assign s=((8'h70&PCM1)>>4);//s = (0x70 & pcm) >> 4;
assign sgn= PCM1[7];//sgn = 0x80 & pcm;

assign bias=(LAW==0) ? 8'd33 : (s ? 8'h21 : 8'h01);

assign a1={q,1'b0}+bias;				//Intermediate output
//!aLaw -> 
//	mag = (((2 * q) + bias) << s) - bias;
//	mag = (sgn ? mag | (1 << 13) : mag) & 16383;
// aLaw ->
//	mag = (2 * q) + bias;
//	mag = (s > 1) ? mag << (s - 1) : mag;
//	mag = (sgn ? mag : mag | (1 << 12)) & 8191;


assign mag1 = (LAW==0) ? 
		((a1<<s)-bias) :
		((s>1) ? a1<<(s-1) : a1); 	//Magnitude without sign value
assign mag = (LAW==0) ?
		(sgn ? (mag1|14'h2000) : mag1) :		//Magnitude with sign bit
		{1'b0, (sgn ? mag1[12:0] : (mag1[12:0] | 13'h1000))};

endmodule // end of G711 


