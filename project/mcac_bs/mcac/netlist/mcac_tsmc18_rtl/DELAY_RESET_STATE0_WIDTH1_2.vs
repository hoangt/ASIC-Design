
module DELAY_RESET_STATE0_WIDTH1_2 ( x, reset, y, clk, scan_enable, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4 );
  input [0:0] x;
  output [0:0] y;
  input reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   x_0_, y_0_, delay0_0_, delay1_0_, delay2_0_, delay3_0_, delay4_0_,
         delay5_0_, delay6_0_, n1;
  assign x_0_ = x[0];
  assign y[0] = y_0_;

  DFFRHQX1 delay7_reg_0_ ( .D(delay6_0_), .CK(clk), .RN(n1), .Q(y_0_) );
  DFFRHQX1 delay0_reg_0_ ( .D(x_0_), .CK(clk), .RN(n1), .Q(delay0_0_) );
  DFFRHQX1 delay1_reg_0_ ( .D(delay0_0_), .CK(clk), .RN(n1), .Q(delay1_0_) );
  DFFRHQX1 delay2_reg_0_ ( .D(delay1_0_), .CK(clk), .RN(n1), .Q(delay2_0_) );
  DFFRHQX1 delay3_reg_0_ ( .D(delay2_0_), .CK(clk), .RN(n1), .Q(delay3_0_) );
  DFFRHQX1 delay4_reg_0_ ( .D(delay3_0_), .CK(clk), .RN(n1), .Q(delay4_0_) );
  DFFRHQX1 delay5_reg_0_ ( .D(delay4_0_), .CK(clk), .RN(n1), .Q(delay5_0_) );
  DFFRHQX1 delay6_reg_0_ ( .D(delay5_0_), .CK(clk), .RN(n1), .Q(delay6_0_) );
  INVX1 U3 ( .A(reset), .Y(n1) );
endmodule

