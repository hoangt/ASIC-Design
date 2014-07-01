
module test;
//`include "src/ANTILOG.v"

reg [4:-7] DQL;
reg DQS;
wire [15:0] DQ;

ANTILOG dut(
 //Function: Convert quantized difference signal from the logarithmic to the linear domain.
			DQL, //12-bit two's complement Log2(quantized difference signal)
			DQS, //(1-bit) Sign bit of quantized difference signal
			DQ   //16-bit signed magnitude Quantized difference signal (16, 24, 32 or 40 kbit/s operation)
       );

reg [15:0] RAM [0:4095];

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/ANTILOG_tsmc18_scan.sdf", test.top);
`endif
	DQS <= 1'b1;
	//I'd just go over all the values, and make a table,
	//display it in x-ln(y) format, and look for a roughly straight line
	DQL <= 12'b0;
	
	repeat (4095) begin
		#1 RAM[DQL] <= DQ;
		#1 DQL <= DQL + 1'b1;
	end
	$writememh("ANTILOG_results_DQS1.txt",RAM);
	$finish;
end

endmodule
