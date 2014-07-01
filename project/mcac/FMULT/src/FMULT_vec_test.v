
/* ANTILOG_vec_test.v
*
* Module: FMULT testbench
*
* Authors:
* David Herdzik
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the FMULT module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		drh4327		03/21/2014	Module created.
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module FMULT_vec_test ();

///////////////
// Registers //
///////////////
reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [15:0] An;
reg [10:0] SRn;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] An_vec [0:19879];	//Input vector 1
reg [23:0] SRn_vec [0:19879];	//Input vector 2
reg [23:0] WAn_vec [0:19879];	//Output vector 1
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [15:0]
	WAn;		//Output signal 1

FMULT dut(
	.I16_TC(An),
	.I11_FL(SRn),
	.O16_TC(WAn)
);

////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial begin
	$display("Beginning Vector Test");
	i = 1'b0;
	test_clk = 1'b0;
	law = 1'b0;
	rate= 2'b00;
	new_vector_set = 1'b0;
// u-law vectors
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/a1.t", An_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/sr1.t", SRn_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/wa1.t", WAn_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	#100  $finish; 
end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;
for(i = 0; i <= MEM_ADDR_RANGE -1; i = i +1) begin
	@(posedge test_clk);
		An<=An_vec[i];
		SRn<=SRn_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (WAn == WAn_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: An=%h, SRn=%h: Expected WAn=%h, received WAn=%h", An, SRn, WAn_vec[i], WAn);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, An=%h, SRn=%h: Expected WAn=%h, received WAn=%h",law, rate,i, An, SRn, WAn_vec[i], WAn);
	`ifdef BREAKONERR
		$stop;	
	`endif
end
endtask

endmodule
