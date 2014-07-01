/* FILTE.v
*
* Module: FILTE
*
* Authors:
* Pradnya Bogar
* 
*
* Description:part of the decoder: quantizer scale factor adaption where the filtd is used to filetr the feedback signal from the output
* 
*
* Revision History:
* _Rev #_	_Author(s)_	  _Date_	_Changes_
* 1.00		Pradnya Bogar     02/09/2014	Module Created.
* 1.01          Pradnya Bogar     02/19/2014    Comments and Data Widths Corrected	
  1.02		Pradnya bogar	  02/23/2014	corrections
*/

// Module Declaration
module FILTE (YUP,YL,YLP);

///////////////////////////////////////////
// Inputs 
//

input [12:0] YUP;                   // COMMENT HERE
input [18:0] YL;                    // COMMENT HERE


///////////////////////////////////////////
// Outputs 
//
output [18:0] YLP;                  //COMMENT HERE
wire [18:0] YLP;

///////////////////////////////////////////
// Wires
//
                
wire [13:0] DIF;
wire DIFS;
wire [18:0] DIFSX;      //COMMENT HERE



///////////////////////////////////////////
// LOGIC
//


assign DIF=(YUP+((21'd1048576-YL)>>6));  //COMMENT HERE
assign DIFS=DIF[13];

assign DIFSX = (DIFS == 0)?(DIF):(DIF+19'd507904);

assign YLP=YL+DIFSX; //COMMENT HERE


endmodule // end of FILTE

