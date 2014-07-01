/* 
*
* Module: CLOCK_GEN.v
*
* Authors:
* author1:AISHWARYA
* author2
* author3...
*
* Description:
* This code acts like a PLL which generates the clocks for the register file
* , channel and the other modules that require clock for synchronization 
* Revision History:
* =======================================================================================
* _Rev #_	_Author(s)_	_Date_		_Changes_
* ---------------------------------------------------------------------------------------
* 1.00		Aishwarya	04/16/2014	Module Created.
* 1.20 		Niraj V		04/20/2014	Edited module.
*
*========================================================================================
*
*/


module CLOCK_GEN ( clk,			// input - System Clock input
		   reset,		// input - RESET signal		
		   test_mode, 		// input - Test Mode input for the multiplexer 
		   enc_s_fs,		// input - Frame sync input for the encoder - not acted upon in mcac
		   enc_s_clk,           // Input channel clock - not acted upon in mcac
		   chn_cnt,		// Count for the channel
		   clk_buff_out,	// o/p - Buffered system clock
		   enc_i_clk,		// o/p - Regenerated Channel clock
		   enc_i_fs,		// o/p - Regenrated Frame Sync
		   enc_s_fs_buff_out,	// o/p - Buffered enc_s_fs, no change, no use
		   enc_s_clk_buff_out,	// o/p - Same for enc_s_clk
		   enc_s_clk_b,		// o/p - enc_s_clk inverted, buffered
                   scan_enable,
                   scan_in0,
                   scan_in1,
                   scan_in2,
                   scan_in3,
                   scan_in4,
                   scan_out0,
                   scan_out1,
                   scan_out2,
                   scan_out3,
                   scan_out4
		 );

parameter NUM_CLK = 8 ;

/*********** Input ******************/

input reset,clk, test_mode,enc_s_fs, enc_s_clk ;
input [2:0] chn_cnt;
input
                   scan_enable,
                   scan_in0,
                   scan_in1,
                   scan_in2,
                   scan_in3,
                   scan_in4;

/************ Output ****************/

output clk_buff_out, enc_i_clk, enc_i_fs, enc_s_fs_buff_out, enc_s_clk_buff_out,enc_s_clk_b;
output	 
                   scan_out0,
                   scan_out1,
                   scan_out2,
                   scan_out3,
                   scan_out4;

/**************** Local Variable ***********/

reg [10:0]  clk_cnt;
reg chn_clk_mux;
reg chn_clk, fs_clk;
wire fs_clk_mux;
reg sys_clk, chn_clk_buff_in, fs_clk_buff_in, enc_s_fs_buff_in, enc_s_clk_buff_in;

always @(posedge clk or posedge reset)

	begin
		if(reset)
			begin
				
				chn_clk  <= 0;
				clk_cnt <= 11'h000;
		
			end
		else
			begin
				if(clk_cnt == (NUM_CLK/2))  // if count is met
					begin
						chn_clk <= ~chn_clk;
					        clk_cnt <= 11'd0;
					end
				else  // otherwise, remain the same and count
					begin
						chn_clk <= chn_clk;
						clk_cnt <= clk_cnt + 1; 
					end	
			end	
	end
 /******************* Frame synchronization *****************/
 always @(posedge clk or posedge reset)
 	begin
          if (reset)
            fs_clk <= 1'b0;
          else
 		if (chn_cnt == 3'b000)
			fs_clk <= 1'b1;
		else
			fs_clk <= 1'b0; 
 	end
 /****************** Multiplexer Block *************/

 assign  ch_clk_mux = test_mode ? clk: chn_clk;
 assign  fs_clk_mux = test_mode ? clk : fs_clk;


/******************* Clock Buffer *******************/

CLKBUFX20 system_clk(.A(clk),.Y(clk_buff_out));			// System Clock
CLKBUFX20 CH_CLK(.A(ch_clk_mux),.Y(enc_i_clk));			// Regenerated channel clock

CLKBUFX20 FRM_SYNC(.A(fs_clk_mux),.Y(enc_i_fs));		// Regenerated frame Sync
CLKBUFX20 ENC_FS(.A(enc_s_fs),.Y(enc_s_fs_buff_out));		// Input frame sync
CLKBUFX20 ENC_CLK(.A(enc_s_clk),.Y(enc_s_clk_buff_out));		// Input channel clk
CLKINVX20 ENC_CLK_INV(.A(enc_s_clk),.Y(enc_s_clk_b));		// Input channel clk




 
 endmodule // CLOCK_GEN
