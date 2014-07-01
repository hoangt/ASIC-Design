
/* ANTILOG_vec_test.v
*
* Module: FMULT testbench
*
* Authors:
* Aishwarya & David Herdzik
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the FMULT module.
*
====================================================================================================
* Revision History:
====================================================================================================
* _Rev #_	_Author(s)_		   _Date_		_Changes_
* -------------------------------------------------------------------------------------------
* 1.00		Aishwarya 		 03/16/2014	     Module created
* 2.00		David Herdzik		 03/21/2014	     Code modified	
  2.10		Sheenam					     Code revision 						      
* 2.11		Aishwarya		 03/29/2014	     Code revision for output                               		
* =============================================================================================
*
*
*
*
*
*
*
*/
///////////////////////
//Module Declaration //
///////////////////////
module ADDA_vec_test ();

///////////////
// Registers //
///////////////
reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [11:0] DQLN;
reg [12:0] Y;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] DQLN_vec [0:19879];	//Input vector 1
reg [23:0] Y_vec [0:19879];	//Input vector 2
reg [23:0] DQL_vec [0:19879];	//Output vector 1
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [11:0]
	DQL;		//Output signal 1

ADDA dut(
	.DQLN(DQLN),
	.Y(Y),
	.DQL(DQL)
);

////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial 
	begin
	$display("Beginning Vector Test");
	i = 1'b0;
	test_clk = 1'b0;
	law = 1'b0;
	rate= 2'b00;
	new_vector_set = 1'b0;
// u-law vectors
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dql.t", DQL_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

/*	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;    //Calls task test_vectors*/	


	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dql.t", DQL_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dql.t", DQL_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dql.t", DQL_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dql.t", DQL_vec);


// u-law vectors




	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;


	//Test Vectors for 24 kb/s
	rate=2'b10;	
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dql.t", DQL_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Test Vectors for 32 kb/s
	rate=2'b01;
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dql.t", DQL_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dqln.t", DQLN_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dql.t", DQL_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	#10  $finish; 
end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;
	for(i = 0; i <= MEM_ADDR_RANGE -1; i = i +1) 
		begin
		@(posedge test_clk);
			DQLN<=DQLN_vec[i];
			Y<=Y_vec[i];
		@(negedge test_clk);
			monitor;
		end
endtask

task monitor;
if (DQL == DQL_vec[i]) begin
	//Test Succesful
//	`ifdef VERBOSE
		$display("Success: DQLN=%h, Y=%h: Expected DQL=%h, received DQL=%h", DQLN, Y, DQL_vec[i], DQL);
//	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, DQLN=%h, Y=%h: Expected DQL=%h, received DQL=%h",law, rate,i, DQLN, Y, DQL_vec[i], DQL);
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
