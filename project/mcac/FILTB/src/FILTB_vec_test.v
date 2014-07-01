/* FILTB_vec_test.v
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
* 1.00		Abhishek Ramesh		03/12/2014	Module started.
* 1.01		Abhishek Ramesh 	03/14/2014	Code completed.
* 1.02		Abhishek Ramesh		04/04/2014	VERBOSE and BREAKONERR
*
*/

`define MEM_ADDR_RANGE	15'h4DA8	//0 to 19880 address 
`define CLK_PERIOD	20000

// Module Declaration
module FILTB_vec_test ();

/////////////////////////////////////////////////////////////////////
////////////// Registers ////////////////////////////////////////////

reg [23:0] 		// 24 bit constant field
	vec_FI [0:`MEM_ADDR_RANGE - 1],	// 3 bit signed magnitude input
	vec_DML[0:`MEM_ADDR_RANGE - 1],	// 14bit signed magnitude input 	
	vec_DMLP[0:`MEM_ADDR_RANGE - 1];// 14bit signed magnitude output 	

reg [2:0]
	test_FI;		// For passing vector value to top module

reg [13:0]
	test_DML;

wire [13:0] DMLP;

reg
	test_clk,		// clk for verification
	testing_alaw,		// == 1 if running alaw vectors
	testing_ulaw,		// == 1 if running ulaw vectors
	new_vector_set;		// Toggles high when changing vector set

integer i, test_number;


/////////////////// Module definition /////////////////////////

FILTB dut(		//Port Mapping testbench with RTL code
	.FI(test_FI),
	.DML(test_DML),
	.DMLP(DMLP)
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

// a-law vectors

	testing_ulaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dml.t",vec_DML);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dmlp.t",vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;		// Calls the task test_vectors
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dmlp.t",vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dmlp.t",vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dmlp.t",vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0;	//End a-law vector testing

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dmlp.t", vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dmlp.t", vec_DMLP);

	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dmlp.t", vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/fi.t", vec_FI);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dml.t", vec_DML);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dmlp.t", vec_DMLP);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

end

//////////////////////// Clock //////////////////////////////
always 
   begin
	#`CLK_PERIOD test_clk = ~test_clk;
end


task test_vectors;
for(i = 0; i <= 15'h4DA7; i = i + 1)
begin
	@(posedge test_clk);
		test_FI = vec_FI[i];
		test_DML = vec_DML[i];
	@(negedge test_clk);
		monitor;		
	end
endtask

task monitor;		//Compare DUT ouput vs Output vector
if (vec_DMLP[i] !== DMLP)
   begin
	$display("Failed:-> Test %d at %t , Expected: DMLP_vec[i] =%h, Received: DMLP=%h", test_number, $time, vec_DMLP[i], DMLP);
	`ifdef BREAKONERR
		$stop;
	`endif
	end

else 
   begin
     `ifdef VERBOSE
	$display("Success:-> Test %d at %t, Expected: DMLP_vec[i]=%h, Received: DMLP=%h", test_number, $time, vec_DMLP[i], DMLP);
     `endif
	test_number = test_number+1;
   end
endtask

endmodule // end of FILTB_vec_test

