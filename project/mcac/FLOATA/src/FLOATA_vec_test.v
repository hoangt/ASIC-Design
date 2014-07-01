/* FLOATA_vec_test.v
*
* Module: FLOATA testbench
*
* Authors:
* Sheenam
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the FLOATA module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		sj7728		03/26/2014	Module created. 
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module FLOATA_vec_test ();

///////////////
// Registers //
///////////////
reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [15:0] DQ;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] DQ0_vec [0:19879];	//Input vector 1
reg [23:0] DQ_vec [0:19879];	//Output vector 1
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [10:0]
	DQ0;		//Output signal 1

FLOATA dut(
	.DQ(DQ),
	.DQ0(DQ0)
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
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq.t", DQ_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq0.t", DQ0_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dqs.t", DQS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq.t", DQ_vec);
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
//		DQS<=DQS_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (DQ0 == DQ0_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: DQ=%h, : Expected DQ0=%h, received DQ0=%h", DQ,  DQ0_vec[i], DQ0);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%h, DQ=%b, : Expected DQ0=%b, received DQ0=%b",law, rate,i, DQ, DQ0_vec[i], DQ0);
	//`ifdef BREAKONERR
		$stop;	
	//`endif
end
endtask

endmodule
