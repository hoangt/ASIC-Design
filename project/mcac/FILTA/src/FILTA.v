/*
module FILTA (
           reset,
           clk,
           scan_in0,
           scan_en,
           scan_out0
       );

input
    reset,                      // system reset
    clk;                        // system clock

input
    scan_in0,                   // test scan mode data input
    scan_en;                    // test scan mode enable

output
    scan_out0;                  // test scan mode data output

*/

/* FILTA.v
*
* Module: FILTA
*
* Authors:
* Pradnya Bogar
* 
*
* Description:part of the decoder: quantizer scale factor adaption where this filter is used to get the   feedback signal from the output
*
* Function:Update of short-term average of F(I).
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Pradnya Bogar     02/09/2014	Module Created.
* 1.01          Pradnya Bogar     02/19/2014    Comments and Data Widths Corrected	
  1.02		Pradnya bogar	  02/23/2014	corrections
*/

// Module Declaration

module FILTA (FI, DMS, DMSP);

// Inputs 

input [2:0] FI;                   // COMMENT HERE
input [11:0] DMS;                    // COMMENT HERE

// Outputs 

output [11:0] DMSP;                  //COMMENT HERE
wire [11:0] DMSP;

// Wires
                
wire [12:0] DIF;
wire DIFS;
wire [12:0] DIFSX;      //COMMENT HERE

// LOGIC

assign DIF=({FI,9'b000000000}+14'd8192-DMS);  //131072-Y
 /*  WWW000000000
  + 1 0 0 0 000000000
   =
     1WWW000000000
- YYYYYYYYYYYY this is DIF (13 BIT)

*/

assign DIFS=DIF[12];
assign DIFSX = (DIFS == 0)?DIF[12:5]:(DIF[12:5]+ 12'd3840); //3840 1000000000000
/* ZZZZZZZZZZZZZ
 + 1000000000000
=
  CXZZZZZZZZZZZZ
*/
assign DMSP = DIFSX + DMS; //COMMENT HERE

endmodule // end of FILTA
 

