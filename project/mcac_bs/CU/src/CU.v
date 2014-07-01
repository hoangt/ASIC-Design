/* CU.v
*
* Module:Control unuit
* 
* Authors: Abhishek Ramesh
* 	   Ravi Kiran Yadava
* 
* Description: Control unit for the whole FMULT+ACCUM module
* 
* Revision History:
* _Rev #_	_Author(s)_		_Date_		_Changes_
* 1.00		Abhishek, Ravi Kiran	04/6/2014	Module started
* 1.01		Abhishek Ramesh		04/11/2014	Completed- Not verified
* 1.02		Abhishek, Ravi Kiran	04/13/2014	Fixed errors
* 1.03		Abhishek Ramesh		04/18/2014	Added test ports
* 1.04		Abhishek Ramesh		04/28/2014	Clock buffer added and completed the module
*/

////////////////////// Definitions /////////////////
// Delays
`define IN_WAIT_CLKS 5'd16
`define DELAY_WAIT_CLKS 5'd18
`define OUT_WAIT_CLKS 5'd16//must less than delay

///////////////////////////////////////////////////////////////
module CU (
           reset,  	//Global reset
	   FSYNC_IN, 	//Frame Sync- high at channel 0
	   FSYNC_OUT, 	//Frame Sync- high at channel 0
	   NOT_CH_CLK_IN,	//Frame clock- next channel at rising edge
	   CH_CLK_OUT,	//Frame clock- next channel at rising edge
           clk,        	//System clock- fed to FMULT_accum
           FA_start,	//FMULT_ACCUM start trigger
	   FA_done,		//output of FMULT_ACCUM
	   delay_strobe,	// Delay strobe by control unit to shift data through delay
   	   scan_enable,
	   test_mode,
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
	   RF_WR_ADDR,
	   RF_RD_ADDR,
	   RF_WR,
	   RF_RD
       );

input
    reset,  
    FSYNC_IN,                   
    FSYNC_OUT,                   
    NOT_CH_CLK_IN,	//Frame clock- next channel at rising edge
    CH_CLK_OUT,	//Frame clock- next channel at rising edge
    clk, 
    FA_done,
    scan_enable,
    test_mode,
    scan_in0,
    scan_in1,
    scan_in2,
    scan_in3,
    scan_in4;			

output delay_strobe;
output RF_WR;
output RF_RD;
output FA_start,
   // error,
    scan_out0,
    scan_out1,
    scan_out2,
    scan_out3,
    scan_out4;
output RF_WR_ADDR, RF_RD_ADDR;

reg FA_start,
   // error,
    scan_out0,
    scan_out1,
    scan_out2,
    scan_out3,
    scan_out4;
wire [2:0] RF_WR_ADDR, RF_RD_ADDR;

////////////////////// Wires ////////////////////////
reg [4:0] IN_WAIT_CNT;
reg IN_WAIT_STATE;
reg delay_strobe_r;
reg RF_WR_r;
reg RF_RD_r;
wire delay_strobe_buff_in;
wire RF_WR_buff_in;
wire RF_RD_buff_in;


////////////////////// DFT muxes//////////////////

assign delay_strobe_buff_in = test_mode ? clk : delay_strobe_r ;
assign RF_WR_buff_in = test_mode ? clk : RF_WR_r ;
assign RF_RD_buff_in = test_mode ? clk : RF_RD_r;

////////////////// Clock Buffer ////////////
CLKBUFX20 delay_buf(.A(delay_strobe_buff_in),.Y(delay_strobe));
CLKBUFX20 RF_buf1(.A(RF_WR_buff_in),.Y(RF_WR));
CLKBUFX20 RF_buf2(.A(RF_RD_buff_in),.Y(RF_RD));

///////////////// INPUT DELAY ////////////////
always @(posedge clk or posedge reset)
begin
	if (reset==1'b1)
	begin
		FA_start<=1'b0;
		IN_WAIT_CNT<=5'd0;
		IN_WAIT_STATE<=1'b0;
	end
	else
	begin
		if (NOT_CH_CLK_IN==1'b1 && IN_WAIT_STATE==1'b0) 
		  begin
			IN_WAIT_CNT <= 5'd0;
			IN_WAIT_STATE<=1'b1;
		  end 
		else if (IN_WAIT_CNT<`IN_WAIT_CLKS)
		begin
			IN_WAIT_CNT<=IN_WAIT_CNT+5'd1;
		end
		if (NOT_CH_CLK_IN==1'b0)
			IN_WAIT_STATE<=1'b0;

		if (IN_WAIT_CNT==`IN_WAIT_CLKS-1)
			FA_start<=1'b1;
		else
			FA_start<=1'b0;
	end
end
//OUTPUT DELAY
reg [4:0] OUT_WAIT_CNT;
reg out_wait_state;
reg [2:0] RF_in_state;
always @(posedge clk or posedge reset)
begin
	if (reset==1'b1)
	begin
		RF_in_state<=3'd0;
		out_wait_state<=1'b0;
		delay_strobe_r<=1'b0;
		RF_WR_r<=1'b0;

	end
	else
	begin
	//	if (RF_in_state==3'd7 && FSYNC_IN==1'b1)
		if (NOT_CH_CLK_IN==1'b1 && FSYNC_IN==1'b1)
			RF_in_state<=3'd0;
	//count
		if (FA_done==1'b1 && out_wait_state==1'b0) 
		  begin
			out_wait_state<=1'b1;
			OUT_WAIT_CNT<=5'd0;
		  end 
		  else if(FA_done==1'b0)
		  begin
			out_wait_state<=1'b0;
		  end
		else if (OUT_WAIT_CNT<`DELAY_WAIT_CLKS)
		begin
			OUT_WAIT_CNT<=OUT_WAIT_CNT+5'd1;
		end
	//strobe control signals
		if (OUT_WAIT_CNT==`DELAY_WAIT_CLKS-1)
		begin
			delay_strobe_r<=1'b1;
			if (RF_in_state !=3'd7)
				RF_in_state<=RF_in_state+3'd1;
		end
		else
			delay_strobe_r<=1'b0;

		if (OUT_WAIT_CNT==`OUT_WAIT_CLKS-1)
		begin
			RF_WR_r<=1'b1;
		end
		else
			RF_WR_r<=1'b0;
	end
end
assign RF_WR_ADDR=RF_in_state;
//////////////// Channel out ///////////
reg [2:0] RF_STATE_OUT;
reg OUT_WRITE_STATE;
always @(posedge clk or posedge reset) 
begin
	if(reset==1'b1)
	begin
		OUT_WRITE_STATE<=1'b0;
	//	RF_STATE_OUT<=3'd0;
	end
	else
	begin
		if (OUT_WRITE_STATE==1'b0 && CH_CLK_OUT==1'b1)
		begin
			RF_RD_r<=1'b1;
			OUT_WRITE_STATE<=1'b1;
		end
		else
			RF_RD_r<=1'b0;
		if(CH_CLK_OUT==1'b0)
			OUT_WRITE_STATE<=1'b0;
	end
end
always @(negedge CH_CLK_OUT,posedge reset)
begin
	if(reset==1'b1)
	begin
		RF_STATE_OUT<=3'd0;
	end
	else
	begin
		if (FSYNC_OUT)
			RF_STATE_OUT <= 3'd0;
		else
		begin
			RF_STATE_OUT <=	RF_STATE_OUT+3'd1;
		end
	end
end
assign RF_RD_ADDR=RF_STATE_OUT;
/////////////////////////////////////////////////
endmodule // CU
