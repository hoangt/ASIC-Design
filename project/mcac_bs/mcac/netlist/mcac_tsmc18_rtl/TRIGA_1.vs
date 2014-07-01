
module TRIGA_1 ( TR, APP, APR );
  input [9:0] APP;
  output [9:0] APR;
  input TR;
  wire   n1;

  NOR2BX1 U3 ( .AN(APP[9]), .B(TR), .Y(APR[9]) );
  NOR2BXL U4 ( .AN(APP[6]), .B(TR), .Y(APR[6]) );
  NOR2BXL U5 ( .AN(APP[5]), .B(TR), .Y(APR[5]) );
  INVX1 U6 ( .A(TR), .Y(n1) );
  NOR2BX1 U7 ( .AN(APP[7]), .B(TR), .Y(APR[7]) );
  NAND2BX1 U8 ( .AN(APP[8]), .B(n1), .Y(APR[8]) );
  NOR2BX1 U9 ( .AN(APP[0]), .B(TR), .Y(APR[0]) );
  NOR2BX1 U10 ( .AN(APP[1]), .B(TR), .Y(APR[1]) );
  NOR2BX1 U11 ( .AN(APP[2]), .B(TR), .Y(APR[2]) );
  NOR2BX1 U12 ( .AN(APP[3]), .B(TR), .Y(APR[3]) );
  NOR2BX1 U13 ( .AN(APP[4]), .B(TR), .Y(APR[4]) );
endmodule

