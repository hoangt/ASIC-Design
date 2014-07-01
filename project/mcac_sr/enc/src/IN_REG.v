///////////////////////////
//Module Declaration
module IN_REG(
	in,
	clk,
	reset,
	out,
	scan_enable,
	test_mode
	);

////////////////////////
// Inputs and outputs

input	[7:0]	in;
input		clk;
input 		scan_enable,
		test_mode,
                reset;
		

output reg	[7:0]	out;

always @(posedge clk or posedge reset) begin
  if (reset)
    out <= 8'd0;
  else
    out <= in;
end 

endmodule //end IN_REG

