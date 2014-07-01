
module FILTD_1 ( WI, Y, YUT );
  input [11:0] WI;
  input [12:0] Y;
  output [12:0] YUT;
  wire   DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_,
         DIFSX_2_, DIFSX_1_, DIFSX_12_, DIFSX_10_, DIFSX_0_, N9, N8, N7, N6,
         N5, N17, N12, N11, N10, N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1,
         SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3,
         SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;
  wire   [12:5] sub_43_carry;
  assign N0 = Y[0];

  NOR2BX1 U3 ( .AN(sub_43_carry[6]), .B(Y[6]), .Y(sub_43_carry[7]) );
  OR2X2 U4 ( .A(n1), .B(Y[12]), .Y(n2) );
  INVX1 U5 ( .A(sub_43_carry[12]), .Y(n1) );
  INVX1 U6 ( .A(Y[7]), .Y(n6) );
  INVXL U7 ( .A(Y[5]), .Y(n4) );
  INVXL U8 ( .A(Y[9]), .Y(n8) );
  INVXL U9 ( .A(Y[6]), .Y(n5) );
  INVXL U10 ( .A(Y[11]), .Y(n10) );
  INVXL U11 ( .A(Y[10]), .Y(n9) );
  INVXL U12 ( .A(Y[8]), .Y(n7) );
  NOR4BXL U13 ( .AN(n3), .B(Y[1]), .C(N0), .D(Y[2]), .Y(sub_43_carry[5]) );
  NOR2XL U14 ( .A(Y[4]), .B(Y[3]), .Y(n3) );
  INVX1 U15 ( .A(n2), .Y(N17) );
  INVX1 U16 ( .A(Y[12]), .Y(n11) );
  XOR2X1 U17 ( .A(n11), .B(sub_43_carry[12]), .Y(N12) );
  AND2X1 U18 ( .A(sub_43_carry[11]), .B(n10), .Y(sub_43_carry[12]) );
  XOR2X1 U19 ( .A(n10), .B(sub_43_carry[11]), .Y(N11) );
  AND2X1 U20 ( .A(sub_43_carry[10]), .B(n9), .Y(sub_43_carry[11]) );
  XOR2X1 U21 ( .A(n9), .B(sub_43_carry[10]), .Y(N10) );
  AND2X1 U22 ( .A(sub_43_carry[9]), .B(n8), .Y(sub_43_carry[10]) );
  XOR2X1 U23 ( .A(n8), .B(sub_43_carry[9]), .Y(N9) );
  AND2X1 U24 ( .A(sub_43_carry[8]), .B(n7), .Y(sub_43_carry[9]) );
  XOR2X1 U25 ( .A(n7), .B(sub_43_carry[8]), .Y(N8) );
  AND2X1 U26 ( .A(sub_43_carry[7]), .B(n6), .Y(sub_43_carry[8]) );
  XOR2X1 U27 ( .A(n6), .B(sub_43_carry[7]), .Y(N7) );
  XOR2X1 U28 ( .A(n5), .B(sub_43_carry[6]), .Y(N6) );
  AND2X1 U29 ( .A(sub_43_carry[5]), .B(n4), .Y(sub_43_carry[6]) );
  XOR2X1 U30 ( .A(n4), .B(sub_43_carry[5]), .Y(N5) );
  FILTD_1_DW01_add_1 add_60 ( .A({Y[12:1], N0}), .B({DIFSX_12_, DIFSX_12_, 
        DIFSX_10_, DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, 
        DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_}), .CI(1'b0), .SUM(YUT) );
  FILTD_1_DW01_add_0 add_43 ( .A({1'b0, WI, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .B({N17, n2, n2, n2, n2, N12, N11, N10, N9, N8, N7, N6, N5, 1'b0, 1'b0, 
        1'b0, 1'b0, N0}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, DIFSX_12_, 
        DIFSX_10_, DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, 
        DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5}) );
endmodule

