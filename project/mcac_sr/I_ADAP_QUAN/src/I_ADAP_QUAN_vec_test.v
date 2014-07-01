/* I_ADAP_QUAN_vec_test.v
*
* Module: test
*
* Authors:
* Levs Dolgovs
*
* Description:
* Testbench for ADAP_QUAN.
* Runs a directed test.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 0.1		Levs		Mar 23		Created from ADAP_QUAN_vec_test.v
*/
module test ();

reg [2*8-1:0] rates [0:3];
//reg [3*8-1:0] places [1:2]; //I_ADAP_QUAN exists only in dec
reg [4*8-1:0] laws [0:1];
integer rate, law, j, i;//,place

wire [15:0] DQ;
reg [23:0] DQs [0:19879]; 
reg [12:0] Y;
reg [23:0] Ys [0:19879];
reg [1:0] RATE;
reg [4:0] I;
reg [23:0] Is [0:19879];

I_ADAP_QUAN top (
	.DQ	(DQ),
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
	//places[0] = "enc";
	//places[1] = "dec";
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
//for(place=1;place<2;place=place+1) begin
for(law=0;law<2;law=law+1) begin
	$display("%s %s", rates[rate], laws[law]);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/dec/",rates[rate],"/normal/homing/dq.t"}, DQs);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/dec/",rates[rate],"/normal/homing/y.t"}, Ys);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/dec/",rates[rate],"/normal/homing/I.t"}, Is);
	RATE = rate;
	for (j = 0; j < 19879; j=j+1) begin
		#1 I = Is[j];
		Y = Ys[j];
		#10;
`ifdef VERBOSE
		$display("DQ = %h",DQ);
		$display("Y = %b",Y);
		$display("I = %h",I);
`endif
		if (DQ!=DQs[j]) begin
			$display("TEST #%7d FAIL for RATE = %b, I = %b, Y = %d. DQ = %h instead of %h", j, RATE, I, Y, DQ, DQs[j]);
			//$display("TEST FAIL for RATE = %b, DS = %b, DLN = %h. I = %h instead of %h", RATE, DSs[j], DLNs[j], I, Is[j]);
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

  #10 $display("** Test Complete!");
  $finish;
end

endmodule
