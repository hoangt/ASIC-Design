/* OUT_PCM.v
*
* Module : Output PCM
*
* Authors: Niraj Vasudevan 
*
* Description:
* Hierarchical module of output PCM
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		nv1440		03/20/2014	Module Created.
*
*/




//Module Declaration

module OUT_PCM (

	SR,	//Reconstructed signal
	LAW,	//Selects a-law or u-law
	SE,	//Signal estimate
	RATE,
	Y,	//Quantizer scale factor
	I,	//Rate selector
	SD	//Decoder pcm output word
);

///////////////////////////////////////////
// Inputs 
//
input [15:0] 	SR;		
input 		LAW;		
input [14:0] 	SE;		
input [12:0] 	Y;		
input [4:0]	I;
input [1:0]	RATE;	

///////////////////////////////////////////
// Outputs 
//
output [7:0]	SD;

///////////////////////////////////////////
// Wire and register instantiations
//

wire [7:0] 	sp_w;		// 8 bit PCM reconstructed signal
wire [13:0] 	sl_w;		// 14-bit Output Referrenced as SL in the Encoder and SLX in the Decoder
wire [15:0]	d_w;		// output of SUBTA
wire [10:0]	dl_w;		// 11-bit Output Refferenced as DL in the Encoder and DLX in the Decoder
wire		ds_w;		// 1-bit Output Refferenced as DS in the Encoder and DSX in the Decoder
wire [11:0]	dln_w;		// 12 bit 2's complement Log2 normalized difference in encoder

///////////////////////////////////////////
// Module instantiations
//

COMPRESS	top_out_pcm_compress	(	.SR(SR), 
					  	.LAW(LAW),
						.SP(sp_w)
										);
EXPAND		top_out_pcm_expand	(	.SIN(sp_w),
						.LAW(LAW), 
						.SOUT(sl_w)
										);
SUBTA		top_out_pcm_subta	(	.SL(sl_w),
						.SE(SE),
						.D(d_w)
						
										);
LOG		top_out_pcm_log		(	.D(d_w), 
						.DL(dl_w), 
						.DS(ds_w)
										);
SUBTB		top_out_pcm_subtb	(	.DL(dl_w),
						.DLN(dln_w), 
						.Y(Y) 
										);
SYNC		top_out_pcm_sync	(	.I(I), 
						.SP(sp_w), 
						.DLNX(dln_w), 
						.DSX(ds_w), 
						.LAW(LAW), 
						.SD(SD), 
						.RATE(RATE)
										); 

endmodule // end of OUT_PCM
