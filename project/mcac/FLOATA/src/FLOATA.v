/* template.v
*
* Module: module_name
*
* Authors:
* Manoj Kodali



* Description:
* This file is a template for a Verilog module. The top block
* comment is strongly recommended. The rest is an example of
* organized and readble Verilog code. You may use this style if
* you wish. Regardless, make sure your code is organized and 
* neat.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Manoj Kodali	mm/dd/yyyy	Module Created.
* 1.01          Sheenam Jayaswal 03/26/2014	Final Changes
* 1.10		Levs Dolgovs	Apr 9		Debugged (bit width errors)
*/

// Module Declaration
module FLOATA (DQ,DQ0);
	


///////////////////////////////////////////
// Inputs 
//
input
	[15:0]DQ;		// This is signal one
			// This is signal two

///////////////////////////////////////////
// Outputs 
//
output
	[10:0]DQ0;		// This is signal three

///////////////////////////////////////////
// Wire and Register Instantiations
//

wire [14:0] 
	MAG;
wire DQS;
wire [5:0]MANT;
wire [3:0]EXP;


///////////////////////////////////////////
// YOUR LOGIC ( Use this header, as seen above )
//
assign DQS =DQ[15];
assign MAG=DQ;
assign EXP= (MAG>=16384)?15:
            (MAG>=8192)?14:
            (MAG>=4096)?13:
            (MAG>=2048)?12:
            (MAG>=1024)?11:
            (MAG>=512)?10:
            (MAG>=256)?9:
            (MAG>=128)?8:
            (MAG>=64)?7:
            (MAG>=32)?6:
            (MAG>=16)?5:
            (MAG>=8)?4:
            (MAG>=4)?3:
            (MAG>=2)?2:
            (MAG>=1)?1:0;
assign MANT = (MAG == 0) ? 6'b100000 : {MAG,6'b000000}>>EXP;
assign DQ0 ={DQS,EXP,MANT};









endmodule // end of TEMPLATE


