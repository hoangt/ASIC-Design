module DELAYPREDIC(
	DQN,
	DQ,
	RATE,
	TR,
	reset,
	clk,
	DQN1,
	B,
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

////////////
// Inputs //
////////////
input[10:0]
DQN;	//Quantized Difference Signal with delay N.
input[15:0]
DQ;	//Quantized Difference Signal
input[1:0]
RATE;
input
TR,
reset,
clk;
input
			scan_enable,
			scan_in0,
			scan_in1,
			scan_in2,
			scan_in3,
			scan_in4; 

/////////////
// Outputs //
/////////////
output[10:0]
DQN1;	//Quantized Difference Signal with delay N+1.
output[15:0]
B;	//Delayed 6th order predictor coefficient

output
			scan_out0,
			scan_out1,
			scan_out2,
			scan_out3,
			scan_out4;

///////////
// Wires //
///////////
wire[10:0]
DQN1_int;
wire[15:0]
B_int,
BNP,
BNR;
wire
U;

//////////////////////////
// Module Instatiations //
//////////////////////////
DELAY#(.WIDTH(11),.RESET_STATE(11'd32)) delay1(
	.x(DQN),
	.reset(reset),
	.y(DQN1_int),
	.clk(clk),
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

XORA xora1(
	.DQn(DQN1_int),
	.DQ(DQ),
	.Un(U)
	);
UPB upb1(
	.UN(U),
	.RATE(RATE),
	.BN(B_int),
	.DQ(DQ),
	.BNP(BNP)
	);
TRIGB#(.WIDTH(16)) trigb1(
	.TR(TR),
	.nP(BNP),
	.nR(BNR)
	);
DELAY #(.WIDTH(16),.RESET_STATE(0)) delay2(
	.x(BNR),
	.reset(reset),
	.y(B_int),
	.clk(clk),
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
assign B=B_int;
assign DQN1=DQN1_int;

endmodule //DELAYPREDIC

