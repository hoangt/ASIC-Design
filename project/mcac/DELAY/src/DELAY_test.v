/* DFELAY.v
*
* Module: DELAY
*
* Authors:
* Ravikiran Yadava
*
* Description:This file has the code to test the DELAY.v file which has the following logic
* y(k)=x(k-1) (G.726, Page 46)
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Ravikiran	03/16/2014	Module Created and modified.
* */
// Module Declaration



module test;
parameter RESET_STATE = 0;	

reg  clk;

reg [1:0] test_x;
reg test_R;

wire [1:0] y;
wire [1:0] test_y;
integer j = 0,i =0;
DELAY top(
         .clk(clk),
	.x(test_x),
	.R(test_R),
	.y(y)
    );

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/DELAY_tsmc18_scan.sdf", test.top);
`endif
    clk = 1'b0;
    test_R = 1'b0;
    repeat(100)
	begin
		i = i +1;
		j = i;
		#5 test_x <= $random(i)%(2'b11);
		  // test_R <= ~ test_R;
		   $display("test_x = %b and test_R = %b",test_x,test_R);
	/*	i = j;	
	        #5 test_x <= 2'b00;
	        test_R <= ~ test_R;	
		test_x = test_x +2'b01;*/
	end
    $finish;
end

always 
	begin
	# 5 clk = ~ clk;
	end

assign text_y = test_R?0:test_x;

always @(test_y or test_x)
	begin
		$display("inside the always block");

	/*	if(test_R)
			begin
				$display("inside if test_R");
				test_y <= 0;	
			end
		else
			begin	
				$display("inside else test_R");
				test_y <= test_x;
			end
		*/
		if(test_y == y)
			begin
		       	 $display("DELAY: For test_x= %b and test_R = %b test is successful ",test_x, test_R); 
			 $display("DELAY : y = %b and test_y = %b",y, test_y);
			end
	        else
			begin
			 $display("DELAY : test Failed For test_x = %b and test_R = %b, the ",test_x,test_R); 
			 $display("DELAY : test Failed value of test_y andd y ",test_y,y); 
			// $stop;
			end 	
	end
endmodule
