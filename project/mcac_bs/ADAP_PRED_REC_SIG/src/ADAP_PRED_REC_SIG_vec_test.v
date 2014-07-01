/* ADAP_PRED_REC_SIG_vec_test.v
* 
* Module: ADAP_PRED_REC_SIG vector testbench
*
* Author(s):R Paul Hoops
*
* Description:
* This file uses C-code generated vectors to verify the operation of
* ADAP_PRED_REC_SIG.v.
* The operation of ADAP_PRED_REC_SIG is defined on page 36 of the CCITT
* 
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0.0		rph6644		03/31/2014	Module Created.
* 1.0.1		rph6644		04/02/2014	Removed SEZ in accordance with
* rev 1.0.4 of source code, minor syntax fixes.
* 1.1.0         mgp6782         04/11/2014      Fixed the triggering and clocking of FMULT_ACCUM.
*
*/

`define VECTOR_BIT_SIZE		24
`define MEM_ADDR_RANGE		19880
`define CLK_PERIOD		1000
`define SYSCLK_PERIOD	        25

//Module Declaration
module ADAP_PRED_REC_SIG_vec_test ();

///////////////
// Registers //
///////////////

reg[15:0]
	tb_DQ;
reg[1:0]
	tb_rate;	//2 bit rate vector
reg
        tb_R,
	tb_TR,
        tb_start_trig,
        tb_sysclk,
	test_clk,
	delay_clk,
	testing_alaw,
	testing_ulaw,
	check_monitor,
	new_vector_set;

//////////////////////////////////////////////
// ROM                                      //
// Need one ROM per input and output signal //
// This is module specific!                 //
//////////////////////////////////////////////
reg[`VECTOR_BIT_SIZE -1:0]	DQ_vec	[0:`MEM_ADDR_RANGE - 1];	//DQ(input) ROM
reg[`VECTOR_BIT_SIZE -1:0]	TR_vec	[0:`MEM_ADDR_RANGE - 1];	//TR(input) ROM
reg[`VECTOR_BIT_SIZE -1:0]	SE_vec	[0:`MEM_ADDR_RANGE - 1];	//SE(output) ROM
reg[`VECTOR_BIT_SIZE -1:0]	A2_vec	[0:`MEM_ADDR_RANGE - 1];	//A2(output) ROM
reg[`VECTOR_BIT_SIZE -1:0]	SR_vec	[0:`MEM_ADDR_RANGE - 1];	//A2(output) ROM

reg[`VECTOR_BIT_SIZE -1:0]	A1_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	B1_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	B2_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	B3_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	B4_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	B5_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	B6_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	DQ1_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	DQ2_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	DQ3_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	DQ4_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	DQ5_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	DQ6_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	SR1_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM
reg[`VECTOR_BIT_SIZE -1:0]	SR2_vec	[0:`MEM_ADDR_RANGE - 1];	//intermediate ROM

integer i;

///////////
// Wires //
///////////
wire[14:0]
	tb_SE;		//Signal Estimate
wire[15:0] tb_A2;		//Delayed predictor second order coefficient
wire	tb_done;
wire [15:0]	tb_SR;

wire test_mode, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4;
assign test_mode=1'b0;
assign scan_enable=1'b0;
assign scan_in0=1'b0;
assign scan_in1=1'b0;
assign scan_in2=1'b0;
assign scan_in3=1'b0;
assign scan_in4=1'b0;



///////////////////////////////////
// Unit Under Test Instantiation //
///////////////////////////////////

ADAP_PRED_REC_SIG	top(
			.DQ(tb_DQ),
			.RATE(tb_rate),
			.clk(tb_sysclk),
			.dly_strb(delay_clk),
			.reset(tb_R),
			.TR(tb_TR),
			.start_trig(tb_start_trig),
			.SE(tb_SE),
			.A2(tb_A2),
			.SR(tb_SR),
			.done(tb_done),
			.test_mode(test_mode),
			.scan_enable(scan_enable),
			.scan_in0(scan_in0),
			.scan_in1(scan_in1),
			.scan_in2(scan_in2),
			.scan_in3(scan_in3),
			.scan_in4(scan_in4)
			);

///////////////
// Main Code //
///////////////


initial
begin
    	tb_R = 1'b0;
	i = 1'b0;
        tb_sysclk = 1'b0;
	test_clk = 1'b0;
	delay_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;
	check_monitor = 1'b0;
	tb_rate = 2'b00;
        tb_start_trig = 1'b0;
	@(posedge test_clk)
		tb_R = 1'b1;
	@(posedge test_clk)
		tb_R = 1'b0;
	@(posedge test_clk);

// a-law vectors

	testing_ulaw = 1'b1;
	tb_rate = 2'b11;
	
	//First Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sr.t", SR_vec);

	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/a1.t", A1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/b1.t", B1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/b2.t", B2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/b3.t", B3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/b4.t", B4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/b5.t", B5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/b6.t", B6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq1.t", DQ1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq2.t", DQ2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq3.t", DQ3_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq4.t", DQ4_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq5.t", DQ5_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq6.t", DQ6_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sr1.t", SR1_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/sr2.t", SR2_vec);



	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b10;
	
	//Second Set of Test Vectors : 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b01;
	
	//Third Set of Test Vectors : 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b00;
	
	//Fourth Set of Test Vectors : 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	testing_alaw = 1'b0;

//u-law vectors

	testing_ulaw = 1'b1;
	tb_rate = 2'b11;
	
	//Fifth Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b10;
	
	//Sixth Set of Test Vectors : 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b01;
	
	//Seventh Set of Test Vectors : 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/sr.t", SR_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b00;
	
	//Eighth Set of Test Vectors : 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq.t", DQ_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tr.t", TR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/a2p.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/sr.t", SR_vec);


	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	testing_ulaw = 1'b0;

	$finish;

end

always begin
	#(`CLK_PERIOD/2) test_clk = ~test_clk;
        #(`SYSCLK_PERIOD/2) tb_sysclk = ~tb_sysclk;
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
				tb_DQ=DQ_vec[i];
				tb_TR=TR_vec[i];
                                @(posedge tb_sysclk);
                                tb_start_trig = 1'b1;
                                @(posedge tb_sysclk);
                                tb_start_trig = 1'b0;
			end
		@(negedge test_clk);
                        repeat(150)
                          @(posedge tb_sysclk);
			check_monitor   = 1;
			monitor;		
//			$display("A1=%h vs %h",top.A1, inter[i]);
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

task monitor;
	if(tb_A2 !== A2_vec[i] || tb_SR !== SR_vec[i]) begin	//Test failed for A2
	$display("FAILURE on %d:Case DQ= %h, RATE= %b:Expected A2= %h, Received A2= %h", i, tb_DQ, tb_rate, A2_vec[i], tb_A2);
	//`ifdef BREAKONERR
		$stop;
	//`endif
	end else if(tb_SE !== SE_vec[i]) begin	//Test failed for SE
	$display("FAILURE on %d:Case DQ= %h, RATE= %b:Expected SE= %h, Received SE= %h", i, tb_DQ, tb_rate, SE_vec[i], tb_SE);
	$display("A1: %h vs %h. A2: %h vs %h. B1: %h vs %h B2: %h vs %h. B3: %h vs %h. B4: %h vs %h. B5: %h vs %h. B6: %h vs %h. DQ1: %h vs %h. DQ2: %h vs %h. DQ3: %h vs %h. DQ4: %h vs %h. DQ5: %h vs %h. DQ6: %h vs %h. SR1: %h vs %h. SR2: %h vs %h.",top.A1,A1_vec[i],top.A2,A2_vec[i],top.B1,B1_vec[i],top.B2,B2_vec[i],top.B3,B3_vec[i],top.B4,B4_vec[i],top.B5,B5_vec[i],top.B6,B6_vec[i],top.DQ1,DQ1_vec[i],top.DQ2,DQ2_vec[i],top.DQ3,DQ3_vec[i],top.DQ4,DQ4_vec[i],top.DQ5,DQ5_vec[i],top.DQ6,DQ6_vec[i],top.SR1,SR1_vec[i],top.SR2,SR2_vec[i]);
	//`ifdef BREAKONERR
		$stop;
	//`endif
	end else begin
	`ifdef VERBOSE
		$display("SUCCESS: Case DQ= %h, RATE= %b: SE= %h, A2= %h (expected %h %h)", tb_DQ, tb_rate, tb_SE, tb_A2, SE_vec[i], A2_vec[i]);
	`endif
	end


endtask


endmodule // End of ADAP_PRED_REC_SIG vector test
