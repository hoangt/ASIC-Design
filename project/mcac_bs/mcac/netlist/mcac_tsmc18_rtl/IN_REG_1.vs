
module IN_REG_1 ( data_in, load, reset, data_out, scan_enable, scan_in0, 
        scan_in1, scan_in2, scan_in3, scan_in4, scan_out0, scan_out1, 
        scan_out2, scan_out3, scan_out4 );
  input [7:0] data_in;
  output [7:0] data_out;
  input load, reset, scan_enable, scan_in0, scan_in1, scan_in2, scan_in3,
         scan_in4;
  output scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   n1;

  DFFRHQX1 data_out_reg_7_ ( .D(data_in[7]), .CK(load), .RN(n1), .Q(
        data_out[7]) );
  DFFRHQX1 data_out_reg_5_ ( .D(data_in[5]), .CK(load), .RN(n1), .Q(
        data_out[5]) );
  DFFRHQX1 data_out_reg_3_ ( .D(data_in[3]), .CK(load), .RN(n1), .Q(
        data_out[3]) );
  DFFRHQX1 data_out_reg_1_ ( .D(data_in[1]), .CK(load), .RN(n1), .Q(
        data_out[1]) );
  DFFRHQX1 data_out_reg_0_ ( .D(data_in[0]), .CK(load), .RN(n1), .Q(
        data_out[0]) );
  DFFRHQX1 data_out_reg_2_ ( .D(data_in[2]), .CK(load), .RN(n1), .Q(
        data_out[2]) );
  DFFRHQX1 data_out_reg_6_ ( .D(data_in[6]), .CK(load), .RN(n1), .Q(
        data_out[6]) );
  DFFRHQX1 data_out_reg_4_ ( .D(data_in[4]), .CK(load), .RN(n1), .Q(
        data_out[4]) );
  INVX1 U3 ( .A(reset), .Y(n1) );
endmodule

