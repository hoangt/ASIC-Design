/* enc_vec_test.v
*
* Module: enc vector testbench
*
* Authors: Pratheep Joe
*
* Description:
* This file 
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		pi4810		04/13/2014	Module Created.
*/

`define VECTOR_BIT_SIZE		 24
`define MEM_ADDR_RANGE		19880


`define CLK_PERIOD		78
`define FCLK_PERIOD		15600
`define FSYNC_PERIOD		124800
`define SYS_CLK_PERIOD           78


`define DELAY_CLK_PERIOD     	 2500
`define TEST_CLK_PERIOD		20000
// Module Declaration
module enc_vector_tb ();

///////////////////////////////////////////
// Registers 
//
reg	[7:0]	tb_s;		
reg		tb_clk;                
reg   	[1:0]  	tb_rate;
reg	      	LAW;
reg           	tb_fclk;     
reg           	tb_fsync;
reg           	tb_R;                  // active HIGH reset
reg	      	sysclk      = 1'b0;
reg	      	start_test  = 1'b0;
reg		test_clk,			// clk for verification
		delay_clk,			// clk for delay blocks
		testing_alaw,			// == 1 if running alaw vectors
		testing_ulaw,			// == 1 if running ulaw vectors
		check_monitor,			// == 1 if running ulaw vectors
		new_vector_set;			// Toggles high when changing vector set

reg		START;
reg   [23:0]  I_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  s_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  se_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  d_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  dq_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  y_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  al_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  a2p_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  tr_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  td_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  yl_vec	[`MEM_ADDR_RANGE - 1: 0];

reg   [23:0]  DQ1_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  DQ2_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  DQ3_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  DQ4_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  DQ5_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  DQ6_vec	[`MEM_ADDR_RANGE - 1: 0];

reg   [23:0]  B1_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  B2_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  B3_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  B4_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  B5_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  B6_vec	[`MEM_ADDR_RANGE - 1: 0];

reg   [23:0]  SR1_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  A1_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  SR2_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  A2_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  A2T_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  A2P_vec	[`MEM_ADDR_RANGE - 1: 0];
reg   [23:0]  A2R_vec	[`MEM_ADDR_RANGE - 1: 0];

wire test_mode;
wire scan_enable;
wire scan_in0;
wire scan_in1;
wire scan_in2;
wire scan_in3;
wire scan_in4;

integer fs_cnt = 0;
integer fclk_cnt = 0,i;
wire	[7:0]	tb_I;		//

/////////////// signals /////////////////////////
//

		`ifdef ISNOTGATE
wire [14:0] t_se = enc_vector_tb.top.se_w;
wire [14:0] t_s_reg = enc_vector_tb.top.enc_s_w;
//wire	[13:0] t_sl=	enc_vector_tb.top.sl_w;					// Linear input signal
wire	[15:0] t_d=	enc_vector_tb.top.d_w;					// Difference signal
wire	[15:0] t_dq=	enc_vector_tb.top.dq_w;					// Quantized difference signal
wire	[12:0] t_y=	enc_vector_tb.top.y_w;					// Quantizer scale factor
wire	[18:0] t_yl=	enc_vector_tb.top.yl_w;					// Delayed slow quantizer scale factor
wire		t_td=	enc_vector_tb.top.td_w;					// Tone detect
wire		t_tr=enc_vector_tb.top.tr_w;					// Transition detect
wire	[6:0]	t_al=enc_vector_tb.top.al_w;					// Speed control parameter
wire	[15:0]	t_a2p=enc_vector_tb.top.a2p_w;
wire	[4:0]	t_i=enc_vector_tb.top.enc_i_w;

wire	[10:0]	t_DQ1=enc_vector_tb.top.iadap_pred_rec.DQ1;
wire	[10:0]	t_DQ2=enc_vector_tb.top.iadap_pred_rec.DQ2;
wire	[10:0]	t_DQ3=enc_vector_tb.top.iadap_pred_rec.DQ3;
wire	[10:0]	t_DQ4=enc_vector_tb.top.iadap_pred_rec.DQ4;
wire	[10:0]	t_DQ5=enc_vector_tb.top.iadap_pred_rec.DQ5;
wire	[10:0]	t_DQ6=enc_vector_tb.top.iadap_pred_rec.DQ6;

wire	[15:0]	t_B1=enc_vector_tb.top.iadap_pred_rec.B1;
wire	[15:0]	t_B2=enc_vector_tb.top.iadap_pred_rec.B2;
wire	[15:0]	t_B3=enc_vector_tb.top.iadap_pred_rec.B3;
wire	[15:0]	t_B4=enc_vector_tb.top.iadap_pred_rec.B4;
wire	[15:0]	t_B5=enc_vector_tb.top.iadap_pred_rec.B5;
wire	[15:0]	t_B6=enc_vector_tb.top.iadap_pred_rec.B6;

wire	[15:0]	t_A1=enc_vector_tb.top.iadap_pred_rec.A1;
wire	[15:0]	t_A2=enc_vector_tb.top.iadap_pred_rec.A2_int;
wire	[15:0]	t_A2P=enc_vector_tb.top.iadap_pred_rec.A2Pint;
wire	[15:0]	t_A2R=enc_vector_tb.top.iadap_pred_rec.A2R_int;
wire	[15:0]	t_A2T=enc_vector_tb.top.iadap_pred_rec.A2T;
wire	[10:0]	t_SR1=enc_vector_tb.top.iadap_pred_rec.SR1;
wire	[10:0]	t_SR2=enc_vector_tb.top.iadap_pred_rec.SR2;
		`endif
////////////////////////////////////////////////////
// Module Instantiations
// 
enc top(
	.enc_s(tb_s),						// PCM input word
	.reset(tb_R),						// reset signal
	.rate(tb_rate),
	.clk(sysclk),
	.law(LAW),
	.enc_i(tb_I),
	.enc_s_clk(tb_fclk),
	.enc_s_fs(tb_fsync),
	.enc_i_clk(out_fclk),
	.enc_i_fs(out_fsync),
	.scan_in0(scan_in0),
	.scan_in1(scan_in1),
	.scan_in2(scan_in2),
	.scan_in3(scan_in3),
	.scan_in4(scan_in4),
    	.scan_enable(scan_enable),
    	.test_mode(test_mode),
	.scan_out0(scan_out0),
	.scan_out1(scan_out1),
	.scan_out2(scan_out2),
	.scan_out3(scan_out3),
	.scan_out4(scan_out4)
    );



///////////////////////////////////////////
// 	MAIN CODE
//

assign test_mode=1'b0;
assign scan_enable=1'b0;
assign scan_in0=1'b0;
assign scan_in1=1'b0;
assign scan_in2=1'b0;
assign scan_in3=1'b0;
assign scan_in4=1'b0;
initial begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/enc_tsmc18_scan.sdf", enc_vector_tb.top);
`endif
	sysclk<=1'b0;
	tb_R = 1'b0;
	i = 1'b0;
	test_clk = 1'b0;
	delay_clk = 1'b0;
	testing_alaw = 1'b0;
	testing_ulaw = 1'b0;
	new_vector_set = 1'b0;
	check_monitor = 1'b0;
	tb_rate = 2'b00;
	@(posedge test_clk)
		tb_R = 1'b1;
	@(posedge test_clk)
		tb_R = 1'b0;
	@(posedge test_clk);

// u-law vectors

	LAW = 1'b0;
	tb_rate = 2'b11;
	$display("Testing ulaw 16kb/s");
	//Second Set of Test Vectors: 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2p.t", a2p_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/td.t", td_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/yl.t", yl_vec);

	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq1.t", DQ1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq2.t", DQ2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq3.t", DQ3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq4.t", DQ4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq5.t", DQ5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/dq6.t", DQ6_vec);

	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/b1.t", B1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/b2.t", B2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/b3.t", B3_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/b4.t", B4_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/b5.t", B5_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/b6.t", B6_vec);

	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sr1.t", SR1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/sr2.t", SR2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a1.t", A1_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2.t", A2_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2t.t", A2T_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2p.t", A2P_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/16/normal/homing/a2r.t", A2R_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate = 2'b10;

	$display("Testing ulaw 24kb/s");
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/24/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate = 2'b01;

	$display("Testing ulaw 32kb/s");
	//Second Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/32/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate =2'b00;

	$display("Testing ulaw 40kb/s");
	//Second Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/ulaw/enc/40/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;

	testing_ulaw = 1'b0;



// a-law vectors

	LAW= 1'b1;
	tb_rate = 2'b11;
	
	$display("Testing alaw 16kb/s");
	//First Set of Test Vectors for 16 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/16/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b10;
	
	$display("Testing alaw 24kb/s");
	//Second Set of Test Vectors: 24 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/24/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate = 2'b01;

	$display("Testing alaw 32kb/s");
	//Third Set of Test Vectors: 32 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/32/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	tb_rate= 2'b00;

	$display("Testing alaw 40kb/s");
	//Fourth Set of Test Vectors: 40 kb/s
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/I.t", I_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/pcm.t", s_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/se.t", se_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/d.t", d_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/dq.t", dq_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/y.t", y_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/tr.t", tr_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/al.t", al_vec);
	$readmemh("../model/adpcm-itu/vector_out/alaw/enc/40/normal/homing/a2p.t", a2p_vec);
	new_vector_set = 1'b1;
	@(posedge test_clk);
	new_vector_set = 1'b0;
	test_vectors;
	
	$finish;

end

always begin

/////////////////////////////////////////////////////
// Generate Clocks and FSYNC
// 
  #(`SYS_CLK_PERIOD/2)  sysclk    = ~sysclk;
  #(`CLK_PERIOD/2) 	test_clk = ~test_clk;
 // #(`FSYNC_PERIOD/2) 	tb_fsync  = ~tb_fsync;
//  #(`FCLK_PERIOD/2)  	tb_fclk   = ~tb_fclk;

end

always @(posedge sysclk) begin
	fclk_cnt<=fclk_cnt+1;
	if (fclk_cnt==101)
	begin
		tb_fclk<=1'b0;
	end
	if (fclk_cnt==202)
	begin
		fclk_cnt<=0;
		fs_cnt<=fs_cnt+1;
		tb_fclk<=1'b1;
	end
	if (fs_cnt==8)
	begin
		fs_cnt<=0;
		tb_fsync<=1'b1;
	end
	if (fs_cnt==1)
	begin
		tb_fsync<=1'b0;
	end
end


always @(negedge out_fsync) begin
	@ (negedge out_fclk) 
	monitor;
end


task test_vectors;
begin
		tb_R <= 1'b1;
		tb_fclk <=1'b1;
		tb_fsync <=1'b1;
		tb_s   <= s_vec[0];
		@(posedge sysclk);
		@(posedge tb_fsync);
		tb_R<=1'b0;
		$display("hi");
	i=0;
	for(i = 1; i <= `MEM_ADDR_RANGE - 1; i = i + 1)
	begin
/*
		@(posedge tb_fsync)
			begin
			tb_R<=1'b0;
			tb_s   <= s_vec[i];
			end
*/

	@(posedge tb_fsync);
		tb_s   <= s_vec[i];
	@(posedge tb_fclk);
		tb_s   <= 8'b0;
	end
end
endtask


/*
wire [14:0] t_se = enc_vector_tb.top.se_w;

//wire	[13:0] t_sl=	enc_vector_tb.top.sl_w;					// Linear input signal
wire	[15:0] t_d=	enc_vector_tb.top.d_w;					// Difference signal
wire	[15:0] t_dq=	enc_vector_tb.top.dq_w;					// Quantized difference signal
wire	[12:0] t_y=	enc_vector_tb.top.y_w;					// Quantizer scale factor
wire	[18:0] t_yl=	enc_vector_tb.top.yl_w;					// Delayed slow quantizer scale factor
wire		t_td=	enc_vector_tb.top.td_w;					// Tone detect
wire		t_tr=enc_vector_tb.top.tr_w;					// Transition detect
wire	[6:0]	t_al=enc_vector_tb.top.al_w;					// Speed control parameter
wire	[15:0]	t_a2p=enc_vector_tb.top.a2p_w;*/
task monitor;
begin
/*	$display("***********LAW=%h, RATE=%h, sample=%d ************",LAW,tb_rate,i);
	$display("s=\t%h",tb_s);
	$display("s_reg=\t%h",t_s_reg);
//	$display("d=\t%h\t%h",t_d,d_vec[i]);
	if(i>1)
		$display("i=\t%h\t%h",tb_I,I_vec[i-2]);
	$display("dq=\t%h\t%h",t_dq,dq_vec[i]);
	$display("se=\t%h\t%h",t_se,se_vec[i]);
	$display("a2=\t%h\t%h",t_a2p,a2p_vec[i]);
	$display("tr=\t%h\t%h",t_tr,tr_vec[i]);
	$display("td=\t%h\t%h",t_td,td_vec[i]);
	$display("al=\t%h\t%h",t_al,al_vec[i]);
	$display("y=\t%h\t%h",t_y,y_vec[i]);
	$display("yl=\t%h\t%h",t_yl,yl_vec[i]);
	$display("ADAP_PRED:");
	$display("DQ1=\t%h\t%h",t_DQ1,DQ1_vec[i]);
	$display("DQ2=\t%h\t%h",t_DQ2,DQ2_vec[i]);
	$display("DQ3=\t%h\t%h",t_DQ3,DQ3_vec[i]);
	$display("DQ4=\t%h\t%h",t_DQ4,DQ4_vec[i]);
	$display("DQ5=\t%h\t%h",t_DQ5,DQ5_vec[i]);
	$display("DQ6=\t%h\t%h",t_DQ6,DQ6_vec[i]);
	$display("B1=\t%h\t%h",t_B1,B1_vec[i]);
	$display("B2=\t%h\t%h",t_B2,B2_vec[i]);
	$display("B3=\t%h\t%h",t_B3,B3_vec[i]);
	$display("B4=\t%h\t%h",t_B4,B4_vec[i]);
	$display("B5=\t%h\t%h",t_B5,B5_vec[i]);
	$display("B6=\t%h\t%h",t_B6,B6_vec[i]);
	$display("A1=\t%h\t%h",t_A1,A1_vec[i]);
	$display("A2T=\t%h\t%h",t_A2T,A2T_vec[i]);
	$display("A2P=\t%h\t%h",t_A2P,A2P_vec[i]);
	$display("A2R=\t%h\t%h",t_A2R,A2R_vec[i]);
	$display("A2=\t%h\t%h",t_A2,A2_vec[i]);
	$display("SR1=\t%h\t%h",t_SR1,SR1_vec[i]);
	$display("SR2=\t%h\t%h",t_SR2,SR2_vec[i]);*/
       	if(i>1) begin
		if(tb_I == I_vec[i-2])   // test succeeded 
		begin
	//	`ifdef VERBOSE
		$display("Success:-> For Input = %h, Expected Output: I_vec[%5d]=%h, Received Output: tb_I=%h",tb_s, i, I_vec[i-2], tb_I);
	//	`endif
		end


		else				// test failed
		begin
		$display("Fail:LAW=%h, RATE=%h, For Input = %h,Expected Output: I_vec[%5d]=%h, Received Output: tb_I=%h",LAW,tb_rate, tb_s,i, I_vec[i-2], tb_I);
		`ifdef BREAKONERR
			$stop;
		`endif
		end
	end
end
endtask

endmodule // end of encoder_test bench

