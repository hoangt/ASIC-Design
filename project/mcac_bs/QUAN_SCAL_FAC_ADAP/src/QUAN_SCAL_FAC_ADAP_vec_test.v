/* QUAN_SCAL_FAC_ADAP_vec_test.v
*
* Module: 
*
* Authors:
* RAVIKIRAN YADAVA
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the QUAN_SCAL_FAC_ADAP module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		ry6144		04/05/2014	Module created. 
*
*/



///////////////////////
//Module Declaration //
///////////////////////

module QUAN_SCAL_FAC_ADAP_vec_test ();
///////////////
// Registers //
///////////////
reg	test_clk,	//clock for verification
	law,		// == 1 if running alaw vectors
	new_vector_set,	// Toggles high when changing vector set
	check_monitor;
reg 	delay_clk;

reg [4:0] IC;
reg [1:0] RATE;
reg [6:0] AL;
reg R;
//////////////////////////
/////////  ROM ///////////
/////////////////////////

//integer VECTOR_BIT_SIZE = 24
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000; 

reg [23:0] ic_vec [0:19879];   //	input vector 1
reg [23:0] al_vec [0:19879];   //       input vector 2
reg [23:0] y_vec  [0:19879];   //       output vector 1

integer i,test_num;

/////////////////////////
///////  wires //////////
////////////////////////

wire [12:0] Y;

QUAN_SCAL_FAC_ADAP top(
        .CLK(delay_clk),
	.IC(IC),
	.RATE(RATE),
	.AL(AL),
	.reset(R),
	.Y(Y)
        );

///////////////////////////////////////
////   READ TEST VECTOR FILES//////////
//////////////////////////////////////

initial
begin
	i = 1'b0;
	test_clk = 1'b0;
	law = 1'b0;
	RATE = 2'b00;
	new_vector_set = 1'b0;
	test_num = 0;
	R = 1'b0;
	delay_clk = 1'b0;
	check_monitor = 1'b0;
	@(posedge test_clk)
		R = 1'b1;
	@(posedge test_clk) 
		R = 1'b0;
	@(posedge test_clk);


//u_law vectors
	RATE = 2'b11;	// for 16 kb/s
	// test vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;


	RATE = 2'b10;	// for 24 kb/s
	// test vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	test_vectors;


	RATE = 2'b01;	// for 32 kb/s
	// test vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;


	RATE = 2'b00;	// for 40 kb/s
	// test vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

// a_law vectors
	
	law = 1'b1;
	RATE = 2'b11;
	//Test vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;

	test_vectors;


	RATE = 2'b10;
	//Test vectors for 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	RATE = 2'b01;
	//Test vectors for 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	RATE = 2'b00;
	//Test vectors for 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", ic_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t", y_vec);

	new_vector_set =  1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

    #500  $finish;
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
	for(i = 0; i <= MEM_ADDR_RANGE - 1; i = i+1)
	begin
		@(posedge test_clk);
		begin
			IC <= ic_vec[i];
	//	$display("IC value is %b ",IC);
			AL <= al_vec[i];
	//	$display("AL value is %b ",AL);

		end
		@(negedge test_clk);
		check_monitor = 1;
		monitor;


		@(posedge test_clk);
		check_monitor = 0;
		repeat(8)
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
begin
	if(Y == y_vec[i])
	begin
	//$display("Inside initial block 10");
//	$display("Pass test -- Test No. = %d, Y = %b, y_test = %b ", test_num, Y, y_vec[i]);	

	end

	else
	begin
	//$display("Inside initial block 11");

	$display("Test number %d at time = %t Y returned as %b, while %b was expected", test_num, $time, Y, y_vec[i]);
	end
	test_num = test_num +1;
end
endtask		

endmodule
