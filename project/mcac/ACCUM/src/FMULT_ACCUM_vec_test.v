

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
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
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
integer CLK_PERIOD = 1000; //ns

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
wire [15:0] wb1;
wire [15:0] wb2;
wire [15:0] wb3;
wire [15:0] wb4;
wire [15:0] wb5;
wire [15:0] wb6;
wire [15:0] wa2;
wire [15:0] wa1;

wire [14:0] sez;
wire [14:0] se;

FMULT_ACCUM dut(
	.b1(b1),
	.b2(b2),
	.b3(b3),
	.b4(b4),	
	.b5(b5),
	.b6(b6),
	.a2(a2),
	.a1(a1),

	.dq1(dq1),
	.dq2(dq2),
	.dq3(dq3),
	.dq4(dq4),
	.dq5(dq5),
	.dq6(dq6),
	.sr2(sr2),
	.sr1(sr1),

	.wb1(wb1),	//Delete these if not check FMULT
	.wb2(wb2),
	.wb3(wb3),
	.wb4(wb4),
	.wb5(wb5),
	.wb6(wb6),
	.wa2(wa2),
	.wa1(wa1),

	.sez(sez),
	.se(se)
);

////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial begin
	$display("Beginning Vector Test");
	pass=1'b1;
	i = 1'b0;
	test_clk = 1'b0;
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
for(i = 0; i <= MEM_ADDR_RANGE -1; i = i +1) begin
	@(posedge test_clk);
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
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (sez == sez_vec[i] & se == se_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: LAW=%h, RATE=%h, sample=%d, b1=%h, b2=%h, b3=%h, b4=%h: Expected wb1=%h, received wb1=%h",law, rate,i, b1, b2, b3, b4, wb1_vec[i],wb1);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, b1=%h, b2=%h, b3=%h, b4=%h: Expected wb1=%h, received wb1=%h",law, rate,i, b1, b2, b3, b4, wb1_vec[i],wb1);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
