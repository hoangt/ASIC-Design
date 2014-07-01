
/* FILTA_vec_test.v
*
* Module: FILTA testbench
*
* Authors: Abdullah Zyarah
*
* Description:
* This file 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah	03/12/2014	Module Created.
* 1.20		Abdullah	03/15/2014	Corrections
* 1.30		Abdullah	03/16/2014	Corrections
*/

`define VECTOR_BIT_SIZE 24
`define MEM_ADDR_RANGE	19880
`define CLK_PERIOD	20000

// Module Declaration
module FILTA_vectors_tb ();

///////////////////////////////////////////
// Registers 
//
reg	[2:0]	tb_FI;			// FI FILTA input
reg	[11:0]	tb_DMS;			// DMS FILTA input
reg	test_clk,		//clk for verification
	testing_alaw,		// == 1 if running alaw vectors
	testing_ulaw,		// == 1 if running ulaw vectors
	new_vector_set;		// Toggles high when changing vector set
	

///////////////////////////////////////////
// ROM
// Need one rom per input and output signal
// This is module specific!!
reg [`VECTOR_BIT_SIZE - 1:0] FI_vec      [0:`MEM_ADDR_RANGE - 1];			// FI (input) ROM
reg [`VECTOR_BIT_SIZE - 1:0] DMS_vec     [0:`MEM_ADDR_RANGE - 1];			// DMS (input) ROM
reg [`VECTOR_BIT_SIZE - 1:0] DMSP_vec    [0:`MEM_ADDR_RANGE - 1];			// DMSP (output) ROM

integer i;

///////////////////////////////////////////
// Wires
//
wire	[11:0]	tb_DMSP;		// FILTA output

FILTA	 top(
	.FI(tb_FI),
	.DMS(tb_DMS),
	.DMSP(tb_DMSP)
	 );

///////////////////////////////////////////
// 	MAIN CODE
//

initial begin
	i = 1'b0;
	test_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;

// a-law vectors

	testing_ulaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dmsp.t", DMSP_vec);
	

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dmsp.t", DMSP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dmsp.t", DMSP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dmsp.t", DMSP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dmsp.t", DMSP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dmsp.t", DMSP_vec);


	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dmsp.t", DMSP_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/fi.t", FI_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dms.t", DMS_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dmsp.t", DMSP_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;
	
	$finish;

end

always begin
	#`CLK_PERIOD test_clk = ~test_clk;
end

task test_vectors;
for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1)
begin
	@(posedge test_clk);
		begin
		tb_FI <= FI_vec[i];
		tb_DMS <= DMS_vec[i];
		end
	@(negedge test_clk);
		monitor;		
end
endtask

task monitor;

	if(tb_DMSP == DMSP_vec[i])   // test successful
	begin
//	`ifdef VERBOSE
	$display("Success:-> Expected: DMSP_vec[i]=%h, Received: tb_DMSP=%h", DMSP_vec[i], tb_DMSP);
//	`endif
	end


	else				// test failed
	begin
 	$display("Failed:-> Expected: DMSP_vec[i]=%h, Received: tb_DMSP=%h", DMSP_vec[i], tb_DMSP);
	`ifdef BREAKONERR
		$stop;
	`endif
	end

endtask

endmodule // end of FILTA
