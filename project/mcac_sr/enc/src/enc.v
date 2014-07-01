/* enc.v
*
* Module : Encoder
*
* Authors: Abdullah Zyarah
* 
*
* Description:
*
*
* Revision History:
* _Rev #_	_Author(enc_s)_	_Date_		_Changes_
* 1.00		Abdullah	03/31/2014	Module Created.
* 1.01          MGP             04/13/2014      Updated instantiations.
*                                               Changed wires to match spec.
* 1.02          MGP             04/15/2014      Again changed wire names.
*                                               Again updated instantiations.
* 
*/

// Module Declaration
module enc (
	enc_s,	    // PCM input word
	reset,      // active high reset signal
	RATE,	    // 16/24/32/40 Kb/enc_s				
	clk,        // system clock
	enc_s_clk,  // channel clock for PCM	
	enc_s_fs,   // channel sync for PCM	
	law,        // uLaw or aLaw
	enc_i,      // ADPCM output	
        enc_i_clk,  // output channel clock for ADPCM
        enc_i_fs,   // output channel sync for ADPCM
        enc_error,   // high when a loss of sync is detected
	scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_mode, scan_enable
);

///////////////////////////////////////////
// Inputs 
//

input	[7:0]	enc_s;
input		reset, law;
input	[1:0]	RATE;
input		enc_s_fs, enc_s_clk, clk;
input		scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, test_mode, scan_enable; //DFT scan chain


///////////////////////////////////////////
// Outputs 
//

output	[7:0]	enc_i;
output		enc_error;
output		enc_i_clk,
		enc_i_fs;
output	scan_out0, scan_out1, scan_out2, scan_out3, scan_out4; //DFT scan chain

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire    [4:0]   I;
wire	[15:0]	d_w;					// Difference signal
wire	[15:0]	dq_w;					// Quantized difference signal
wire	[14:0]	se_w;					// Signal estimate
wire	[12:0]	y_w;					// Quantizer scale factor
wire	[18:0]	yl_w;					// Delayed slow quantizer scale factor
wire		td_w;					// Tone detect
wire		tr_w;					// Transition detect
wire	[6:0]	al_w;					// Speed control parameter
wire	[15:0]	a2p_w;
wire	[7:0] 	in_pcm;
  // cu wires
wire            dly_strb;     				  // Strobe for DELAY block
wire	[2:0]	rd_addr; 
wire	[2:0]	wr_addr;
wire		rd_clk,
		wr_clk;
wire		error;
wire		fa_done_w;
  // clock_gen wires
wire		clk_buf;
wire	[2:0]	chn_cnt;
wire		enc_s_clk_buf;				// Buffered channel clock
wire		enc_s_clk_b;				// Inverted buffered channel clock
wire		enc_s_fs_buf;				// Buffered frame sync
wire            enc_i_fs_buf;
wire            enc_i_clk_buf;

assign enc_i_fs = enc_i_fs_buf;
assign enc_i_clk = enc_i_clk_buf;

///////////////////////////////////////////
//  Module Instantiations
//

        IN_PCM                  iin_pcm(
                                        .S    (in_pcm),
                                        .SE   (se_w),
                                        .LAW  (law),
                                        .D    (d_w)
                                      );
                                        

	ADAP_QUAN 		iadap_quan(
			   	       .RATE(RATE),
		           	       .D(d_w),
	 		   	       .Y(y_w),
			    	       .I(I)
		  	     				);

	I_ADAP_QUAN 		iI_adap_quan (
		    		       .RATE(RATE),
		     		       .I(I),
		    		       .Y(y_w),
		    		       .DQ(dq_w)
					  		 );

	ADAP_PRED_REC_SIG 	iadap_pred_rec(
		  			 .DQ(dq_w),
					 .RATE(RATE),
					 .clk(clk_buf),
					 .reset(reset),
					 .TR(tr_w),
					 .SE(se_w),
				         .A2P(a2p_w),
					 .FA_DONE(fa_done_w),
					 .SR(),
					 .dly_strb(dly_strb),
					 .start_trig(fa_trig),
					 .scan_enable(),
					 .test_mode(test_mode)
		  					 );

	QUAN_SCAL_FAC_ADAP iquan_Scal_fac(
		  			  .I(I),
		   			  .Y(y_w),
				      	  .reset(reset),
                                          .RATE(RATE),
					  .dly_strb(dly_strb),
					  .AL(al_w),
                                          .YL(yl_w),
					  .scan_enable(),
					  .test_mode(test_mode)
		 					  );

	ADAP_SPED_CTL	iadap_sped_ctl(
		    		       .I(I),
		  		       .reset(reset),
		   		       .Y(y_w),
				       .TDP(td_w),
				       .TR(tr_w),
				       .AL(al_w),
				       .RATE(RATE),
				       .clk(dly_strb),
				       .scan_enable(),
				       .test_mode(test_mode)
		  		    			  );

	TON_TRAN_DET	iton_tran_det(
		    		      .A2P(a2p_w),
		   		      .reset(reset),
		    		      .TR(tr_w),
		    		      .YL(yl_w),
		    		      .DQ(dq_w),
		    		      .TDP(td_w),
		   		      .clk(dly_strb),
				      .scan_enable(),
				      .test_mode(test_mode)
		   		    			 );

	CU	        # (
                                      .CNT_PRE_FA(125),
                                      .CNT_POST_FA(450)
                        ) ienc_CU (
				      .FA_DONE(fa_done_w),
			              .s_fs(enc_s_fs_buf),
				      .s_clk(enc_s_clk_buf),
				      .clk(clk_buf),
				      .reset(reset),
				      .DLY_STRB(dly_strb),
				      .FA_TRIG(fa_trig),
                                      .CHANNEL_CNT(chn_cnt),
                                      .ERROR(enc_error),
                                      .RD_CLK(rd_clk),
                                      .RD_ADDR(rd_addr),
                                      .WR_CLK(wr_clk),
                                      .WR_ADDR(wr_addr),
				      .scan_enable(),
				      .test_mode(test_mode)
							);

	RF		ienc_rf	(
				      .data_in({3'b000, I}),			
	              		      .re_addr(rd_addr),
				      .wr_addr(wr_addr),
				      .re_clk(rd_clk),
				      .wr_clk(wr_clk),
				      .reset(reset),
				      .data_out(enc_i),
				      .scan_enable()
							);

	CLOCK_GEN	#(
					.NUM_CLK(625)		
			)iclock_gen(  
				      .reset(reset),
				      .test_mode(test_mode),
				      .scan_enable(scan_enable),
				      .clk(clk),
                                      .clk_buff_out(clk_buf),
                                      .enc_s_clk(enc_s_clk),
				      .enc_s_clk_buff_out(enc_s_clk_buf),
				      .enc_s_clk_b(enc_s_clk_b),
                                      .enc_s_fs(enc_s_fs),
				      .enc_s_fs_buff_out(enc_s_fs_buf),
				      .chn_cnt(chn_cnt),
				      .enc_i_clk(enc_i_clk_buf),
                                      .enc_i_fs(enc_i_fs_buf)
	                              );
	IN_REG		ireg_inst(
				      .in(enc_s),
				      .clk(enc_s_clk_b),
                                      .reset(reset),
				      .out(in_pcm),
				      .scan_enable(),
				      .test_mode(test_mode)
			      				);

endmodule // end of enc

