/* TON_TRAN_DET_vec_test.v
*
* Authors:
* Chethana Dilip
*
* Description:
* Vector testbecnh for TON_TRAN_DET
* 
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Chethana	03/31/2014	Module created
*/

// Module Declaration
module TON_TRAN_DET_vectors_tb ();

///////////////////////////////////////////
// Registers 
//
integer VECTOR_BIT_SIZE		=24;
integer MEM_ADDR_RANGE		=19880;
integer CLK_PERIOD		=20000;
integer DELAY_CLK_PERIOD     	 =2500;


reg [15:0] A2P;
reg [18:0] YL;
reg [15:0] DQ;
reg 	   R;
reg	test_clk,               //clk for verification
	delay_clk,              //clk for delay blocks
	testing_alaw,		// == 1 if running alaw vectors
	testing_ulaw,		// == 1 if running ulaw vectors
	check_monitor,           // == 1 if running ulaw vectors
	new_vector_set,		// Toggles high when changing vector set
	testing_encoder,
	testing_decoder;

///////////////////////////////////////////
// ROM
// Need one vector array per input and output signal
// This is module specific!!


reg [23:0] A2P_vec [0:19879];
reg [23:0] TR_vec [0:19879];
reg [23:0] R_vec [0:19879];
reg [23:0] YL_vec [0:19879];
reg [23:0] DQ_vec [0:19879];
reg [23:0] TDP_vec [0:19879];

integer i;

///////////////////////////////////////////
// Wires
//
wire TR; 
wire TDP;                //TON_TRAN_DET output

TON_TRAN_DET top(
	.A2P(A2P),
	.TR(TR),
	.reset(R),
	.YL(YL),
	.DQ(DQ),
	.TDP(TDP),
	.clk(delay_clk)
	, .test_mode(1'b0), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2('b0), .scan_in3(1'b0), .scan_in4(1'b0)
	
);

///////////////////////////////////////////
// LOGIC 
//

initial begin
	i = 1'b0;
	R = 1'b0;
	test_clk = 1'b0;
	delay_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;
	check_monitor = 1'b0;
	@(posedge test_clk)
		R = 1'b1;
	@(posedge test_clk)
		R = 1'b0;
	@(posedge test_clk);


/**********************
* Encoder Testing
**********************/

testing_encoder = 1'b1;


// a-law Vector Tests


	testing_alaw = 1'b1;
	
 	$display("alaw+r=16");
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tr.t", TR_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
 	$display("alaw+r=24");
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tr.t", TR_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

 	$display("alaw+r=32");
	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tdp.t", TDP_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tr.t", TR_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

 	$display("alaw+r=40");
	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tdp.t", TDP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;

 	$display("ulaw+r=16");
	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tdp.t", TDP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	
 	$display("ulaw+r=24");
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tdp.t", TDP_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

 	$display("ulaw+r=32");
	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tdp.t", TDP_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

 	$display("ulaw+r=40");
	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tdp.t", TDP_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

testing_encoder = 1'b0;


/**********************
* Decoder Testing
**********************/
/*
testing_decoder = 1'b1;

// a-law Vector Tests

	testing_alaw = 1'b1;
	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/dq.t", DQ_vec);

	

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	//Second Set of Test Vectors: 24 kb/s	
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/dq.t", DQ_vec);

	

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/dq.t", DQ_vec);



	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/dq.t", DQ_vec);



	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_alaw = 1'b0;

// u-law vectors

	testing_ulaw = 1'b1;

	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/dq.t", DQ_vec);
	


	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/dq.t", DQ_vec);
	

	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/dq.t", DQ_vec);
	


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/yl.t", YL_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/dq.t", DQ_vec);
	


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;

testing_decoder = 1'b0;
*/
$finish;
end

always begin
	#CLK_PERIOD test_clk = ~test_clk;
end

task test_vectors;
begin

	@(posedge test_clk)
		R = 1'b1;
	@(posedge test_clk)
		R = 1'b0;
	@(posedge test_clk);

	for(i = 0; i < MEM_ADDR_RANGE - 1; i = i + 1) 
	begin

	@(posedge test_clk);
	begin
	A2P <= A2P_vec[i];
	YL <= YL_vec[i];
	DQ <= DQ_vec[i];
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

wire TDP_vec_val = TDP_vec[i] ;
wire TR_vec_val = TR_vec[i] ;
reg FAIL ;

task monitor;

	if((TDP == TDP_vec[i]) && (TR == TR_vec[i]))   // test succeeded 
	//if(TR == TR_vec[i]) 
	begin
//	`ifdef VERBOSE
//	$display("Success:-> Expected: TR_vec[%d]=%h, Received: TR=%h", i, TR_vec[i], TR);
//	`endif
	end


	else				// test failed
	begin
//	@(posedge test_clk);
	FAIL = 1;
 	$display("Fail:->Expected: TDP_vec[%d]=%h, Received: TDP=%h",i, TDP_vec[i], TDP);
//	`ifdef BREAKONERR
//		$stop;
//	`endif
//	@(posedge test_clk);
	FAIL = 0;
	end

endtask

endmodule // end of TON_TRAN_DET_vec
