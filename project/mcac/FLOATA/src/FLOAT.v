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
* 1.00		Manoj KOdali	mm/dd/yyyy	Module Created.
*
*/

// Module Declaration
module FLOATA (DQ,DQO)
	
);

///////////////////////////////////////////
// Inputs 
//
input
	DQ		// This is signal one
	;		// This is signal two

///////////////////////////////////////////
// Outputs 
//
output
	DQO;		// This is signal three

///////////////////////////////////////////
// Wire and Register Instantiations
//

wire [15:0] 
	MAG;
wire DQS=DQ[15];
wire [6:0]MANT;
wire [3:0]EXP;


///////////////////////////////////////////
// YOUR LOGIC ( Use this header, as seen above )
//

assign MAG=DQ&16383;
assign EXP= MAG>=16384?15:
            MAG>=8192?14:
            MAG>=4096?13:
            MAG>=2048?12:
            MAG>=1024?11:
            MAG>=512?10:
            MAG>=256?9:
            MAG>=128?8:
            MAG>=64?7:
             MAG>=32?6:
              MAG>=16?5:
              MAG>=8?4:
               MAG>=4?3:
               MAG>=2?2:
                MAG>=1?1:
                MAG>=0?0:0;
assign MANT = MAG=0? 6'b 100000:(MAG<<6)>>EXP;
assign DQ0 ={DQS,EXP,MAN};









endmodule // end of TEMPLATE

