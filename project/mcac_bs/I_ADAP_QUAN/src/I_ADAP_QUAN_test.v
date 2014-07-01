
module test;

wire  scan_out0;

reg [4:0]I;
reg [12:0]Y;
reg [1:0]RATE;
wire [15:0]D;
reg  clk, reset;
reg  scan_in0, scan_en;

I_ADAP_QUAN top(
        .reset(reset),
        .clk(clk),
        .scan_in0(scan_in0),
        .scan_en(scan_en),
        .scan_out0(scan_out0),
    	.D(D),
	.I(I),
	.RATE(RATE),
	.Y(Y)
);


initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/I_ADAP_QUAN_tsmc18_scan.sdf", test.top);
`endif
    clk = 1'b0;
    reset = 1'b0;
    scan_in0 = 1'b0;
    scan_en = 1'b0;
    $finish;
end

endmodule
