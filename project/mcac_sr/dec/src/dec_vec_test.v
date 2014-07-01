/* dec.v
*
* Module : top
*
* Authors: Niraj Vasudevan 
*
* Description: Vector testbench for dec.v
* 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		nv1440		04/01/2014	Module Created.
* 1.01		mgp6782		04/02/2014	Code tidied up. 
*               nv1440                          Updated to reflect dec.v changes.
*/

module test_decoder;

`define VECTOR_BIT_SIZE		24
`define MEM_ADDR_RANGE		19880

/*
// Actual frequencies
`define SYS_CLK_PERIOD		25    // in ns; = 100 MHz
`define iCLK_PERIOD		15625 // in ns; = 64 kHz
`define TEST_CLK_PERIOD		15625
*/
// for fast sim
`define SYS_CLK_PERIOD		2    // in ns; = 100 MHz
`define iCLK_PERIOD		1250 // in ns; = 64 kHz
`define TEST_CLK_PERIOD		1250

reg   [2*8-1:0]	rate	[0:3];
reg   [4*8-1:0]	law	[0:1];
reg   [1:0]   	RATE;
reg	      	LAW;
reg   [1:5]   	tb_dec_i;
reg           	tb_dec_i_clk     = 1'b0;
reg           	tb_dec_i_fs;
reg           	reset;                  // active HIGH reset
reg	      	sysclk      = 1'b0;
reg	      	test_clk    = 1'b0;
reg	      	start_test  = 1'b0;
reg		check_monitor;
reg		test_mode = 1'b1;
reg		scan_enable = 1'b1;

wire  [7:0]   	tb_dec_s;
wire  	      	tb_dec_s_clk,
		tb_dec_s_fs;
wire 	        tb_dec_error;

reg   [23:0]  	I_vec		[0 : `MEM_ADDR_RANGE - 1];	
reg   [23:0]  	SD_vec		[0 : `MEM_ADDR_RANGE - 1];	
reg   [23:0]  	Y_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	DQ_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	TR_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	SE_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	A2P_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	SR_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	YL_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	AL_vec		[0 : `MEM_ADDR_RANGE - 1];
reg   [23:0]  	TDP_vec		[0 : `MEM_ADDR_RANGE - 1];

integer fclk_cnt = 0;
integer i, j, k;

////////////////////////////////////////////////////
// Module Instantiations
// 
dec top(
	.RATE(RATE),
	.dec_i(tb_dec_i),
	.sysclk(sysclk),
        .reset(reset),
        .dec_i_clk(tb_dec_i_clk),
        .dec_i_fs(tb_dec_i_fs),
	.dec_s_clk(tb_dec_s_clk),
	.dec_s_fs(tb_dec_s_fs),
	.dec_error(tb_dec_error),
	.LAW(LAW),
	.dec_s(tb_dec_s),
	.test_mode(test_mode),
	.scan_enable(scan_enable),
	.scan_in0(1'b0),
	.scan_in1(1'b0),
	.scan_in2(1'b0),
	.scan_in3(1'b0),
	.scan_in4(1'b0)

	
    );

/////////////////////////////////////////////////////
// Generate Clocks and FSYNC
// 
always  #(`SYS_CLK_PERIOD/2)  sysclk    = ~sysclk;
always  #(`TEST_CLK_PERIOD/2) test_clk  = ~test_clk;
always  #(`iCLK_PERIOD/2)     tb_dec_i_clk   = ~tb_dec_i_clk;
always @(posedge tb_dec_i_clk or posedge reset) begin
  if (reset) begin
    tb_dec_i_fs = 1'b0;
    fclk_cnt = 3'd0;
  end else begin
    if (fclk_cnt == 7) begin
      tb_dec_i_fs = 1'b1;
      fclk_cnt = 0;
    end else begin
      tb_dec_i_fs = 1'b0;
      fclk_cnt = fclk_cnt + 1;
    end
  end
end

/////////////////////////////////////////////////////
// Define rates and laws
// 
initial begin
		rate[0] = "40";
		rate[1] = "32";
		rate[2] = "24";
		rate[3] = "16";

		law[0] = "ulaw";
		law[1] = "alaw";
		test_mode = 1'b0;
		scan_enable = 1'b0;
end

/////////////////////////////////////////////////////
// Initialize RAMs and run vector tests
// 
initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/dec_tsmc18_scan.sdf", test.top);
`endif
LAW = 1'd0;
RATE = 2'd0;
tb_dec_i = 8'd0;
@(posedge test_clk)
reset = 1'b0;
@(posedge test_clk)
reset = 1'b1;
@(posedge test_clk)
reset = 1'b0;
   
for(i = 0; i < 4; i = i + 1) begin		//Loop for rates
	for(j = 0; j < 2; j = j + 1) begin	//Loop for laws
		
		$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/I.t"}, I_vec );
		$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/sd.t"}, SD_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/y.t"}, Y_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/dq.t"}, DQ_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/tr.t"}, TR_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/se.t"}, SE_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/a2p.t"}, A2P_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/sr.t"}, SR_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/yl.t"}, YL_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/tdp.t"}, TDP_vec );
		//$readmemh( {"../model/adpcm-itu/vector_out/",law[j],"/dec/",rate[i],"/normal/homing/al.t"}, AL_vec );
                RATE = i;
                LAW = j;
		@(posedge test_clk)
                reset = 1'b1;
                $display("** Starting %s %s kb/s Vector Test...",law[j],rate[i]);
		@(posedge test_clk);
		reset = 1'b0;
		compare;	

		end
	end
        $display("** Tests complete. Exiting testbench.");
        #100 $finish;
end

/////////////////////////////////////////////////////
// Tasks
// 
task compare;
begin
  k = 0;
  while(k < `MEM_ADDR_RANGE) begin	
    @(posedge test_clk);
    if(fclk_cnt == 7) begin
      tb_dec_i = I_vec[k];
      @(negedge test_clk);
      monitor;
      k = k + 1;
    end else begin
      tb_dec_i = 8'd0;
    end
  end
end
endtask

task monitor; 
if(fclk_cnt == 0 && k != 0)begin
  if(tb_dec_s === SD_vec[k-1]) begin
  //repeat (50)  @(posedge sysclk);
  //if(test_decoder.top.SD === SD_vec[k]) begin
`ifdef VERBOSE
    $display("** Success!!	Expected = %h	Received = %h @ k = %d", SD_vec[k-1], tb_dec_s, k);
`endif
  end else begin
    $display("** Error!!	Expected = %h	Received = %h	Input = %h  LAW= %d  RATE= %d @ k = %d", SD_vec[k-1], tb_dec_s, I_vec[k-1], LAW, RATE, k);
    //$display("** Error!!	Expected = %h	Received = %h	Input = %h  LAW= %d  RATE= %d @ k = %d", SD_vec[k], test_decoder.top.SD, I_vec[k], LAW, RATE, k);
    //$display("** Expected Signals:  Y=%h; DQ=%h;  TR=%h;  SR=%h;  A2P=%h; SE=%h;  YL=%h;  TDP=%h; AL=%h;", Y_vec[k], DQ_vec[k], TR_vec[k], SR_vec[k], A2P_vec[k], SE_vec[k], YL_vec[k], TDP_vec[k], AL_vec[k]);
    //$display("** Actual Values:     Y=%h; DQ=%h;  TR=%h;  SR=%h;  A2P=%h; SE=%h;  YL=%h;  TDP=%h; AL=%h;", test_decoder.top.y_w, test_decoder.top.dq_w, test_decoder.top.TR_w, test_decoder.top.sr_w, test_decoder.top.A2P_w, test_decoder.top.SE_w, test_decoder.top.yl_w, test_decoder.top.tdp_w, test_decoder.top.al_w);
`ifdef BREAKONERROR
    $stop;
`endif
  end
end
endtask

endmodule // end of test

