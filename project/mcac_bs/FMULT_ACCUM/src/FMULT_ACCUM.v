//upper level module created for FMULT_ACCUM
//Module started 03/26/2014 by Sadiq pasha (sp8776@rit.edu)
module FMULT_ACCUM (
           reset,
           clk,
	   start,done,
	   A1,A2,B1,B2,B3,B4,B5,B6,
	   SR1,SR2,
	   DQ1,DQ2,DQ3,DQ4,DQ5,DQ6,
	   WAn,SE,SEZ,
			test_mode,
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
			scan_out4 
       );

input
			test_mode,
			scan_enable,
			scan_in0,
			scan_in1,
			scan_in2,
			scan_in3,
			scan_in4, 
    reset,                      // system reset
    clk;                        // system clock

input
    start;

output
			scan_out0,
			scan_out1,
			scan_out2,
			scan_out3,
			scan_out4, 
    done;
reg done;

input [15:0] A1,A2,B1,B2,B3,B4,B5,B6;
input [10:0] SR1,SR2;
input [10:0] DQ1,DQ2,DQ3,DQ4,DQ5,DQ6;

output [15:0] WAn;
output [14:0] SEZ,SE;

reg [15:0] mux_tc_out;
reg [10:0] mux_fl_out;

wire [15:0] WAn_out;
//Control Signalss
reg [2:0]  mux_sel;
reg SHIFT_EXP_int;
reg SHIFT_MANT_int;
reg INIT_SR_int;
reg LD_OUT_SR_int;
wire SHIFT_EXP;
wire SHIFT_MANT;
wire SHIFT_EXP_bb;
wire SHIFT_MANT_bb;
wire INIT_SR;
wire LD_OUT_SR;

reg LD_SEI;
reg LD_SEZI;
reg CLR_CARRY;
reg CLR_ACCUM;

reg [7:0]   count;
//initial count =8'd146;

wire LD_SEI_w = test_mode ? clk : LD_SEI ;
wire LD_SEZI_w = test_mode ? clk : LD_SEZI ;

FMULT FMULT_BS(
	.clk(clk),
	.reset(reset),
	.An(mux_tc_out),
	.SRn(mux_fl_out),
	.WAn(WAn_out),
	.SHIFT_EXP(SHIFT_EXP),
	.SHIFT_MANT(SHIFT_MANT),
	.INIT_SR(INIT_SR),
	.LD_OUT_SR(LD_OUT_SR),
	.scan_enable(),
	.scan_in0(),
	.scan_in1(),
	.scan_in2(),
	.scan_in3(),
	.scan_in4(),
	.scan_out0(),
	.scan_out1(),
	.scan_out2(),
	.scan_out3(),
	.scan_out4()
);

ACCUM ACCUM_BS(
	.a(WAn_out[0]),
	.clk(clk),
	.reset(reset),
	.sei_en(LD_SEI_w),
	.sezi_en(LD_SEZI_w),
	.m1_sel(CLR_CARRY),
	.m2_sel(CLR_ACCUM),
	.sei(SE),
	.sezi(SEZ),
	.scan_enable(),
	.test_mode(test_mode),
	.scan_in0(),
	.scan_in1(),
	.scan_in2(),
	.scan_in3(),
	.scan_in4(),
	.scan_out0(),
	.scan_out1(),
	.scan_out2(),
	.scan_out3(),
	.scan_out4()
);

assign WAn =WAn_out;


always @ (mux_sel,B1,B2,B3,B4,B5,B6,A1,A2)
begin
	case (mux_sel)
	3'b000 : mux_tc_out = B1;
	3'b001 : mux_tc_out = B2;
	3'b010 : mux_tc_out = B3;
	3'b011 : mux_tc_out = B4;
	3'b100 : mux_tc_out = B5;
	3'b101 : mux_tc_out = B6;
	3'b110 : mux_tc_out = A2;
	3'b111 : mux_tc_out = A1;
	default : mux_tc_out = 16'd0;
	endcase
end
always @ (mux_sel,DQ1,DQ2,DQ3,DQ4,DQ5,DQ6,SR1,SR2)
begin
	case (mux_sel)
        3'b000 : mux_fl_out = DQ1;
        3'b001 : mux_fl_out = DQ2;
        3'b010 : mux_fl_out = DQ3;
        3'b011 : mux_fl_out = DQ4;
        3'b100 : mux_fl_out = DQ5;
        3'b101 : mux_fl_out = DQ6;
        3'b110 : mux_fl_out = SR2;
        3'b111 : mux_fl_out = SR1;
        default : mux_fl_out = 16'd0;
        endcase
end
assign SHIFT_EXP_bb =SHIFT_EXP_int & clk;
assign SHIFT_MANT_bb =SHIFT_MANT_int & clk;
assign SHIFT_EXP =test_mode ? clk : SHIFT_EXP_bb;
assign SHIFT_MANT =test_mode ? clk : SHIFT_MANT_bb;
assign LD_OUT_SR =LD_OUT_SR_int;
assign INIT_SR=INIT_SR_int;

always @ (posedge clk or posedge reset)
begin
if (reset)
begin
mux_sel<=0 ;
count <= 0 ;
done <= 0 ;
end
else
begin
	mux_sel<=count[7:4];
	if (count < 8'd146)
	begin
		count <= count + 8'd1;
		done <= 1'b0;
	end else
	begin
		done <= 1'b1;
		if (start==1'b1)
		begin
			count<=8'd0;
			done<=1'b0;
		end
	end
//**********   FMULT CONTROL   ****************
 	if (count[3:0]>0 & count[3:0]<7)
		SHIFT_EXP_int<=1'b1;
	else 
	begin
		SHIFT_EXP_int<=1'b0;
	end

 	if (count[3:0]>0 & count[3:0]<9)
		SHIFT_MANT_int<=1'b1;
	else 
	begin
		SHIFT_MANT_int<=1'b0;
	end

 	if (count[3:0]==4'd15)
	begin
		LD_OUT_SR_int<=1'b1;
	end else 
	begin
		LD_OUT_SR_int<=1'b0;
	end

 	if (count[3:0]==4'd1)
	begin
		INIT_SR_int<=1'b1;
	end else 
	begin
		INIT_SR_int<=1'b0;
	end
//*********** ACCUM CONTROL *******************
 	if (count[3:0]==4'd15)
	begin
		CLR_CARRY<=1'b1;
	end else 
	begin
		CLR_CARRY<=1'b0;
	end

	if (count[7:4]==4'd0)
		CLR_ACCUM<=1'b1;
	else
	begin
		CLR_ACCUM<=1'b0;
	end
	
	if (count==8'd112)
		LD_SEZI<=1'b1;
	else	
		LD_SEZI<=1'b0;

	if (count==8'd144)
		LD_SEI<=1'b1;
	else	
		LD_SEI<=1'b0;

end
end

endmodule // FMULT_ACCUM
