/* DFELAY.v
*
* Module: DELAY
*
* Authors:
* Abdullah 
*
* Description:
* This file is a memory block.
* For the input x, the output is given by:
* y(k)=x(k-1) (G.726, Page 46)
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Abdullah	02/07/2014	Module Created.
* 1.10		Abdullah	02/08/2014	Module Excuted
*/
// Module Declaration

module DELAY (
	x,
	reset,
	y,
	clk,					// strope not clock
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

///////////////////////////////////////////
// Inputs 
//

parameter RESET_STATE = 0;		// Variable to hold delayed quantizer scale factor
parameter WIDTH = 2;			// To specify the size of the Input and output bits

input	[WIDTH-1:0]	x;		// input data
input			reset;		// reset signal
input 			clk;		// clock 
input scan_enable; //DFT scan system
input 	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4;



///////////////////////////////////////////
// Outputs 
//

output	[WIDTH-1:0]	y;		// output data
output	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;


reg	[WIDTH-1:0]	delay0;
reg	[WIDTH-1:0]	delay1;
reg	[WIDTH-1:0]	delay2;
reg	[WIDTH-1:0]	delay3;
reg	[WIDTH-1:0]	delay4;
reg	[WIDTH-1:0]	delay5;
reg	[WIDTH-1:0]	delay6;
reg	[WIDTH-1:0]	delay7;

///////////////////////////////////////////
// Delay
//
always @ (posedge clk or posedge reset)
begin
	if (reset)
	begin
		delay0 <= RESET_STATE;
		delay1 <= RESET_STATE;
		delay2 <= RESET_STATE;
		delay3 <= RESET_STATE;
		delay4 <= RESET_STATE;
		delay5 <= RESET_STATE;
		delay6 <= RESET_STATE;
		delay7 <= RESET_STATE;
	end

	else 
	begin

		delay0 <= x ;
		delay1 <= delay0;
		delay2 <= delay1;
		delay3 <= delay2;
		delay4 <= delay3;
		delay5 <= delay4;
		delay6 <= delay5;
		delay7 <= delay6;
	
	end

end

	assign	y = delay7;


endmodule // end of DELAY

