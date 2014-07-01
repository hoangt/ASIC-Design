/* mcac.v
* module: mcac
*
* Description: Top level of the shared-resource implementation
*
* Authors:
* author1 R Paul Hoops rph6644
*
*Revision History:
* _Version_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		3/19/2014	Module Created
*/
module mcac(
);
////////////
// Inputs //
////////////

/////////////
// Outputs //
/////////////

///////////
// Wires //
///////////

///////////////////////////
// Module Instantiations //
///////////////////////////
enc mcac_encoder(
	.enc_s		// PCM input word
	.reset		// active high reset signal
	.rate		// 16/24/32/40 Kb/enc_s
	.clk		// system clk
	.enc_s_clk	// channel clock for PCM
	.enc_s_fs	// channel sync for PCM
	.law		// uLaw or aLaw
	.enc_i		// ADPCM output
	.enc_i_clk	// output channel clock for ADPCM
	.enc_i_fs	// output channel sync for ADPCM
	.enc_error	// high when  a loss of sync is detected
	.scan_in0
	.scan_in1
	.scan_in2
	.scan_in3
	.scan_in4
	.scan_out1
	.scan_out2
	.scan_out3
	.scan_out4
	.test_mode
	.scan_enable
);
dec mcac_decoder(
	.RATE
	.dec_i
	.dec_i_clk
	.dec_i_fs
	.reset
	.sysclk
	.dec_s
	.dec_error,
	.dec_s_clk	
	.dec_s_fs
	.LAW
	.scan_in0
	.scan_in1
	.scan_in2
	.scan_in3
	.scan_in4
	.scan_out1
	.scan_out2
	.scan_out3
	.scan_out4
	.test_mode
	.scan_enable
);

endmodule // mcac

