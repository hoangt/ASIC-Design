/* FMULT_ACCUM.v
*
* Module: FMULT_ACCUM
*
* Authors:
* Matthew Pendel
*
* Description:
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		All		03/18/2014	Module Created.
* 1.10          mgp6782         04/11/2014      Changed reset to active high.
* 1.20          mgp6782         04/11/2014      Added DONE output signal for 
*                                               handshaking with the CU.
* 1.21		rph6644		04/16/2014	Added comma to DFT scan chain
*/

// Module Declaration
module FMULT_ACCUM (
  clk,
  reset,
  start_trig,
  B1,
  B2,
  B3,
  B4,
  B5,
  B6,
  DQ1,
  DQ2,
  DQ3,
  DQ4,
  DQ5,
  DQ6,
  A1,
  A2,
  SR1,
  SR2,
  SE,
  SEZ,
  DONE,
  scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4, test_mode, scan_enable //DFT scan chain
);

///////////////////////////////////////////
// Inputs 
//
input	[15:0]	  
		  A1,
		  A2,
		  B1,
		  B2,
		  B3,
		  B4,
		  B5,
		  B6;
input	[10:0]
		  DQ1,
		  DQ2,
		  DQ3,
		  DQ4,
		  DQ5,
		  DQ6,
		  SR1,
		  SR2;
input		  
		  clk,
		  reset,
		  start_trig;

input	scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, test_mode, scan_enable; //DFT scan chain

///////////////////////////////////////////
// Outputs 
//
output	[14:0]	  
		  SE,
		  SEZ;
output reg
                  DONE;
output	scan_out0, scan_out1, scan_out2, scan_out3, scan_out4; //dft scan chain

///////////////////////////////////////////
// States 
//
`define IDLE 0
`define COEFF1 1
`define COEFF2 2
`define COEFF3 3 
`define COEFF4 4
`define COEFF5 5
`define COEFF6 6
`define COEFF7 7
`define COEFF8 8

///////////////////////////////////////////
// Wires and Regs 
//
reg   [15:0]	  
		  r16_fmultA,
		  r16_accum,
		  r16_sei,
		  r16_sezi;
reg   [3:0]	  r4_state;
reg   [10:0]	  r11_fmultB;
wire  [15:0]	  w16_add,
		  w16_fmultO;

///////////////////////////////////////////
// Module Instantiations 
//
FMULT i_fmult (
    .I16_TC   (r16_fmultA),
    .I11_FL   (r11_fmultB),
    .O16_TC   (w16_fmultO)
);

///////////////////////////////////////////
// Assignments 
//
assign SE = r16_sei[15:1];
assign SEZ = r16_sezi[15:1];
assign w16_add = r16_accum + w16_fmultO;

///////////////////////////////////////////
// ACCUM FSM 
//
// FSM State Transistion + Registers
always @(posedge clk or posedge reset) begin
  if (reset == 1'b1) begin
      r16_accum <= 16'd0;
      r16_sei	<= 16'd0;
      r16_sezi	<= 16'd0;
      r4_state	<= 4'd0;
  end else begin
    case (r4_state)
      `IDLE: begin
	r16_accum  <= 16'd0;
	if (start_trig == 1'b1)
	  r4_state  <= r4_state + 1;
	else
	  r4_state  <= r4_state;
      end
      `COEFF1: begin
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF2: begin
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF3: begin
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF4: begin
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF5: begin
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF6: begin
	r16_sezi  <= w16_add;
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF7: begin
	r16_accum <= w16_add;
	r4_state  <= r4_state + 1;
      end
      `COEFF8: begin
	r16_sei	  <= w16_add;
	r16_accum <= w16_add;
	r4_state  <= 4'd0;
      end
      default:
	r4_state  <= 4'd0;
    endcase
  end
end

// FSM MUXes and DONE ctrl signal
always @(r4_state or B1 or B2 or B3 or B4 or B5 or
	B6 or A1 or A2 or DQ1 or DQ2 or DQ3 or
	DQ4 or DQ5 or DQ6 or SR1 or SR2) begin
  DONE = 1'b0;
  case(r4_state) 
    `COEFF1: begin  
      r16_fmultA  = B1;
      r11_fmultB  = DQ1;    
    end
    `COEFF2: begin
      r16_fmultA  = B2;
      r11_fmultB  = DQ2;    
    end
    `COEFF3: begin
      r16_fmultA  = B3;
      r11_fmultB  = DQ3;    
    end
    `COEFF4: begin
      r16_fmultA  = B4;
      r11_fmultB  = DQ4;    
    end
    `COEFF5: begin
      r16_fmultA  = B5;
      r11_fmultB  = DQ5;    
    end
    `COEFF6: begin
      r16_fmultA  = B6;
      r11_fmultB  = DQ6;    
    end
    `COEFF7: begin
      r16_fmultA  = A1;
      r11_fmultB  = SR1;    
    end
    `COEFF8: begin
      r16_fmultA  = A2;
      r11_fmultB  = SR2;    
      DONE = 1'b1;
    end
    default: begin
      r16_fmultA  = 16'd0;
      r11_fmultB  = 11'd0;    
    end

  endcase
end

endmodule // end of ACCUM

