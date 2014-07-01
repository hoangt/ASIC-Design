

/* ADAP_SPED_CTL_vec_test.v
*
* Module: ADAP_SPED_CTL vector testbench
*
* Authors: Abdullah Zyarah
*
* Description:
* This file 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah	03/27/2014	Module Created.
*
*/

`define VECTOR_BIT_SIZE		 24
`define MEM_ADDR_RANGE		19880
`define CLK_PERIOD		20000
`define DELAY_CLK_PERIOD     	 2500

// Module Declaration
module ADAP_SPED_CTL_vectors_tb ();

///////////////////////////////////////////
// Registers 
//
reg	[4:0]	tb_I;			// ADPCM word, input
reg		tb_R, tb_TDP, tb_TR;
reg	[12:0]	tb_Y;			// Quant. Scale factro, input
reg	[1:0]	tb_rate;
reg	test_clk,			// clk for verification
	delay_clk,			// clk for delay blocks
	testing_alaw,			// == 1 if running alaw vectors
	testing_ulaw,			// == 1 if running ulaw vectors
	check_monitor,			// == 1 if running ulaw vectors
	new_vector_set;			// Toggles high when changing vector set
	

///////////////////////////////////////////
// ROM
// Need one rom per input and output signal
// This is module specific!!
//
  reg [`VECTOR_BIT_SIZE - 1:0] I_vec      [0:`MEM_ADDR_RANGE - 1];			// I  (input) ROM
//reg [`VECTOR_BIT_SIZE - 1:0] R_vec      [0:`MEM_ADDR_RANGE - 1];			// R  (input) ROM
  reg [`VECTOR_BIT_SIZE - 1:0] TDP_vec    [0:`MEM_ADDR_RANGE - 1];			// TDP(input) ROM
  reg [`VECTOR_BIT_SIZE - 1:0] TR_vec     [0:`MEM_ADDR_RANGE - 1];			// TR (input) ROM
  reg [`VECTOR_BIT_SIZE - 1:0] Y_vec      [0:`MEM_ADDR_RANGE - 1];			// Y  (input) ROM
  reg [`VECTOR_BIT_SIZE - 1:0] AL_vec     [0:`MEM_ADDR_RANGE - 1];			// AL (output) ROM



integer i;

///////////////////////////////////////////
// Wires
//
wire	[6:0]	tb_AL;		// APAP_SPED_CTL output

ADAP_SPED_CTL	 top(
		.I(tb_I),
		.reset(tb_R),
		.Y(tb_Y),
		.TDP(tb_TDP),
		.TR(tb_TR),
		.AL(tb_AL),
		.RATE(tb_rate),
		.clk(delay_clk)
	, .test_mode(1'b0), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2('b0), .scan_in3(1'b0), .scan_in4(1'b0)
		 );

	

///////////////////////////////////////////
// 	MAIN CODE
//

initial begin
	tb_R = 1'b0;
	i = 1'b0;
	test_clk = 1'b0;
	delay_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;
	check_monitor = 1'b0;
	tb_rate = 2'b00;
	@(posedge test_clk)
		tb_R = 1'b1;
	@(posedge test_clk)
		tb_R = 1'b0;
	@(posedge test_clk);

// a-law vectors

	testing_ulaw = 1'b1;
	tb_rate = 2'b11;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/al.t", AL_vec);

	

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b10;
	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate = 2'b01;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b00;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;
	tb_rate = 2'b11;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/al.t", AL_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate = 2'b10;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/al.t", AL_vec);


	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate = 2'b01;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/al.t", AL_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate =2'b00;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", I_vec);
//	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/.t", R_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/al.t", AL_vec);


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
begin
	@(posedge test_clk)
		tb_R = 1'b1;
	@(posedge test_clk)
		tb_R = 1'b0;
	@(posedge test_clk);
	for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1)
	begin
		@(posedge test_clk);
			begin
			tb_I   <= I_vec[i];
	//		tb_R   <= R_vec[i];
			tb_TDP <= TDP_vec[i];
			tb_TR  <= TR_vec[i];
			tb_Y   <= Y_vec[i];
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

wire [6:0] tb_AL_vec = AL_vec[i];

task monitor;

	if(tb_AL == AL_vec[i])   // test succeeded 
	begin
//	`ifdef VERBOSE
	$display("Success:-> Expected: AL_vec[%5d]=%h, Received: tb_AL=%h", i, AL_vec[i], tb_AL);
//	`endif
	end


	else				// test failed
	begin
 	$display("Fail:-> Expected: AL_vec[%5d]=%h, Received: tb_AL=%h",i, AL_vec[i], tb_AL);
	`ifdef BREAKONERR
		$stop;
	`endif
	end

endtask

endmodule // end of ADAP_SPED_CTL
