
module TRIGB_WIDTH16_15 ( TR, nP, nR );
  input [15:0] nP;
  output [15:0] nR;
  input TR;
  wire   n1;

  AND2X1 U2 ( .A(nP[8]), .B(n1), .Y(nR[8]) );
  AND2X1 U3 ( .A(nP[10]), .B(n1), .Y(nR[10]) );
  AND2X1 U4 ( .A(nP[3]), .B(n1), .Y(nR[3]) );
  AND2X1 U5 ( .A(nP[6]), .B(n1), .Y(nR[6]) );
  INVX1 U6 ( .A(TR), .Y(n1) );
  NOR2BX1 U7 ( .AN(nP[14]), .B(TR), .Y(nR[14]) );
  NOR2BX1 U8 ( .AN(nP[15]), .B(TR), .Y(nR[15]) );
  AND2X2 U9 ( .A(nP[0]), .B(n1), .Y(nR[0]) );
  AND2X2 U10 ( .A(nP[1]), .B(n1), .Y(nR[1]) );
  AND2X2 U11 ( .A(nP[2]), .B(n1), .Y(nR[2]) );
  AND2X2 U12 ( .A(nP[4]), .B(n1), .Y(nR[4]) );
  AND2X2 U13 ( .A(nP[5]), .B(n1), .Y(nR[5]) );
  AND2X2 U14 ( .A(nP[7]), .B(n1), .Y(nR[7]) );
  AND2X2 U15 ( .A(nP[9]), .B(n1), .Y(nR[9]) );
  AND2X2 U16 ( .A(nP[11]), .B(n1), .Y(nR[11]) );
  AND2X2 U17 ( .A(nP[12]), .B(n1), .Y(nR[12]) );
  AND2X2 U18 ( .A(nP[13]), .B(n1), .Y(nR[13]) );
endmodule

