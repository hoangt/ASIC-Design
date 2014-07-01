/* FUNCTW_test.v
*
* Module: test
*
* Authors:
* R Paul Hoops
*
* Description:
* Testbench for FUNCTW
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		02/17/2014	Module Created.
* 1.0.1		rph6644		02/25/2014	syntax corrected.  Now compiles.
* 1.0.2		rph6644		02/26/2014	Corrected errors related to BREAKONERR and VERBOSE. Fixed problem with for loop counter "j" changing unexpectedly.
*
*/

module test;

///////////////////////////////////
// Wire and Register Instantiations
//
reg [4:0]
	I;	// 5 bit input to circuit
reg [1:0]
	RATE;	// 2 bit signal determining rate
wire [11:0]
	WI;	//12 bit 2's complement
reg [31:0]
	j;	//Used in for loop in random vector generation

///////////////////////////////////
// Module Instantiation
//
FUNCTW dut(
	.I (I),
	.RATE (RATE),
	.WI (WI)
		);

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FUNCTW_tsmc18_scan.sdf", test.top);
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
always @(I or RATE)
begin
	#5 if (RATE == 2'b00) begin //40 kB/s
		if (I == 5'b00000 || I == 5'b11111) begin //IM=0
			if (WI != 12'b000000001110) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00001 || I == 5'b11110) begin //IM=1
			if (WI != 12'b000000001110) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00010 || I == 5'b11101) begin //IM=2
			if (WI != 12'b000000011000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00011 || I == 5'b11100) begin //IM=3
			if (WI != 12'b000000100111) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00100 || I == 5'b11011) begin //IM=4
			if (WI != 12'b000000101000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00101 || I == 5'b11010) begin //IM=5
			if (WI != 12'b000000101001) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00110 || I == 5'b11001) begin //IM=6
			if (WI != 12'b000000111010) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00111 || I == 5'b11000) begin //IM=7
			if (WI != 12'b000001100100) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01000 || I == 5'b10111) begin //IM=8
			if (WI != 12'b000010001101) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01001 || I == 5'b10110) begin //IM=9
			if (WI != 12'b000010110011) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01010 || I == 5'b10101) begin //IM=10
			if (WI != 12'b000011011011) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01011 || I == 5'b10100) begin //IM=11
			if (WI != 12'b000100011000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01100 || I == 5'b10011) begin //IM=12
			if (WI != 12'b000101100110) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01101 || I == 5'b10010) begin //IM=13
			if (WI != 12'b000110111000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01110 || I == 5'b10001) begin //IM=14
			if (WI != 12'b001000010001) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b01111 || I == 5'b10000) begin //IM=15
			if (WI != 12'b001010111000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
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
			if (WI != 12'b111111110100) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif

		end else if (I == 5'b00001 || I == 5'b01110) begin //IM=1
			if (WI != 12'b000000010010) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00010 || I == 5'b01101) begin //IM=2
			if (WI != 12'b000000101001) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00011 || I == 5'b01100) begin //IM=3
			if (WI != 12'b000001000000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00100 || I == 5'b01011) begin //IM=4
			if (WI != 12'b000001110000) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00101 || I == 5'b01010) begin //IM=5
			if (WI != 12'b000011000110) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00110 || I == 5'b01001) begin //IM=6
			if (WI != 12'b000101100011) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00111 || I == 5'b01000) begin //IM=7
			if (WI != 12'b010001100010) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
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
			if (WI != 12'b111111111100) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif

		end else if (I == 5'b00001 || I == 5'b00110) begin //IM=1
			if (WI != 12'b000000011110) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00010 || I == 5'b00101) begin //IM=2
			if (WI != 12'b000010001001) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
			`ifdef VERBOSE
				$display("Case RATE = %b I = %b Tested", RATE, I);
			`endif
		end else if (I == 5'b00011 || I == 5'b00100) begin //IM=3
			if (WI != 12'b001001000110) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
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
			if (WI != 12'b111111101010) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
				$display("**Test Failed**");
`ifdef BREAKONERR
	$stop;
`endif
			end
`ifdef VERBOSE
	$display("Case RATE = %b I = %b Tested", RATE, I);
`endif
		end else if (I == 5'b00001 || I == 5'b00010) begin //IM=1
			if (WI != 12'b000110110111) begin
				$display("**WI = %b when RATE = %b and I = %b**", WI, RATE, I);
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

endmodule
