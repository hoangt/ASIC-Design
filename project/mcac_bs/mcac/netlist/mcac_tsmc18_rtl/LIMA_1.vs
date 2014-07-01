
module LIMA_1 ( AP, AL );
  input [9:0] AP;
  output [6:0] AL;
  wire   AP_8_, AL_5_, AL_4_, AL_3_, AL_2_, AL_1_, AL_0_, n1;
  assign AL[6] = AP_8_;
  assign AP_8_ = AP[8];
  assign AL[5] = AL_5_;
  assign AL[4] = AL_4_;
  assign AL[3] = AL_3_;
  assign AL[2] = AL_2_;
  assign AL[1] = AL_1_;
  assign AL[0] = AL_0_;

  AND2X2 U3 ( .A(n1), .B(AP[3]), .Y(AL_1_) );
  AND2X2 U4 ( .A(n1), .B(AP[2]), .Y(AL_0_) );
  AND2X2 U5 ( .A(n1), .B(AP[5]), .Y(AL_3_) );
  AND2X2 U6 ( .A(n1), .B(AP[6]), .Y(AL_4_) );
  AND2X2 U7 ( .A(n1), .B(AP[7]), .Y(AL_5_) );
  AND2X1 U8 ( .A(n1), .B(AP[4]), .Y(AL_2_) );
  NAND2BX2 U9 ( .AN(AP[9]), .B(AP_8_), .Y(n1) );
endmodule

