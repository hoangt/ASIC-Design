
/* Clock_gen_tb.v

Authors:
Chethana Dilip

Description:
Testbench for Clock_gen

Date created : 04/21/2014

*/
module test;


reg test_mode,
    clk, 
    reset,
    enc_s_fs, 
    enc_s_clk;

reg [2:0] chn_cnt;

reg  scan_enable,
     scan_in0,
     scan_in1,
     scan_in2,
     scan_in3,
     scan_in4;


wire  clk_buff_out, 
      enc_i_clk, 
      enc_i_fs, 
      enc_s_fs_buff_out, 
      enc_s_clk_buff_out;

wire  scan_out0,
      scan_out1,
      scan_out2,
      scan_out3,
      scan_out4;

integer i;      

CLOCK_GEN #(
	.NUM_CLK(125)
)top(
        .clk          (clk),
	.reset        (reset),
        .chn_cnt      (chn_cnt),
	.enc_s_fs     (enc_s_fs),
	.enc_s_clk    (enc_s_clk),
	.test_mode    (test_mode),
	.scan_enable  (scan_enable),
	.scan_in0     (scan_in0),
        .scan_in1     (scan_in1),
        .scan_in2     (scan_in2),
        .scan_in3     (scan_in3),
        .scan_in4     (scan_in4),
        .scan_out0    (scan_out0),
        .scan_out1    (scan_out1),
        .scan_out2    (scan_out2),
        .scan_out3    (scan_out3),
        .scan_out4    (scan_out4),
	.enc_i_clk    (enc_i_clk),
	.enc_i_fs     (enc_i_fs),
	.enc_s_fs_buff_out  (enc_s_fs_buff_out), 
	.enc_s_clk_buff_out (enc_s_clk_buff_out),
	.clk_buff_out (clk_buff_out)
    );

always #(15625/2) enc_s_clk <= ~ enc_s_clk;
always #(125/2)   clk <= ~clk;


always @(posedge enc_s_clk) begin
	if(i < 7) begin
		i = i+1;
		chn_cnt = i;
                enc_s_fs = 1'b0;
	end
	else begin
		i = 0;
		chn_cnt = i;
                enc_s_fs = 1'b1;
	end
end

initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/CLOCK_GEN_tsmc18_scan.sdf", test.top);
`endif
    clk = 0;
    enc_s_clk = 0;
    enc_s_fs = 0;
    reset = 1'b1;
    i = 0;
    chn_cnt = 0;
    scan_in0 = 1'b0;
    scan_in1 = 1'b0;
    scan_in2 = 1'b0;
    scan_in3 = 1'b0;
    scan_in4 = 1'b0;	
    scan_enable = 1'b0;
    test_mode = 1'b0;
    #500 reset =1'b0;
    

      repeat(20)
      	@(posedge clk);

//	$finish;
end

endmodule

