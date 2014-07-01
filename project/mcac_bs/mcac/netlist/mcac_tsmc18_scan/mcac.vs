
module mcac ( reset, rate, clk, law, enc_s, enc_i, enc_s_clk, enc_s_fs, 
        enc_i_clk, enc_i_fs, dec_i, dec_s, dec_i_clk, dec_i_fs, dec_s_clk, 
        dec_s_fs, scan_in0, scan_in1, scan_in2, scan_in3, scan_in4, 
        scan_enable, test_mode, scan_out0, scan_out1, scan_out2, scan_out3, 
        scan_out4 );
  input [1:0] rate;
  input [7:0] enc_s;
  output [7:0] enc_i;
  input [7:0] dec_i;
  output [7:0] dec_s;
  input reset, clk, law, enc_s_clk, enc_s_fs, dec_i_clk, dec_i_fs, scan_in0,
         scan_in1, scan_in2, scan_in3, scan_in4, scan_enable, test_mode;
  output enc_i_clk, enc_i_fs, dec_s_clk, dec_s_fs, scan_out0, scan_out1,
         scan_out2, scan_out3, scan_out4;
  wire   n1, n2, n3, n9, n12;
  assign scan_out4 = enc_i[7];
  assign scan_out0 = dec_s[7];

  CLKBUFX8 U1 ( .A(law), .Y(n3) );
  BUFX3 U2 ( .A(rate[0]), .Y(n2) );
  BUFX3 U3 ( .A(test_mode), .Y(n1) );
  enc_test_1 mcac_enc ( .enc_s(enc_s), .reset(reset), .rate({rate[1], n2}), 
        .clk(clk), .law(n3), .enc_i(enc_i), .enc_s_clk(enc_s_clk), .enc_s_fs(
        enc_s_fs), .enc_i_clk(enc_i_clk), .enc_i_fs(enc_i_fs), .scan_in0(1'b0), 
        .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0), 
        .scan_enable(1'b0), .test_mode(n1), .test_si4(scan_in4), .test_si3(
        scan_in3), .test_si2(n9), .test_si1(n12), .test_so3(scan_out3), 
        .test_so2(scan_out2), .test_so1(scan_out1), .test_se(scan_enable) );
  dec_test_1 mcac_dec ( .dec_s(dec_s), .reset(reset), .rate({rate[1], n2}), 
        .clk(clk), .law(n3), .dec_i(dec_i), .dec_s_clk(dec_s_clk), .dec_s_fs(
        dec_s_fs), .dec_i_clk(dec_i_clk), .dec_i_fs(dec_i_fs), .test_mode(n1), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0), .scan_enable(1'b0), .test_si3(scan_in2), .test_si2(
        scan_in1), .test_si1(scan_in0), .test_so2(n9), .test_so1(n12), 
        .test_se(scan_enable) );
endmodule

