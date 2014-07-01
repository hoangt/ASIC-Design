/* functw.v
* module: functw
* authors:
* author1 r paul hoops rph6644
*
* description: map quantizer output into logarithmic version of scale factor multiplier
*
* defined on page 28 of the ccitt.
*
* revision history:
* _rev #_	_author(s)_	_date_		_changes_
* 1.0.0		rph6644		02/12/2014	module created.
* 1.0.1		rph6644		02/25/2014	syntax corrected.  Now compiles.
* 1.0.2		rph6644		02/26/2014	Corrected register declaration for WI.
* 1.1.0		rph6644		02/26/2014	Corrected errors in the values in the LUT. Now passes testbench.
*
*/

//Module Declaration
module FUNCTW (
	I,
	RATE,
	WI
       );

/////////////////////////////////
// Inputs
//
input[4:0]
	I;	//5 bit
input[1:0]
	RATE;	//2 bit signal determining rate, 00 corresponds to 40 kbits/s, 01 to 32, etc

////////////////////////////////
// Outputs
//
output [11:0]
	WI;	//12 bit 2's complement

////////////////////////////////
// Wire and Register Instantiations
//
reg[11:0]
	WI;	//12 bit signed magnitude output of W(I)
reg[4:0]
	IM;	//Magnitude version of I
////////////////////////////////
// Code Main Block
//
always @(RATE or I)
begin
case (RATE)
 3:begin					// 16kb/s				
	IM = I[1] ?(3-I)&1:I&1;		// Convert I from 2's complement to magnitude
	case (IM)				// \
	 1: WI=439;				// |_ Assign output value based on look up table
	 default: WI=4074;			// |
	endcase					// /
 end

 2:begin					// 24kb/s				
	IM = I[2] ?(7-I)&3:I&3;		// Convert I from 2's complement to magnitude
	case (IM)				// \
	 3: WI=582;				// |
	 2: WI=137;				// |_ Assign output value based on look up table
	 1: WI=30;				// |
	 default: WI=4092;			// |
	endcase					// /
 end

 1:begin					// 32kb/s				
	IM = I[3] ?(15-I)&7:I&7;		// Convert I from 2's complement to magnitude
	case (IM)				// \
	 7: WI=1122;				// |
	 6: WI=355;				// |
	 5: WI=198;				// |
	 4: WI=112;				// |_ Assign output value based on look up table
	 3: WI=64;				// |
	 2: WI=41;				// |
	 1: WI=18;				// |
	 default: WI=4084;			// |
	endcase					// /
 end

 default:begin					// 40kb/s				
	IM = I[4] ?(31-I)&15:I&15;	// Convert I from 2's complement to magnitude
	case (IM)				// \
	 15: WI=696;				// |
	 14: WI=529;				// |
	 13: WI=440;				// |
	 12: WI=358;				// |
	 11: WI=280;				// |
	 10: WI=219;				// |
	 9: WI=179;				// |_ Assign output value based on look up table
	 8: WI=141;				// |
	 7: WI=100;				// |
	 6: WI=58;				// |
	 5: WI=41;				// |
	 4: WI=40;				// |
	 3: WI=39;				// |
	 2: WI=24;				// |
	 default: WI=14;			// |
	endcase					// /
 end
endcase
end

endmodule // FUNCTW
