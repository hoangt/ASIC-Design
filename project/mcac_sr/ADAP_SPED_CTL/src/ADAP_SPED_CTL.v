
/* ADAP_SPED_CTL.v
*
* Module : Adaptive Speed Control
*
* Authors: Abdullah Zyarah
* 
*
* Description:
* This file is a template for a Verilog module. The top block
* comment is strongly recommended. The rest is an example of
* organized and readble Verilog code. You may use this style if
* you wish. Regardless, make sure your code is organized and 
* neat.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah	03/18/2014	Module Created.
* 1.20		Abdullah	03/20/2014	Modified
* 1.30		Abdullah	03/28/2014	Modified
*/

// Module Declaration
module ADAP_SPED_CTL (
	I,						// ADPCM word
	reset,						// reset signal
	Y,						// Quantizer scale factor
	TDP,						// Tone detect
	TR,						// Transition detect
	AL,						// Speed control parameter
	RATE,						
	clk,						// delay block clock
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
	scan_enable 					//DFT scan chain
);

///////////////////////////////////////////
// Inputs 
//

input	[4:0]	I;
input		reset, TDP, TR, clk;
input	[12:0]	Y;
input	[1:0]	RATE;


input	scan_in0, 
	scan_in1, 
	scan_in2, 
	scan_in3, 
	scan_in4, 
	test_mode, 
	scan_enable; 					//DFT scan chain
///////////////////////////////////////////
// Outputs 
//

output	[6:0]	AL;
output	scan_out0, 
	scan_out1, 
	scan_out2, 
	scan_out3, 
	scan_out4; 					//DFT scan chain
///////////////////////////////////////////
// Wire and Register Instantiations
//

wire	[2:0]	fi_w;					// Output of F(I) 
wire	[11:0]	dmsp_w;					// Short term average of F(I) sequence
wire	[11:0]	dms_w;					// Delayed short term average of F(I) sequence
wire	[13:0]	dmlp_w;					// Long term average of F(I) sequence
wire	[13:0]	dml_w;					// Delayed long term average of F(I) sequence
wire		ax_w;					// Speed control parameter update
wire	[9:0]	app_w;					// Unlimited speed control parameter
wire	[9:0]	apr_w;					// Triggered unlimited speed control parameter
wire	[9:0]	ap_w;					// Delayed unlimited speed control parameter


///////////////////////////////////////////
// YOUR LOGIC ( Use this header, as seen above )
//

	FUNCTF	ADAP_SPED_CTL_funtf(
		   			 .I(I),
		   			 .RATE(RATE),
		   			 .FI(fi_w)
		   			);

	FILTA	ADAP_SPED_CTL_filta(
		    			.FI(fi_w),
		   			.DMS(dms_w),
		    			.DMSP(dmsp_w)
		   		    );

	DELAY	#(
		    .WIDTH(12)
		) ADAP_SPED_CTL_delay1 (
		  			 .x(dmsp_w),
		   			 .reset(reset),
		   			 .y(dms_w),
		   			 .clk(clk),
		  			 .scan_enable(scan_enable)
		  			 );

	FILTB	ADAP_SPED_CTL_filtb(
		    			.FI(fi_w),
		   			.DML(dml_w),
		    			.DMLP(dmlp_w)
		  			 );

	DELAY	#(
		    .WIDTH(14)
		) ADAP_SPED_CTL_delay2 (
		     			.x(dmlp_w),
		    			.reset(reset),
		     			.y(dml_w),
		     			.clk(clk),
		   			.scan_enable(scan_enable)
		   );

	SUBTC	ADAP_SPED_CTL_subtc(
		     			.DMSP(dmsp_w),
		     			.DMLP(dmlp_w),
		     			.TDP(TDP),
		    			.Y(Y),
		     			.AX(ax_w)
		   );

	FILTC	ADAP_SPED_CTL_filtc(
		     			.AX(ax_w),
		     			.AP(ap_w),
		     			.APP(app_w)
		  		     );

	TRIGA	ADAP_SPED_CTL_triga(
		     		     .TR(TR),
		     		     .APP(app_w),
		    		     .APR(apr_w)
		  		   );

	DELAY	#(
		    .WIDTH(10)
		) ADAP_SPED_CTL_delay3 (
		    			.x(apr_w),
		   			.reset(reset),
		   			.y(ap_w),
		  			.clk(clk),
		  			.scan_enable(scan_enable)
		     		       );

	LIMA	ADAP_SPED_CTL_lima(
		   		    .AP(ap_w),
		   		    .AL(AL)
		                   );

	//defparam u8.WIDTH  = 12;
	//defparam u10.WIDTH = 14;
	//defparam u6.WIDTH  = 10;

endmodule // end of ADPT_SPED_CTL
