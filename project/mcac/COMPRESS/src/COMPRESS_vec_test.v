/* COMPRESS_vec_test.v
*
* Module: vector test
*
* Authors:
* Yukee
*
* Description:
* Vector testbench for COMPRESS block
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Yukee		03/17/2014	Module Created.
* 1.01		Yukee/nv1440	03/28/2014	Merge two files
* 1.02		Yukee		03/30/2014	Commented scan_in scan_en scan_out
*
*/


// Module Declaration
module COMPRESS_vectors_tb ();
`define VECTOR_BIT_SIZE 23 //[23:0] therefore 24 bit vectos
`define MEM_ADDR_RANGE	15'h4da7 //[0:19879] therefore 19880 memory locations
`define CLK_PERIOD	20000

///////////////////////////////////////////
// Registers 
//
reg	[15:0]	test_SR;		// 16 bits input
reg	test_LAW;
			
reg	test_clk,		//clk for verification
	testing_alaw,		// == 1 if running alaw vectors
	testing_ulaw,		// == 1 if running ulaw vectors
	new_vector_set;		// Toggles high when changing vector set

///////////////////////////////////////////
// ROM
// Need one rom per input and output signal
// This is module specific!!
reg [`VECTOR_BIT_SIZE:0]
	SR_vec		[0:`MEM_ADDR_RANGE],
	SP_vec 		[0:`MEM_ADDR_RANGE];



integer i;				// counter for 'for' loop

///////////////////////////////////////////
// Wires
//
wire	[7:0]	test_SP;	// 8 bits output


COMPRESS top(
	.SR(test_SR),
	.LAW(test_law),
	.SP(test_SP)
);

///////////////////////////////////////////
// Code to read test vectors
//

initial begin
	i = 1'b0;
	test_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;


@(posedge test_clk);// Idle for one clock cycle before begining tests

/*************************************
*Decoder testing
*************************************/

// a-law Vector Tests

	testing_alaw = 1'b1;
	
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	//Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	
	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;

	//Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Test Vectors: 24 kb/s

	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sp.t", SP_vec);
	
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Test Vectors: 32 kb/s

	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Test Vectors: 40 kb/s

	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sp.t", SP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

	$finish;
end

always begin
	#(`CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;
for(i = 0; i <= `MEM_ADDR_RANGE; i = i + 1) begin
	@(posedge test_clk);
		test_SR= SR_vec[i];
		test_LAW = testing_alaw;//? 1'b1: 1'b0;
	@(negedge test_clk);
		monitor;		
	end
endtask

task monitor;
	if (SP_vec[i] != {16'b0,test_SP}) begin
		$display("Test number %d failed. Case LAW = %h, SR = %h: SP = %h. %h is expected.", i, test_LAW, test_SR, test_SP, SP_vec[i]);
`ifdef BREAKONERR 
    $stop;
`endif
	end
	else begin
		$display("** Test number %d tested. Case LAW = %h, SR = %h: SP = %h.", i, test_LAW, test_SR, test_SP);
	end
endtask

endmodule // end of COMPRESS_vectors_tb
