/*
module test;

Authors :
Vineeta Singh

Description:
Testbench for FILTE

Date modified:
03/09/2014
*/
//re  scan_out0;

module test;

reg  clk, reset;
//reg  scan_in0, scan_en;

// wire and register instantiations

reg [12:0] YUP;
reg [18:0] YL;
wire [18:0] YLP;
wire [13:0] DIF;
wire DIFS;
wire [18:0] DIFSX;
wire [18:0] YLP_TEST;

integer i, j;

FILTE top(
           .YUP (YUP),
	   .YL (YL),
	   .YLP(YLP)
	    );
// Test vector generation
initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FILTE_tsmc18_scan.sdf", test.top);
`endif
	i=0;
	while (i<10)
	begin
	i=i+1;
	j=i;
	#1 YUP <= $random (i) % (13'h1fff - 13'h0);
	i=j;
	  YL <= $random (i) % (19'h7fff - 19'h0);
	i=j;
	end
	# 10 $display ("Test Completed");
    $finish;
end

//logic

assign DIF = (YUP + ((1048576 - YL) >> 6)) & 16383;
assign DIFS = DIF >> 13;
assign DIFSX = (DIFS)? (DIF + 507904):(DIF);
assign YLP_TEST = (YL + DIFSX ) & 524287;

always @ (posedge clk or YUP or YL or YLP)
	begin
	#1 if (YLP == YLP_TEST)
	begin
	$display ("FILTE : For YUP = %b and YL = %b test is successful", YUP, YL);
	$dispay ("FILTE : YLP = %b and YLP_TEST = %b ", YLP, YLP_TEST);
	end
	else begin
	$display ("FILTE : test failed for YUP = %b and YL = %b", YUP, YL);
	$stop;
	end
end 

endmodule
