/* ADDC_test.v
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
reg  [14:0] SEZ; 		// Test outputs
wire  PK0, SIGPK;			//Test Inputs
wire PK0_test, SIGPK_test;		// Local variables

reg [15:0] DQI; 
reg [14:0] SEZI;
reg DQS,SEZS;
wire [15:0] DQSEZ;


//******************* Instantiation ***************

ADDC top(
//         .reset(reset),
//         .clk(clk),
//       .scan_in0(scan_in0),
//       .scan_en(scan_en),
//       .scan_out0(scan_out0),
	 .DQ(DQ),
	 .SEZ(SEZ),
	 .PK0(PK0),
	 .SIGPK(SIGPK)	
         );

always
begin

 #2 clk = ~clk;
end
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
	 			SEZ = $random %(15'hFFF);
	 			$display("SEZ is %b", SEZ);
				$display(" PK0 = %b and SIGPK = %b ",PK0,SIGPK); 

			end
   //				 $finish;
	end


//******************** Logic *************************

always @ (posedge clk or DQS or DQ)
	begin
		DQS = DQ[15];

		$display("DQS = %b ", DQS);

			 if (DQS == 0)
				begin 
				DQI = DQ ;
				$display(" DQI = %b",DQI);
				end
			 else if (DQS == 1)
				begin
				DQI = 65536 - DQ ;
				$display(" DQI = %b",DQI);
				end

	 		else 
       				begin
				$display (" Incorrect value of signal DQS = %b ",DQS);
		 		$stop;
				end
		end
	

always @ (posedge clk or SEZS or SEZ)
	begin

	SEZS = SEZ[14];
		$display("SEZS = %b ", SEZS);

		if (SEZS == 1)
			begin
 			SEZI = (1<<15)+SEZ;
			$display("SEZI = %b ", SEZI);
			end	
 		else if (SEZS ==0)
 			begin
			SEZI = SEZ;
			$display("SEZI = %b ", SEZI);
			end
    		else
			begin		
	     		$display (" Incorrect value of signal SES ");
			$stop;
			end

	
end

assign DQSEZ = (DQI +SEZI);
assign PK0_test = DQSEZ [15] ;
assign SIGPK_test = (!DQSEZ)? 0:1;

always @(posedge clk or PK0_test or SIGPK_test)
	
		begin

	   		 if((PK0==PK0_test) && (SIGPK == SIGPK_test))
			   	begin
				 $display("PK0 : For PK0 = %b test is successful ",PK0_test); 
				 $display("SIGPK : SIGPK = %b test is successful ",SIGPK_test);
			   	end
	 		 else
				begin
				 $display("test Failed For PK0 = %b and SIGPK = %b ",PK0,SIGPK); 
				 $stop;
				end 
		end

endmodule



