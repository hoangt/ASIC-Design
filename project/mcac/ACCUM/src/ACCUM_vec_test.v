/*
* Authors:
* Levs Dolgovs
*
* Description:
* Testbench for ACCUM.
* Runs a directed test.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 0.1		Levs		Mar 30		Created from QUAN_vec_test.v
*/

module test;

reg [15:0] WA1;
reg [15:0] WA2;

reg [15:0] WB1;
reg [15:0] WB2;
reg [15:0] WB3;
reg [15:0] WB4;
reg [15:0] WB5;
reg [15:0] WB6;

wire [15:0] SE;
wire [15:0] SEZ;

reg [23:0] WA1s [0:19879];
reg [23:0] WA2s [0:19879];

reg [23:0] WB1s [0:19879];
reg [23:0] WB2s [0:19879];
reg [23:0] WB3s [0:19879];
reg [23:0] WB4s [0:19879];
reg [23:0] WB5s [0:19879];
reg [23:0] WB6s [0:19879];

reg [23:0] SEs [0:19879];
reg [23:0] SEZs [0:19879];


ACCUM top(
	WA1, WA2,
	WB1, WB2, WB3, WB4, WB5, WB6,
	SE, SEZ
    );

reg [2*8-1:0] rates [0:3];
//reg [3*8-1:0] places [1:2]; //QUAN exists only in enc
reg [4*8-1:0] laws [0:1];
integer rate, law, j, i;//,place
reg [1:0] RATE;

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
    $sdf_annotate("sdf/ACCUM_tsmc18_scan.sdf", test.top);
`endif
	for(rate=0;rate<4;rate=rate+1) begin
	//for(place=1;place<2;place=place+1) begin
	for(law=0;law<2;law=law+1) begin
		$display("%s %s", rates[rate], laws[law]);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wa1.t"}, WA1s);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wa2.t"}, WA2s);
	
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wb1.t"}, WB1s);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wb2.t"}, WB2s);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wb3.t"}, WB3s);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wb4.t"}, WB4s);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wb5.t"}, WB5s);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/wb6.t"}, WB6s);
	
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/sez.t"}, SEZs);
		$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/normal/homing/se.t"}, SEs);
		RATE = rate;
		for (j = 0; j < 19879; j=j+1) begin
			#1;
			WA1 = WA1s[j];
			WA2 = WA2s[j];
			
			WB1 = WB1s[j];
			WB2 = WB2s[j];
			WB3 = WB3s[j];
			WB4 = WB4s[j];
			WB5 = WB5s[j];
			WB6 = WB6s[j];
			#10;
			if ((SE!=SEs[j]) || (SEZ!=SEZs[j])) begin
				$display("TEST #%7d FAIL for RATE = %b, WAx = %h %h, WBx = %h %h %h %h %h %h. SE = %h vs %h, SEZ = %h vs %h", j, RATE, WA1, WA2, WB1, WB2, WB3, WB4, WB5, WB6, SE, SEs[j], SEZ, SEZs[j]);
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
