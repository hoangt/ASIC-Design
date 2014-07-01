
/* enc.v
*
* Module : Encoder
*
* Authors: Pratheep Joe Siluvai
* 
*
* Description:
*
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		pi4810		04/07/2014	Module Created.
* 1.10		pi4810		04/07/2014	Corrected Errors
* 1.20		pi4810		04/14/2014	Added CU RF and CLKGEN	
* 1.30		pi4810		04/18/2014	Updated signals
* */

// Module Declaration
module enc (
	enc_s,				// PCM input word
	reset,				// reset signal
	rate,				// RATE varable
	clk,				// Sys clk
	law,				// Law variable
	enc_i,				// ADPCM output
	enc_s_clk,				// channel clk for DEC
	enc_s_fs,			// Channel Sync for DEC
	enc_i_clk,
	enc_i_fs,
	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4,
    	scan_enable,
    	test_mode,
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4
	);

///////////////////////////////////////////
// Inputs 
//

input	[7:0]	enc_s;
input		reset, law;
input	[1:0]	rate;
input		enc_s_clk,enc_s_fs, clk;

input		scan_in0,
		scan_in1,
		scan_in2,
		scan_in3,
		scan_in4,
    		scan_enable,
    		test_mode;

///////////////////////////////////////////
// Outputs 
//

wire [7:0] enc_s_w;

output	[7:0]	enc_i;    // after RF replace I by data_out
output enc_i_clk, enc_i_fs;
output	
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire enc_clk_buffout,enc_fs_buffout;
//wire enc_i_clk, enc_i_fs;
wire    [4:0]   enc_i_w;
wire            dly_clk, sys_clk;       		// Strobe for DELAY block
wire	[13:0]	sl_w;					// Linear input signal
wire	[15:0]	d_w;					// Difference signal
wire	[15:0]	dq_w;					// Quantized difference signal
wire	[14:0]	se_w;					// Signal estimate
wire	[12:0]	y_w;					// Quantizer scale factor
wire	[18:0]	yl_w;					// Delayed slow quantizer scale factor
wire		td_w;					// Tone detect
wire		tr_w;					// Transition detect
wire	[6:0]	al_w;					// Speed control parameter
wire	[15:0]	a2p_w;
wire 		fa_done;
wire	 [2:0] 	wr_add;
wire 	 [2:0]	rd_add;
wire 		wr_clk;
wire		rd_clk;
wire 		FA_start;	
///////////////////////////////////////////
// YOUR LOGIC ( Use this header, as seen above )
//

	IN_REG	iIn_reg(
			.data_in(enc_s),
			.load(inv_ch_clk_in),
			.reset(reset),
			.data_out(enc_s_w),
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

 	IN_PCM enc_in_pcm(
		.S(enc_s_w), 
		.SE(se_w),
		.LAW(law),
		.D(d_w)
	);
	ADAP_QUAN iadap_quan(
		 	     .RATE(rate),
		   	     .D(d_w),
		   	     .Y(y_w),
		    	     .I(enc_i_w)
		  	     );

	I_ADAP_QUAN iI_adap_quan (
		    		 .RATE(rate),
		     		 .I(enc_i_w),
		    		 .Y(y_w),
		    		 .D(dq_w)
		  		 );

	ADAP_PRED_REC_SIG iadap_pred_rec(
		  			 .DQ(dq_w),
					 .RATE(rate),
					 .clk(sys_clk),
					 .reset(reset),
					 .TR(tr_w),
					 .SE(se_w),
				         .A2(a2p_w),
					 .dly_strb(dly_clk),
					 .start_trig(fa_start),
					 .done(fa_done),
					 .test_mode(test_mode),
	   				.scan_in0(),
 	   				.scan_in1(),
	   				.scan_in2(),
	   				.scan_in3(),
 	   				.scan_in4(),
	   				.scan_out0(),
	   				.scan_out1(),
	   				.scan_out2(),
	   				.scan_out3(),
 	   				.scan_out4(),
					.scan_enable()
		  			 );

	QUAN_SCAL_FAC_ADAP iQuan_Scal_fac(
		  			  .IC(enc_i_w),
		   			  .Y(y_w),
					  .YL(yl_w),
				      	  .reset(reset),
				          .RATE(rate),
					  .CLK(dly_clk),
					  .AL(al_w),
	   				.scan_in0(),
 	   				.scan_in1(),
	   				.scan_in2(),
	   				.scan_in3(),
 	   				.scan_in4(),
	   				.scan_out0(),
	   				.scan_out1(),
	   				.scan_out2(),
	   				.scan_out3(),
 	   				.scan_out4(),
					.scan_enable()
		 			  );

	ADAP_SPED_CTL	iadap_sped_ctl(
		    		       .I(enc_i_w),
		  		       .reset(reset),
		   		       .Y(y_w),
				       .TDP(td_w),
				       .TR(tr_w),
				       .AL(al_w),
				       .RATE(rate),
				       .CLK(dly_clk),
	   				.scan_in0(),
 	   				.scan_in1(),
	   				.scan_in2(),
	   				.scan_in3(),
 	   				.scan_in4(),
	   				.scan_out0(),
	   				.scan_out1(),
	   				.scan_out2(),
	   				.scan_out3(),
 	   				.scan_out4(),
					.scan_enable()
		  		      );

	TON_TRAN_DET	iton_tran_det(
		    		      	.A2P(a2p_w),
		   		      	.reset(reset),
		    		     	.TR(tr_w),
		    		      	.YL(yl_w),
		    		      	.DQ(dq_w),
		    		      	.TDP(td_w),
		   		  	.clk(dly_clk),
	   				.scan_in0(),
 	   				.scan_in1(),
	   				.scan_in2(),
	   				.scan_in3(),
 	   				.scan_in4(),
	   				.scan_out0(),
	   				.scan_out1(),
	   				.scan_out2(),
	   				.scan_out3(),
 	   				.scan_out4(),
					.scan_enable(),
					.test_mode(test_mode)
		   		     );
	CU		 ienc_CU(
				.reset(reset),  			//Global reset
	   			.FSYNC_IN(enc_fs_buffin), 		//Frame Sync- high at channel 0
	   			.FSYNC_OUT(enc_fs_buffout), 		//Frame Sync- high at channel 0
	  			.NOT_CH_CLK_IN(inv_ch_clk_in),	//Frame clock- next channel at rising edge
	   			.CH_CLK_OUT(enc_clk_buffout),		//Frame clock- next channel at rising edge
           			.clk(sys_clk),			//System clock- fed to FMULT_accum
           			.FA_start(fa_start),		//FMULT_ACCUM start trigger
	   			.FA_done(fa_done),		//output of FMULT_ACCUM
	   			.delay_strobe(dly_clk),		// Delay strobe by control unit to shift data through delay
   	   			.scan_enable(),
	   			.test_mode(test_mode),
	   			.scan_in0(),
 	   			.scan_in1(),
	   			.scan_in2(),
	   			.scan_in3(),
 	   			.scan_in4(),
	   			.scan_out0(),
	   			.scan_out1(),
	   			.scan_out2(),
	   			.scan_out3(),
 	   			.scan_out4(),
	   			.RF_WR_ADDR(wr_add),
	   			.RF_RD_ADDR(rd_add),
	  			.RF_WR(wr_clk),
	   			.RF_RD(rd_clk)
				);

	CLOCK_GEN	iclock_gen(
				.reset(reset),
				.clk(clk),				// System clk
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
				.scan_out4(),
				.sys_clk_buffered(sys_clk),		// System clk after buffer
				.f_sync_in(enc_s_fs),			// f_sync input
				.f_sync_in_buffered(enc_fs_buffin),		// buffered input f_sync
				.f_sync_out_buffered(enc_fs_buffout),		// buffered output f_sync (generated)
				.ch_clk_in(enc_s_clk),			// input channel clock
				.not_ch_clk_in_buffered(inv_ch_clk_in),		// buffered inverted channel clock
				.ch_clk_out_buffered(enc_clk_buffout),		// buffered output channel clock
				.test_mode(test_mode)
				);

assign enc_i_fs = enc_fs_buffout;
assign enc_i_clk = enc_clk_buffout;

	RF		irf(
			.data_in({3'b000,enc_i_w}),
			.data_out(enc_i),
			.re_addr(rd_add),
			.wr_addr(wr_add),
			.wr_clk(wr_clk),
			.re_clk(rd_clk),
			.reset(reset),
			.scan_enable(),
			.scan_in0(),
			.scan_in1(),
			.scan_in2(),
			.scan_in3(),
			.scan_in4(),
			.scan_out1(),
			.scan_out2(),
			.scan_out3(),
			.scan_out4()
			);

endmodule // end of enc
