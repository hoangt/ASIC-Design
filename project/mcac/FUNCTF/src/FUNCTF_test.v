/* FUNCTF_test.v
*
* Module: test
*
* Authors:
* R Paul Hoops
*
* Description:
* Testbench for FUNCTF
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		02/17/2014	Module Created.
* 1.0.1		rph6644		02/24/2014	Corrected several syntactical errors. Testbench now compiles.
* 1.0.2		rph6644		02/26/2014	Corrected coding related to BREAKONERR and VERBOSE.  Fixed error related to loop counter j changing unexpectedly. This version appears to have full functionality.
* 1.1.0		rph6644		02/26/2014	Redid some whitespace as per design review.  Random functions now have no parameters.  Passes testbench.
*
*

module test;

///////////////////////////////////
// Wire and Register Instantiations
//
reg [4:0]
	I;	//5 bit input to module
reg [1:0]
	RATE;	//2 bit signal determinning rate
wire [2:0]
	FI;	//3 bit signed magnitude output of circuit
reg [31:0]
	j;	//Used in for loop in random vector generation
///////////////////////////////////
// Module Instantiation
//
FUNCTF dut(
        .I(I),
	.RATE(RATE),
	.FI(FI)
           );
////////////////////////////////////
// Vector Generation
//

initial
begin
	$timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FUNCTF_tsmc18_scan.sdf", test.top);
`endif
for (j = 0; j < 256; j=j +1) begin
	#1 RATE = $random % 3'b100;	//Generate a random input for the rate
	#1 if (RATE == 2'b00) begin
		I = $random % 5'b11111; //40 kB/s
	end else if (RATE == 2'b01) begin
		I = $random % 5'b01111; //32 kB/s
	end else if (RATE == 2'b10) begin
		I = $random % 5'b00111; //24 kB/s
	end else begin
		I = $random % 5'b00011; //16 kB/s
	end
	#10;
end
$finish;
end

//////////////////////////////////////
// Validation
//
always @(RATE or I)
begin
	#5 if (RATE == 2'b00) begin //40 kB/s
		if (I == 5'b00000 || I == 5'b11111) begin //IM=0
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00001 || I == 5'b11110) begin //IM=1
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00010 || I == 5'b11101) begin //IM=2
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00011 || I == 5'b11100) begin //IM=3
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00100 || I == 5'b11011) begin //IM=4
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00101 || I == 5'b11010) begin //IM=5
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00110 || I == 5'b11001) begin //IM=6
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00111 || I == 5'b11000) begin //IM=7
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01000 || I == 5'b10111) begin //IM=8
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01001 || I == 5'b10110) begin //IM=9
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01010 || I == 5'b10101) begin //IM=10
			if (FI != 3'b010) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01011 || I == 5'b10100) begin //IM=11
			if (FI != 3'b011) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01100 || I == 5'b10011) begin //IM=12
			if (FI != 3'b100) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01101 || I == 5'b10010) begin //IM=13
			if (FI != 3'b101) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01110 || I == 5'b10001) begin //IM=14
			if (FI != 3'b110) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01111 || I == 5'b10000) begin //IM=15
			if (FI != 3'b110) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end
	end else if (RATE == 2'b01) begin //32 kB/s
		if (I == 5'b00000 || I == 5'b01111) begin //IM=0
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif

		end else if (I == 5'b00001 || I == 5'b01110) begin //IM=1
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00010 || I == 5'b01101) begin //IM=2
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00011 || I == 5'b01100) begin //IM=3
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00100 || I == 5'b01011) begin //IM=4
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00101 || I == 5'b01010) begin //IM=5
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00110 || I == 5'b01001) begin //IM=6
			if (FI != 3'b011) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00111 || I == 5'b01000) begin //IM=7
			if (FI != 3'b111) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end
	end else if (RATE == 2'b10) begin //24 kB/s
		if(I == 5'b00000 || I == 5'b00111) begin //IM=0
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00001 || I == 5'b00110) begin //IM=1
			if (FI != 3'b001) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00010 || I == 5'b00101) begin //IM=2
			if (FI != 3'b010) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00011 || I == 5'b00100) begin //IM=3
			if (FI != 3'b111) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end
	end else if (RATE == 2'b11) begin //16 kB/s
		if (I == 5'b00000 || I==5'b00011) begin //IM=0
			if (FI != 3'b000) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00001 || I == 5'b00010) begin //IM=1
			if (FI != 3'b111) begin
				$display("**FI = %b when RATE = %b and I = %b**", FI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end
	end
end

endmodule */
