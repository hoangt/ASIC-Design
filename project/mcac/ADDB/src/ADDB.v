/* ADDB.v
*
* Module: ADDB
*
* Authors:
* Sheenam Jayaswal
* 
*
* Description:
* This module adds the quantized difference signal and signal estimate to form reconstructed signal.
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Sheenam Jayaswal  02/12/2014	Module Created.
* 1.01          Sheenam Jayaswal  02/13/2014    Completed addition of logic
* 1.02          Sheenam Jayaswal  02/21/2014    Syntax changes
*/

// Module Declaration
module ADDB (
           DQ,
           SE,
           SR
);

//////	/////////////////////////////////////
// Inputs 
//

input [14:0]
  	  SE;                    //Signal Estimate   
input [15:0]
   	 DQ;                    //Quantized difference signal

///////////////////////////////////////////
// Outputs 
//
output [15:0]
        SR;                  //Reconstructed signal 
//////////////////////////////////////////
//Wire and Register Instantiations
wire DQS;
wire [15:0]
       DQI;
wire SES;
wire [15:0]
      SEI;

///////////////////////////////////////////
// LOGIC ( Use this header, as seen above )
//
/*
if (LAW == 1'b0) begin
 assign DQS = DQ>>15;
end else  
if (LAW == 1'b1) begin
 assign DQS = (DQ>>14);
end
if (DQS == 1'b0) begin                      //Convert signed magnitude to two's complement
 assign DQI = (DQ);
end else 
if (LAW ==1'b0 && DQS == 1'b1) begin
assign DQI = (65536-DQ);
end else 
if (LAW==1'b1 && DQS == 1'b1) begin
assign DQI = (65536-DQ);
end
assign SES = SE>>14;
if (SES==1'b0) begin                   //Sign extension                   
assign SEI = SE;
end else 
if (SES == 1'b1) begin
assign SEI = (1<<15)+SE;
end
assign SR = (DQI + SEI);

=======
*/
	assign DQS = DQ[15];
	assign SES = SE[14];
	assign DQI = DQS ? (17'd65536-{2'b00,DQ[14:0]}) : DQ;		
	assign SEI = SES ? {1'b1,SE} :{1'b0, SE};
	assign SR = (DQI + SEI);


endmodule // end of ADDB

