/* IN_PCM.v
*
* Module:Input PCM format conversion
*
* Authors:
* ABHISHEK RAMESH
*
* Description:
* Decode PCM code word and computes the difference signal.
*
* Revision History:
* _Rev #_	_Author(s)_		_Date_		_Changes_
* 1.00		Abhishek Ramesh		03/31/2014	Module started and completed.
* 1.01		Abhishek Ramesh		04/06/2014	Added SE input
*
*/

module IN_PCM (	S, 
		SE,
		LAW,
		D);

///////////////// Inputs and Output declaration///////////////
input [7:0] S;
input LAW;
input [14:0] SE;

output [15:0] D; 

/////////////////////////// Declaration of wires //////////////////////
wire [13:0] SL;

////////////////////////// Module instantiation //////////////////////
EXPAND IEXPAND (
	.SIN(S),
	.LAW(LAW),
	.SOUT(SL)
);

SUBTA ISUBTA (
	.SL(SL),
	.SE(SE),
	.D(D)
);


endmodule // IN_PCM
