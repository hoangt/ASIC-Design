/* COMPRESS.v
*
* Module: module_COMPRESS
*
* Authors:
* Abhishek Ramesh-RTL
* Manoj Kodali-Verification
* 
*
* Description:
* DECODER-Convert from uniform PCM to either A law or U law PCM.
* 
*
* Revision History:
* _Rev #_	_Author(s)_	         _Date_		_Changes_
* 1.00		Abhishek Ramesh		02/16/2014	Module Started
* 1.01		Abhishek Ramesh		02/28/2014	IG711 instantiated
* 1.02 		Abhishek Ramesh		03/02/2014
* 1.03		nv1440			03/25/2014	changed IMAG assignment		
* 1.10		Matt Pendel		03/30/2014	Added clamping functionality (parity from c model)
*		David Herdzik				RTL Verified
*/

////////////////////////////////////////////
/////// Module Declaration//////////////////

module COMPRESS (
	SR,
	LAW,
	SP
	);

///////////////////////////////////////////
////////////// Inputs /////////////////////

input [15:0] SR;		// 16 bit signed 2's complement reconstructed signal
input LAW;			// PCM Law select,  ulaw=0; Alaw=1.

////////////////////////////////////////
///////////// Outputs /////////////////////

output [7:0] SP;		// 8 bit PCM reconstructed signal

///////////////////////////////////////////
///// Wire and Register Instantiations/////
wire	    IS;
wire [15:0] IM;
wire [12:0] IMAG;
wire [15:0] IMp1;


reg [12:0]  IMAG_a;

////////////////////////////////////
IG711 inst_IG711(
	.LAW 	(LAW), 
	.is	(IS), 
	.imag	(IMAG), 
	.inv	(SP)
);

///////////////////////////////////////////
///////////////// LOGIC////////////////////

assign IS=SR[15];			//Mask the bits (Get MSB)
assign IM=IS?(17'h10000-SR):SR;		//Convert 2's complement to signed magnitude
assign IMp1 = IM + 16'd1;		// IM plus one.
/*
assign IMAG = LAW ? 
		(IS ? ({1'b0,IMp1[15:1]}-16'd1) : {1'b0,IM[15:1]}) : 
		IM;
*/

always @(IMAG_a,IM,IMp1,IS)
begin  
      IMAG_a = (IS ? ({1'b0,IMp1[15:1]}-16'd1) : {1'b0,IM[15:1]});
      if (IMAG_a[12]==1'b1) begin
	IMAG_a=13'hFFF;
      end 
end 

assign IMAG= LAW ? IMAG_a : IM;
/*
assign IMAG=(LAW==0)?IM:			//u-Law
            (LAW==1 && IS==0)?{1'b0,IM[14:0]}:((IM+1)>>1);	
	   // (LAW==1 && IS==1)?((IM+1)>>1);	// A-Law
*/

endmodule // end of COMPRESS 

