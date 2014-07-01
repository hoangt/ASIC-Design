/* FMULT.v
*
* Module: FMULT
*
* Authors:
* Matthew Pendel
*
* Description:
* Multiply predictor coefficients with corresponding
* quantized difference signal or reconstructed signal.
* Multiplication is done in floating point format.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		All		02/23/2014	Module Created.
*
*/

// Module Declaration
module FMULT (
	I16_TC,
	I11_FL,
	O16_TC
);

///////////////////////////////////////////
// Inputs 
//
input [15:0]  I16_TC;		// Operand 1. 2's compliment 16 bit number
				// Possible inputs: An, Bn
input [10:0]  I11_FL;		// Operand 2. Floating point 11 bit number
				// Possible inputs: SRn, DQn

///////////////////////////////////////////
// Outputs 
//
output [15:0] O16_TC;		// Result=(I16_TC*I11_FL)
			// 2's compliment 16 bit number
			// Possible outputs

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire	      w_s_itc;	    // operand 1: sign
reg   [13:0]  w14_mag_itc;  // operand 1: magnitude
reg   [3:0]   w4_exp_itc;   // operand 1: exponent
wire  [5:0]   w6_mant_itc;  // operand 1: mantissa

wire	      w_s_ifl;	    // operand 2: sign
wire  [3:0]   w4_exp_ifl;   // operand 2: exponent
wire  [5:0]   w6_mant_ifl;  // operand 2: mantissa

wire	      w_s_otc;	    // result: sign
wire  [4:0]   w5_exp_otc;   // result: exponent
wire  [11:0]  w12_mantm_otc; // intermediate mantissa result 
wire  [11:0]  w12_manta_otc; // intermediate mantissa result
wire  [7:0]   w8_mant_otc;  // result: mantissa
reg   [15:0]  w16_mag_otc;  // result: magnitude

///////////////////////////////////////////
// SRn or DQn: FL Representation
//
assign w_s_ifl	   = I11_FL[10];    // sign bit
assign w4_exp_ifl  = I11_FL[9:6];   // exponent
assign w6_mant_ifl = I11_FL[5:0];   // mantissa

///////////////////////////////////////////
// An or Bn: TC to SM conversion
//
assign w_s_itc = I16_TC[15];  // sign bit
always @(I16_TC or w_s_itc) begin	      // calculate magnitude
  if (w_s_itc == 0)
    w14_mag_itc <= I16_TC[15:2];
  else
    w14_mag_itc <= 16'h4000 - {2'b00, I16_TC[15:2]};
end

///////////////////////////////////////////
// An or Bn: SM to FL conversion
//
// sign bit is the same, from above
always @(w14_mag_itc) begin // calculate exponent
  if (w14_mag_itc[13] | w14_mag_itc[12]) 
   w4_exp_itc <= 4'd13;
  else if (w14_mag_itc[11]) 
    w4_exp_itc <= 4'd12;
  else if (w14_mag_itc[10])
    w4_exp_itc <= 4'd11;
  else if (w14_mag_itc[9])
    w4_exp_itc <= 4'd10;
  else if (w14_mag_itc[8])
    w4_exp_itc <= 4'd9;
  else if (w14_mag_itc[7])
    w4_exp_itc <= 4'd8;
  else if (w14_mag_itc[6])
    w4_exp_itc <= 4'd7;
  else if (w14_mag_itc[5])
    w4_exp_itc <= 4'd6;
  else if (w14_mag_itc[4])
    w4_exp_itc <= 4'd5;
  else if (w14_mag_itc[3])
    w4_exp_itc <= 4'd4;
  else if (w14_mag_itc[2])
    w4_exp_itc <= 4'd3;
  else if (w14_mag_itc[1])
    w4_exp_itc <= 4'd2;
  else if (w14_mag_itc[0])
    w4_exp_itc <= 4'd1;
  else
    w4_exp_itc <= 4'd0;
end
assign w6_mant_itc =  (w14_mag_itc == 14'd0) ? // calculate mantissa
		      6'h20 :
		      {w14_mag_itc,6'd0} >> w4_exp_itc;

///////////////////////////////////////////
// Perform FL multiplication
//
assign w5_exp_otc 	= w4_exp_itc + w4_exp_ifl;  	// calculate exponent
assign w12_mantm_otc 	= (w6_mant_itc * w6_mant_ifl);	// step1: multiply
assign w12_manta_otc	= (w12_mantm_otc + 12'd48);	// step2: add #48
assign w8_mant_otc	= w12_manta_otc[11:4];		// step3: divide by 16

///////////////////////////////////////////
// Result: FL to SM conversion
//
assign w_s_otc 		= w_s_itc ^ w_s_ifl;	      	// sign bit
always @(w8_mant_otc or w5_exp_otc) begin			// calculate magnitude
  if (w5_exp_otc <= 5'd26)
    w16_mag_otc <= {1'b0,w8_mant_otc,7'd0} >> (5'd26-w5_exp_otc);
  else
    w16_mag_otc <= {1'b0,w8_mant_otc,7'd0} << (w5_exp_otc-5'd26);
end

///////////////////////////////////////////
// Result: SM to TC conversion
//
assign O16_TC = w_s_otc ? (17'h10000 - w16_mag_otc) : w16_mag_otc;

endmodule // end of FMULT
