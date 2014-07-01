/* dec.v
*
* Module : Decoder
*
* Authors: Sheenam Jayaswal 
*
* Description:
* 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		sj7728		04/06/2014	Module Created.
*
*/module dec (
	dec_s,				// PCM output word
	reset,				// reset signal
	rate,				// RATE varable
	clk,				// Sys clk
	law,				// Law variable
	dec_i,				// ADPCM output
	dec_s_clk,				// channel clk for DEC
	dec_s_fs,			// Channel Sync for DEC
	dec_i_clk,
	dec_i_fs, 
    	test_mode,
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
	scan_enable
	);

///////////////////////////////////////////
// Inputs 
//

output	[7:0]	dec_s;
input		reset, law, clk;
input	[1:0]	rate;
output		dec_s_clk,dec_s_fs;
wire 		dec_s_clk,dec_s_fs;
output		scan_out0,
		scan_out1,
		scan_out2,
		scan_out3,
		scan_out4;

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


input	[7:0]	dec_i;    // after RF replace I by data_out
input dec_i_clk, dec_i_fs;
///////////////////////////////////////////
// Wire and Register Instantiations
//

wire            dly_clk, sys_clk;       		// Strobe for DELAY block
wire	[15:0]	dq_w,sr_w;					// Quantized differdece signal
wire	[14:0]	se_w;					// Signal estimate
wire	[12:0]	y_w;					// Quantizer scale factor
wire	[18:0]	yl_w;					// Delayed slow quantizer scale factor
wire		td_w;					// Tone detect
wire		tr_w;					// Transition detect
wire	[6:0]	al_w;					// Speed control parameter
wire	[15:0]	a2p_w;

wire 		fa_done,
		dec_fs_buffin,
		inv_ch_clk_in;
wire [7:0] dec_s_w;
wire [2:0] rd_add,wr_add;
/////////////////////////////////
// Module instantiations

wire[7:0] I_reg;

	IN_REG	iIn_reg(
			.data_in(dec_i),
			.load(inv_ch_clk_in),
			.reset(reset),
			.data_out(I_reg),
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

I_ADAP_QUAN		top_dec_I_ADAP_QUAN 		(
		    					 .RATE(rate),
		     					 .I(I_reg[4:0]),
		    					 .Y(y_w),
		    					 .D(dq_w)
		  					 );
ADAP_PRED_REC_SIG	top_dec_ADAP_PRED_REC_SIG	(
		  			 		.DQ(dq_w),
						 	.RATE(rate),
							.clk(sys_clk),
							.reset(reset),
							.TR(tr_w),
							.SE(se_w),
				        		.A2(a2p_w),
							.SR(sr_w),
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
								
TON_TRAN_DET		top_dec_TON_TRAN_DET		(
		    		      			.A2P(a2p_w),
		   		      			.reset(reset),
		    		     			.TR(tr_w),
		    		      			.YL(yl_w),
		    		      			.DQ(dq_w),
		    		      			.TDP(td_w),
		   		  			.clk(dly_clk),
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
ADAP_SPED_CTL		top_dec_ADAP_SPED_CTL		(
							.I(I_reg[4:0]),
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

QUAN_SCAL_FAC_ADAP	top_dec_QUAN_SCAL_FAC_ADAP	(
							.IC(I_reg[4:0]),
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

OUT_PCM			top_dec_OUT_PCM			(.SR(sr_w),
							 .LAW(law),
							 .SE(se_w),
							 .RATE(rate),
							 .Y(y_w),
							 .I(I_reg[4:0]),
							 .SD(dec_s_w),
							.reset(reset),
							.clk(clk)
		
									);	

	CU		 idec_CU	(
				.reset(reset),  			//Global reset
	   			.FSYNC_IN(dec_fs_buffin), 		//Frame Sync- high at channel 0
	   			.FSYNC_OUT(dec_s_fs), 		//Frame Sync- high at channel 0
	  			.NOT_CH_CLK_IN(inv_ch_clk_in),	//Frame clock- next channel at rising edge
	   			.CH_CLK_OUT(dec_s_clk),		//Frame clock- next channel at rising edge
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

	CLOCK_GEN	dec_clock_gen (
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
				.f_sync_in(dec_i_fs),			// f_sync input
				.f_sync_in_buffered(dec_fs_buffin),		// buffered input f_sync
				.f_sync_out_buffered(dec_s_fs),		// buffered output f_sync (generated)
				.ch_clk_in(dec_i_clk),			// input channel clock
				.not_ch_clk_in_buffered(inv_ch_clk_in),		// buffered inverted channel clock
				.ch_clk_out_buffered(dec_s_clk),		// buffered output channel clock
				.test_mode(test_mode)
				);

	RF		dec_rf (
				.data_in(dec_s_w),
				.data_out(dec_s),
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

				.scan_out0(),
				.scan_out1(),
				.scan_out2(),
				.scan_out3(),
				.scan_out4()
			);

endmodule // dec
