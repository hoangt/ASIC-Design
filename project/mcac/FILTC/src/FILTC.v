/*
module FILTC (
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


endmodule // FILTC
*/

/* FILTC.v
*
* Module: FILTC
*
* Authors:
* Pradnya Bogar
* 
*
* Description:part of the decoder: quantizer scale factor adaption where this filter is used to get the   feedback signal from the output
*
* Function: Low pass filter of speed control parameter. 
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Pradnya Bogar     02/09/2014	Module Created.
* 1.01          Pradnya Bogar     02/19/2014    Comments and Data Widths Corrected	
  1.02		Pradnya bogar	  02/23/2014	corrections
  1.03		Sheenam Jayaswa   03/26/2014	Final Corrections
*/

// Module Declaration

module FILTC (AX, AP, APP);

// Inputs 

input  AX;                   // COMMENT HERE
input [9:0] AP;                    // COMMENT HERE

// Outputs 

output [9:0] APP;                  //COMMENT HERE
wire [9:0] APP;

// Wires
                
wire [10:0] DIF;
wire DIFS;
wire [9:0] DIFSX;      //COMMENT HERE

// LOGIC
//Begin of changes by sj7728
//assign DIF=({AX,9'b000000000}+12'd2048-AP);  //COMMENT HERE
assign DIF=((AX<<9)+12'd2048-AP);  //COMMENT HERE
//end of changes by sj7728
 /*  W000000000
  + 100000000000
   =
     1W000000000
- YYYYYYYYY this is DIF (11 BIT)

*/

assign DIFS=DIF[10];
//Begin of Changes by sj7728
//assign DIFSX = (DIFS == 0)?DIF[10:5]:(DIF[10:5]+ 10'd896); //COMMENT HERE
assign DIFSX = (DIFS == 0)?DIF[10:4]:(DIF[10:4]+ 10'd896); //COMMENT HERE
//end of Changes by sj7728
/* ZZZZZZZZZZZZZ
 + 1000000000000
=
  CXZZZZZZZZZZZZ
*/
assign APP = DIFSX + AP; //COMMENT HERE

endmodule // end of FILTC

