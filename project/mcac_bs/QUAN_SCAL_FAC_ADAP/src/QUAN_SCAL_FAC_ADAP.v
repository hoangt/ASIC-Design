module QUAN_SCAL_FAC_ADAP (
            CLK,
	    IC,
	    RATE,
	    AL,
	    YL,
	    reset,
	    Y,
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
			scan_in4,
			CLK;                        // system clock


input [4:0] IC;
input [1:0] RATE;       //2 bit signal determining rate, 00 corresponds to 40 kbits/s, 01 to 32 etc
input [6:0] AL;		//7 bit input to the MIX block
input reset;
output
			scan_out0,
			scan_out1,
			scan_out2,
			scan_out3,
			scan_out4;

wire [11:0] WI;				//12 bit signed magnitude output of W(I) //from FUNCTW
wire [12:0] YUT;			//13 bit output from FILTD
wire [12:0] YUP;			//13 bit output from LIMB
wire [12:0] YU;				//13 bit output from DELAY 
wire [18:0] YLP;			//19 bit output from FILTE
wire [18:0] YL_int;		//19 bit output from DELAY


output [12:0] Y;	//13 bit output from the MIX block
output [18:0] YL;	//13 bit output from the MIX block
//reg [12:0] Y;

///////////////////////////////////////////
// YOUR LOGIC ( Use this header, as seen above )
assign YL =YL_int;
FUNCTW iFUNCTW(
	.I(IC),
	.RATE(RATE),
	.WI(WI)
	);

FILTD iFILTD(
	.WI(WI),
	.Y(Y),
	.YUT(YUT)
	);

LIMB iLIMB(
	.YUP(YUP),
	.YUT(YUT)
	);

DELAY #(.WIDTH(13),.RESET_STATE(13'd544))  iDELAY_1(
	.x(YUP),
	.reset(reset),
	.clk(CLK),
	.y(YU),
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

FILTE iFILTE(
	.YUP(YUP),
	.YL(YL_int),	
	.YLP(YLP)
	);

DELAY #(.WIDTH(19),.RESET_STATE(19'd34816)) iDELAY_2(
	.x(YLP),
	.reset(reset),
	.clk(CLK),
	.y(YL_int),
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

MIX iMIX(
	.AL(AL),
	.YU(YU),
	.YL(YL_int),
	.Y(Y)
	);


endmodule // QUAN_SCAL_FAC_ADAP
