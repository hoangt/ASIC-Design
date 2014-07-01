/* ADAP_QUAN_vec_test.v
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
* 0.1		Levs		Mar 19		Created from QUAN_vec_test.v
*/
module test ();

reg [2*8-1:0] rates [0:3];
//reg [3*8-1:0] places [1:2]; //ADAP_QUAN exists only in enc
reg [4*8-1:0] laws [0:1];
integer rate, law, j, i;//,place

reg [15:0] D;
reg [23:0] Ds [0:19879]; 
reg [12:0] Y;
reg [23:0] Ys [0:19879];
reg [1:0] RATE;
wire [4:0] I;
reg [23:0] Is [0:19879];

ADAP_QUAN top (
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
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/d.t"}, Ds);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/y.t"}, Ys);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/I.t"}, Is);
	RATE = rate;
	for (j = 0; j < 19879; j=j+1) begin
		#1 D = Ds[j];
		Y = Ys[j];
		#10;
`ifdef VERBOSE
		$display("D = %h",D);
		$display("Y = %b",Y);
		$display("I = %h",I);
`endif
		if (I!=Is[j]) begin
			$display("TEST #%7d FAIL for RATE = %b, D = %b, Y = %d. I = %h instead of %h", j, RATE, D, Y, I, Is[j]);
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
