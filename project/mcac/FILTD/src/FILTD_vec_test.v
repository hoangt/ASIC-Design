/* FILTD_vec_test.v
*
* Module:Testbench_vector
*
* Authors:
* ABHISHEK RAMESH
*
* Description:
* Full testing of FILTB module.
*
* Revision History:
* _Rev #_	_Author(s)_		_Date_		_Changes_
* 1.00		Abhishek Ramesh		03/14/2014	Module started and completed.
* 1.01		Jagan Muralidharan	03/30/2014	Decoder testing added. Works.
* 1.02		Abhishek Ramesh		04/04/2014	BREAKONERR added
*/

`define MEM_ADDR_RANGE	15'h4DA8	//0 to 19880 address
`define CLK_PERIOD	20000

// Module Declaration
module FILTD_vec_test ();

/////////////////////////////////////////////////////////////////////
////////////// Registers ////////////////////////////////////////////

reg [23:0] 		// 24 bit constant field
	vec_WI [0:`MEM_ADDR_RANGE - 1],	// 12 bit 2's complement input
	vec_Y[0:`MEM_ADDR_RANGE - 1],	// 13 bit signed magnitude input 	
	vec_YUT[0:`MEM_ADDR_RANGE - 1];// 13 bit signed magnitude output 	

reg [11:0]
	test_WI;		// For passing vector value to top module

reg [12:0]
	test_Y;

wire [12:0] YUT;

reg
	test_clk,		// clk for verification
	testing_alaw,		// == 1 if running alaw vectors
	testing_ulaw,		// == 1 if running ulaw vectors
	new_vector_set;		// Toggles high when changing vector set

integer i, test_number;


/////////////////// Module definition /////////////////////////

FILTD dut(		//Port Mapping testbench with RTL code
	.WI(test_WI),
	.Y(test_Y),
	.YUT(YUT)
);

//////////////////////////////////////////////////////////////
/////////////////////// Read test Vectors ////////////////////

initial 
   begin
	i = 1'b0;		// Initialize value
	test_number = 1'b0;	// To keep track of test number
	test_clk = 1'b0;	
	testing_alaw = 1'b0;	// Used for a-law
	testing_ulaw = 1'b0;	// Used for u-law
	new_vector_set = 1'b0;	// Toggle bit- Used for indicating reading has completed 


//////////////ENCODER TESTING////////////////////////

///////////////////////// a-law vectors //////////////////////////

	testing_ulaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;		// Calls the task test_vectors
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0;	//End a-law vector testing

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/yut.t", vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/yut.t", vec_YUT);

	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/yut.t", vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/yut.t", vec_YUT);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

//////////////DECODER TESTING////////////////////////

///////////////////////// a-law vectors //////////////////////////

	testing_ulaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;		// Calls the task test_vectors
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/y.t",vec_Y);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/yut.t",vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0;	//End a-law vector testing

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/yut.t", vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/yut.t", vec_YUT);

	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/yut.t", vec_YUT);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/wi.t", vec_WI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/y.t", vec_Y);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/yut.t", vec_YUT);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;




	#100 $finish;

end

////////////////////////////////////////// Clock ////////////////////////////////////////
always 
   begin
	#(`CLK_PERIOD/2) test_clk = ~test_clk;
end


task test_vectors;
for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1) begin
	@(posedge test_clk);
		test_WI = vec_WI[i];
		test_Y = vec_Y[i];
	@(negedge test_clk);
		monitor;		
	end
endtask

task monitor;
begin		//Compare DUT ouput vs Output vector
if (vec_YUT[i] !== YUT)
   begin
	$display("Failed:-> Test %d at %t , Expected: vec_YUT[i] =%h, Received: YUT=%h", test_number, $time, vec_YUT[i], YUT);
	`ifdef BREAKONERR
		$stop
	`endif
   end

else 
   begin
	`ifdef VERBOSE 
	$display("Success:-> Test %d at %t, Expected: vec_YUT[i]=%h, Received: YUT=%h", test_number, $time, vec_YUT[i], YUT);
	`endif
   end
	test_number = test_number+1;	
end
endtask

endmodule // end of FILTD_vec_test


