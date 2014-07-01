/* OUT_PCM_vec_test.v
*
* Authors:
* Niraj Vasudevan
*
* Description:
* Vector testbecnh for OUT_PCM
* 
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Niraj		03/23/2014	Module created
*/
module OUT_PCM_testbench();

//integer VECTOR_BIT_SIZE = 24;
integer MEM_ADDR_RANGE = 19880;
integer CLK_PERIOD = 1000;	//nanoseconds

reg [15:0] SR;
reg	   LAW;
reg [14:0] SE;
reg [12:0] Y;
reg [4:0]  I;
reg [1:0]  RATE;

reg test_clk,
	law,
	new_vector_test;

integer i;

wire [7:0] SD;

reg [23:0] SR_vec [0:19879];
reg [23:0] SE_vec [0:19879];
reg [23:0] Y_vec [0:19879];
reg [23:0] I_vec [0:19879];
reg [23:0] SD_vec [0:19879];

`define BREAKONERROR 1;

OUT_PCM top(
	.SR(SR),
	.LAW(LAW),
	.SE(SE),
	.RATE(RATE),
	.Y(Y),
	.I(I),
	.SD(SD)
);

/********************
*Decoder test
********************/

initial begin 

	test_clk = 1'b0;
	LAW = 1'b0;	//ulaw test
	new_vector_test = 1'b0;
@(posedge test_clk);	//Idle for one clock cycle
	
//Test vectors for 16kb/s

	RATE = 2'b11;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/16/normal/homing/sd.t", SD_vec);

	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;

//Test vectors for 24kb/s

	RATE = 2'b10;
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sr.t", SR_vec);
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/se.t", SE_vec);
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/y.t", Y_vec);
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/I.t", I_vec);
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/24/normal/homing/sd.t", SD_vec);

	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;

//Test vectors for 32kb/s


	RATE = 2'b01;
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sr.t", SR_vec);
	$readmemh("../../mcac/model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/32/normal/homing/sd.t", SD_vec);

	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;

//Test vectors for 40kb/s

	RATE = 2'b00;
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/dec/40/normal/homing/sd.t", SD_vec);


	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;

	LAW = 1'b1;
//Test vectors for 16kb/s

	RATE = 2'b11;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/16/normal/homing/sd.t", SD_vec);
	
	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;
//Test vectors for 24kb/s

	RATE = 2'b10;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/24/normal/homing/sd.t", SD_vec);

	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;
//Test vectors for 32kb/s


	RATE = 2'b01;
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/32/normal/homing/sd.t", SD_vec);

	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;

//Test vectors for 40kb/s

	RATE = 2'b00;
	$readmemh("../../mcac/model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sr.t", SR_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/se.t", SE_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/y.t", Y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/dec/40/normal/homing/sd.t", SD_vec);

	new_vector_test = 1'b1;
	@(posedge test_clk);
	test_vectors;
	new_vector_test = 1'b0;

	#100 $finish;
end

always begin
	#(CLK_PERIOD/2) test_clk = ~test_clk;
end

task test_vectors;

for(i = 0; i < MEM_ADDR_RANGE; i = i + 1) begin
	@(posedge test_clk);
		

		SR <= SR_vec[i];
		SE <= SE_vec[i];
		Y <= Y_vec[i];
		I <= I_vec[i];

	@(negedge test_clk);
		
		if (SD == SD_vec[i]) begin
		`ifdef VERBOSE
		$display("Test success!	Expected = %h	Received = %h", SD_vec[i], SD);
		`endif
	end else begin
	
		$display("Test failed! Input SR: %h Expected = %h	Received = %h", SR_vec[i], SD_vec[i], SD);
		`ifdef BREAKONERROR
		$stop;
		`endif
	end

end
endtask

endmodule	// End of module
