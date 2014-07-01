
module TRIGB_WIDTH16_14 ( TR, nP, nR );
  input [15:0] nP;
  output [15:0] nR;
  input TR;
  wire   n1;

  AND2X2 U2 ( .A(nP[5]), .B(n1), .Y(nR[5]) );
  AND2X1 U3 ( .A(nP[15]), .B(n1), .Y(nR[15]) );
  INVX1 U4 ( .A(TR), .Y(n1) );
  AND2X2 U5 ( .A(nP[0]), .B(n1), .Y(nR[0]) );
  AND2X2 U6 ( .A(n1), .B(nP[1]), .Y(nR[1]) );
  AND2X2 U7 ( .A(n1), .B(nP[2]), .Y(nR[2]) );
  AND2X2 U8 ( .A(n1), .B(nP[3]), .Y(nR[3]) );
  AND2X2 U9 ( .A(n1), .B(nP[4]), .Y(nR[4]) );
  AND2X2 U10 ( .A(n1), .B(nP[6]), .Y(nR[6]) );
  AND2X2 U11 ( .A(n1), .B(nP[7]), .Y(nR[7]) );
  AND2X2 U12 ( .A(n1), .B(nP[8]), .Y(nR[8]) );
  AND2X2 U13 ( .A(n1), .B(nP[9]), .Y(nR[9]) );
  AND2X2 U14 ( .A(n1), .B(nP[10]), .Y(nR[10]) );
  AND2X2 U15 ( .A(n1), .B(nP[11]), .Y(nR[11]) );
  AND2X2 U16 ( .A(n1), .B(nP[12]), .Y(nR[12]) );
  AND2X2 U17 ( .A(nP[13]), .B(n1), .Y(nR[13]) );
  AND2X2 U18 ( .A(nP[14]), .B(n1), .Y(nR[14]) );
endmodule

