
module FILTD_0_DW01_add_1 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [12:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X2 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .Y(SUM[12]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FILTD_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [16:7] carry;

  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(n1), .CO(carry[7]), .S(SUM[6]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  AND2X2 U1 ( .A(B[5]), .B(A[5]), .Y(n1) );
  XOR2X1 U2 ( .A(B[5]), .B(A[5]), .Y(SUM[5]) );
endmodule


module FILTD_0 ( WI, Y, YUT );
  input [11:0] WI;
  input [12:0] Y;
  output [12:0] YUT;
  wire   DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, DIFSX_3_,
         DIFSX_2_, DIFSX_1_, DIFSX_12_, DIFSX_10_, DIFSX_0_, N9, N8, N7, N6,
         N5, N4, N3, N2, N17, N12, N11, N10, N1, N0, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10;
  wire   [12:5] sub_43_carry;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;
  assign N0 = Y[0];

  FILTD_0_DW01_add_1 add_60 ( .A({Y[12:1], N0}), .B({DIFSX_12_, DIFSX_12_, 
        DIFSX_10_, DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, 
        DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_}), .CI(1'b0), .SUM(YUT) );
  FILTD_0_DW01_add_0 add_43 ( .A({1'b0, WI, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .B({N17, n1, n1, n1, n1, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, 
        N1, N0}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, DIFSX_12_, 
        DIFSX_10_, DIFSX_9_, DIFSX_8_, DIFSX_7_, DIFSX_6_, DIFSX_5_, DIFSX_4_, 
        DIFSX_3_, DIFSX_2_, DIFSX_1_, DIFSX_0_, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5}) );
  CLKINVXL U3 ( .A(Y[7]), .Y(n5) );
  INVXL U4 ( .A(Y[5]), .Y(n3) );
  NAND2X1 U5 ( .A(sub_43_carry[12]), .B(n10), .Y(n1) );
  INVX1 U6 ( .A(n1), .Y(N17) );
  INVXL U7 ( .A(Y[10]), .Y(n8) );
  INVXL U8 ( .A(Y[11]), .Y(n9) );
  INVXL U9 ( .A(Y[8]), .Y(n6) );
  INVXL U10 ( .A(Y[9]), .Y(n7) );
  INVXL U11 ( .A(Y[6]), .Y(n4) );
  INVXL U12 ( .A(Y[12]), .Y(n10) );
  XOR2X1 U13 ( .A(n10), .B(sub_43_carry[12]), .Y(N12) );
  AND2X1 U14 ( .A(sub_43_carry[11]), .B(n9), .Y(sub_43_carry[12]) );
  XOR2X1 U15 ( .A(n9), .B(sub_43_carry[11]), .Y(N11) );
  AND2X1 U16 ( .A(sub_43_carry[10]), .B(n8), .Y(sub_43_carry[11]) );
  XOR2X1 U17 ( .A(n8), .B(sub_43_carry[10]), .Y(N10) );
  AND2X1 U18 ( .A(sub_43_carry[9]), .B(n7), .Y(sub_43_carry[10]) );
  XOR2X1 U19 ( .A(n7), .B(sub_43_carry[9]), .Y(N9) );
  AND2X1 U20 ( .A(sub_43_carry[8]), .B(n6), .Y(sub_43_carry[9]) );
  XOR2X1 U21 ( .A(n6), .B(sub_43_carry[8]), .Y(N8) );
  AND2X1 U22 ( .A(sub_43_carry[7]), .B(n5), .Y(sub_43_carry[8]) );
  XOR2X1 U23 ( .A(n5), .B(sub_43_carry[7]), .Y(N7) );
  AND2X1 U24 ( .A(sub_43_carry[6]), .B(n4), .Y(sub_43_carry[7]) );
  XOR2X1 U25 ( .A(n4), .B(sub_43_carry[6]), .Y(N6) );
  AND2X1 U26 ( .A(sub_43_carry[5]), .B(n3), .Y(sub_43_carry[6]) );
  XOR2X1 U27 ( .A(n3), .B(sub_43_carry[5]), .Y(N5) );
  NOR2X1 U28 ( .A(Y[4]), .B(Y[3]), .Y(n2) );
  NOR4BX1 U29 ( .AN(n2), .B(Y[1]), .C(N0), .D(Y[2]), .Y(sub_43_carry[5]) );
endmodule

