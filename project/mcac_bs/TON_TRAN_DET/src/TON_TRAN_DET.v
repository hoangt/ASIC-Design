/* TON_TRAN_DET.v
 * 
 * Module: Tone and transition detector
 *
 * Author: Pratheep Joe Siluvai
 *
 * Description:
 * Hierarchical module of tone and transition detector
 *
 * Revision history:
 * _Rev #_	_Author(s)_	_Date_		_Changes_
 *  1.00	pi4810		03/30/2014	module created
 *  1.01	pi4810		04/13/2014	vector passes
 *  signals and changed names to match datasheet
*/

module TON_TRAN_DET (
		A2P,
		reset,
		YL,
		DQ,
		TDP,
		TR,
		clk,
		scan_in0, 
		scan_in1, 
		scan_in2, 
		scan_in3, 
		scan_in4, 
		scan_out0, 
		scan_out1, 
		scan_out2, 
		scan_out3, 
		scan_out4, 
		test_mode, 
		scan_enable 
		);
		
           	
// Inputs

input 	[15:0] A2P,DQ;
input	reset;
input	[18:0] YL;                 
input  	clk;                        // system clock
input   	scan_in0, 
		scan_in1, 
		scan_in2, 
		scan_in3,
		scan_enable,
		test_mode, 
		scan_in4;

// Output

output wire	TR;
output wire 	TDP;
output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;

// Wires
wire w_tdr;
wire w_td;


// Module Instatiations


TONE ton_tran_det_TONE	( 
			.A2P(A2P),
			.TDP(TDP)
			);

TRIGB ton_tran_det_TRIGB (
			.TR(TR),
			.nP(TDP),
			.nR(w_tdr)
			);

DELAY #(.WIDTH(1)) ton_tran_det_DELAY (
			.x(w_tdr),
			.reset(reset),
			.y(w_td),
			.clk(clk),
			.scan_enable(),
			.scan_in0(),
			.scan_in1(),
			.scan_in2(),
			.scan_in3(),
			.scan_in4(),
			.scan_out0(),
			.scan_out1(),
			.scan_out2(),
			.scan_out3(),
			.scan_out4()
			);

TRANS ton_tran_det_TRANS (
			.TD(w_td),
			.YL(YL),
			.DQ(DQ),
			.TR(TR)
			);

endmodule // TON_TRAN_DET

