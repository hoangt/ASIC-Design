/* EXPAND.v
*
* Module: Expand
* Authors:
* author1 Sheenam Jayaswal sj7728
*
* Description: Convert either A-LAW or u-LAW PCM to uniform PCM
* 
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		 sj7728 	02/10/2014	Module Created.
* 1.01		 sj7728		03/02/2014	Changes to Syntax
* 2.00		 ld2193		03/25/2014	Renamed signals
*/

// Module Declaration
module EXPAND (
           SIN,
           LAW,
	   SOUT
       );

input [7:0] SIN;   //8-bit Input Referrenced as S in the Encoder and 
		   // SP in the Decoder 

input LAW;         // A-Law or u-Law

output [13:0] SOUT;  // 14-bit Output Referrenced as SL in the Encoder and 
		   //SLX in the Decoder

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire SSS;
wire [13:0] SSQ;
wire [13:0] SSM;
wire [13:0] SS;

G711 inst_G711 (LAW,SIN,SS);

assign SSS = LAW? SS[12]: SS[13];
assign SSQ = LAW? {SS[11:0],1'b0} : SS[12:0];
assign SSM = 15'd16384-SSQ;
assign SOUT = SSS? SSM[13:0]: SSQ;

endmodule // EXPAND
