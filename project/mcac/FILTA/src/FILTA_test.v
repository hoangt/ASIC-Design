/* FILTA_tb.v

Authors:
Vineeta Singh

Description:
Testbench for FILTA

Date created : 02/23/2014

*/
module test;

// wire and register instantiations
reg clk;
reg [2:0] FI;
reg [11:0] DMS;
wire [11:0] DMSP;
wire [ 11:0] DMSP_TEST;
wire [ 13:0] DIF;
wire [11:0] DIFSX;
wire DIFS;

integer i, j;

FILTA dut(
          .FI (FI),
	  .DMS(DMS),
	  .DMSP(DMSP)
    );

//Test vector generation

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FILTA_tsmc18_scan.sdf", test.top);
`endif
    

        i=0;
	while (i<10)
	begin
	i=i+1;
	j=i;
      #1 DMS<= $random (i) % (12'hFFF - 12'h0);
	i=j;
	 FI<= $random (i) % (3'b111 - 3'b000);
	i=j;
	end
      # 10 $display ("Test completed");
	$finish;
end

//logic

assign DIF = (((FI<<9) + 8192 - DMS) & 8191); // Compute differnce

assign DIFS = DIF >> 12;

assign DIFSX = (DIFS)? ((DIF>>5) +3840):(DIF>>5);

assign DMSP_TEST = ((DIFSX + DMS)& 4095);

always @ (posedge clk or FI or DMS or DMSP) begin
	#1 if (DMSP == DMSP_TEST) begin
	$display("FILTA : For FI =%b and DMS = %b test is successful", FI, DMS);
	$display("FILTA : DMSP = %b and DMSP_test = %b", DMSP, DMSP_TEST);
	end
	else begin
	$display("FILTA : test failed for FI =%b and DMS = %b", FI, DMS);

	$stop;
	end
      end

endmodule
