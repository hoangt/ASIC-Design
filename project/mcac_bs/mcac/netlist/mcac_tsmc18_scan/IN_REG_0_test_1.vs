
module IN_REG_0_test_1 ( data_in, load, reset, data_out, scan_enable, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4, test_si, test_se );
  input [7:0] data_in;
  output [7:0] data_out;
  input load, reset, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4, test_si, test_se;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   n12, n13, n1;

  INVX1 U3 ( .A(reset), .Y(n1) );
  SDFFRHQXL data_out_reg_7_ ( .D(data_in[7]), .SI(data_out[6]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(data_out[7]) );
  SDFFRHQXL data_out_reg_6_ ( .D(data_in[6]), .SI(data_out[5]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(data_out[6]) );
  SDFFRHQXL data_out_reg_5_ ( .D(data_in[5]), .SI(data_out[4]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(data_out[5]) );
  SDFFRHQXL data_out_reg_4_ ( .D(data_in[4]), .SI(data_out[3]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(n12) );
  SDFFRHQXL data_out_reg_1_ ( .D(data_in[1]), .SI(data_out[0]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(n13) );
  SDFFRHQX2 data_out_reg_2_ ( .D(data_in[2]), .SI(data_out[1]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(data_out[2]) );
  SDFFRHQX1 data_out_reg_3_ ( .D(data_in[3]), .SI(data_out[2]), .SE(test_se), 
        .CK(load), .RN(n1), .Q(data_out[3]) );
  SDFFRHQX1 data_out_reg_0_ ( .D(data_in[0]), .SI(test_si), .SE(test_se), .CK(
        load), .RN(n1), .Q(data_out[0]) );
  BUFX3 U1 ( .A(n13), .Y(data_out[1]) );
  BUFX3 U6 ( .A(n12), .Y(data_out[4]) );
endmodule

