/* Module : Test

Authors : Vineeta Singh

Description : Testbench for FILTC

Date created : 03/02/2014
*/

module test;
// wire and register instantiations

//wire  scan_out0;

//reg  clk, reset;
//reg  scan_in0, scan_en;
reg clk;
reg AX;
reg [9:0] AP;
wire [9:0] APP;
wire [9:0]DIF;
wire DIFS;
wire [9:0]DIFSX;
wire [9:0] APP_TEST;

/*FILTC top(
        .reset(reset),
        .clk(clk),
        .scan_in0(scan_in0),
        .scan_en(scan_en),
        .scan_out0(scan_out0)
    );
*/
FILTC dut (.AX (AX),
	   .AP (AP),
	   .APP(APP)
	  );
// Test vector generation

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FILTC_tsmc18_scan.sdf", test.top);
`endif
   // clk = 1'b0;
   // reset = 1'b0;
   // scan_in0 = 1'b0;
   // scan_en = 1'b0;
	i=0;
	while (i<10)
	begin 
	i=i+1;
	j=i;
	#1 AP <= $random (i)%(10'h3ff-10'h0);
	i=j;
	AX <= $random (i)%(1'b1- 1'b0);
	i=j;
	end
	#10 $display ("Test Completed");
	$finish;
	end

//logic

	assign DIF = (((AX<<9) +2048 -AP) & 2047);

	assign DIFS = DIF >> 10 ;

	assign DIFSX = (DIFS)?((DIF>>4) + 896):(DIF>>4);

	assign APP_TEST = (DIFSX + AP) & 1023;

	always @ (posedge clk or AX or AP or APP)
	begin
	#1 if (APP == APP_TEST)
	begin
	$display ("FILTC : For AX = %b and AP = %b test is successful", AX, AP);
	$display ("FILTC : APP = %b and APP_TEST = %b", APP, APP_TEST);
	end
	else begin
	$display ("FILTC : test failed for AX = %b and AP = %b", AX, AP);
	$stop;
	end
	end

endmodule
