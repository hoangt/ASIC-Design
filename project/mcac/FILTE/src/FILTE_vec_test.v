/* FILTE_vec_test.v
*
* Module: FILTE testbench
*
* Authors:
* Varun Pavagada Matha, Sheenam Jayaswal
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		vp9866		3/16/14		module created
* 2.0		vp9866		3/17/14		module completed. errors yet
* 						to be checked
* 3.0		sj7728		03/25/2014	changes made to the module to
* 						correct the errors. 
* 3.1		jm4880		03/30/2014	Decoder testing added
*
* 4.0 		jm4880		03/30/2014	Test PASSES for both enc and dec
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module FILTE_vec_test ();

///////////////
// Registers //
///////////////
reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [12:0] YUP;
reg [18:0] YL;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] YUP_vec [0:19879];	//Input vector 1
reg [23:0] YL_vec [0:19879];	//Input vector 2
reg [23:0] YLP_vec [0:19879];	//Output vector 1
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [18:0]
	YLP;		//Output signal 1

FILTE dut(
	.YUP(YUP),
	.YL(YL),
	.YLP(YLP)
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

////////////ENCODER TESTING////////////////

// u-law vectors
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

///////////////DECODER TESTING///////////

// u-law vectors
//
	law = 1'b0;
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/ylp.t", YLP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/yup.t", YUP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/ylp.t", YLP_vec);
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
		YUP<=YUP_vec[i];
		YL<=YL_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (YLP == YLP_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: YUP=%h, YL=%h: Expected YLP=%h, received YLP=%h", YUP, YL, YLP_vec[i], YLP);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, YUP=%h, YL=%h: Expected YLP=%h, received YLP=%h",law, rate,i, YUP, YL, YLP_vec[i], YLP);
//	`ifdef BREAKONERR
		$stop;	
//	`endif
end
endtask

endmodule
