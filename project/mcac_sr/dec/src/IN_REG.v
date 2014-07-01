///////////////////////////
//Module Declaration
module IN_REG(
	in,
	clk,
	reset,
	out,
	scan_enable,
	
	);

////////////////////////
// Inputs and outputs

input	[4:0]	in;
input		clk;
input 		scan_enable,
		reset;
		

output reg	[4:0]	out;

always @(posedge clk or posedge reset) begin
  if (reset)
    out <= 8'd0;
  else
    out <= in;
end 

endmodule //end IN_REG

