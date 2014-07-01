
module test;

reg
	
	test_clk,		// This is signal one
	law,			// == 1 if running alaw vectors
	new_vector_set,	// Toggles high when changing vector set
	testing_encoder,     // Encoder test
	testing_decoder;	// Decoder test

integer VECTOR_BIT_SIZE = 15;
integer MEM_ADDR_RANGE = 15'h4da7;	
integer CLK_PERIOD = 1000; //ns

// inputs-outputs

reg [7:0] PCM;		// Input Signal
reg [1:0] rate;

wire [13:0] mag;
wire sgn;

//////////
// ROM ///
//////////

// Need one rom per input and output signal
// This is module specific!!
reg [23:0] PCM_vec [0:19879];   
reg [23:0] mag_vec [0:19879];  
integer i;


G711 top(
	.LAW(law),//select,  ulaw=0; Alaw=1
	.PCM(PCM),//Incoming PCM signal 8 bit
	.mag(mag)//14bit output magnitude
    );


////////////////////////////
// Read Test Vector Files //
////////////////////////////

initial begin
	$display("Starting Vector TEST");
	i = 1'b0;
	test_clk = 1'b0;
	law = 1'b1;
	rate= 2'b00;
	new_vector_set = 1'b0;
	testing_encoder = 1'b0;
	testing_decoder = 1'b0;

@(posedge test_clk); // Idle for one clock cycle before begining tests

/**********************
* Encoder Testing
**********************/

testing_encoder = 1'b1;

// a-law vectors
	law = 1'b1;
	rate=2'b11;
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/ss.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	rate=2'b10;
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/ss.t", mag_vec);	
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/ss.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;


	rate=2'b00;
	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/ss.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

// u-law vectors

	law = 1'b0;
	rate=2'b11;
	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/ss.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/ss.t", mag_vec);
	
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/ss.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/pcm.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/ss.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	
	testing_encoder = 1'b0;


/**********************
* Decoder Testing
**********************/

testing_decoder = 1'b1;

// a-law Vector Tests

	law = 1'b1;
	rate=2'b11;	
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;	
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;


// u-law vectors

	law = 1'b0;
	rate=2'b11;
	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b10;
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b01;
	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	rate=2'b00;
	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sp.t", PCM_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sg.t", mag_vec);

	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_decoder = 1'b0;
	#100 $finish;

end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;
for(i = 0; i <= MEM_ADDR_RANGE - 1; i = i + 1) begin
	@(posedge test_clk);
		PCM = PCM_vec[i];
	@(negedge test_clk);
		monitor;		
	end
endtask

task monitor;
if (mag == mag_vec[i]) begin
	//Test Succesful
	`ifdef VERBOSE
		$display("Success: LAW=%h, PCM=%h: Expected mag=%h, received mag=%h", law, PCM, mag_vec[i], mag);
	`endif
end else begin
	//Test failed
	$display("ERROR: LAW=%h, RATE=%h, sample=%d, PCM=%h: Expected mag=%h, received mag=%h",law, rate, i, PCM, mag_vec[i], mag);
	`ifdef BREAKONERR
		$stop	
	`endif
end
endtask

endmodule
