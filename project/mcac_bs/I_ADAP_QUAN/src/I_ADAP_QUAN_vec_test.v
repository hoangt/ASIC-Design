/* I_ADAP_QUAN_vec_test.v
*
* Module: test
*
* Authors:
* Sadiq Pasha
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 0.1		Sadiq		4/13/2014	Created from I_ADAP_QUAN_vec_test.v (Levs)
*RATES AND LAWS LOGIC TAKEN FROM TEST BENCH CREATED BY LEVS.
*/
module I_ADAP_QUAN_TEST_BENCH ();

reg [2*8-1:0] rates [0:3];
reg [4*8-1:0] laws [0:1];
integer rate, law, j, i;

wire [15:0] D;
reg [23:0] D_vec [0:19879]; 
reg [12:0] Y;
reg [23:0] Y_vec [0:19879];
reg [1:0] RATE;
reg [4:0] I;
reg [23:0] I_vec [0:19879];

I_ADAP_QUAN test_bench (
	.D	(D),
	.RATE	(RATE),
	.Y	(Y),
	.I	(I)
);

initial
begin
	rates[0] = "40";
	rates[1] = "32";
	rates[2] = "24";
	rates[3] = "16";
	laws[0] = "alaw";
	laws[1] = "ulaw"; 
end

initial
begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/QUAN_tsmc18_scan.sdf", test.top);
`endif
  #10;
//$display("%s",{rates[0],rates[1]});
//$finish;
for(rate=0;rate<4;rate=rate+1) begin
for(law=0;law<2;law=law+1) begin
	$display("%s %s", rates[rate], laws[law]);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/dec/",rates[rate],"/normal/homing/dq.t"}, D_vec);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/dec/",rates[rate],"/normal/homing/y.t"}, Y_vec);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/dec/",rates[rate],"/normal/homing/I.t"}, I_vec);
	RATE = rate;
	for (j = 0; j < 19879; j=j+1) begin
		#1 I = I_vec[j];
		Y = Y_vec[j];
		#10;
`ifdef VERBOSE
		$display("D = %h",D);
		$display("Y = %b",Y);
		$display("I = %h",I);
`endif
		if (D!=D_vec[j]) begin
			$display("ERROR _ _ _  RATE = %b, I = %b, Y = %d. Found D = %h, EXPECTED = %h", j, RATE, I, Y, D, D_vec[j]);
`ifdef BREAKONERR
			$stop;
`endif
		end else begin
			//$display("TEST #%7d  OK  for RATE = %b, DS = %b, DLN = %d. I = %h", j, RATE, DS, DLN, I);
		end
	end
end
//end
end

  #10 $display("ALL VECTORS SUCESSFULLY PASSED");
  $finish;
end

endmodule
