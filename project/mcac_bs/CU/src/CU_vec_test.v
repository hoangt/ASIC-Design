
module test;

wire  scan_out0;

reg  clk, reset;
reg  scan_in0, scan_en;

CU top(
        .reset(reset),
        .clk(clk),
        .scan_in0(scan_in0),
        .scan_en(scan_en),
        .scan_out0(scan_out0)
    );


initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/CU_tsmc18_scan.sdf", test.top);
`endif
    clk = 1'b0;
    reset = 1'b0;
    scan_in0 = 1'b0;
    scan_en = 1'b0;
    $finish;
end

endmodule
