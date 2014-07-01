/* ADDA.v
*
* Module: ADDA
*
* Authors:
* Sheenam Jayaswal
* 
*
* Description:
* This module adds the scale factor to the logarithmic version of quantized difference signal
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Sheenam Jayaswal  02/10/2014	Module Created.
* 1.01          Sheenam Jayaswal  02/13/2014    Comments and Data Widths Corrected
* 1.02          Sheenam Jayaswal  02/19/2014    Syntax Error Corrected	
*/

// Module Declaration
module ADDA (
           DQLN,
           Y,
           DQL
);

///////////////////////////////////////////
// Inputs 
//

input [11:0]
  	DQLN;                   // Log(normalized Quantized Difference)
input [12:0]    
    	 Y;                    // Quantizer Scale Factor


///////////////////////////////////////////
// Outputs 
//
output [11:0]
        DQL;                  //Log(Quantized Difference Signal) 

///////////////////////////////////////////
// LOGIC
	assign DQL = (DQLN + {2'b00,(Y[12:2])}); //Addition of scale factor to logarithmic version of quantized signal

endmodule // end of ADDA

