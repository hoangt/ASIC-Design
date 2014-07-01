/* FLOATB.v
*
* Module:FLOATB
*
* Authors:
* Vineeta Singh
* 
*
* Description:
* Convert 16-bit two's complement to floating point.
*
* Revision History:
* _Rev #_	_Author(s)_		_Date_		_Changes_
* 1.00		All			02/16/2014	Module Created.
* 1.01		Jagan Muralidharan	03/31/2014	Corrected bit overflow error
*
*/

// Module Declaration
module FLOATB (
	SR ,
 	SR0
        );

///////////////////////////////////////////
// Inputs 
//
input	[15:0] SR ;     //reconstructed signal
		

///////////////////////////////////////////
// Outputs 
//
output	[10:0] SR0 ; // reconstructed signal with delay 0


///////////////////////////////////////////
// Wire and Register Instantiations
//
wire [15:0] 
	SRS;	// Signed magnitude of D
wire [3:0] 
	EXP;	// 4-bit exponent value
wire [5:0]
	MANT;	// 6-bit mantissa value
wire [14:0]
	MAG;	// magnitude

///////////////////////////////////////////
// 

assign SRS = SR[15]; //SRS gets MSB of SR
assign MAG = SRS ? (17'd65536-SR) : SR;  // Compute magnitude

assign EXP = (MAG >= 15'd16384) ? 15:
	     (MAG >= 15'd8192) ? 14:
	     (MAG >= 15'd4096) ? 13:
	     (MAG >= 15'd2048) ? 12:
	     (MAG >= 15'd1024) ? 11:
	     (MAG >= 15'd512)  ? 10:
	     (MAG >= 15'd256)  ?  9:
	     (MAG >= 15'd128)  ?  8:
	     (MAG >=  15'd64)  ?  7:
	     (MAG >=  15'd32)  ?  6:
	     (MAG >=  15'd16)  ?  5:
	     (MAG >=   15'd8)  ?  4:
	     (MAG >=   15'd4)  ?  3:
	     (MAG >=   15'd2)  ?  2:
	     (MAG ==   15'd1)  ?  1:
	     (MAG ==   15'd0)  ?  0:
				  0;

assign MANT = (MAG==0) ? (1<<5) : ({ MAG , 6'b000000}>> EXP);	// Compute Mantissa with a 1 in the most significant bit.

assign SR0 = {SRS,EXP,MANT};	// Combine sign bit and 4 exponent bits and 6 mantissa bits into one 11-bit word.

endmodule // end of floatb


