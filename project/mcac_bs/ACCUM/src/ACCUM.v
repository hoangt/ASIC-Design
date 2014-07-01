
module ACCUM (
           a,
           clk,
           sei_en,
           sezi_en,
           m1_sel,
           m2_sel,
           sei,
           sezi,
           reset,
           scan_in0,
           scan_in1,
           scan_in2,
           scan_in3,
           scan_in4,
           test_mode,
           scan_enable,
           scan_out0,
           scan_out1,
           scan_out2,
           scan_out3,
           scan_out4
       );

input	sei_en,sezi_en,a,m1_sel,m2_sel,
      clk, reset, scan_in0,scan_in1, scan_in2,scan_in3, scan_in4, scan_enable, test_mode;

output reg [14:0]
       sei,sezi;                  // test scan mode data output

output scan_out0, scan_out1,scan_out2, scan_out3, scan_out4;

wire b, s,c, m2_out;
reg m1_out;
wire [14:0] tmp;
wire reset;
wire cout;
reg    [15:0] tmp1;
wire sezi_en_w, sei_en_w;

//	FA full_add (a,b,m1_out,s, c);
assign s = a^b^m1_out;
assign c = (a&b)|(a&m1_out)|(b&m1_out);
//	mux_2to1 mux1 (c,1'b0, m1_sel, cout);
assign cout = (m1_sel) ? 1'b0 : c;
//	flop dff (clk, reset, cout, m1_out);
always @(posedge clk or posedge reset)
    if (reset)
        m1_out <= 0;
    else
        m1_out <= cout;

//	mux_2to1 mux2 (s,1'b0, m2_sel, m2_out);
assign m2_out = (m2_sel) ? 1'b0 : s;
//	shift siso (clk, reset,m2_out,b,tmp);
always @(posedge clk or posedge reset)
    if (reset)
    begin
        tmp1 <= 0;
    end
    else
    begin
        tmp1 <= {m2_out, tmp1[15:1]};
    end
assign tmp = tmp1[15:1];
assign b = tmp1[0];

//	reg_l sezi_r(tmp, reset, sezi_en,sezi);
assign sezi_en_w = (test_mode)? clk : sezi_en;
assign sei_en_w = (test_mode)? clk : sei_en;

always @(posedge sezi_en_w or posedge reset)
    if (reset)
        sezi <= 0;
    else
        sezi <= tmp;
//	reg_l sei_r(tmp, reset,sei_en,sei);
always @(posedge sei_en_w or posedge reset)
    if (reset)
        sei <= 0;
    else
        sei <= tmp;

endmodule//ACCUM
