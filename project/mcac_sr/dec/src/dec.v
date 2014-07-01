/* dec.v
*
* Module : top.decoder
*
* Authors: Niraj Vasudevan 
*
* Description:
* 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		nv1440		03/31/2014	Module Created.
* 1.01          mgp6782         04/06/2014      Fixed a few module instantiations.
*
*/

module dec (
	RATE,
	dec_i,
	dec_i_clk,
	dec_i_fs,
        reset,
	sysclk,
        dec_s,
	dec_error,
	dec_s_clk,
	dec_s_fs,
	LAW,
	scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_mode, scan_enable
);


///////////////////////////////////
// Inputs
				
input	[1:0]	RATE;		// Input for I_adap_quan,
input		LAW;		// Input for adap_pred_rec_sig, 
input	[7:0]	dec_i;		// Quantized ADPCM value 
input		sysclk,         // ?? MHz
                reset;          // active HIGH reset
input		scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, test_mode, scan_enable; //DFT scan chain
input		dec_i_fs,
		dec_i_clk;

///////////////////////////////////
// Outputs

output	[7:0]	dec_s;		//Decoder PCM output word
output		dec_error;	// error signal from CU
output		dec_s_clk,	//| regenerated clocks from
		dec_s_fs;	//| clock generator
		
output	scan_out0, scan_out1, scan_out2, scan_out3, scan_out4; //DFT scan chain

///////////////////////////////////
// Wires and registers

wire	TR_w;			// Transition detect - output of tone_det. Used in TRIGA/B in adap_pred	
wire	[4:0]	I;
wire	[7:0]	SD;
wire            dly_strb;       // Strobe for DELAY block
wire	[15:0]	dq_w;		// 16 bit signed magnitude quantized difference signal. output of i_adap_quan 
wire	[14:0]	SE_w;		//Signal estimate
wire	[15:0]	A2P_w;		//Delayed predictor second order coefficient
wire	[18:0]	yl_w;		//Delayed slow quantizer scale factor
wire	[12:0]	y_w;		//quantizer scale factor
wire		tdp_w;		//Tone detect
wire	[6:0]	al_w;		//Limited speed control parameter
wire	[15:0]	sr_w;		//Reconstructed signal
wire	[2:0]	chn_cnt;	//Channel count
wire		dec_buf_clk,	//| buffered outputs from -
		dec_i_fs_buf,	//| - clock generator
		dec_i_clk_buf,	//| i - input
		dec_i_clk_b;	//| s - output
				
wire		re_clk,		//| Clock and 		|
		wr_clk;		//| addressing 		|
wire	[2:0]	re_addr,	//| to 			|
		wr_addr;	//| register file	|

wire		fa_done_w;	//fa done signal

	/////////////////////////////////
// Module instantiations

I_ADAP_QUAN		top_dec_I_ADAP_QUAN 		(.RATE(RATE),
						  	 .I (I),
							 .Y (y_w),
							 .DQ(dq_w)
									);

ADAP_PRED_REC_SIG	top_dec_ADAP_PRED_REC_SIG	(.DQ(dq_w),
							 .clk(dec_buf_clk),
                                                         .dly_strb(dly_strb),
                                                         .start_trig(fa_trig),
                                                         .RATE(RATE),
							 .FA_DONE(fa_done_w),
							 .reset(reset),
							 .TR(TR_w),
							 .SE(SE_w),
							 .A2P(A2P_w),
                                                         .SR(sr_w),
							 .scan_enable()
									);
TON_TRAN_DET		top_dec_TON_TRAN_DET		(.A2P(A2P_w),
							 .TR(TR_w),
							 .reset(reset),
							 .YL(yl_w),
							 .DQ(dq_w),
							 .TDP(tdp_w),
							 .clk(dly_strb)
									);
ADAP_SPED_CTL		top_dec_ADAP_SPED_CTL		(.I(I),
							 .reset(reset),
							 .Y(y_w),
							 .TDP(tdp_w),
							 .TR(TR_w),
							 .AL(al_w),
							 .RATE(RATE),
							 .clk(dly_strb)
									);
QUAN_SCAL_FAC_ADAP	top_dec_QUAN_SCAL_FAC_ADAP	(.I(I),
							 .Y(y_w),
							 .reset(reset),
							 .RATE(RATE),
							 .AL(al_w),
							 .YL(yl_w),
                                                         .dly_strb(dly_strb)
									);
OUT_PCM			top_dec_OUT_PCM			(.SR(sr_w),
							 .LAW(LAW),
							 .SE(SE_w),
							 .RATE(RATE),
							 .Y(y_w),
							 .I(I),
							 .SD(SD)		
									);	

CU	      		# (
                                   			.CNT_PRE_FA(125),
			                                .CNT_POST_FA(450)
                        ) top_enc_CU (
						        .s_fs(dec_i_fs_buf),
		              			        .s_clk(dec_i_clk_buf),
				      			.clk(dec_buf_clk),
							.reset(reset),
							.FA_DONE(fa_done_w),
				      			.DLY_STRB(dly_strb),
				      			.FA_TRIG(fa_trig),
                                      			.CHANNEL_CNT(chn_cnt),
                                      			.ERROR(dec_error),
							.RD_CLK(re_clk),
							.RD_ADDR(re_addr),
							.WR_CLK(wr_clk),
							.WR_ADDR(wr_addr),
				      			.scan_enable(),
				      			.test_mode(test_mode)
							);
CLOCK_GEN		#(
							.NUM_CLK(625)	
			)top_clock_gen(  
						         
							.reset(reset),
				      			.clk(sysclk),
				      			.enc_s_fs(dec_i_fs),
							.enc_s_clk(dec_i_clk),
						   	.chn_cnt(chn_cnt),
				      			.clk_buff_out(dec_buf_clk),
							.enc_i_clk(dec_s_clk),
							.enc_i_fs(dec_s_fs),
							.enc_s_fs_buff_out(dec_i_fs_buf),
							.enc_s_clk_buff_out(dec_i_clk_buf),
							.enc_s_clk_b(dec_i_clk_b),
							.test_mode(test_mode),
							.scan_enable()
						      	);

RF			top_dec_RF(			.data_in(SD),			//input data to the register file
	              		      			.re_addr(re_addr),
				   			.wr_addr(wr_addr),
				      			.re_clk(re_clk),
				      			.wr_clk(wr_clk),
				      			.data_out(dec_s),
				      			.scan_enable(),
                                                        .reset(reset)                                      			
							);
							 	

IN_REG			top_reg_inst(
						        .in(dec_i),
						        .clk(dec_i_clk_b), 
                                      			.reset(reset),
				      			.out(I),
				      			.scan_enable()
			      				);




endmodule // dec
