/* OUT_PCM.v
 * *
 * * Module : Tone and transition detector
 * *
 * * Authors: Chethana Dilip 
 * *
 * * Description:
 * * Hierarchical module of Tone and transition detector
 * *
 * * Revision History:
 * * _Rev #_	_Author(s)_	_Date_		_Changes_
 * * 1.00	Chethana Dilip	03/31/2014	Module Created.
 * *
 * */



module TON_TRAN_DET (
	
	A2P, //Second order prdictor coeficient
	TR, //Transition detect
	reset, // Reset
	YL, //delayed slow quantizer scale factor
	DQ,
	TDP,  
	clk,
	scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_mode, scan_enable //DFT scan chain
       );

///////////////////////////////////////////
//// Inputs 
////
input	[15:0] A2P;
input 	       reset;
input	[18:0] YL;
input	[15:0] DQ;
input 	       clk;
input		scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, test_mode, scan_enable; //DFT scan chain
                
///////////////////////////////////////////
//// Outputs 
////
output wire	TR;
output 		TDP;
output		scan_out0, scan_out1, scan_out2, scan_out3, scan_out4; //dft scan chain
   
//////////////////////////////////////////
//// Wire and register instantiations
////

wire w_TDP;
wire w_TDR;
wire w_TD;

///////////////////////////////////////////
//// Module instantiations
////
	assign TDP = w_TDP;

	TONE ton_tran_det_TONE( .A2P(A2P), 
				.TDP(w_TDP)
				);

	TRIGB ton_tran_det_trigb( .nP(w_TDP), 
				  .TR(TR), 
			  	  .nR(w_TDR)
				  );

	DELAY #(.WIDTH(1)) 
		ton_tran_det_delay(.x(w_TDR), 
				   .reset(reset), 
				   .y(w_TD), 
				   .clk(clk),
				   .scan_enable(scan_enable)
				   );

	TRANS ton_tran_det_trans( .TD(w_TD), 
				  .YL(YL), 
				  .DQ(DQ), 
				  .TR(TR)
				  );
endmodule // TON_TRAN_DET
