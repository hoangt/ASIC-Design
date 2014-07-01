/* ADAP_QUAN.v
*
* Module : Adaptive quantizer
*
* Authors: Niraj Vasudevan 
*
* Description:
* Hierarchical module of adaptive quantizer
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		nv1440		03/21/2014	Module Created.
* 1.10		Levs		Mar 22		Added RATE as input
*
*/

module ADAP_QUAN (
	RATE, //40, 32, 24 or 16 kbit/s
	D,//16- bit input; referenced as D in encoder and DX in decoder
	Y,//13-bit signed magnitude quantizer scale factor
	I
);
///////////////////////////////////////////
// Inputs 
//

input	[15:0]	D;		//16- bit input; referenced as D in encoder and DX in decoder
input	[12:0]	Y;		//13-bit signed magnitude quantizer scale factor	
input	[1:0]	RATE;		

///////////////////////////////////////////
// Outputs 
//
output	[4:0]	I;			

///////////////////////////////////////////
// Wire and register instantiation 
//
wire	[10:0]	dl_w;		//11-bit Output Refferenced as DL in the Encoder and DLX in the Decoder
wire		ds_w;		//1-bit Output Refferenced as DS in the Encoder and DSX in the Decoder
wire	[11:0]	dln_w;



///////////////////////////////////////////
// Module instantiation 
//

LOG	adap_quan_log(.D(D), 
		      .DL(dl_w),
		      .DS(ds_w)
		      );

SUBTB	adap_quan_subtb(.DL(dl_w), 
			.DLN(dln_w), 
			.Y(Y)
			); 

QUAN	adap_quan_quan(.DLN(dln_w), 
		       .DS(ds_w), 
		       .RATE(RATE),.I(I)
		       );


endmodule // ADAP_QUAN
