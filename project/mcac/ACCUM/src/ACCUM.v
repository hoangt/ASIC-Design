
module ACCUM (
	WA1, WA2,
	WB1, WB2, WB3, WB4, WB5, WB6,
	SE, SEZ
       );

input [15:0] WA1;
input [15:0] WA2;

input [15:0] WB1;
input [15:0] WB2;
input [15:0] WB3;
input [15:0] WB4;
input [15:0] WB5;
input [15:0] WB6;

output [15:0] SE;
output [15:0] SEZ;

wire [15:0] SEZI;
wire [15:0] SEI;

assign SEZI = WB1 +WB2 +WB3 +WB4 +WB5 +WB6;
assign SEZ = {1'b0, SEZI[15:1]};

assign SEI = SEZI +WA1 +WA2;
assign SE = {1'b0, SEI[15:1]};

endmodule
