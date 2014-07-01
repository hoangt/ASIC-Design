
/* ADAP_SPED_CTL_vec_test.v
*
* Module: ADAP_SPED_CTL testbench
*
* Authors:
* Sheenam Jayaswal
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the ADAP_SPED_CTL module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		sj7728		03/28/2014	Module created. 
*
*/



///////////////////////
//Module Declaration //
///////////////////////
module ADAP_SPED_CTL_vec_test ();

///////////////
// Registers //
///////////////
reg
	R,TDP,TR,check_monitor,		//Input signal 2
	delay_clk,
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set
reg [4:0] I;
reg [12:0] Y;
reg [1:0] rate;
///////////
//  ROM  //
///////////

//integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 20000; //ns
integer DELAY_CLK_PERIOD =  2500;

reg [23:0] R_vec [0:19879];	//Input vector 1
reg [23:0] TDP_vec [0:19879];	//Input vector 2
reg [23:0] TR_vec [0:19879];	//Output vector 1
reg [23:0] AL_vec [0:19879];	//Output vector 1
reg [23:0] I_vec [0:19879];	//Output vector 1
reg [23:0] Y_vec [0:19879];	//Output vector 1

integer i;						//Counter used in for loop
///////////
// Wires //
///////////
wire [6:0]
	AL;		//Output signal 1

ADAP_SPED_CTL dut(
	.CLK(delay_clk),
	.I(I),
	.RATE(rate),
	.TDP(TDP),
	.Y(Y),
	.TR(TR),
	.reset(R),
	.AL(AL)
);

////////////////////////////
// Read Test Vector Files //
////////////////////////////
initial begin
	$display("Beginning Vector Test");
	i = 1'b0;
	test_clk = 1'b0;
	law = 1'b0;
	rate= 2'b00;
	new_vector_set = 1'b0;
	R = 1'b0;
	delay_clk = 1'b0;
	check_monitor = 1'b0;
	@(posedge test_clk)
		R = 1'b1;
	@(posedge test_clk)
		R = 1'b0;
	@(posedge test_clk);
// u-law vectors
	rate=2'b11;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
// a-law vectors
	rate=2'b11;
	law=1'b1;
	//Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Test Vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Test Vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Test Vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tr.t", TR_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/r.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	#100  $finish; 
end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end
task test_vectors;
begin
	@(posedge test_clk)
		R = 1'b1;
	@(posedge test_clk)
		R = 1'b0;
	@(posedge test_clk);
	for(i = 0; i <= MEM_ADDR_RANGE - 1; i = i + 1)
	begin
		@(posedge test_clk);
			begin
			I   <= I_vec[i];
	//		tb_R   <= R_vec[i];
			TDP <= TDP_vec[i];
			TR  <= TR_vec[i];
			Y   <= Y_vec[i];
			end
		@(negedge test_clk);
		check_monitor   = 1;
		monitor;		
		@(posedge test_clk);
		check_monitor   = 0;
		repeat (8)
		begin
		@(posedge test_clk)
			delay_clk = 1;
		@(posedge test_clk)
			delay_clk = 0;
		end
		@(posedge test_clk);
	end
end
endtask
//task test_vectors;
//for(i = 0; i <= MEM_ADDR_RANGE -1; i = i +1) begin
//	@(posedge test_clk);
//		I<=I_vec[i];
//		TDP<=TDP_vec[i];
//		Y<=Y_vec[i];
//		TR<=TR_vec[i];
//		R<=R_vec[i];
//	@(negedge test_clk);
//		monitor;
//	end
//endtask



task monitor;
if (AL == AL_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: Y=%h, I=%h: Expected AL=%h, received AL=%h", Y, I, AL_vec[i], AL);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, Y=%h, I=%h: Expected AL=%h, received AL=%h",law, rate,i, Y, I, AL_vec[i], AL);
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
