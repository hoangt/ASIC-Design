/* ADAP_PRED_REC_SIG.v
* module: adap_pred_rec_sig
*
* Description: Generates SE and SEZ signals
* Defined on the CCITT page 36
* Note that there is a set of 5 blocks which must be duplicated six times over.
* These blocks include 2 delay elements, 1 XOR, 1 UPB and 1 TRIGB.
* These five elements will be combined into their own module to increase readability.
* As such, signals which are exclusively internal to these blocks, such as U1, B1P, and B1R,
* will not be seen at this top level.
*
* Authors:
* author1 R Paul Hoops rph6644
*
* Submodule Status:
* _Module_	_Author_	_Version_	_Status*_	_Date_
* ADDB		sj7728		1.02		pp		4/08/2014
* ADDC		sj7728		1.00		fp		4/08/2014
* DELAY		amz6011		1.10		ff		4/08/2014
* FLOATA	mk2870		1.01		xp		4/08/2014
* FLOATB	vxs9946		1.01		xp		4/09/2014
* LIMC		ld2193		v0.2		pp		4/09/2014
* LIMD		ld2193		v0.3		pp		3/19/2014
* TRIGB		mgp6782		1.20		pp		3/19/2014
* UPA1		vp9986		x		xp		4/09/2014
* UPA2		vp9986		x		xp		4/09/2014
* UPB		vxs9946		1.00		fp		4/09/2014
* XORA		amz6011		1.10		pp		4/09/2014
* FMULT/ACCUM	mgp6782		1.00		xp		4/09/2014
*
* *Note on status:
* first character (p,f) indicates pass or failure of behavioral testbench.
* second character (p,f) indicates pass or failure of vector testbench.
* An x in either above indicates that testbench does not exist.
* string "nc" indicates No Compile
*
* Revision History:
* _Version_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		3/19/2014	Module Created.
* 1.0.1		rph6644		3/20/2014	Populated list of inputs, outputs, and wires.
* 1.0.2		rph6644		3/23/2014	Instantiated modules
* 1.0.3		rph6644		3/31/2014	Completed preliminary RTL work
* 1.0.4		rph6644		4/1/2014	Removed SEZ from outputs,
* eliminated SEZ_int, instantiated missing FMULT/ACCUM
* 1.0.5		rph6644		4/4/2014	Redid DELAY and TRIGB elements,
* utilizing parameters.  Seperated DELAYPREDIC into seperate file.
*/
module ADAP_PRED_REC_SIG (
	DQ,
	RATE,
	clk,
	dly_strb,
	reset,
	TR,
	start_trig,
        FA_DONE,
	SE,
	A2P,
        SR,
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

////////////
// Inputs //
////////////
input[15:0]
	DQ;		//Quantized Difference Signal
input[1:0]
	RATE;		//2 bit rate signal
input
	clk,		// clock signal, used in FMULT_ACCUM
	dly_strb,	//used as the "clock" to DELAY elements
	reset,		// reset signal, used in DELAY,FMULT_ACCUM
	TR,		// Transistion detct, used in TRIGA/B
	start_trig;	//When low, FMULT_ACCUM idles

input	scan_in0, 
	scan_in1, 
	scan_in2, 
	scan_in3, 
	scan_in4, 
	test_mode, 
	scan_enable; 	//DFT scan chain

/////////////
// Outputs //
/////////////
output[14:0]	SE;		//Signal Estimateoutput[15:0]
output[15:0]	A2P,		//Second order predictor coefficient
	        SR;		//Reconstructed Signal
output          FA_DONE;
output	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;	//DFT scan chain
///////////
// Wires //
///////////
wire
	PK0,		//Sign of DQ+SEZ with delay 0
	PK1,		//Sign of DQ+SEZ with delay 1
	PK2,		//Sign of DQ+SEZ with delay 2
	SIGPK;		//Sgn[p(k)] flag

wire[10:0]
	DQ0,		//Quantized Difference Signal with Delay 0
	DQ1,		//Quantized Difference Signal with Delay 1
	DQ2,		//Quantized Difference Signal with Delay 2
	DQ3,		//Quantized Difference Signal with Delay 3
	DQ4,		//Quantized Difference Signal with Delay 4
	DQ5,		//Quantized Difference Signal with Delay 5
	DQ6,		//Quantized Difference Signal with Delay 6
	SR0,		//Reconstructed signal with delay 0
	SR1,		//Reconstructed signal with delay 1
	SR2;		//Reconstructed signal with delay 2
wire[14:0]
	SE_int,		//Signal Estimate
	SEZ;	//Sixth order predictor partial signal estimate
wire[15:0]
	A1,		//Delayed predictor second order coefficient
	A2P_int,		//Delayed predictor second order coefficient
	A1T,		//Unlimited a1 coefficient
	A2T,		//Unlimited a2 coefficient
	A1P,		//Second order predictor coefficient
	A2,		//Delayed predictor second order coefficient
	A1R,		//Triggered second order predictor coefficient
	A2R,		//Triggered Second order predictor coefficient
	B1,		//Delayed sixth order predictor coefficient 1
	B2,		//Delayed sixth order predictor coefficient 2
	B3,		//Delayed sixth order predictor coefficient 3
	B4,		//Delayed sixth order predictor coefficient 4
	B5,		//Delayed sixth order predictor coefficient 5
	B6;		//Delayed sixth order predictor coefficient 6
/*	WA1,		//Partial product of signal estimate
	WA2,		//Partial product of signal estimate
	WB1,		//Partial product of signal estimate
	WB2,		//Partial product of signal estimate
	WB3,		//Partial product of signal estimate
	WB4,		//Partial product of signal estimate
	WB5,		//Partial product of signal estimate
	WB6;		//Partial product of signal estimate
*/
///////////////////////////
// Module Instantiations //
///////////////////////////

/*
These will be based off of Figure 9/G.726, and grouped into sections based upon what
row they appear in.  Note that the elements in Rows 3 and 4 will be primarily placed inside of
another heirarchical level to facilitate their sixfold duplication.
*/

//Row 1: ADDC -> DELAY -> DELAY

ADDC ADAP_PRED_REC_SIG_addc1(
	.DQ(DQ),
	.SEZ(SEZ),
	.PK0(PK0),
	.SIGPK(SIGPK)
	);
DELAY #(.WIDTH(1),.RESET_STATE(0)) ADAP_PRED_REC_SIG_delay1(
	.x(PK0),
	.reset(reset),
	.y(PK1),
	.clk(dly_strb)
	,.scan_enable()
	);
DELAY #(.WIDTH(1),.RESET_STATE(0))ADAP_PRED_REC_SIG_delay2(
	.x(PK1),
	.reset(reset),
	.y(PK2),
	.clk(dly_strb)
	,.scan_enable()
	);

//Row 2: ADDB -> FLOATB -> DELAY
ADDB ADAP_PRED_REC_SIG_addb1(
	.DQ(DQ),
	.SE(SE),
	.SR(SR)
	);
FLOATB ADAP_PRED_REC_SIG_floatb1(
	.SR(SR),
	.SR0(SR0)
	);
DELAY #(.WIDTH(11),.RESET_STATE(11'd32)) ADAP_PRED_REC_SIG_delay3(
	.x(SR0),
	.reset(reset),
	.y(SR1),
	.clk(dly_strb)
	,.scan_enable()
	);

//ROW 3/4: Delayed Predictors
FLOATA ADAP_PRED_REC_SIG_floata1(
	.DQ(DQ),
	.DQ0(DQ0)
	);
DELAYPREDIC ADAP_PRED_REC_SIG_delaypredic1(
	.DQN(DQ0),
	.DQ(DQ),
	.RATE(RATE),
	.TR(TR),
	.reset(reset),
	.clk(dly_strb),
	.DQN1(DQ1),
	.B(B1)
	,.scan_enable()
	);
DELAYPREDIC ADAP_PRED_REC_SIG_delaypredic2(
	.DQN(DQ1),
	.DQ(DQ),
	.RATE(RATE),
	.TR(TR),
	.reset(reset),
	.clk(dly_strb),
	.DQN1(DQ2),
	.B(B2)
	,.scan_enable()
	);
DELAYPREDIC ADAP_PRED_REC_SIG_delaypredic3(
	.DQN(DQ2),
	.DQ(DQ),
	.RATE(RATE),
	.TR(TR),
	.reset(reset),
	.clk(dly_strb),
	.DQN1(DQ3),
	.B(B3)
	,.scan_enable()
	);
DELAYPREDIC ADAP_PRED_REC_SIG_delaypredic4(
	.DQN(DQ3),
	.DQ(DQ),
	.RATE(RATE),
	.TR(TR),
	.reset(reset),
	.clk(dly_strb),
	.DQN1(DQ4),
	.B(B4)
	,.scan_enable()
	);
DELAYPREDIC ADAP_PRED_REC_SIG_delaypredic5(
	.DQN(DQ4),
	.DQ(DQ),
	.RATE(RATE),
	.TR(TR),
	.reset(reset),
	.clk(dly_strb),
	.DQN1(DQ5),
	.B(B5)
	,.scan_enable()
	);
DELAYPREDIC ADAP_PRED_REC_SIG_delaypredic6(
	.DQN(DQ5),
	.DQ(DQ),
	.RATE(RATE),
	.TR(TR),
	.reset(reset),
	.clk(dly_strb),
	.DQN1(DQ6),
	.B(B6)
	,.scan_enable()
	);
	

//Row 5: Delay
DELAY #(.WIDTH(11),.RESET_STATE(11'd32)) ADAP_PRED_REC_SIG_delay4(
	.x(SR1),
	.reset(reset),
	.y(SR2),
	.clk(dly_strb)
	,.scan_enable()
	);

//Row 6: UPA -> LIM -> TRIGB -> DELAY X2
UPA2 ADAP_PRED_REC_SIG_upa21(
	.PK0(PK0),
	.PK1(PK1),
	.PK2(PK2),
	.A1(A1),
	.A2(A2),
	.SIGPK(SIGPK),
	.A2T(A2T)
	);
LIMC ADAP_PRED_REC_SIG_limc1(
	.A2T(A2T),
	.A2P(A2P_int)
	);
TRIGB #(.WIDTH(16))ADAP_PRED_REC_SIG_trigb1(
	.TR(TR),
	.nP(A2P_int),
	.nR(A2R)
	);
DELAY #(.WIDTH(16),.RESET_STATE(0)) ADAP_PRED_REC_SIG_delay5(
	.x(A2R),
	.reset(reset),
	.y(A2),
	.clk(dly_strb)
	,.scan_enable()
	);
UPA1 ADAP_PRED_REC_SIG_upa11(
	.PK0(PK0),
	.PK1(PK1),
	.A1(A1),
	.SIGPK(SIGPK),
	.A1T(A1T)
	);
LIMD ADAP_PRED_REC_SIG_limd1(
	.A1T(A1T),
	.A2P(A2P_int),
	.A1P(A1P)
	);
TRIGB #(.WIDTH(16))ADAP_PRED_REC_SIG_trigb2(
	.TR(TR),
	.nP(A1P),
	.nR(A1R)
	);
DELAY #(.WIDTH(16),.RESET_STATE(0)) ADAP_PRED_REC_SIG_delay6(
	.x(A1R),
	.reset(reset),
	.y(A1),
	.clk(dly_strb)
	,.scan_enable()
	);

//Row 7: Shared reseource FMULT/Accumulator
FMULT_ACCUM ADAP_PRED_REC_SIG_fmultaccum1(
	.A1(A1),
	.A2(A2),
	.B1(B1),
	.B2(B2),
	.B3(B3),
	.B4(B4),
	.B5(B5),
	.B6(B6),
	.DQ1(DQ1),
	.DQ2(DQ2),
	.DQ3(DQ3),
	.DQ4(DQ4),
	.DQ5(DQ5),
	.DQ6(DQ6),
	.SR1(SR1),
	.SR2(SR2),
	.SE(SE_int),
	.SEZ(SEZ),
	.clk(clk),
	.reset(reset),
	.start_trig(start_trig),
        .DONE(FA_DONE),
	.scan_enable(),
	.test_mode(test_mode)
	);


//Assignment statements: intermediate outputs to outputs
assign A2P=A2P_int;
assign SE=SE_int;

endmodule // ADAP_PRED_REC_SIG


