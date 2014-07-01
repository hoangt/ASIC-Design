
module LIMA_0 ( AP, AL );
  input [9:0] AP;
  output [6:0] AL;
  wire   AP_8_, AL_5_, AL_4_, AL_3_, AL_2_, AL_1_, AL_0_, n1, n2, n3, n4;
  assign AL[6] = AP_8_;
  assign AP_8_ = AP[8];
  assign AL[5] = AL_5_;
  assign AL[4] = AL_4_;
  assign AL[3] = AL_3_;
  assign AL[2] = AL_2_;
  assign AL[1] = AL_1_;
  assign AL[0] = AL_0_;

  AND2X2 U3 ( .A(n3), .B(AP[5]), .Y(AL_3_) );
  AND2X2 U4 ( .A(n3), .B(AP[2]), .Y(AL_0_) );
  AND2X2 U5 ( .A(n3), .B(AP[6]), .Y(AL_4_) );
  AND2X2 U6 ( .A(n3), .B(AP[7]), .Y(AL_5_) );
  INVX1 U7 ( .A(n1), .Y(AL_2_) );
  CLKINVX4 U8 ( .A(n2), .Y(AL_1_) );
  NAND2BX1 U9 ( .AN(n4), .B(AP[4]), .Y(n1) );
  NAND2BX1 U10 ( .AN(n4), .B(AP[3]), .Y(n2) );
  NAND2BX4 U11 ( .AN(AP[9]), .B(AP_8_), .Y(n3) );
  CLKINVX3 U12 ( .A(n3), .Y(n4) );
endmodule

