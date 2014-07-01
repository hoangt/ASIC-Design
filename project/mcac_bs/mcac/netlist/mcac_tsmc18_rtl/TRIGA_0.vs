
module TRIGA_0 ( TR, APP, APR );
  input [9:0] APP;
  output [9:0] APR;
  input TR;


  NOR2BX1 U3 ( .AN(APP[5]), .B(TR), .Y(APR[5]) );
  NOR2BX1 U4 ( .AN(APP[6]), .B(TR), .Y(APR[6]) );
  NOR2BX1 U5 ( .AN(APP[7]), .B(TR), .Y(APR[7]) );
  OR2X2 U6 ( .A(TR), .B(APP[8]), .Y(APR[8]) );
  NOR2BX1 U7 ( .AN(APP[1]), .B(TR), .Y(APR[1]) );
  NOR2BX1 U8 ( .AN(APP[2]), .B(TR), .Y(APR[2]) );
  NOR2BX1 U9 ( .AN(APP[3]), .B(TR), .Y(APR[3]) );
  NOR2BX1 U10 ( .AN(APP[4]), .B(TR), .Y(APR[4]) );
  NOR2BX1 U11 ( .AN(APP[9]), .B(TR), .Y(APR[9]) );
  NOR2BX1 U12 ( .AN(APP[0]), .B(TR), .Y(APR[0]) );
endmodule

