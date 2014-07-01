/* DELAYPREDIC_vec_test.v
*
* Module: DELAYPREDIC
*
* Authors:
* Levs Dolgovs
*
* Description:
* Testbench for QUAN.
* Runs a directed test.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 0.1		Levs		Apr 6		Created from QUAN_vec_test.v
*/
module test ();

reg [2*8-1:0] rates [0:3];
reg [3*8-1:0] places [1:2]; //QUAN exists only in enc
reg [4*8-1:0] laws [0:1];
reg [7:0] n_str;
integer rate, law, place, j, i,n;//,place

reg [15:0] DQ;
reg [23:0] DQs [0:19879]; 
reg [10:0] DQN;
reg [23:0] DQNs [0:19879]; 
reg R, clk;
reg [1:0] RATE;
reg TR;
reg [23:0] TRs [0:19879]; 

wire [10:0] DQN1;
reg [23:0] DQN1s [0:19879]; 
wire [15:0] B;
reg [23:0] Bs [0:19879]; 

DELAYPREDIC top(
	.DQ(DQ),		//common input for all DELAYPREDICs
	.DQN(DQN),		//DQ0..5 (input) from the previous DELAYPREDIC
	.RATE(RATE),		//ADPCM RATE
	.TR(TR),		//transition detected signal for TRIGB
	.reset(R),			//DELAY blocks' RESET
	.clk(clk),		//clock for the DELAY shift register
	.DQN1(DQN1),		//output DQ1..6 to be fed to the next DELAYPREDIC
	.B(B)			//output to FMULT
       );

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
  $sdf_annotate("sdf/QUAN_tsmc18_scan.sdf", test.top);
`endif
  #10;
	for(rate=0;rate<4;rate=rate+1) begin
		for(place=1;place<2;place=place+1) begin
			for(law=0;law<2;law=law+1) begin
				$display("%s %s", rates[rate], laws[law]);
				$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/dq.t"}, DQs);
				$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/tr.t"}, TRs);
				for(n=0;n<6;n=n+1) begin
					$sformat(n_str, "%1d", n);
					$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/dq",n_str,".t"}, DQNs);
					$sformat(n_str, "%1d", n+1);
					$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/dq",n_str,".t"}, DQN1s);
					$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",places[place],"/",rates[rate],"/normal/homing/b",n_str,".t"}, Bs);
					RATE = rate;
					R = 1'b1;
					#10 R = 1'b0;
					#10;
					clk = 1'b0;
					for (j = 0; j < 19879; j=j+1) begin
						#1 DQ = DQs[j];
						DQN = DQNs[j];
						TR = TRs[j];
						repeat(8) #10 clk = ~clk;
						if (B!=Bs[j] && DQN1!=DQN1s[j]) begin
							$display("TEST #%7d FAIL for RATE = %b, DQ = %b, TR = %d, DQN = %d. B = %h vs %h, DQN1 = %h vs %h", j, RATE, DQ, TR, DQN, B, Bs[j], DQN1, DQN1s[j]);
							//$display("TEST FAIL for RATE = %b, DS = %b, DLN = %h. I = %h instead of %h", RATE, DSs[j], DLNs[j], I, Is[j]);
				`ifdef BREAKONERR
							$stop;
				`endif
						end else begin
							//$display("TEST #%7d  OK  for RATE = %b, DS = %b, DLN = %d. I = %h", j, RATE, DS, DLN, I);
						end
					end
				end
			end
		end
	end

  #10 $display("** Test Complete!");
  $finish;
end

endmodule
