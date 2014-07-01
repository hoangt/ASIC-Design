
/* QUAN_SCAL_FAC_ADAP.v
*
* Module : Quantizer scale factor adaptation.v
* Authors: Aishwarya 
*
* Description:
* Hierarchical module of Quantizer scale factor adaptation
*
* Revision History:
*==============================================================================
  Rev #		Author(s)	Date			Changes
-------------------------------------------------------------------------------
* 1.00		Aishwarya	03/25/2014		Module Created.
* 
===============================================================================
*/

/****** Module Declaration *******/

module QUAN_SCAL_FAC_ADAP (
           			I,
			        Y,
				reset,
                                RATE,
				dly_strb,
				AL,
                                YL,
				scan_in0, 
				scan_in1, 
				scan_in2, 
				scan_in3, 
				scan_in4, 
				scan_out0, 
				scan_out1, 
				scan_out2, 
				scan_out3, 
				scan_out4, 
				test_mode, 
				scan_enable
				);

/******* Inputs ******/
input	[4:0]	I;
input  		reset,
		dly_strb;
input 	[6:0]   AL;
input   [1:0]   RATE;
input		scan_in0, 
		scan_in1, 
		scan_in2, 
		scan_in3, 
		scan_in4, 
		test_mode, 
		scan_enable; 			//DFT scan chain
              
/******** Outputs ******/
output 	[12:0]	Y;
output  [18:0]  YL;
output		scan_out0, 
		scan_out1, 
		scan_out2, 
		scan_out3, 
		scan_out4; 			//dft scan chain

  
/***** Register and Wires *****/
wire [11:0] w_wi;
wire [12:0] w_yut, w_yup, w_yu;
wire [18:0] w_ylp, w_yl;

assign YL = w_yl;

/****** Logic ******/
	
	FUNCTW	QUAN_SCAL_FAC_ADAP_functw(.WI(w_wi),
					  .I(I), 
					  .RATE(RATE)
					  );

	FILTD   QUAN_SCAL_FAC_ADAP_filtd (.YUT(w_yut), 
					  .WI(w_wi), 
					  .Y(Y)
					  );

	LIMB	QUAN_SCAL_FAC_ADAP_limb  (.YUP(w_yup), 
					  .YUT(w_yut)
					  );

	DELAY 	#(.WIDTH(13), .RESET_STATE(544))
                QUAN_SCAL_FAC_ADAP_delay_yu(.y(w_yu), 
					  .reset(reset), 
					  .x(w_yup), 
					  .clk(dly_strb)
					  ,.scan_enable(scan_enable)
					);

	FILTE   QUAN_SCAL_FAC_ADAP_filte (.YLP(w_ylp), 
					  .YUP(w_yup), 
					  .YL(w_yl)
					  );

	DELAY 	#(.WIDTH(19), .RESET_STATE(34816))
                QUAN_SCAL_FAC_ADAP_delay_yl(.y(w_yl), 
					  .x(w_ylp),
					  .reset(reset), 
					  .clk(dly_strb)
					  ,.scan_enable(scan_enable)
					);


	MIX 	QUAN_SCAL_FAC_ADAP_mix   (.Y(Y), 
					  .YU(w_yu), 
					  .YL(w_yl), 
					  .AL(AL)
					  );

endmodule // QUAN_SCAL_FAC_ADAP


