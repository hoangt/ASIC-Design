/* DELAY_vec_test.v
*
* Module: DELAY VECTOR testbench
*
* Authors: Abdullah Zyarah + Ravi
*
* Description:
* This file 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah+Ravi	03/27/2014	Module Created.
*/

`define VECTOR_BIT_SIZE 24
`define MEM_ADDR_RANGE	19880
`define CLK_PERIOD	20000

// Module Declaration
module DELAY_vec_test ();

	parameter WIDTH = 24;


		 

///////////////////////////////////////////
// Registers 
//
reg	[WIDTH-1:0]	tb_x;			//  input
reg			tb_R = 0, tb_clk;		//  input
reg	test_clk,				//clk for verification
	testing_alaw,				// == 1 if running alaw vectors
	testing_ulaw,				// == 1 if running ulaw vectors
	new_vector_set;				// Toggles high when changing vector set
reg 	scan_enable;	
reg 	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4;


///////////////////////////////////////////
// ROM
// Need one rom per input and output signal
// This is module specific!!
  reg [`VECTOR_BIT_SIZE - 1:0] x_vec       [0:`MEM_ADDR_RANGE - 1];			// x (input) ROM
//reg [`VECTOR_BIT_SIZE - 1:0] R_vec       [0:`MEM_ADDR_RANGE - 1];			// R (input) ROM
  reg [`VECTOR_BIT_SIZE - 1:0] y_vec       [0:`MEM_ADDR_RANGE - 1];			// y (output) ROM

integer i;

///////////////////////////////////////////
// Wires
//
wire	[WIDTH-1:0]	tb_y;			// DELAY output
wire	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;

DELAY	 top(
	.x(tb_x),
	.reset(tb_R),
	.clk(tb_clk),
	.y(tb_y),
	.scan_enable(scan_enable),
	.scan_in0(scan_in0),
	.scan_in1(scan_in1),
	.scan_in2(scan_in2),
	.scan_in3(scan_in3),
	.scan_in4(scan_in4),
	.scan_out0(scan_out0),
	.scan_out1(scan_out1),
	.scan_out2(scan_out2),
	.scan_out3(scan_out3),
	.scan_out4(scan_out4)
);

	defparam top.WIDTH=24;
	
	

///////////////////////////////////////////
// 	MAIN CODE
//

initial begin
	i = 1'b0;
	test_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;
	scan_enable = 1'b0;
	scan_in0 = 1'b0;
	scan_in1 = 1'b0;
	scan_in2 = 1'b0;
	scan_in3 = 1'b0;
	scan_in4 = 1'b0;

// a-law vectors

	testing_ulaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/fi.t", y_vec);
	

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/fi.t", y_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/fi.t", y_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/fi.t", y_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/fi.t", y_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/fi.t", y_vec);


	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/fi.t", y_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/fi.t", x_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dms.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/fi.t", y_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;
	
	$finish;

end

always begin
	#`CLK_PERIOD test_clk = ~test_clk;
		     tb_clk= test_clk;
end

task test_vectors;
for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1)
begin
	@(posedge test_clk);
		begin
		tb_x <= x_vec[i];
//		tb_R <= R_vec[i];
		end
	@(negedge test_clk);
		monitor;		
end
endtask

task monitor;
<<<<<<< HEAD
if(i>= 8)begin

=======
    if (i >= 8) begin
>>>>>>> 02f7da96718de080696f6e2627e9ed8b0eecd81f
	if(tb_y == y_vec[i-8])   // test successful
	begin
//	`ifdef VERBOSE
	$display("Success:-> Expected: y_vec[i]=%h, Received: tb_y=%h", y_vec[i-8], tb_y);
//	`endif
	end


	else				// test failed
	begin
 	$display("Failed:-> Expected: y_vec[i]=%h, Received: tb_y=%h", y_vec[i-8], tb_y);
	`ifdef BREAKONERR
		$stop;
	`endif
	end
<<<<<<< HEAD
end

=======
    end
>>>>>>> 02f7da96718de080696f6e2627e9ed8b0eecd81f
endtask

endmodule // end of FILTA
