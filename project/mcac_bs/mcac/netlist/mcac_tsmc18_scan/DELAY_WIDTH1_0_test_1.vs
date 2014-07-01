
module DELAY_WIDTH1_0_test_1 ( x, reset, y, clk, scan_enable, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4, test_si, test_se );
  input [0:0] x;
  output [0:0] y;
  input reset, clk, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, test_si, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   x_0_, y_0_, delay0_0_, delay1_0_, delay2_0_, delay3_0_, delay4_0_,
         delay5_0_, delay6_0_, n1;
  assign x_0_ = x[0];
  assign y[0] = y_0_;

  INVX1 U3 ( .A(reset), .Y(n1) );
  SDFFRHQXL delay7_reg_0_ ( .D(delay6_0_), .SI(delay6_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(y_0_) );
  SDFFRHQXL delay0_reg_0_ ( .D(x_0_), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(n1), .Q(delay0_0_) );
  SDFFRHQXL delay1_reg_0_ ( .D(delay0_0_), .SI(delay0_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(delay1_0_) );
  SDFFRHQXL delay2_reg_0_ ( .D(delay1_0_), .SI(delay1_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(delay2_0_) );
  SDFFRHQXL delay3_reg_0_ ( .D(delay2_0_), .SI(delay2_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(delay3_0_) );
  SDFFRHQXL delay4_reg_0_ ( .D(delay3_0_), .SI(delay3_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(delay4_0_) );
  SDFFRHQXL delay5_reg_0_ ( .D(delay4_0_), .SI(delay4_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(delay5_0_) );
  SDFFRHQXL delay6_reg_0_ ( .D(delay5_0_), .SI(delay5_0_), .SE(test_se), .CK(
        clk), .RN(n1), .Q(delay6_0_) );
endmodule

