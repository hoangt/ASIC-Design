/* ADDB_test.v
*
* Module: module_name testbench
*
* Authors:
* Author1: Aishwarya
*
* Description:
* This file has the testbench code for SUBTA RTL code
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Aishwarya   	24/02/2014	Code Created.
* 1.01		Aishwarya	01/03/2014	Syntax errors resolved and code enhanced	
*
*/

//************ Module Declaration **************** 

module test;
//************ Wire declarations *****************
wire  scan_out0;
reg  clk, reset;
reg  scan_in0, scan_en;
reg  [15:0] DQ; 		// Test outputs
reg  [14:0] SE; 		// Test outputs
wire [15:0] SR;			//Test Inputs
reg [15:0] SR_test;		// Local variables

reg [15:0] DQI; 
reg [14:0] SEI;
reg DQS,SES;



//******************* Instantiation ***************

ADDB top(
//         .reset(reset),
//         .clk(clk),
//       .scan_in0(scan_in0),
//       .scan_en(scan_en),
//       .scan_out0(scan_out0),
	 .DQ(DQ),
	 .SE(SE),
	 .SR(SR)
         );

//************* Test Vector Generation **************
initial

	begin
    		$timeformat(-9,2,"ns", 16);
		`ifdef SDFSCAN
		$sdf_annotate("sdf/ADDB_tsmc18_scan.sdf", test.top);
		`endif
//		clk = 1'b0;
//    		reset = 1'b0;
//    		scan_in0 = 1'b0;
//		scan_en = 1'b0;
//           	i = 0;
//    			
			repeat (100)
			begin
//	   		
			#1	DQ = $random%(16'hFFFF); 
	 			$display("DQ is %b", DQ);
	 			SE = $random %(15'hFFF);
	 			$display("SE is %b", SE);

			end
   //				 $finish;
	end


//******************** Logic *************************

always @ (posedge clk or DQS or DQ)
	begin
		DQS = DQ[15];

		$display("DQS = %b ", DQS);

			 if (DQS == 0) 
				DQI <= DQ ;
			 else if (DQS == 1)
				DQI <= 65536 - DQ ;
	 		else 
       				begin
				$display (" Incorrect value of signal DQS =  ");
		 		$stop;
				end
		end
	

always @ (posedge clk or SES or SE)
	begin

	SES = SE[14];

		if (SES == 1)
 			SEI = (1<<15)+SE;
 		else if (SES ==0)
 			SEI = SE;
    		else
			begin		
	     		$display (" Incorrect value of signal SES ");
			$stop;
			end

	
end


always @ (posedge clk or SR or SR_test)
	
		begin
SR_test = (DQI+SEI);

	   		 if(SR == SR_test)
			   	begin
				 $display("ADDB : For SE = %b and DQ = %b test is successful ",SE,DQ); 
				 $display("ADDB : SR = %b and SR_test = %b",SR,SR_test);
			   	end
	 		 else
				begin
				 $display("ADDB : test Failed For SE = %b and DQ = %b ",SE,DQ); 
				 $stop;
				end 
		end

endmodule


