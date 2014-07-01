//AUTHOR: David Herdzik
//REV 1.0 4/14/14 

module CLOCK_GEN (
			reset,
			clk,		// System clk
			scan_enable,
			scan_in0,
			scan_in1,
			scan_in2,
			scan_in3,
			scan_in4,
			scan_out0,
			scan_out1,
			scan_out2,
			scan_out3,
			scan_out4,
			sys_clk_buffered,		// System clk after buffer
			f_sync_in,			// f_sync input
			f_sync_in_buffered,		// buffered input f_sync
			f_sync_out_buffered,		// buffered output f_sync (generated)
			ch_clk_in,			// input channel clock
			not_ch_clk_in_buffered,		// buffered inverted channel clock
			ch_clk_out_buffered,		// buffered output channel clock
			test_mode
       );

input
    	reset,
    	clk,                      // system reset
    	ch_clk_in,
    	f_sync_in,
	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4,
    	scan_enable,
    	test_mode;

output
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4,
	sys_clk_buffered,
	f_sync_in_buffered,
	f_sync_out_buffered,
	not_ch_clk_in_buffered,
	ch_clk_out_buffered;

parameter [7:0] CLK_PER_CHAN=8'd200;

reg [3:0] FSYNC_COUNTER;
reg ch_clk_out_int, f_sync_out_int, not_ch_clk_int,f_sync_in_int;
wire ch_clk_out_buf_in,f_sync_out_buf_in,not_ch_clk_buf_in,f_sync_in_buf_in;
reg [7:0] CLK_GEN_COUNTER;
reg FSYNC_STATE;
assign FSYNC_PERIOD = {CLK_PER_CHAN,3'b000}; //frame sync period every 8 channel clocks
always @(posedge clk)
begin
	not_ch_clk_int <= ~ch_clk_in;
	f_sync_in_int <= f_sync_in;
	if(reset==1'b1)
	begin
		FSYNC_STATE<=1'b0;
		CLK_GEN_COUNTER<=8'd0;
		FSYNC_COUNTER<=4'd0;
	end
 	else
	begin
		if(f_sync_in==1'b1 && FSYNC_STATE==1'b0)
		begin
			f_sync_out_int<=1'b1;
			ch_clk_out_int<=1'b1;
			FSYNC_STATE<=1'b1;
			CLK_GEN_COUNTER<=8'd0;
			FSYNC_COUNTER<=4'd0;
		end
		else
		begin
			
			if (FSYNC_COUNTER!=4'd8)//wait until next fsync to start
			begin
				CLK_GEN_COUNTER<=CLK_GEN_COUNTER+8'd1;
				if (CLK_GEN_COUNTER[7:0]=={1'b0,CLK_PER_CHAN[7:1]})
					ch_clk_out_int<=1'b0;
				else if (CLK_GEN_COUNTER[7:0]==CLK_PER_CHAN[7:0])
				begin
					ch_clk_out_int<=1'b1;
					FSYNC_COUNTER<=FSYNC_COUNTER+4'd1;
					CLK_GEN_COUNTER<=8'd0;
				end
				if (FSYNC_COUNTER==4'd1)
					f_sync_out_int<=1'b0;
			end

			if(f_sync_in==1'b0)//has to have falling edge
				FSYNC_STATE<=1'b0;
		end

	end
	/*
	if (reset==1'b1 || CLK_GEN_COUNTER==FSYNC_PERIOD || (f_sync_in==1'b1 && (CLK_GEN_COUNTER>{2'b00 ,CLK_PER_CHAN, 1'b0}))) // F_SYNC_OUT synchronous with F_SYNC_IN but will continue to operate if input sync is lost
	begin
		CLK_GEN_COUNTER<=11'd0;
		ch_clk_out_int<=1'b1;
		f_sync_out_int<=1'b1;
	end else
	begin
		CLK_GEN_COUNTER<=CLK_GEN_COUNTER+11'd1;

		if (CLK_GEN_COUNTER=={3'b000,CLK_PER_CHAN})//F_SYNC high one period
			f_sync_out_int<=1'b0;
		
		if (CLK_GEN_COUNTER[7:0]=={1'b0,CLK_PER_CHAN[7:1]})
			ch_clk_out_int<=1'b0;
		else if (CLK_GEN_COUNTER[7:0]==CLK_PER_CHAN[7:0])
			ch_clk_out_int<=1'b1;
	end
*/
end




assign ch_clk_out_buf_in = test_mode ? clk : ch_clk_out_int;
assign not_ch_clk_buf_in = test_mode ?  clk : not_ch_clk_int ;

assign f_sync_in_buf_in = test_mode ? clk : f_sync_in_int; 
assign f_sync_out_buf_in = test_mode ? clk : f_sync_out_int; 


CLKBUFX20 f_sync_in_buf(.A(f_sync_in_buf_in),.Y(f_sync_in_buffered));
CLKBUFX20 f_sync_out_buf(.A(f_sync_out_buf_in),.Y(f_sync_out_buffered));

CLKBUFX20 not_ch_clk_buf(.A(not_ch_clk_buf_in),.Y(not_ch_clk_in_buffered));
CLKBUFX20 ch_clk_out_buf(.A(ch_clk_out_buf_in),.Y(ch_clk_out_buffered));

CLKBUFX20 main_clk_buf(.A(clk),.Y(sys_clk_buffered));

endmodule // CLOCK_GEN
