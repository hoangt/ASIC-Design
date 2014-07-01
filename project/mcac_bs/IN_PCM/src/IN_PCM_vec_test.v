/* IN_PCM_vec_test.v
*
* Module:Test verification of Input PCM format conversion
*
* Authors:
* ABHISHEK RAMESH
*
* Description:
* Verifies input PCM module by comparing the vectors from C model to the
* output of our module
*
* Revision History:
* _Rev #_	_Author(s)_		_Date_		_Changes_
* 1.00		Abhishek Ramesh		03/31/2014	Module started & Completd.
* 1.01		Abhishek_Ramesh		04/04/2014	BREAKONERR added
* 1.02		Abhishek_Ramesh		04/06/2014	Added SE input
* 
*/

`define MEM_ADDR_RANGE  15'd19880	//0 to 19880 address
`define CLK_PERIOD  1000	 	//in ns

////////////////////////// Module declaration //////////////////
module IN_PCM_vec_test();

reg
test_clk,	//clock for verification
new_vector_set;	// Toggles high when changing vector set

reg [7:0] S;	// For passing vector value to top module
reg [14:0] SE;
reg LAW;
wire [15:0] D; 

reg [23:0] 		// 24 bit constant field- Input and output vectors
	S_vec [0:`MEM_ADDR_RANGE - 1],	// 8 bit 2's complement input	
	D_vec[0:`MEM_ADDR_RANGE - 1],	// 16 bit signed magnitude output 
	SE_vec[0:`MEM_ADDR_RANGE - 1];	

reg pass;
integer i, test_number;	

//////////////////////// Module Definition ////////////////////

IN_PCM dut(
.S(S),
.SE(SE),
.LAW(LAW),
.D(D)
);

//////////////////////////////////////////////////////////////
/////////////////////// Read test Vectors ////////////////////
initial begin
$display("Beginning Vector Test");
pass=1'b1;
test_clk = 1'b0;
LAW = 1'b0;
new_vector_set = 1'b0;

///////////////////////// u-law vectors //////////////////////////

//Test Vectors for 16 kb/s
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;

	
//Test Vectors for 24 kb/s
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;


//Test Vectors for 32 kb/s
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;


//Test Vectors for 40 kb/s
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;

/////////////////////////////// a-law vectors /////////////////////////////////

LAW=1'b1;
//Test Vectors for 16 kb/s
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;

	
//Test Vectors for 24 kb/s
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;


//Test Vectors for 32 kb/s
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;


//Test Vectors for 40 kb/s
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/d.t", D_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/pcm.t", S_vec);
$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/se.t", SE_vec);

new_vector_set = 1'b1;
@(posedge test_clk);
new_vector_set = 1'b0;
test_vectors;
if (pass==1'b1) begin
$display("************ ALL VECTORS PASSED ***************");
end
#100 $finish;
end


////////////////////////////////////////// Clock ////////////////////////////////////////
always 
   begin
	#(`CLK_PERIOD/2) test_clk = ~test_clk;
end

////////////////////////////////////// Begin testing /////////////////////
task test_vectors;
for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1)
	begin
	@(posedge test_clk);
		S = S_vec[i];
		SE = SE_vec[i];
	@(negedge test_clk);
		monitor;		
	end
endtask

task monitor;		//Compare DUT ouput vs Output vector
if (D_vec[i] !== D)
   begin
	$display("Failed:-> Test %d at %t , LAW =%b, Expected: D_vec[i] =%h, Received: D=%h", test_number, $time, LAW, D_vec[i], D);
	pass=1'b0;
	`ifdef BREAKONERR
		$stop
	`endif
   end

else 
   begin
	`ifdef VERBOSE 
	$display("Success:-> Test %d at %t, LAW =%b, Expected: D_vec[i]=%h, Received: D=%h", test_number, $time, LAW, D_vec[i], D);
	`endif
	test_number = test_number+1;	
   end
endtask

endmodule // end of IN_PCM_vec_test
