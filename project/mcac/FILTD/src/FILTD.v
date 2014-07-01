/* FILTD.v
*
* Module: FILTD
*
* Authors:
* Pradnya Bogar
* 
*
* Description:part of the decoder: quantizer scale factor adaption where this filter is used to get the feedback signal from the output
* 
*
* Revision History:
* _Rev #_	_Author(s)_	  	_Date_		_Changes_
* 1.00		Pradnya Bogar     	02/09/2014	Module Created.
* 1.01          Pradnya Bogar     	02/19/2014    	Comments and Data Widths Corrected	
* 1.02		Pradnya bogar	  	02/23/2014	corrections
* 1.03          Sheenam Jayaswal  	03/26/2014   	Final Corrections
* 1.04		Jagan Muralidharan	03/30/2014	Corrected bit overflow
*/

// Module Declaration

module FILTD (WI, Y,YUT);

// Inputs 

input [11:0] WI;                   // COMMENT HERE
input [12:0] Y;                    // COMMENT HERE

// Outputs 

output [12:0] YUT;                  //COMMENT HERE
wire [12:0] YUT;

// Wires
                
wire [16:0] DIF;
wire DIFS;
wire [12:0] DIFSX;      //COMMENT HERE

// LOGIC
//Begin of Changes by sj7728
assign DIF=({WI,5'b00000}+(18'd131072-Y));  
//assign DIF=({WI,5'b00000}+(17'd131071-Y));  //131072-Y
//End of Changes by sj7728
 /* 0WWWWWWWWWWWW00000
   +YYYYYYYYYYYYYYYYYY
   =
    ZZZZZZZZZZZZZYYYYY this is DIF (18 BIT)

*/

assign DIFS=DIF[16];
assign DIFSX = (DIFS == 0)?DIF[16:5]:(DIF[16:5]+ 13'd4096); //4096 1000000000000
/* ZZZZZZZZZZZZZ
 + 1000000000000
=
  CXZZZZZZZZZZZZ
*/
assign YUT = (Y+DIFSX); //COMMENT HERE

endmodule // end of FILTD
