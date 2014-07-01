/* I_ADAP_QUAN.v
*
* Module : Inverse adaptive quantizer
*
* Authors: Niraj Vasudevan 
*
* Description:
* Hierarchical module of Inverse adaptive quantizer
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		nv1440		03/22/2014	Module Created.
* 1.10		Levs		Mar 23		Added RATE as input
*
*/


//Module Declaration
module I_ADAP_QUAN (
	RATE,//40, 32, 24, or 16 kbit/s
	I,//Quantized ADPCM value
	Y,//Quantizer scale factor
	DQ//16-bit signed magnitude Quantized difference signal (16, 24, 32 or 40 kbit/s operation)
);
///////////////////////////////////////////
// Inputs 
//

input	[1:5]	I;	
input	[12:0]	Y;	//Quantizer scale factor
input	[1:0] 	RATE;
///////////////////////////////////////////
// Outputs 
//
 
output	[15:0]	DQ;	//16-bit signed magnitude Quantized difference signal (16, 24, 32 or 40 kbit/s operation)
    


///////////////////////////////////////////
// Wire and register instantiations
//

wire	[11:0]	dqln_w;
wire		dqs_w;
wire	[11:0]	dql_w;



///////////////////////////////////////////
// Module instantiations
//

RECONST		I_ADAP_QUAN_reconst( .I(I), 
				     .RATE(RATE),
				     .DQLN(dqln_w), 
				     .DQS(dqs_w)
				    );

ADDA		I_ADAP_QUAN_adda( .DQLN(dqln_w), 
				   .Y(Y),
				   .DQL(dql_w)
				  );

ANTILOG		I_ADAP_QUAN_antilog( .DQL(dql_w), 
				      .DQS(dqs_w), 
				      .DQ(DQ)
				      );


endmodule // I_ADAP_QUAN
