

/* OUT_PCM_vec_test.v
*
* Module: OUT_PCM testbench
*
* Authors:
* Vineeta Singh
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		Vineeta Singh	3/31/14		Created
*
*/


//Module Declaration //

module OUT_PCM_vec_test ();

   // $timeformat(-9,2,"ns", 16);

// Registers //

reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set

reg [15:0] sr;
reg LAW;
reg [14:0] se;
reg [4:0] I;
reg [12:0] Y;
reg [1:0] rate;

//  ROM  //

//integer VECTOR_BIT_SIZE = 24;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; //ns

reg [23:0] sr_vec [0:19879];	//Input vector 1
reg [23:0] LAW_vec [0:19879];	//Input vector 2
reg [23:0] se_vec [0:19879];	//Input vector 3
reg [23:0] I_vec [0:19879];    //Input vector 4
reg [23:0] Y_vec [0:19879];   // Input vector 5
reg [23:0] rate_vec [0:19879]; // Input vector 6
reg [23:0] sd_vec [0:19879];   // OUtput vector 1

reg pass;
integer i;						//Counter used in for loop

// Wires //

wire [7:0] sd;

OUT_PCM dut(
	  .SR(sr),
	  .LAW(law),
	  .SE(se),
	  .I(I),
	  .Y(Y),
	  .RATE(rate),     // rate is there for SYNC module
	  .SD(sd)
);
	 
// Read Test Vector Files //
//
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
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sd.t", sd_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sr.t", sr_vec);
        $readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/y.t", Y_vec);
       	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sd.t", sd_vec);

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
		sr<=sr_vec[i];
		se<=se_vec[i];
		I<=I_vec[i];
		Y<=Y_vec[i];
	@(negedge test_clk);
		monitor;
	end
endtask

task monitor;
if (sd == sd_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: sr=%h, law=%h, sample=%d, se=%h, I=%h, Y=%h, RATE=%h: Expected sd=%h, received sd=%h",sr, law, i, se, I, Y, rate, sd_vec[i],sd);
	`endif
end else begin
	//Test failed
	$display("ERROR: sr=%h, law=%h, sample=%d, se=%h, I=%h, Y=%h, RATE=%h: Expected sd=%h, received sd=%h",sr, law,i, se, I, Y, rate, sd_vec[i],sd);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule


