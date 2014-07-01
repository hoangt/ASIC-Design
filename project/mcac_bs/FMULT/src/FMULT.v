/* FMULT.v
*
* Module: FMULT_BS
*
* Authors:
* Dave Herdzik
*
* Description:
* Multiply predictor coefficients with corresponding
* quantized difference signal or reconstructed signal.
* Multiplication is done in floating point format.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		drh4327		03/21/2014	Added Additional control
* signals and changed names to match datasheet
*
*/

// Module Declaration
module FMULT (
	clk,
	reset,
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
	scan_out4,
	An,
	SRn,
	WAn,
	//CONTROL
	SHIFT_EXP,
	SHIFT_MANT,
	INIT_SR,
	LD_OUT_SR
);

///////////////////////////////////////////
// Inputs 
//
input		clk;
input		reset;
input		scan_enable;
input		scan_in0, scan_in1, scan_in2, scan_in3, scan_in4;
output		scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
input [15:0]  	An;		// Operand 1. 2's compliment 16 bit number					 // Possible inputs: An, Bn
input [10:0]  	SRn;		// Operand 2. Floating point 11 bit number
				// Possible inputs: SRn, DQn
input wire 		SHIFT_EXP;
input wire		SHIFT_MANT;
input wire		INIT_SR;
input wire		LD_OUT_SR;

///////////////////////////////////////////
// Outputs 
//
output [15:0] WAn;	// Result=(An*SRn)
			// 2's compliment 16 bit number
			// Possible outputs

///////////////////////////////////////////
// Wire and Register Instantiations
//

wire	      AnS;	    // operand 1: sign
reg	      AnS_reg;	    // operand 1: signi


reg   [13:0]  AnMAG;  // operand 1: magnitude
reg   [3:0]   AnEXP;   // operand 1: exponent
reg   [3:0]   AnEXP_reg;   // operand 1: exponent
wire  [5:0]   AnMANT;  // operand 1: mantissa
reg   [5:0]   AnMANT_reg;  // operand 1: mantissa

wire	      SRnS;	    // operand 2: sign
reg	      SRnS_reg;	    // operand 2: sign
wire  [3:0]   SRnEXP;   // operand 2: exponent
reg  [3:0]   SRnEXP_reg;   // operand 2: exponent
wire  [5:0]   SRnMANT;  // operand 2: mantissa
reg  [5:0]   SRnMANT_reg;  // operand 2: mantissa
wire [5:0]   SRnMANT_AND;

reg   	      EXP_CARRY;
wire  [1:0]   EXP_SUM;
wire  [1:0]   EXP_SUM1;
wire	      WAnS;	    // result: sign
//wire  [4:0]   WAnEXP;   // result: exponent
reg   [4:0]   WAnEXP_reg;
reg   [12:0]  WAnMANT_rege;
wire   [11:0]  WAnMANT_reg;
wire  [7:0]  WAnMANT1; // intermediate mantissa result
wire  [7:0]   WAnMANT;  // result: mantissa
reg   [15:0]  WAnMAG;  // result: magnitude
reg   [15:0]  WAn_reg;
wire   [15:0]  WAn_prereg;
///////////////////////////////////////////
// SRn or DQn: FL Representation
//i
assign SRnS    = SRn[10];
assign SRnEXP  = SRn[9:6];   // exponent
assign SRnMANT = SRn[5:0];   // mantissa

///////////////////////////////////////////
// An or Bn: TC to SM conversion
//
assign AnS = An[15];
always @(An,AnS) begin	      // calculate magnitude
  if (AnS == 0)
    AnMAG <= An[15:2];
  else
    AnMAG <= (16'h4000 -{2'b00, An[15:2]});
end

///////////////////////////////////////////
// An or Bn: SM to FL conversion
//
// sign bit is the same, from above
always @(AnMAG) begin // calculate exponent
  if (AnMAG[13] | AnMAG[12]) 
   AnEXP <= 4'd13;
  else if (AnMAG[11]) 
    AnEXP <= 4'd12;
  else if (AnMAG[10])
    AnEXP <= 4'd11;
  else if (AnMAG[9])
    AnEXP <= 4'd10;
  else if (AnMAG[8])
    AnEXP <= 4'd9;
  else if (AnMAG[7])
    AnEXP <= 4'd8;
  else if (AnMAG[6])
    AnEXP <= 4'd7;
  else if (AnMAG[5])
    AnEXP <= 4'd6;
  else if (AnMAG[4])
    AnEXP <= 4'd5;
  else if (AnMAG[3])
    AnEXP <= 4'd4;
  else if (AnMAG[2])
    AnEXP <= 4'd3;
  else if (AnMAG[1])
    AnEXP <= 4'd2;
  else if (AnMAG[0])
    AnEXP <= 4'd1;
  else
    AnEXP <= 4'd0;
end
assign AnMANT =  (AnMAG == 14'd0) ? // calculate mantissa
		      6'h20 :
		      {AnMAG,6'd0} >> AnEXP;
////////////////////////////////////////////////
//Load Shift Registers/////
///////////////////////////
//
assign EXP_SUM1={1'b0,SRnEXP_reg[0]}+{1'b0,AnEXP_reg[0]};		
assign EXP_SUM=EXP_SUM1+{1'b0,EXP_CARRY};		
always @(posedge SHIFT_EXP or posedge reset)//,posedge INIT_SR)//,AnEXP,SRnEXP,AnS,SRnS)//, AnEXP, SRnEXP,AnS,SRnS,AnEXP_reg,SRnEXP_reg, WAnEXP_reg,EXP_SUM) begin
begin
	if (reset)
	begin
		AnEXP_reg<=4'd0;
		SRnEXP_reg<=4'd0;
		WAnEXP_reg<=5'd0;
		EXP_CARRY<=1'b0;
	end
	else
	begin
		if (INIT_SR)
		begin
			AnEXP_reg<=AnEXP;
			SRnEXP_reg<=SRnEXP;
			WAnEXP_reg<=5'd0;
			EXP_CARRY<=1'b0;
		end else
		begin
			AnEXP_reg[2:0]<=AnEXP_reg[3:1];
			AnEXP_reg[3]<=1'b0;

			SRnEXP_reg[2:0]<=SRnEXP_reg[3:1];
			SRnEXP_reg[3]<=1'b0;

			EXP_CARRY<=EXP_SUM[1];
			WAnEXP_reg[4:0]<={EXP_SUM[0],WAnEXP_reg[4:1]};
		end
	end
end

////////////////////////////////////////////
//Perform Multiplication of Mantissa
assign SRnMANT_AND= AnMANT_reg[0] ? SRnMANT : 6'd0; //if SHIFT_out of AN=1 ADD
always @(posedge SHIFT_MANT or posedge reset)//,posedge INIT_SR)//,AnMANT,SRnMANT)//,AnMANT,SRnMANT,AnMANT_reg,SRnMANT_AND,WAnMANT_reg) begin
begin
	if (reset)
	begin
		AnMANT_reg<=6'd0;
		SRnMANT_reg<=6'd0;
		WAnMANT_rege<=13'd0;
	end
	else
	begin
		if (INIT_SR) begin
			AnMANT_reg<=AnMANT;
			SRnMANT_reg<=SRnMANT;
			WAnMANT_rege<=13'd0;
		end else 
		begin 
			AnMANT_reg[4:0]<=AnMANT_reg[5:1];
			AnMANT_reg[5]<=1'b0; //ANMANT gets shifted

			WAnMANT_rege[12:0]<={{1'b0,SRnMANT_AND}+{1'b0,WAnMANT_rege[12:7]},WAnMANT_rege[6:1]};
		//	WAnMANT_reg[5:0]<=WAnMANT_reg[6:1];		
		end
	end
end
assign WAnMANT_reg =WAnMANT_rege[11:0];
///////////////////////////////////////////
// Perform FL multiplication
//
//assign WAnEXP 	= AnEXP + SRnEXP;  	// calculate exponent
//assign WAnMANT2	= (AnMANT * SRnMANT);	// step1: multiply
assign WAnMANT1	= (WAnMANT_reg[11:4]);// + 6'd48);	// step2: add #48
assign WAnMANT	= WAnMANT1+2'd3;		// step3: divide by 16

///////////////////////////////////////////
// Result: FL to SM conversion
//
assign WAnS	= AnS ^ SRnS;	      	// sign bit
always @(WAnMANT, WAnEXP_reg) begin			// calculate magnitude
  if (WAnEXP_reg <= 5'd26)
    WAnMAG <= {1'b0,WAnMANT,7'd0} >> (5'd26-WAnEXP_reg);
  else
    WAnMAG <= {1'b0,WAnMANT,7'd0} << (WAnEXP_reg-5'd26);
end

///////////////////////////////////////////
// Result: SM to TC conversion
//
assign WAn_prereg = WAnS ? (17'h10000 - WAnMAG) : WAnMAG;

always @(posedge clk or posedge reset)//, LD_OUT_SR)//, LD_OUT_SR)//,WAn_prereg, WAn_reg) begin
begin
if (reset)
	WAn_reg <= 0;
else
	if (LD_OUT_SR) begin
		WAn_reg<=WAn_prereg;
	end
	else begin
		WAn_reg[14:0]<=WAn_reg[15:1];	
	end
end
assign WAn=WAn_reg;
endmodule // end of FMULT
