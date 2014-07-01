/*
* Module : ADDA_test
* Author: Aishwarya Ganapathy Subramaniam
* Description :
* This is a test bench to test the ADDA module which adds the scale
* factor to the logarithmic version of quantized difference signal
*
* Revision History :
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0.0		Aishwarya	02/10/2014	Module Created.
* 1.0.1         Aishwarya	02/14/2014	Module updated
*
*/


//***********Module declaration**************

module test;

//************Variable declaration*******************

wire [11:0] DQL; 		// Test mode data input
reg [11:0] DQLN;  		// Test mode data output
reg [12:0] Y ; 			// Test mode scan enable
reg [11:0] DQL_test; 			// internal register

//************Instantiation********************

ADDA top( 
	.DQLN(DQLN),
     	.Y(Y),	
	.DQL(DQL)
	  );
//***********************logic*******************************
initial
	begin 
   	    $timeformat(-9,2,"ns", 16);
	    `ifdef SDFSCAN
 	     $sdf_annotate("sdf/ADDA_tsmc18_scan.sdf", test.top);
	     `endif

  		#1 	repeat (10)
			begin
			#1	DQLN = $random % (12'hfff);
				$display("DQLN - %h", DQLN);
  			  	Y =$random % (13'hfff);
				$display("Y - %h", Y);

		//	end
			//#1000 $finish;
//	end 		// end of the initial block 

//always@(DQLN )
//	begin
		#1 DQL_test = (DQLN + (Y[12:2]));
		$display("DQL_test - %h", DQL_test);
		$display("DQL - %h", DQL);

//        always@(DQL or DQL_test)
// begin
        	if (DQL_test != DQL)	
        		begin
                	$display("**Failed test**");
		//	`ifdef BREAKONERR
                	$stop;
		//	`endif
	                end
    		else
        	$display("**Passed Simulation**");
	end // end of always block
end
endmodule
