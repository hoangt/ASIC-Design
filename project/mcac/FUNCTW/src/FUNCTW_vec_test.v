/* FUNCTW_vec_test.v
*
* Module:Testbench_vector
*
* Authors:
* Manoj kodali
*
* Description:
* Full testing of FUNCTW module.
*
* Revision History:
* _Rev #_	_Author(s)_		_Date_		_Changes_
* 1.00		Manoj kodali		03/16/2014	Module started.
* 1.01		Manoj kodali 	        03/17/2014	Code completed.
*/

`define MEM_ADDR_RANGE	15'h4DA8	//0 to 19880 address 
`define CLK_PERIOD	20000

// Module Declaration
module FUNCTW_vec_test ();

/////////////////////////////////////////////////////////////////////
////////////// Registers ////////////////////////////////////////////

reg [23:0] 		// 24 bit constant field
	vec_I [0:`MEM_ADDR_RANGE - 1],	// 5 bit signed magnitude input
	vec_RATE[0:`MEM_ADDR_RANGE - 1],	// 2bit signed magnitude input 	
	vec_WI[0:`MEM_ADDR_RANGE - 1];// 12bit signed magnitude output 	

reg [4:0]
	test_I;		// For passing vector value to top module

reg [1:0]
	rate;

wire [11:0] WI;

reg
	test_clk,		// clk for verification
	testing_alaw,		// == 1 if running alaw vectors
	testing_ulaw,		// == 1 if running ulaw vectors
	new_vector_set;		// Toggles high when changing vector set

integer i, test_number;


/////////////////// Module definition /////////////////////////

FUNCTW dut(		//Port Mapping testbench with RTL code
	.I(test_I),
	.RATE(rate),
	.WI(WI)
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
                rate = 2'b00;
	new_vector_set = 1'b0;	// Toggle bit- Used for indicating reading has completed 

// a-law vectors

	testing_ulaw = 1'b1;
                rate = 2'b11;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", vec_I);
	//$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/rate.t",vec_RATE);	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/wi.t",vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;		// Calls the task test_vectors
	         rate = 2'b10;
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", vec_I);
	//$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/wi.t",vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
               rate = 2'b01;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", vec_I);
	//$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/wi.t",vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
          rate = 2'b00;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", vec_I);
	//$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/wi.t",vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0;	//End a-law vector testing

// u-law vectors

	testing_ulaw = 1'b1;
         rate        = 2'b11;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", vec_I);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/wi.t", vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
        rate = 2'b10;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", vec_I);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/wi.t", vec_WI);

	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
        rate = 2'b01;
	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", vec_I);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/wi.t", vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
         rate = 2'b00;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", vec_I);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/rate.t", vec_RATE);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/wi.t", vec_WI);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;
#100 $finish;

end

//////////////////////// Clock //////////////////////////////
always 
   begin
	#`CLK_PERIOD test_clk = ~test_clk;
end


task test_vectors;
for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1) begin
	@(posedge test_clk);
		test_I = vec_I[i];
	//	test_RATE = vec_rate[i];
	@(negedge test_clk);
		monitor;		
	end
endtask

task monitor;		//Compare DUT ouput vs Output vector
if (vec_WI[i] != WI)
   begin
	$display("Failed:-> Test %d at %t , Expected: WI_vec[i] =%h, Received: WI=%h", test_number, $time, vec_WI[i], WI);
		$stop;
	end

else 
   begin
	$display("Success:-> Test %d at %t, Expected: WI_vec[i]=%h, Received: WI=%h", test_number, $time, vec_WI[i], WI);
	test_number = test_number+1;
   end
endtask

endmodule // end of FUNCTW_vec_test
