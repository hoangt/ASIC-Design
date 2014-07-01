

/* FILTC_vec_test.v
*
* Module: FILTC testbench
*
* Authors: Abdullah Zyarah
*
* Description:
* This file 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah	03/12/2014	Module Created.
* 1.20		Abdullah	03/16/2014	corrections
*/

`define VECTOR_BIT_SIZE 24
`define MEM_ADDR_RANGE	19880
`define CLK_PERIOD	20000

// Module Declaration
module FILTC_vectors_tb ();

///////////////////////////////////////////
// Registers 
//
reg		tb_AX;			// AX FILTC input
reg	[9:0]	tb_AP;			// AP FILTC input
reg		test_clk,		//clk for verification
		testing_alaw,		// == 1 if running alaw vectors
		testing_ulaw,		// == 1 if running ulaw vectors
		new_vector_set;		// Toggles high when changing vector set
		

///////////////////////////////////////////
// ROM
// Need one rom per input and output signal
// This is module specific!!
reg [`VECTOR_BIT_SIZE - 1:0] AX_vec      [0:`MEM_ADDR_RANGE - 1];			// AX (I/P) ROM
reg [`VECTOR_BIT_SIZE - 1:0] AP_vec      [0:`MEM_ADDR_RANGE - 1];			// AP (I/P) ROM
reg [`VECTOR_BIT_SIZE - 1:0] APP_vec    [0:`MEM_ADDR_RANGE - 1];			// APP (O/P) ROM

integer i;

///////////////////////////////////////////
// Wires
//
wire	[9:0]	tb_APP;		// FILTC output

FILTC	 top(
	.AX(tb_AX),
	.AP(tb_AP),
	.APP(tb_APP)
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
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/app.t", APP_vec);
	

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/app.t", APP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/app.t", APP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/app.t", APP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/app.t", APP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/app.t", APP_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/app.t", APP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/ax.t", AX_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/ap.t", AP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/app.t", APP_vec);

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
		tb_AX = AX_vec[i];
		tb_AP = AP_vec[i];
		end
	@(negedge test_clk);
		monitor;		
end
endtask

task monitor;

	if(tb_APP == APP_vec[i])
	begin
//	`ifdef VERBOSE
	$display("Success:-> Expected: APP_vec[i]=%h, Received: tb_APP=%h", APP_vec[i], tb_APP);
//	`endif
	end

	else
	begin
 	$display("Failed:-> Expected: APP_vec[i]=%h, Received: tb_APP=%h", APP_vec[i], tb_APP);
	`ifdef BREAKONERR
		$stop;
	`endif
	end

endtask

endmodule // end of FILTC
