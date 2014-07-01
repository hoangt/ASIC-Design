

/* FMULT_ACCUM_vec_test.v
*
* Module: FMULT_ACCUM testbench
*
* Authors:
* David Herdzik
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the FMULT_ACCUM module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		drh4327		3/28/14		Create FMULT_ACCUM TB
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module FMULT_ACCUM_vec_test ();

   // $timeformat(-9,2,"ns", 16);
///////////////
// Registers //
///////////////
reg
	test_clk,reset,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector seti


reg CLK;
reg START;
reg [15:0] b1;
reg [15:0] b2;
reg [15:0] b3;
reg [15:0] b4;
reg [15:0] b5;
reg [15:0] b6;
reg [15:0] a2;
reg [15:0] a1;

reg [10:0] dq1;
reg [10:0] dq2;
reg [10:0] dq3;
reg [10:0] dq4;
reg [10:0] dq5;
reg [10:0] dq6;
reg [10:0] sr2;
reg [10:0] sr1;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 24;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 100; //ns

reg [23:0] b1_vec [0:19879];	//Input vector 1
reg [23:0] b2_vec [0:19879];	//Input vector 2
reg [23:0] b3_vec [0:19879];	//Input vector 3
reg [23:0] b4_vec [0:19879];	//Input vector 4
reg [23:0] b5_vec [0:19879];	//Input vector 1
reg [23:0] b6_vec [0:19879];	//Input vector 2
reg [23:0] a2_vec [0:19879];	//Input vector 3
reg [23:0] a1_vec [0:19879];	//Input vector 4
reg [23:0] dq1_vec [0:19879];	//Input vector 1
reg [23:0] dq2_vec [0:19879];	//Input vector 2
reg [23:0] dq3_vec [0:19879];	//Input vector 3
reg [23:0] dq4_vec [0:19879];	//Input vector 4
reg [23:0] dq5_vec [0:19879];	//Input vector 1
reg [23:0] dq6_vec [0:19879];	//Input vector 2
reg [23:0] sr2_vec [0:19879];	//Input vector 3
reg [23:0] sr1_vec [0:19879];	//Input vector 4

reg [23:0] wb1_vec [0:19879];	//Output vector 1
reg [23:0] wb2_vec [0:19879];	//Output vector 1
reg [23:0] wb3_vec [0:19879];	//Output vector 1
reg [23:0] wb4_vec [0:19879];	//Output vector 1
reg [23:0] wb5_vec [0:19879];	//Output vector 1
reg [23:0] wb6_vec [0:19879];	//Output vector 1
reg [23:0] wa2_vec [0:19879];	//Output vector 1
reg [23:0] wa1_vec [0:19879];	//Output vector 1

reg [23:0] sez_vec [0:19879];	//Output vector 1
reg [23:0] se_vec [0:19879];	//Output vector 1
reg pass;
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [15:0] WAn;
wire [15:0] Sample_num;
wire [14:0] sez;
wire [14:0] se;

wire test_mode,scan_enable, scan_in0,scan_in1,scan_in2,scan_in3,scan_in4;

assign test_mode =1'b0;
assign scan_enable =1'b0;
assign scan_in0 =1'b0;
assign scan_in1=1'b0;
assign scan_in2 =1'b0;
assign scan_in3=1'b0;
assign scan_in4 =1'b0;
FMULT_ACCUM dut(
	.B1(b1),
	.B2(b2),
	.B3(b3),
	.B4(b4),	
	.B5(b5),
	.B6(b6),
	.A2(a2),
	.A1(a1),
	.reset(reset),
	.DQ1(dq1),
	.DQ2(dq2),
	.DQ3(dq3),
	.DQ4(dq4),
	.DQ5(dq5),
	.DQ6(dq6),
	.SR2(sr2),
	.SR1(sr1),

	.WAn(WAn),	//Delete these if not check FMULT

	.SEZ(sez),
	.SE(se),
	.test_mode(test_mode),
	.scan_enable(scan_enable),
	.scan_in0(scan_in0),
	.scan_in1(scan_in1),
	.scan_in2(scan_in2),
	.scan_in3(scan_in3),
	.scan_in4(scan_in4),
	.clk(CLK),
	.start(START),
	.done(DONE)
);
assign Sample_num =i;
////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial begin
	$display("Beginning Vector Test");
	test_clk = 1'b0;
	pass=1'b1;
	i = 1'b0;
	reset = 1'b0;
	@(posedge test_clk)
	reset = 1'b1;
	@(posedge test_clk)
	reset = 1'b0;
	@(posedge test_clk)
	law = 1'b0;
	rate= 2'b00;
	new_vector_set = 1'b0;
// u-law vectors
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/b1.t", b1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/b2.t", b2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/b3.t", b3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/b4.t", b4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/b5.t", b5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/b6.t", b6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/a2.t", a2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/a1.t", a1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq1.t", dq1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq2.t", dq2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq3.t", dq3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq4.t", dq4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq5.t", dq5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq6.t", dq6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sr2.t", sr2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sr1.t", sr1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wb1.t", wb1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wb2.t", wb2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wb3.t", wb3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wb4.t", wb4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wb5.t", wb5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wb6.t", wb6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wa2.t", wa2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wa1.t", wa1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sez.t", sez_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/se.t", se_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	if (pass==1'b1) begin
		$display("************     ALL VECTORS PASSED     ***************");
	end
	#100  $finish; 
end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;
	for(i = 0; i <= MEM_ADDR_RANGE - 1; i = i + 1)
	begin
		@(posedge test_clk);
		begin
			START=1'b0;
			b1<=b1_vec[i];
			b2<=b2_vec[i];
			b3<=b3_vec[i];
			b4<=b4_vec[i];
			b5<=b5_vec[i];
			b6<=b6_vec[i];
			a2<=a2_vec[i];
			a1<=a1_vec[i];

			dq1<=dq1_vec[i];
			dq2<=dq2_vec[i];
			dq3<=dq3_vec[i];
			dq4<=dq4_vec[i];
			dq5<=dq5_vec[i];
			dq6<=dq6_vec[i];
			sr2<=sr2_vec[i];
			sr1<=sr1_vec[i];
		end
			@(posedge test_clk)
				CLK = 1;
			@(posedge test_clk)
				CLK = 0;
		START=1'b1;
			@(posedge test_clk)
				CLK = 1;
			@(posedge test_clk)
				CLK = 0;
		START=1'b0;

		repeat(17)
		begin
			@(posedge test_clk)
				CLK = 1;
			@(posedge test_clk)
				CLK = 0;
		end
		
		@(negedge test_clk);
		monitor_WB1;		
		repeat(16)
		begin
			@(posedge test_clk)
				CLK = 1;
			@(posedge test_clk)
				CLK = 0;
		end
		monitor_WB2;		
		repeat (9)
		begin
			repeat(16)
			begin
				@(posedge test_clk)
					CLK = 1;
				@(posedge test_clk)
					CLK = 0;
			end
		end
		@(negedge test_clk);
		monitor;		
	end
endtask

task monitor_WB1;
if (WAn == wb1_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
	//	$display("Success: LAW=%h, RATE=%h, sample=%d: Expected se=%h, received se=%h; Expected sez=%h, received sez=%h",law, rate,i, se_vec[i],se,sez_vec[i],sez);
	`endif
end else begin
	//Test failed
	$display("*******ERROR: LAW=%h, RATE=%h, sample=%d: Expected WB1=%h, received WB1=%h",law, rate,i, wb1_vec[i],WAn);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask
task monitor_WB2;
if (WAn == wb2_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
	//	$display("Success: LAW=%h, RATE=%h, sample=%d: Expected se=%h, received se=%h; Expected sez=%h, received sez=%h",law, rate,i, se_vec[i],se,sez_vec[i],sez);
	`endif
end else begin
	//Test failed
	$display("*******ERROR: LAW=%h, RATE=%h, sample=%d: Expected WB2=%h, received WB2=%h",law, rate,i, wb2_vec[i],WAn);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask
task monitor;
if (sez == sez_vec[i] & se == se_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: LAW=%h, RATE=%h, sample=%d: Expected se=%h, received se=%h; Expected sez=%h, received sez=%h",law, rate,i, se_vec[i],se,sez_vec[i],sez);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d: Expected se=%h, received se=%h; Expected sez=%h, received sez=%h",law, rate,i, se_vec[i],se,sez_vec[i],sez);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
