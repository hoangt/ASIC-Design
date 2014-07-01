/* FUNCTF.v
* Module: functf
* Authors:
* author1 R Paul Hoops rph6644
*
* Description: Map quantizer output into the F(I) function
*
* Defined on page 33 of the CCITT.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		02/12/2014	Module Created.
* 1.0.1		rph6644		02/12/2014	Updated definition of RATE to match previous work by Matt Pendel
* 1.0.2		rph6644		02/12/2014	Updated comment on input declarations to relfect changes made 
*						from 1.0.0 to 1.0.1.  No functional changes.
* 1.0.3		rph6644		02/24/2014	Corrected several minor syntactical errors.  RTL Code is now compiles.  -02/26/2014: Code succesfully passed testbench.
*
*/

// Module Declaration
module FUNCTF (
	I,
	RATE,
	FI
);

////////////////////////////////////
// Inputs
//
input [4:0]
	I;	//5 bit
input [1:0]
	RATE;	//2 bit signal determining rate, 11 corresponds to 16kBits/s, 10 to 24, etc.	


////////////////////////////////////
// Outputs
//
output [2:0]
	FI;	//3 bit signed magnitude output of F(I)

////////////////////////////////////
// Wire and Register Instantiations
//
reg [2:0]
	FI;	//3 bit signed magnitude output of F(I)
reg [4:0]
	IM; //Magnitude version of I
///////////////////////////////////
// Code Main Block

always @(RATE or I)
begin
case (RATE)
 3:begin				// 16kb/s
	IM = I[1] ?3-I&1:I&1;	// Convert I from 2's complement to magnitude
	case (IM)			// \
	 1: FI=7;			// |_ Assign output value based on look up table
	 default: FI=0;			// |
	endcase				// /
 end

 2:begin 				// 24 kb/s
	IM = I[2] ?7-I&3:I&3;	// Convert I from 2's complement to magnitude
	case (IM)			// \
	 3: FI=7;			// |
	 2: FI=2;			// |_ Assign output value based on look up table
	 1: FI=1;			// |
	 default: FI=0;			// |
	endcase				// /
 end

 1:begin				// 32 kb/s
	IM = I[3] ?15-I&7:I&7;	// Convert I from 2's complement to magnitude
	case (IM)			// \
	 7: FI=7;			// |
	 6: FI=3;			// |
	 5: FI=1;			// |_Assign output value based on look up table
	 4: FI=1;			// |
	 3: FI=1;			// |
	 default: FI=0;			// |
	endcase				// /
 end

 default:begin				// 40 kb/s
	IM = I[4] ?31-I&15:I&15; // Convert I from 2's complement to magnitude
	case (IM)			// \
	 15: FI=6;			// |
	 14: FI=6;			// |
	 13: FI=5;			// |
	 12: FI=4;			// |
	 11: FI=3;			// |
	 10: FI=2;			// |_Assign output value based on look up table
	 9: FI=1;			// |
	 8: FI=1;			// |
	 7: FI=1;			// |
	 6: FI=1;			// |
	 5: FI=1;			// |
	 default: FI=0;			// |
	endcase				// /
 end
endcase
end

endmodule // FUNCTF
