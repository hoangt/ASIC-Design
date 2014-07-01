/* ADDB_vec_test.v
*
* Module: ADDB testbench
*
* Authors:
* R Paul Hoops
*
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the ADDB module, which is defined on the CCITT page 37.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		03/12/2014	Module created.
* 1.0.1		rph6644		03/12/2014	Corrected some errors.  Now compiles but does not run correctly.
* 1.0.2		rph6644		03/14/2014	Updated read from memories as per email from David Herdzik.  Added $finish.
* 1.0.3		rph6644		03/14/2014	Corrected filenames for readmemh
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module ADDB_vec_test ();

///////////////
// Registers //
///////////////
reg[15:0]
	DQ;		//Input signal 1
reg[14:0]
	SE;		//Input signal 2
reg
	test_clk,	//clock for verification
	testing_alaw,	// == 1 if running alaw vectors
	testing_ulaw,	// == 1 if running ulaw vectors
	new_vector_set;	// Toggles high when changing vector set
///////////
//  ROM  //
///////////


integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000;

reg [23:0] DQ_vec [0:19879];	//Input vector 1
reg [23:0] SE_vec [0:19879];	//Input vector 2
reg [23:0] SR_vec [0:19879];	//Output vector 1
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [15:0]
	SR;		//Output signal 1

ADDB dut(
	.DQ(DQ),
	.SE(SE),
	.SR(SR)
);

////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial begin
	$display("Beginning Vector Test");
	i = 1'b0;
	test_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;
// a-law vectors
	testing_alaw = 1'b1;
// 16kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sr.t", SR_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

// 24kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// 32kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/sr.t", SR_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// 40kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/sr.t", SR_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);

	test_vectors;

	testing_alaw = 1'b0;


// u-law vectors
	testing_ulaw = 1'b1;
// 16kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sr.t", SR_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

// 24kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// 32kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/sr.t", SR_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// 40kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/sr.t", SR_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;
	$finish;
end

always begin
	#CLK_PERIOD test_clk = ~test_clk;
end

task test_vectors;
for(i = 0; i <= MEM_ADDR_RANGE -1; i = i +1) begin
	@(posedge test_clk);
		DQ=DQ_vec[i];
		SE=SE_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (SR == SR_vec[i]) begin
	//Test Succesful
	//`ifdef VERBOSE
		$display("Success: DQ=%h, SE=%h: Expected SR=%h, received SR=%h", DQ, SE, SR_vec[i], SR);
	//`endif
end else begin
	//Test failed
	$display("ERROR: Case DQ=%h, SE=%h: Expected SR=%h, received SR=%h", DQ, SE, SR_vec[i], SR);
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
