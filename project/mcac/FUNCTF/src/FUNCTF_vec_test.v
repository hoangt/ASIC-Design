/* FUNCTF_vec_test.v
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
* 1.0.0		ry6144		03/16/2014	Module Created.
* 
*/

module test;
`define NUM_VECTORS	15'h4da7


///////////////////////////////////
// Wire and Register Instantiations
//
reg [4:0]  test_I;	//5 bit input to module
reg [1:0]  test_RATE;	//2 bit signal determinning rate
wire [2:0] test_FI;	//3 bit signed magnitude output of circuit
reg [31:0] j;	//Used in for loop in random vector generation  ///  may not be required for this code
integer i, test_num = 1;
reg 	test_clk,
	new_vector_set,
	testing_alaw,
	testing_ulaw,
	testing_encoder,
	testing_decoder;

reg [23:0] vec_I    [0:19879]; //5 bit input data
           
reg [23:0] vec_FI   [0:19879]; //3 bit output data


///////////////////////////////////
// Module Instantiation
//

FUNCTF dut(
        .I(test_I),
	.RATE(test_RATE),
	.FI(test_FI)
           );
////////////////////////////////////
// Vector Generation
//

always
	#2000 test_clk = ~test_clk;

initial
begin
	$timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FUNCTF_tsmc18_scan.sdf", test.top);
`endif
// Initialize Values
test_clk = 1'b0;
i = 0;
test_num = 0;
testing_alaw = 1'b0;
testing_ulaw = 1'b0;
new_vector_set = 1'b0;
testing_encoder = 1'b0;
testing_decoder = 1'b0;

@(posedge test_clk); // Idle for a clock cycle before begining tests

/**********************
*Encoder Testing
**********************/


testing_encoder = 1'b1;

// Start testing a-law vectors

	testing_alaw = 1'b1;
	//First Set of Test Vectors for 16 kb/s
	test_RATE = 2'b11;
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	//Second Set of Test Vectors: 24 kb/s
	test_RATE = 2'b10;
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	//Third Set of Test Vectors: 32 kb/s
	test_RATE = 2'b01;
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	//Fourth Set of Test Vectors: 40 kb/s
	test_RATE = 2'b00;
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0; //Done Testing a-law vectors

// Done testing alaw vectors


// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	test_RATE = 2'b11;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	test_RATE = 2'b10;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/fi.t", vec_FI);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	test_RATE = 2'b01;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	test_RATE = 2'b00;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

	testing_encoder = 1'b0;
// End of Encoder Testing



/**********************
*Decoder Testing
**********************/


testing_decoder = 1'b1;

// Start testing a-law vectors

	testing_alaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	test_RATE = 2'b11;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	//Second Set of Test Vectors: 24 kb/s
	test_RATE = 2'b10;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	test_RATE = 2'b01;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	test_RATE = 2'b00;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0; //Done Testing a-law vectors

	// Done testing alaw vectors


	// u-law vectors

	testing_ulaw = 1'b1;

	//First Set of Test Vectors: 16 kb/s
	test_RATE = 2'b11;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	test_RATE = 2'b10;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/fi.t", vec_FI);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	test_RATE = 2'b01;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/fi.t", vec_FI);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	test_RATE = 2'b00;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/I.t", vec_I);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/fi.t", vec_FI);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

	testing_decoder = 1'b0;
// End of Decoder Testing
    $finish;/// // Done Running Tests; Exit Simulation

end

//////////////////////////////////////



task test_vectors;
for(i = 0; i <= `NUM_VECTORS; i = i + 1) begin
	@(posedge test_clk);
		test_I = vec_I[i];
		//test_RATE = vec_RATE[i];
	@(negedge test_clk);
	//	log_mon;	

	if( vec_FI[i] !== test_FI) begin
		$display("Test %d at %t FI returned as %b , %b was expected", test_num, $time, test_FI, vec_FI[i]);
		$stop;
	end
	else
		$display("Test Number %d has passed", test_num);

	test_num = test_num + 1;	
	end
endtask
endmodule
