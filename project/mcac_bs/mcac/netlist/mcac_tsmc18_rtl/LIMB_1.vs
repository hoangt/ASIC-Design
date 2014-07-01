
module LIMB_1 ( YUP, YUT );
  output [12:0] YUP;
  input [12:0] YUT;
  wire   GEUL_13_, GELL_13_, n10, n1, n2, n3;

  AND2X2 U17 ( .A(YUT[1]), .B(n10), .Y(YUP[1]) );
  AOI211X2 U3 ( .A0(YUT[9]), .A1(n2), .B0(n1), .C0(YUT[10]), .Y(GELL_13_) );
  AND2X4 U4 ( .A(YUT[0]), .B(n10), .Y(YUP[0]) );
  AND2X2 U5 ( .A(YUT[2]), .B(n10), .Y(YUP[2]) );
  CLKINVXL U6 ( .A(GELL_13_), .Y(n3) );
  NOR2BX4 U7 ( .AN(GEUL_13_), .B(GELL_13_), .Y(n10) );
  OR4X2 U8 ( .A(YUT[6]), .B(YUT[5]), .C(YUT[8]), .D(YUT[7]), .Y(n2) );
  OR2X2 U9 ( .A(YUT[12]), .B(YUT[11]), .Y(n1) );
  AND2X1 U10 ( .A(YUT[6]), .B(n10), .Y(YUP[6]) );
  AND2X1 U11 ( .A(YUT[7]), .B(n10), .Y(YUP[7]) );
  AND2X1 U12 ( .A(YUT[3]), .B(n10), .Y(YUP[3]) );
  AND2X1 U13 ( .A(YUT[4]), .B(n10), .Y(YUP[4]) );
  OAI2BB2XL U14 ( .B0(GEUL_13_), .B1(GELL_13_), .A0N(YUT[10]), .A1N(n10), .Y(
        YUP[10]) );
  AND2X1 U15 ( .A(YUT[11]), .B(n10), .Y(YUP[11]) );
  AND2X1 U16 ( .A(YUT[8]), .B(n10), .Y(YUP[8]) );
  OAI2BB1X1 U18 ( .A0N(YUT[5]), .A1N(n10), .B0(n3), .Y(YUP[5]) );
  OAI2BB1X1 U19 ( .A0N(YUT[9]), .A1N(GEUL_13_), .B0(n3), .Y(YUP[9]) );
  OAI2BB2X1 U20 ( .B0(GEUL_13_), .B1(GELL_13_), .A0N(YUT[12]), .A1N(n10), .Y(
        YUP[12]) );
  OAI21XL U21 ( .A0(YUT[11]), .A1(YUT[10]), .B0(YUT[12]), .Y(GEUL_13_) );
endmodule

