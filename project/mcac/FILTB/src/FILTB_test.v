/* FILTB_tb.v

Authors:
Vineeta Singh

Description : Testbench for FILTB

*/

module test;

//wire and register instantiations
reg clk;
reg [2:0] FI;
reg [13:0] DML;
wire [13:0] DMLP;
wire [14:0] DIF;
wire DIFS;
wire [13:0] DIFSX;
wire [13:0] DMLP_TEST;

integer i, j;
FILTB dut (.FI(FI),
	   .DML(DML),
	   .DMLP(DMLP)
	  );

// Test vector generation


initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FILTB_tsmc18_scan.sdf", test.top);
`endif
    i=0;
	while (i< 10)
	begin
	i=i+1;
	j=i;
    #1 DML <= $random (i)%(14'h3FFF-14'h0);
       i=j;
	FI <= $random (i)%(3'b111-3'b000);
	i=j;
	end
	#10 display ("Test Completed");

    $finish;
end

//logic

assign DIF = (((FI << 11) + 32768 - DML) & 32767); //Compute difference

assign DIFS = DIF >> 14;

assign DIFSX = (DIFS)?((DIF>>7) +16128):(DIF>>7);

assign DMLP_TEST = (DIFSX + DML) & 16383 ;

always @ (posedge clk or FI or DML or DMLP)
	begin
	#1 if (DMLP == DMLP_TEST)
	begin
	$display("FLITB: For FI=%b and DML=%b test is successful", FI, DML);
	$display("FLITB : DMLP =%B and DMLP_TEST = % b", DMLP, DMLP_TEST);
	end
	else
	begin
	$display ("FILTB : test failed for FI=%b and DML= %b", FI, DML);
	$stop;
end 
end
endmodule
