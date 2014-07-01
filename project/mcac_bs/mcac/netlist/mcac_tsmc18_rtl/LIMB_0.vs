
module LIMB_0 ( YUP, YUT );
  output [12:0] YUP;
  input [12:0] YUT;
  wire   GEUL_13_, GELL_13_, n1, n2, n3, n4;

  AND2X2 U10 ( .A(YUT[8]), .B(n4), .Y(YUP[8]) );
  AND2X2 U11 ( .A(YUT[7]), .B(n4), .Y(YUP[7]) );
  AND2X2 U12 ( .A(YUT[6]), .B(n4), .Y(YUP[6]) );
  AND2X2 U14 ( .A(YUT[4]), .B(n4), .Y(YUP[4]) );
  AND2X2 U15 ( .A(YUT[3]), .B(n4), .Y(YUP[3]) );
  AND2X2 U16 ( .A(YUT[2]), .B(n4), .Y(YUP[2]) );
  AND2X2 U17 ( .A(YUT[1]), .B(n4), .Y(YUP[1]) );
  AND2X2 U19 ( .A(YUT[11]), .B(n4), .Y(YUP[11]) );
  AND2X2 U21 ( .A(YUT[0]), .B(n4), .Y(YUP[0]) );
  NOR2BX1 U3 ( .AN(GEUL_13_), .B(GELL_13_), .Y(n4) );
  INVX1 U4 ( .A(GELL_13_), .Y(n3) );
  OAI2BB1X1 U5 ( .A0N(YUT[5]), .A1N(n4), .B0(n3), .Y(YUP[5]) );
  OAI2BB1X1 U6 ( .A0N(YUT[9]), .A1N(GEUL_13_), .B0(n3), .Y(YUP[9]) );
  OAI2BB2X1 U7 ( .B0(GEUL_13_), .B1(GELL_13_), .A0N(YUT[10]), .A1N(n4), .Y(
        YUP[10]) );
  OAI2BB2X1 U8 ( .B0(GEUL_13_), .B1(GELL_13_), .A0N(YUT[12]), .A1N(n4), .Y(
        YUP[12]) );
  OAI21XL U9 ( .A0(YUT[11]), .A1(YUT[10]), .B0(YUT[12]), .Y(GEUL_13_) );
  OR4X1 U13 ( .A(YUT[6]), .B(YUT[5]), .C(YUT[8]), .D(YUT[7]), .Y(n2) );
  OR2X1 U18 ( .A(YUT[12]), .B(YUT[11]), .Y(n1) );
  AOI211X1 U20 ( .A0(YUT[9]), .A1(n2), .B0(n1), .C0(YUT[10]), .Y(GELL_13_) );
endmodule

