/* enc_vec_test.v
*
* Module: enc vector testbench
*
* Authors: Abdullah Zyarah
*
* Description:
* This file 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah	04/9/2014	Module Created.
* 1.01          Chethana        04/11/2014      modified test bench
* 1.02		Levs/Aishwarya	04/25/2014	Changed the Clock timings
*
*/

`define VECTOR_BIT_SIZE		 24
`define MEM_ADDR_RANGE		19880
`define SYS_CLK_PERIOD          25      //minimum safe period //500
`define CHANNEL_CLK_PERIOD	15625	//Channel Clock period // 125
//`define FRAME_SYNC_CLK		15625   // Frame sync period

// Module Declaration
module enc_vector_tb ();

///////////////////////////////////////////
// Registers 
//
reg   [7:0]	s;			//
reg   [1:0]   	RATE;
reg	      	LAW;
reg           	reset;                  // active HIGH reset
reg		testing_alaw;			// == 1 if running alaw vectors

reg		test_mode	= 1'b0;
reg		scan_enable	= 1'b0;
reg		scan_in0	= 1'b0;
reg		scan_in1	= 1'b0;
reg		scan_in2	= 1'b0;
reg		scan_in3	= 1'b0;
reg		scan_in4	= 1'b0;

reg	[2:0]	channel_count	= 0;

integer i;
///////////////////////////////////////////
// Wires
//
wire	[7:0]	I;		//

wire		scan_out0,
		scan_out1,
		scan_out2,
		scan_out3,
		scan_out4;

///////////////////////////////////////////
// clock signals
reg	      	sysclk      = 1'b0;
reg         	channel_clock = 1'b0;
reg           	frame_sync = 1'b0;

wire            tb_enc_i_clk, tb_enc_i_fs, error;
////////////////////////////////////////////////////
// Module Instantiations
// 
enc top(	
	.clk(sysclk),
        .reset(reset),
	.RATE(RATE),
	.law(LAW),
	.enc_error(error),
	.enc_s(s),		//reg input PCM codeword
        .enc_s_clk(channel_clock),
        .enc_s_fs(frame_sync),
	.enc_i_clk(tb_enc_i_clk),
        .enc_i_fs(tb_enc_i_fs),
	.enc_i(I),
        .test_mode(test_mode),
	.scan_in0(scan_in0), .scan_in1(scan_in1), .scan_in2(scan_in2), .scan_in3(scan_in3), .scan_in4(scan_in4), 
	.scan_out0(scan_out0), .scan_out1(scan_out1), .scan_out2(scan_out2), .scan_out3(scan_out3), .scan_out4(scan_out4),
	.scan_enable(scan_enable)

    );


///////////////////////////////////////////
// ROM
// Need one rom per input and output signal
// This is module specific!!
//
  reg [`VECTOR_BIT_SIZE - 1:0] s_vec      [0:`MEM_ADDR_RANGE - 1];			// PCM  (input) ROM
  reg [`VECTOR_BIT_SIZE - 1:0] I_vec      [0:`MEM_ADDR_RANGE - 1];			// TDP(input) ROM

/////////////////////////////////////////////////////
// Generate Clocks and FSYNC
// 
always  #(`SYS_CLK_PERIOD/2)  		sysclk    = ~sysclk;
always	#(`CHANNEL_CLK_PERIOD/2)	channel_clock = ~channel_clock;
always @(posedge channel_clock or posedge reset) 
begin	
  if (reset)
    channel_count = 3'd0;
  else
    if (channel_count == 3'b000)
      frame_sync = 1'b1;
    else
      frame_sync = 1'b0; 
    channel_count = channel_count + 1;
end

///////////////////////////////////////////
// 	MAIN CODE
//

initial begin
	RATE = 2'b00;
	reset =1'b1;
	i = 0;
	s = 8'h00;
	LAW = 1'b0;
	//@(posedge channel_clock);
	//reset = 1'b0;
	//@(posedge sysclk);
	//reset = 1'b1;
	//@(posedge channel_clock);
	

// a-law vectors
        //reset = 1'b0;
	LAW = 1'b1;
	RATE = 2'b11;
	
	//First Set of Test Vectors for 16 kb/s
        $display("** Starting 16 kb/s alaw test...");
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/pcm.t", s_vec);
	
	test_vectors;
	RATE= 2'b10;
	
	//Second Set of Test Vectors: 24 kb/s
        $display("** Starting 24 kb/s alaw test...");
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/pcm.t", s_vec);


	test_vectors;
	RATE = 2'b01;

	//Third Set of Test Vectors: 32 kb/s
        $display("** Starting 32 kb/s alaw test...");
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/pcm.t", s_vec);


	test_vectors;
	RATE= 2'b00;

	//Fourth Set of Test Vectors: 40 kb/s
        $display("** Starting 40 kb/s alaw test...");
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/pcm.t", s_vec);


	test_vectors;

	testing_alaw = 1'b0;

// u-law vectors

	LAW = 1'b0;

	RATE = 2'b11;

	//Second Set of Test Vectors: 16 kb/s
        $display("** Starting 16 kb/s ulaw test...");
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/pcm.t", s_vec);


	test_vectors;
	RATE = 2'b10;

	//Second Set of Test Vectors: 24 kb/s
        $display("** Starting 24 kb/s ulaw test...");
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/pcm.t", s_vec);


	test_vectors;
	RATE = 2'b01;

	//Second Set of Test Vectors: 32 kb/s
        $display("** Starting 32 kb/s ulaw test...");
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/pcm.t", s_vec);



	test_vectors;
	RATE =2'b00;

	//Second Set of Test Vectors: 40 kb/s
        $display("** Starting 40 kb/s ulaw test...");
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/pcm.t", s_vec);
	


	test_vectors;
        $display("** Tests complete. Exiting testbench.");	
	#100 $finish;

end

task test_vectors;
begin
	//@(posedge sysclk)
	//	reset = 1'b1;
	//@(posedge sysclk)
	//	reset = 1'b0;
	@(posedge sysclk);

        reset = 1'b0;
	@(posedge sysclk);
	for(i = 0; i <= `MEM_ADDR_RANGE - 1; i = i + 1)
	begin
		@(posedge channel_clock);
		s <= s_vec[i];
	//	@(negedge  channel_clock);
	//	monitor;
		Encoder_check;
		repeat (7)
		begin
			@(posedge channel_clock)
                        	s <= 8'd0;
		end
	end
	reset = 1'b1;
end
endtask



/*task monitor;

	if(I == I_vec[i])   // test succeeded 
	begin
	`ifdef VERBOSE
	$display("Success:-> Expected: I_vec[%5d]=%h, Received: I=%h", i, I_vec[i], I);
	`endif
	end


	else				// test failed
	begin
 	$display("Fail:-> Expected: I_vec[%5d]=%h, Received: I=%h",i, I_vec[i], I);
	`ifdef BREAKONERR
	$stop;
	`endif
	end

endtask*/


task Encoder_check;

@(negedge channel_clock)
	if(i != 0)
	begin
		if (I != I_vec[i-1])
		begin
			$display("Fail:-> Expected: I_vec[%5d]=%h, Received: I=%h",i, I_vec[i-1], I);
`ifdef BREAKONERR
			$stop;
`endif
		end
		else
		begin
`ifdef VERBOSE
			$display("Success:-> Expected: I_vec[%5d]=%h, Received: I=%h", i, I_vec[i-1], I);
`endif
		end
	end
		
endtask
			

endmodule // end of encoder_test bench

