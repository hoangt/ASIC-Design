
/* ADDC_vec_test.v
*
* Module: ADDC testbench
*
* Authors:
* Sheenam Jayaswal
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the ANTILOG module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		sj7728		03/25/2014	Module created.
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module ADDC_vec_test ();

///////////////
// Registers //
///////////////
reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [15:0] DQ;
reg [14:0] SEZ;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] DQ_vec [0:19879];	//Input vector 1
reg [23:0] SEZ_vec [0:19879];	//Input vector 2
reg [23:0] SIGPK_vec [0:19879];	//Output vector 1
reg [23:0] PK0_vec [0:19879];	//Output vector 1

integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire SIGPK, PK0;		//Output signal 1 and 2

ADDC dut(
	.DQ(DQ),
	.SEZ(SEZ),
	.SIGPK(SIGPK),
	.PK0(PK0)
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
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/sez.t",SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/pk0.t", PK0_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/sez.t", SEZ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/sigpk.t", SIGPK_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/pk0.t", PK0_vec);

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
		DQ<=DQ_vec[i];
		SEZ<=SEZ_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if ((SIGPK == SIGPK_vec[i]) && (PK0 == PK0_vec[i])) begin
	//Test Succesful
//	`ifdef VERBOSE
		$display("Success: DQ=%h, SEZ=%h: Expected SIGPK=%h, received SIGPK=%h  Expected PK0=%h, received PK0=%h", DQ, SEZ, SIGPK_vec[i], SIGPK, PK0_vec[i], PK0);
//	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, DQ=%h, SEZ=%h: Expected SIGPK=%h, received SIGPK=%h  Expected PK0=%h, received PK0=%h",law, rate,i, DQ, SEZ, SIGPK_vec[i], SIGPK, PK0_vec[i], PK0);
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
