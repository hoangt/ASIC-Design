/* IN_PCM.v
*
* Module: IN_PCM
*
* Authors:
* Matthew Pendel
*
* Description:
* Hierarchical module: Input PCM format 
* conversion and difference signal computation.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		All		03/17/2014	Module Created.
*
*/

// Module Declaration
module IN_PCM (
	S,
	SE,
	LAW,
	D
);

///////////////////////////////////////////
// Inputs 
//
input
	  LAW;		// LAW select. alaw = 0; ulaw = 1;
input	[14:0]
	  SE;		// Unlimited speed control parameter
input	[7:0]
	  S;

///////////////////////////////////////////
// Outputs 
//
output [15:0]
	D;		// Triggered unlimited speed control parameter

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire	[13:0]
	w14_sl;

///////////////////////////////////////////
// Module Instantiations
//
SUBTA i_subta (
      .SL   (w14_sl),
      .SE   (SE),
      .D    (D)
);

EXPAND i_expand (
      .SIN  (S),
      .LAW  (LAW),
      .SOUT (w14_sl)
);

endmodule // end of TRIGA
