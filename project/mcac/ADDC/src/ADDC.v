/* ADDC.v
*
* Module: ADDC
*
* Authors:
* Sheenam Jayaswal
* 
*
* Description:
* This module obtains the sign of addition of quantized difference signal and partial signal estimate
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Sheenam Jayaswal  02/13/2014	Module Created.
*
*/

// Module Declaration
module ADDC (
           DQ,
           SEZ,
	   PK0,
           SIGPK
);

///////////////////////////////////////////
// Inputs 
//

//input LAW;                   // 1 bit rate variable
input [14:0]
    SEZ;                    //Sixth order predictor partial signal estimate  
input [15:0]
    DQ;                    //Quantized difference signal

///////////////////////////////////////////
// Outputs 
//
output SIGPK;                  //Sgn[p(k)] flag
output PK0;                   //Sign of DQ + SEZ with Delay 0
//////////////////////////////////////////
//Wire and Register Instantiations
wire  DQS;
wire [15:0]
       DQI;
wire SEZS;
wire [15:0]
      SEZI;
wire  [15:0] DQSEZ;
///////////////////////////////////////////
// LOGIC ( Use this header, as seen above )
//
	assign DQS = DQ[15];
	assign DQI = DQS ? (17'd65536-{2'b00,DQ[14:0]}) : DQ;	
	assign SEZS = SEZ[14];
	assign SEZI = SEZS ? {1'b1,SEZ} : {1'b0,SEZ};	
	assign DQSEZ = (DQI + SEZI);
	assign PK0 = DQSEZ[15];
	assign SIGPK = (DQSEZ ==16'd0)? 1'b1 : 1'b0;

endmodule // end of ADDC

