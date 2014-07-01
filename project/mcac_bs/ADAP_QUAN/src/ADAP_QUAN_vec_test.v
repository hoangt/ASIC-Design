

/* ADAP_QUAN_vec_test.v
*
* Module: ADAP_QUAN testbench
*
* Authors:
* DAVE HERDZIK
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the SYNC module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		Drh4327		3/30/14		Created
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module ADAP_QUAN_vec_test ();

   // $timeformat(-9,2,"ns", 16);
///////////////
// Registers //
///////////////
reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [15:0] d;
reg [12:0] y;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 24;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] d_vec [0:19879];	//Input vector 1
reg [23:0] y_vec [0:19879];	//Input vector 2
reg [23:0] I_vec [0:19879];	//Output vector 1

reg pass;
integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [4:0] I;


ADAP_QUAN dut(
	.D(d),
	.Y(y),
	.RATE(rate),		//rate needs to be added to SYNC
	.I(I)
);

////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial begin
	$display("Beginning Vector Test");
	pass=1'b1;
	i = 1'b0;
	test_clk = 1'b0;
	law = 1'b0;
	rate= 2'b00;
	new_vector_set = 1'b0;
// u-law vectors
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", I_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	if (pass==1'b1) begin
		$display("************     ALL VECTORS PASSED     ***************");
	end
	#100  $finish; 
end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;
for(i = 0; i <= MEM_ADDR_RANGE -1; i = i +1) begin
	@(posedge test_clk);
		d<=d_vec[i];
		y<=y_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (I == I_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: LAW=%h, RATE=%h, sample=%d, d=%h, y=%h: Expected I=%h, received I=%h",law, rate,i, d, y, I_vec[i],I);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, d=%h, y=%h: Expected I=%h, received I=%h",law, rate,i, d, y, I_vec[i],I);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
