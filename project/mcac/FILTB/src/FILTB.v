/* FILTB.v
*
* Module: FILTB
*
* Authors:
* Pradnya Bogar
* Abhishek Ramesh
* 
*
* Description:part of the decoder: quantizer scale factor adaption where this filter is used to get the   feedback signal from the output
*
* Function: Update of long-term average of F(I).
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Pradnya Bogar     02/09/2014	Module Created.
* 1.01          Pradnya Bogar     02/19/2014    Comments and Data Widths Corrected	
* 1.02		Pradnya bogar	  02/23/2014	corrections
* 1.03 		Abhishek Ramesh   03/16/2014	Corrected the size of wires to pass the test.
*/

// Module Declaration

module FILTB (FI, DML, DMLP);

// Inputs 

input [2:0] FI;                   // COMMENT HERE
input [13:0] DML;                    // COMMENT HERE

// Outputs 

output [13:0] DMLP;                  //COMMENT HERE
wire [13:0] DMLP;

// Wires
                
wire [14:0] DIF;
wire DIFS;
wire [13:0] DIFSX;      //COMMENT HERE

// LOGIC

assign DIF=({FI,11'b00000000000}+16'd32768-DML);  //32768 16 bit
 /*  WWW000000000
  + 1 0 0 0 000000000
   =
     1WWW000000000
- YYYYYYYYYYYY this is DIF (13 BIT)

*/

assign DIFS=DIF[14];
assign DIFSX = (DIFS == 0)?(DIF[14:7]):(DIF[14:7]+ 14'd16128); //16128 14bit
/* ZZZZZZZZZZZZZ
 + 1000000000000
=
  CXZZZZZZZZZZZZ
*/
assign DMLP = DIFSX + DML; //COMMENT HERE

endmodule // end of FILTB
 
