/* CU.v
*
* Module: CU
*
* Authors:
* Matthew Pendel
*
* Description:
* Generic control unit for PCM-ADPCM encoder/decoder units.
* Note: functionality is consistant when s_* signals are 
* replaced with i_* signals. In other words, CU works for both
* encoder and decoder, given proper parameter definitions.
* 
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Matt Pendel	03/31/2014	Module Created.
* 1.10          Matt Pendel     04/11/2014      Enhanced to keep track of the
*                                               current channel, and raise and error 
*                                               bit when loss of synchronization is
*                                               detected. These two are added
*                                               as outputs. Also changed wait
*                                               counts from `defines to params.
*
*/

// Module Declaration
module CU (
	s_fs,     // frame sync - high at channel 0
	s_clk,    // frame clock - next channel at rising edge
	clk,      // system clock - timing for FMULT_ACCUM
	reset,        // global reset - active high
        FA_DONE,  // FMULT_ACCUM done - handshaking signal to signify SE is ready
	DLY_STRB, // delay strobe - shifts data through DELAY
	FA_TRIG,  // FMULT_ACCUM start trigger - kicks off FA FSM
        CHANNEL_CNT,  // channel count - keep track of which channel selected
        ERROR,     // error - high when a loss of synchronization is detected
        RD_CLK,   // read clock - RF read strobe
        RD_ADDR,  // read addres - for RF
        WR_CLK,   // write clock - RF write strobe
        WR_ADDR,  // write address - for RF
	scan_enable,
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
	scan_out4
);

///////////////////////////////////////////
// Defines 
//
  // delays represented as # of sysclks
parameter CNT_PRE_FA = 3;
parameter CNT_POST_FA = 3;
  // states -- one hot?
`define W8_INP_VALD   7'd1
`define W8_FA_VALD    7'd2
`define START_FA      7'd4
`define W8_FA_DONE    7'd8
`define W8_OUTP_VALD  7'd16
`define WR_RF         7'd32
`define NEXT_CHAN     7'd64

///////////////////////////////////////////
// Inputs 
//
input
	s_fs,	    // frame sync - high at channel 0
	s_clk,	    // frame clock - next channel at rising edge
	clk,	    // system clock - timing for FMULT_ACCUM
	reset,	    // global reset - active high
	scan_enable,
	test_mode,
	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4,
        FA_DONE;    // FMULT_ACCUM done - handshaking signal to signify SE is ready

///////////////////////////////////////////
// Outputs 
//
output reg
        ERROR,      // error - high when a loss of synchronization is
                    // detected.
	FA_TRIG;    // FMULT_ACCUM start trigger - kicks off FA FSM

output reg [2:0]
        RD_ADDR,
        CHANNEL_CNT;  // channel count - signifies which channel (0-7) is
                      // currently being computed
output [2:0] 
        WR_ADDR;

output
	DLY_STRB,   // delay strobe - shifts data through DELAY
        WR_CLK,
        RD_CLK,
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire	  s_clk_fall;
wire	  s_clk_rise;
reg	  s_clk_, s_clk__;
reg	  rDLY_STRB;
reg       r_wr_clk;
reg	  clk_cnt_en;
reg [9:0] clk_cnt;
reg [6:0] state;
reg [2:0] channel_cnt_d1, channel_cnt_d2;
reg [2:0] rRD_ADDR;

wire WR_CLK_buff_in, RD_CLK_buff_in;
wire DLY_STRB_buff_in = test_mode ? clk : rDLY_STRB ;

///////////////////////////////////////////
// s_clk edge detectors
//
always @(posedge clk or posedge reset) begin
  if (reset) begin
    s_clk__    <= 1'b0;
    s_clk_     <= 1'b0;
  end else begin
    s_clk_     <= s_clk;
    s_clk__    <= s_clk_;
  end
end
assign s_clk_fall = s_clk__ & ~s_clk_;
assign s_clk_rise = ~s_clk__ & s_clk_;

////////////////////////////////////////////
// RF Control Signal Generation
// 
assign RD_CLK_buff_in   = test_mode ? clk : s_clk_rise;
//assign RD_ADDR  = CHANNEL_CNT;
//assign WR_CLK   = test_mode ? clk : s_clk_fall;
assign WR_CLK_buff_in   = test_mode ? clk : r_wr_clk;
assign WR_ADDR  = channel_cnt_d1;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    channel_cnt_d2 <= 1'b0;
    channel_cnt_d1 <= 1'b0;
    RD_ADDR <= 3'd0;
  end else begin
    // check these ifs... it might be a cycle behind.
    if (s_clk_rise) begin
      channel_cnt_d2 <= channel_cnt_d1;
      channel_cnt_d1 <= CHANNEL_CNT;
    end
    if (s_clk_fall) 
      RD_ADDR <= rRD_ADDR; 
  end
end
//////////////////////////////////////////
// Control Unit FSM State Transition
// 
always @(posedge clk or posedge reset) begin
  if (reset) begin
    state <= `W8_INP_VALD;
  end else begin
    case (state)
      `W8_INP_VALD: begin
	if (s_clk_fall) 
	  state <= `W8_FA_VALD;
	else
	  state <= `W8_INP_VALD;
      end

      `W8_FA_VALD: begin
	if (clk_cnt == CNT_PRE_FA)
	  state <= `START_FA;
	else
	  state <= `W8_FA_VALD;
      end

      `START_FA: begin
	state <= `W8_FA_DONE;
      end
      
      `W8_FA_DONE: begin
	if (FA_DONE == 1'b1)
          state <= `W8_OUTP_VALD;
        else
	  state <= `W8_FA_DONE;
      end

      `W8_OUTP_VALD: begin
	if (clk_cnt == CNT_POST_FA)
	  state <= `WR_RF;
	else
	  state <= `W8_OUTP_VALD;	
      end

      `WR_RF: begin
        state <= `NEXT_CHAN;
      end

      `NEXT_CHAN: begin
	state <= `W8_INP_VALD;
      end
      
      default:
	state <= `W8_INP_VALD;
    endcase
  end
end

///////////////////////////////////////////
// Control Unit FSM Outputs
// 
always @(state) begin
  case(state)
    `W8_FA_VALD: begin
      clk_cnt_en  <= 1'b1;
      FA_TRIG	  <= 1'b0;
      rDLY_STRB	  <= 1'b0;
      r_wr_clk    <= 1'b0;
    end

    `START_FA: begin
      clk_cnt_en  <= 1'b0;
      FA_TRIG	  <= 1'b1;
      rDLY_STRB	  <= 1'b0;
      r_wr_clk    <= 1'b0;
    end

    `W8_OUTP_VALD: begin
      clk_cnt_en  <= 1'b1;
      FA_TRIG	  <= 1'b0;
      rDLY_STRB	  <= 1'b0;
      r_wr_clk    <= 1'b0;
    end

    `NEXT_CHAN: begin
      clk_cnt_en  <= 1'b0;
      FA_TRIG	  <= 1'b0;
      rDLY_STRB	  <= 1'b1;
      r_wr_clk    <= 1'b0;
    end

    `WR_RF: begin
      clk_cnt_en  <= 1'b0;
      FA_TRIG	  <= 1'b0;
      rDLY_STRB	  <= 1'b0;
      r_wr_clk    <= 1'b1;
    end
    
    default: begin
      clk_cnt_en  <= 1'b0;
      FA_TRIG	  <= 1'b0;
      rDLY_STRB	  <= 1'b0;
      r_wr_clk    <= 1'b0;
    end
  endcase
end

///////////////////////////////////////////
// Clock counter
// 
always @(posedge clk or posedge reset) begin
  if (reset)
    clk_cnt <= 10'd0;
  else
    if (clk_cnt_en)
      clk_cnt <= clk_cnt + 10'd1;
    else
      clk_cnt <= 10'd0;
end

///////////////////////////////////////////
// Channel Counter / 
// Synchronization Loss Detector /
// RF Read Address
// 
always @(posedge clk or posedge reset) begin
  if (reset)
    begin
      CHANNEL_CNT <= 3'd0;
      ERROR <= 1'b0;
      rRD_ADDR <= 3'd1;
    end
  else if (s_clk_rise) begin
    if (s_fs) begin 
      CHANNEL_CNT <= 3'd0;
      rRD_ADDR <= 3'd1;
      if (CHANNEL_CNT < 3'd7)
        ERROR <= 1'b1;
      else
        ERROR <= 1'b0;
    end else begin
      CHANNEL_CNT <= CHANNEL_CNT + 3'd1;
      rRD_ADDR <= rRD_ADDR + 3'd1;
      if (CHANNEL_CNT == 3'd7)
        ERROR <= 1'b1;
      else 
        // should we hold error high until a
        // channel sync (s_fs) is detected?
        ERROR <= 1'b0;
    end
  end
end


////////////////// Clock Buffer ////////////
CLKBUFX20 delay_buf(.A(DLY_STRB_buff_in),.Y(DLY_STRB));
CLKBUFX20 RF_buf1(.A(WR_CLK_buff_in),.Y(WR_CLK));
CLKBUFX20 RF_buf2(.A(RD_CLK_buff_in),.Y(RD_CLK));

endmodule // end of CU

