///////////////////////////
//Module Declaration
module IN_REG(
	data_in,
	load,
	reset,
	data_out,
	scan_enable,
	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4,
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4
	);

////////////////////////
// Inputs and outputs

input		scan_in0,
		scan_in1,
		scan_in2,
		scan_in3,
		scan_in4;

input	[7:0]	data_in;
input		load, scan_enable, reset;

output reg	[7:0]	data_out;
output	
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;


always @(posedge load, posedge reset) begin
	if(reset)
	data_out <=0;
	else
	data_out <= data_in;
	end 

endmodule //end IN_REG
