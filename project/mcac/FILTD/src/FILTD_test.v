/*
module test;

Authors:
Vineeta Singh

Date modified :
03/09/2014

Description:
Testbench for FILTD
*/

module test;

//wire and register instantiations
//wire  scan_out0;

reg  clk, reset;
//reg  scan_in0, scan_en;
reg [11:0] WI;
reg [12:0] Y;
wire [12:0] YUT;
wire [16:0] DIF;
wire DIFS;
wire [12:0] DIFSX;
wire [12:0] YUT_TEST;

integer i, j;

FILTD top(
         .WI(WI),
	 .Y(Y),
	 .YUT(YUT)
	 );
// Test vector generation

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FILTD_tsmc18_scan.sdf", test.top);
`endif
    i=0;
    while (i<j)
    begin
	i=i+1;
	j=i;
	#1 Y <= $random (i) % (13'h1fff - 13'h0);
	i=j;
	WI <= $random (i) % (12'hfff - 12'h0);
	i=j;
	end
   #10 $display ("Test Completed");
    $finish;
end

//logic

assign DIF = (((WI<<5) + 131072 - Y) & 131071);
assign DIFS = DIF << 16;

assign DIFSX = (DIFS)?((DIF>>5) + 4096 ):(DIF>>5);
assign YUT_TEST = (Y + DIFSX) & 8191 ;

always @ (posedge clk or Y or WI or YUT)
begin
	#1 if (YUT == YUT_TEST)
	begin
	$display ("FILTD : For WI = %b and Y = %b test is successful", WI, Y);
	$display ("FILTD : YUT = %b and YUT_TEST = %b", YUT, YUT_TEST);
	end
	else begin
	$display ("FILTD : test failed for WI = %b and Y = %b", WI, Y);
	$stop;
	end
  end
endmodule
