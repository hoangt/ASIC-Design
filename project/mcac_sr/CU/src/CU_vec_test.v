
module test;


CU # (
        .CNT_PRE_FA(3),
        .CNT_POST_FA(3)
) top (
	.s_fs           (in_fs),     
	.s_clk          (in_clk),    
	.clk            (sysclk),      
	.reset          (reset),        
        .FA_DONE        (fa_done),  
	.DLY_STRB       (dly_strb), 
	.FA_TRIG        (fa_trig),  
        .CHANNEL_CNT    (channel_cnt),  
        .ERROR          (error),     
        .RD_CLK         (rd_clk),   
        .RD_ADDR        (rd_addr),  
        .WR_CLK         (wr_clk),   
        .WR_ADDR        (wr_addr),  
	.scan_enable    (1'b0),
	.test_mode      (1'b0),
	.scan_in0       (1'b0),
	.scan_in1       (1'b0),
	.scan_in2       (1'b0),
	.scan_in3       (1'b0),
	.scan_in4       (1'b0),
	.scan_out0      (),
	.scan_out1      (),
	.scan_out2      (),
	.scan_out3      (),
	.scan_out4      ()
);

////////////////////////////////////
// Wires + Regs
//
reg
      in_fs,
      in_clk,
      sysclk,
      reset,
      fa_done;

wire
      dly_strb,
      fa_trig,
      error,
      rd_clk,
      wr_clk;

wire [2:0]
      channel_cnt,
      rd_addr,
      wr_addr;

////////////////////////////////////
// Test Bench
//

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/CU_tsmc18_scan.sdf", test.top);
`endif
    $finish;
end



endmodule
