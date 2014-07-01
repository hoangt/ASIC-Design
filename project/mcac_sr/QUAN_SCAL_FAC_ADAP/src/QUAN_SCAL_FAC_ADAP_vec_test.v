
/* QUAN_SCAL_FAC_ADAP_vec_test.V
*
* Module:Testbench_vector
*
* Authors:
* Aishwarya
*
* Description:
* Full testing of the heirarchial module.
*
* Revision History:
* ============================================================================================
* _Rev #_	_Author(s)_		   _Date_		_Changes_
* -------------------------------------------------------------------------------------------
* 1.00		Aishwarya		 04/01/2014	     Code Revisioned for decoder                               		
* =============================================================================================
*/

`define MEM_ADDR_RANGE 19880		//0 to 19779 address
`define CLK_PERIOD	20000

module QUAN_SCAL_FAC_ADAP_test();


reg [4:0]   test_I; 			// 5 Bit Input
reg 	    test_R = 1'b1; 		// Optional Reset Given as input
reg [6:0]   test_AL; 			// Input to the Mixer
reg [1:0]   test_rate; 			// rate selector
reg         test_dly_strb = 1'b0;
wire [12:0] Y; 				// Output of the Module


QUAN_SCAL_FAC_ADAP top(
       			 .I(test_I),
       			 .reset(test_R),
                         .RATE(test_rate),
                         .dly_strb(test_dly_strb),
        		 .AL(test_AL),
        		 .Y(Y),
			 .test_mode(1'b0), 
			 .scan_enable(1'b0), 
			 .scan_in0(1'b0), 
			 .scan_in1(1'b0), 
			 .scan_in2('b0), 
			 .scan_in3(1'b0), 
			 .scan_in4(1'b0)
           		);

reg
	test_clk,		// clk for verification
//	testing_alaw,		// == 1 if running alaw vectors
	//testing_ulaw,		// == 1 if running ulaw vectors
	new_vector_set;
	//test_encoder,
	//test_decoder,
	//rate;	
			
integer i, 
	rate,
	law,
	place, 
	test_number;

reg [2*8-1:0] rates [0:3];
reg [3*8-1:0] places [0:1]; 
reg [4*8-1:0] laws [0:1];

reg[23:0] 
	vec_I [0:`MEM_ADDR_RANGE - 1],	
	vec_AL [0:`MEM_ADDR_RANGE - 1],	
	vec_Y [0:`MEM_ADDR_RANGE - 1];

initial
	begin
		rates[0] = "40";
		rates[1] = "32";
		rates[2] = "24";
		rates[3] = "16";
		places[0] = "enc";
		places[1] = "dec";
		laws[0] = "alaw";
		laws[1] = "ulaw"; 
		end


initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/QUAN_SCAL_FAC_ADAP_tsmc18_scan.sdf", test.top);
`endif
		test_clk = 1'b0;
		i = 1'b0;
		//rate = 2'b00;
		test_number = 1'b0;
		//test_alaw = 1'b0;
		//test_ulaw = 1'b0; 
		new_vector_set = 1'b0;
		//test_encoder = 1'b0;
		//test_decoder = 1'b0;
	
		@(posedge test_clk);


			for(place =0; place<2; place = place+1)
			begin

			for(law=0;law<2;law=law+1) 
			begin	

			for(rate=0;rate<4;rate=rate+1) 
			begin
			  test_rate = rate;
		
					$display("Enc/Dec = %s, RATE = %s, Law = %s ", places[place],rates[rate], laws[law]);
					$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/I.t"}, vec_I);
					//$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/r.t"}, vec_R);
					$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/al.t"}, vec_AL);
					$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/y.t"}, vec_Y);

					@(posedge test_clk);
					new_vector_set = 1'b1;
                                        test_R = 1'b0;
					@(posedge test_clk);
					new_vector_set = 1'b0;
					test_vectors;
                                        test_R = 1'b1;
					@(posedge test_clk);
			end
			end
			end
				#100 $finish;
		end

always
begin
#(`CLK_PERIOD/2)	test_clk = ~test_clk;
end

	task test_vectors;
	for (i=0; i<= `MEM_ADDR_RANGE  -1; i =i+1)
		begin
			@(posedge test_clk);
			test_I = vec_I[i];
			test_AL = vec_AL[i];
			@(negedge test_clk)
				begin
					if (vec_Y[i] !== Y)
					begin
						$display("Test = %d at time = %t Y returned as %b, while %b was expected", test_number, $time, Y, vec_Y[i][12:0]);		
					end
`ifdef VERBOSE
					else 
						begin
						$display("Pass test -- Test = %d at time = %t Y returned as %b, while %b was expected", test_number, $time, Y, vec_Y[i][12:0]);		
						end
`endif
			end
                        repeat(16)
                          #(`CLK_PERIOD/2500) test_dly_strb = ~test_dly_strb;
				test_number = test_number +1;
		end
	endtask

endmodule
