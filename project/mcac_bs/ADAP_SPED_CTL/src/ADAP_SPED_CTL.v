
module ADAP_SPED_CTL (
           		I,
           		RATE,
           		TDP,
	   		Y,
	   		TR,
	   		reset,
	   		CLK,
	   		AL,
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

input
			scan_enable,
			scan_in0,
			scan_in1,
			scan_in2,
			scan_in3,
			scan_in4;
input     [4:0] I;                      // 5 bit //FUNCTF
input 
    [1:0] RATE;			////2 bit signal determining rate, 11 corresponds to 16kBits/s, 10 to 24, etc.	

input reset, CLK, TDP, TR;

input [12:0] Y;
output [6:0] AL;
output 
			scan_out0,
			scan_out1,
			scan_out2,
			scan_out3,
			scan_out4;
                 
wire [2:0] FI; // 3 bit signed magnitude output of F(I)//FUNCTF
wire [11:0] DMS;
wire [11:0] DMSP;
wire [13:0] DML;
wire [13:0] DMLP;
wire AX;
wire [9:0] AP;
wire [9:0] APP;
wire [9:0] APR;

//CODE

FUNCTF func (
.RATE(RATE),
.I(I),
.FI(FI)
);

FILTA filt (
.FI(FI),
.DMS(DMS),
.DMSP(DMSP)
);

DELAY  #(.RESET_STATE(0),.WIDTH(12)) del
(
.x(DMSP),
.reset(reset),
.clk(CLK),
.y(DMS),
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

FILTB filt_b (

.FI(FI),
.DML(DML),
.DMLP(DMLP)

);

DELAY #(.RESET_STATE(0),.WIDTH(14)) del2 (
.x(DMLP),
.reset(reset),
.clk(CLK),
.y(DML),
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

SUBTC sub1 (
.Y(Y),
.TDP(TDP),
.DMSP(DMSP),
.DMLP(DMLP),
.AX(AX)
);

FILTC filt_c (
.AX(AX),
.AP(AP),
.APP(APP)
);

TRIGA trig (
.TR(TR),
.APP(APP),
.APR(APR)
);

LIMA lim (
.AP(AP),
.AL(AL)
);

DELAY #(.RESET_STATE(0),.WIDTH(10)) del3 (

.x(APR),
.reset(reset),
.clk(CLK),
.y(AP),
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
endmodule // ADAP_SPED_CTL
