/* ACCUM_parr.v
*
* Module: ACCUM
*
* Authors:
* Matthew Pendel
*
* Description:Addition of predictor outputs to form the partial
* signal estimate (from the sixth order predictor) and the
* signal estimate.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		All		03/07/2014	Module Created.
*/

// Module Declaration
module ACCUM (
  clk,
  rstn,
  start_trig,
  WA1,
  WA2,
  WB1,
  WB2,
  WB3,
  WB4,
  WB5,
  WB6,
  SE,
  SEZ	
);

///////////////////////////////////////////
// Inputs 
//
input	[15:0]	  
		  WA1,
		  WA2,
		  WB1,
		  WB2,
		  WB3,
		  WB4,
		  WB5,
		  WB6;
input		  
		  clk,
		  rstn,
		  start_trig;

///////////////////////////////////////////
// Outputs 
//
output	[14:0]	  
		  SE,
		  SEZ;

///////////////////////////////////////////
// Wires and Regs 
//
reg   [15:0]	  
		  r16_accum,
		  r16_sei,
		  r16_sezi;
reg   [2:0]	  r3_state;

reg   [15:0]	
		  r16_opa,
		  r16_opb;
wire  [15:0]	  w16_add;

///////////////////////////////////////////
// Assignments 
//
assign SE = r16_sei[15:1];
assign SEZ = r16_sezi[15:1];
assign w16_add = r16_opa + r16_opb;

///////////////////////////////////////////
// ACCUM FSM 
//
always @(posedge clk or negedge rstn) begin
  if (rstn == 1'b0) begin
      r16_accum <= 16'd0;
      r16_sei	<= 16'd0;
      r16_sezi	<= 16'd0;
      r3_state	<= 3'd0;
  end else begin
/*    case (r3_state)
      3'd0: begin
	r16_accum <= WB1 + WB2;
	if (start_trig == 1'b1)
	  r3_state  <= r3_state + 1;
	else
	  r3_state  <= r3_state;
      end
      3'd1: begin
	r16_accum <= r16_accum + WB3;
	r3_state  <= r3_state + 1;
      end
      3'd2: begin
	r16_accum <= r16_accum + WB4;
	r3_state  <= r3_state + 1;
      end
      3'd3: begin
	r16_accum <= r16_accum + WB5;
	r3_state  <= r3_state + 1;
      end
      3'd4: begin
	r16_accum <= r16_accum + WB6;
	r3_state  <= r3_state + 1;
      end
      3'd5: begin
	r16_accum <= r16_accum + WA1;
	r16_sezi  <= r16_accum;
	r3_state  <= r3_state + 1;
      end
      3'd6: begin
	r16_accum <= r16_accum + WA2;
	r3_state  <= r3_state + 1;
      end
      3'd7: begin
	r16_accum <= 16'd0;
	r16_sei	  <= r16_accum;
	r3_state  <= 2'd0;
      end
    endcase
*/  
    r16_accum <= w16_add;
    case (r3_state)
      3'd0: begin
	r16_opa	  <= WB1;
	r16_opb	  <= WB2;
	if (start_trig == 1'b1)
	  r3_state  <= r3_state + 1;
	else
	  r3_state  <= r3_state;
      end
      3'd1: begin
	r16_opa	  <= r16_accum;
	r16_opb	  <= WB3;
	r3_state  <= r3_state + 1;
      end
      3'd2: begin
	r16_opa	  <= r16_accum;
	r16_opb	  <= WB4;
	r3_state  <= r3_state + 1;
      end
      3'd3: begin
	r16_opa	  <= r16_accum;
	r16_opb	  <= WB5;
	r3_state  <= r3_state + 1;
      end
      3'd4: begin
	r16_opa	  <= r16_accum;
	r16_opb	  <= WB6;
	r16_sezi  <= w16_add;
	r3_state  <= r3_state + 1;
      end
      3'd5: begin
	r16_opa	  <= r16_accum;
	r16_opb	  <= WA1;
	r3_state  <= r3_state + 1;
      end
      3'd6: begin
	r16_opa	  <= r16_accum;
	r16_opb	  <= WA2;
	r16_sei	  <= w16_add;
	r3_state  <= r3_state + 1;
      end
      3'd7: begin

	r3_state  <= 2'd0;
      end
    endcase
  end
end

endmodule // end of ACCUM
