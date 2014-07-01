
module FUNCTW_0 ( I, RATE, WI );
  input [4:0] I;
  input [1:0] RATE;
  output [11:0] WI;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134;

  AND2X2 U38 ( .A(n82), .B(n19), .Y(n101) );
  NOR2XL U3 ( .A(n1), .B(RATE[0]), .Y(n83) );
  NAND2XL U4 ( .A(RATE[0]), .B(RATE[1]), .Y(n122) );
  NAND2XL U5 ( .A(RATE[0]), .B(n1), .Y(n111) );
  INVXL U6 ( .A(RATE[1]), .Y(n1) );
  XNOR2XL U7 ( .A(I[2]), .B(I[4]), .Y(n132) );
  XOR2XL U8 ( .A(I[2]), .B(I[3]), .Y(n89) );
  XOR2XL U9 ( .A(n16), .B(I[3]), .Y(n82) );
  XOR2XL U10 ( .A(n16), .B(I[4]), .Y(n21) );
  INVXL U11 ( .A(I[1]), .Y(n16) );
  INVX1 U12 ( .A(n104), .Y(n18) );
  NOR3X1 U13 ( .A(n83), .B(n19), .C(n20), .Y(n104) );
  INVX1 U14 ( .A(n111), .Y(n19) );
  INVX1 U15 ( .A(n122), .Y(n20) );
  INVX1 U16 ( .A(n128), .Y(n2) );
  INVX1 U17 ( .A(WI[11]), .Y(n11) );
  NAND3X1 U18 ( .A(n134), .B(n11), .C(n133), .Y(WI[9]) );
  NAND3X1 U19 ( .A(n4), .B(n6), .C(n9), .Y(n133) );
  OAI21XL U20 ( .A0(n13), .A1(n126), .B0(n11), .Y(WI[10]) );
  NAND4X1 U21 ( .A(n87), .B(n115), .C(n86), .D(n85), .Y(WI[1]) );
  NAND4BXL U22 ( .AN(n100), .B(n119), .C(n97), .D(n96), .Y(WI[3]) );
  AOI31X1 U23 ( .A0(n14), .A1(n13), .A2(n117), .B0(n15), .Y(n97) );
  NAND3X1 U24 ( .A(n103), .B(n110), .C(n102), .Y(WI[4]) );
  AOI211X1 U25 ( .A0(n101), .A1(n14), .B0(n17), .C0(n100), .Y(n102) );
  NAND4X1 U26 ( .A(n109), .B(n112), .C(n108), .D(n107), .Y(WI[5]) );
  OAI211X1 U27 ( .A0(n7), .A1(n105), .B0(n6), .C0(n104), .Y(n108) );
  OAI31X1 U28 ( .A0(n8), .A1(n6), .A2(n4), .B0(n114), .Y(n91) );
  INVX1 U29 ( .A(n127), .Y(n9) );
  AOI211X1 U30 ( .A0(n2), .A1(n9), .B0(n95), .C0(n125), .Y(n96) );
  OAI32X1 U31 ( .A0(n7), .A1(n18), .A2(n6), .B0(n2), .B1(n8), .Y(n95) );
  NAND3X1 U32 ( .A(n88), .B(n6), .C(n98), .Y(n86) );
  INVX1 U33 ( .A(n131), .Y(n5) );
  INVX1 U34 ( .A(n88), .Y(n8) );
  AOI221X1 U35 ( .A0(n5), .A1(n7), .B0(n19), .B1(n13), .C0(n106), .Y(n107) );
  NAND2X1 U36 ( .A(n7), .B(n4), .Y(n128) );
  NAND2X1 U37 ( .A(n88), .B(n2), .Y(n112) );
  NOR3X1 U39 ( .A(n128), .B(n127), .C(n6), .Y(n129) );
  NAND2X1 U40 ( .A(n122), .B(n126), .Y(n106) );
  AOI21X1 U41 ( .A0(n13), .A1(n101), .B0(n15), .Y(n110) );
  AOI22X1 U42 ( .A0(n98), .A1(n104), .B0(n9), .B1(n7), .Y(n103) );
  NAND2X1 U43 ( .A(n122), .B(n121), .Y(n123) );
  INVX1 U44 ( .A(n109), .Y(n15) );
  XOR2X1 U45 ( .A(n4), .B(n6), .Y(n81) );
  INVX1 U46 ( .A(n99), .Y(n17) );
  NAND2X1 U47 ( .A(n12), .B(n119), .Y(WI[11]) );
  INVX1 U48 ( .A(n90), .Y(n12) );
  OAI211X1 U49 ( .A0(n132), .A1(n131), .B0(n12), .C0(n130), .Y(WI[8]) );
  AOI211X1 U50 ( .A0(n10), .A1(n13), .B0(n20), .C0(n129), .Y(n130) );
  INVX1 U51 ( .A(n126), .Y(n10) );
  NAND4X1 U52 ( .A(n112), .B(n121), .C(n99), .D(n92), .Y(WI[2]) );
  AOI211X1 U53 ( .A0(n94), .A1(n5), .B0(n91), .C0(n90), .Y(n92) );
  NAND4BXL U54 ( .AN(n120), .B(n119), .C(n134), .D(n118), .Y(WI[6]) );
  OAI221XL U55 ( .A0(n112), .A1(n132), .B0(n111), .B1(n14), .C0(n110), .Y(n120) );
  NAND3BX1 U56 ( .AN(n125), .B(n12), .C(n124), .Y(WI[7]) );
  AOI31X1 U57 ( .A0(n9), .A1(n128), .A2(n132), .B0(n123), .Y(n124) );
  NAND4X1 U58 ( .A(n93), .B(n99), .C(n23), .D(n22), .Y(WI[0]) );
  NAND3X1 U59 ( .A(n81), .B(n7), .C(n88), .Y(n23) );
  AOI222X1 U60 ( .A0(n5), .A1(n132), .B0(n117), .B1(n13), .C0(n98), .C1(n9), 
        .Y(n22) );
  NAND2X1 U61 ( .A(n104), .B(n26), .Y(n127) );
  AOI211X1 U62 ( .A0(n101), .A1(n116), .B0(n91), .C0(n106), .Y(n85) );
  NOR2X1 U63 ( .A(n18), .B(n26), .Y(n88) );
  NAND3X1 U64 ( .A(n9), .B(n81), .C(n94), .Y(n115) );
  NAND2X1 U65 ( .A(n21), .B(n9), .Y(n131) );
  OAI31X1 U66 ( .A0(n127), .A1(n132), .A2(n94), .B0(n93), .Y(n125) );
  INVX1 U67 ( .A(n94), .Y(n7) );
  INVX1 U68 ( .A(n132), .Y(n6) );
  INVX1 U69 ( .A(n116), .Y(n13) );
  NOR2X1 U70 ( .A(n111), .B(n82), .Y(n117) );
  NAND2X1 U71 ( .A(n117), .B(n89), .Y(n126) );
  NOR2X1 U72 ( .A(n7), .B(n21), .Y(n98) );
  NAND2X1 U73 ( .A(n20), .B(n25), .Y(n99) );
  NAND3X1 U74 ( .A(n116), .B(n89), .C(n101), .Y(n121) );
  NAND3BX1 U75 ( .AN(n113), .B(n84), .C(n83), .Y(n109) );
  INVX1 U76 ( .A(n21), .Y(n4) );
  NAND3X1 U77 ( .A(n83), .B(n113), .C(n84), .Y(n93) );
  NAND2X1 U78 ( .A(n109), .B(n24), .Y(n90) );
  NAND4X1 U79 ( .A(n14), .B(n19), .C(n82), .D(n13), .Y(n24) );
  NAND4X1 U80 ( .A(n132), .B(n104), .C(n7), .D(n105), .Y(n87) );
  NAND2X1 U81 ( .A(n4), .B(n26), .Y(n105) );
  INVX1 U82 ( .A(n89), .Y(n14) );
  NAND2BX1 U83 ( .AN(n84), .B(n83), .Y(n114) );
  NOR2X1 U84 ( .A(n113), .B(n114), .Y(n100) );
  OR2X2 U85 ( .A(n25), .B(n122), .Y(n119) );
  AOI21X1 U86 ( .A0(n117), .A1(n116), .B0(n3), .Y(n118) );
  INVX1 U87 ( .A(n115), .Y(n3) );
  NAND2BX1 U88 ( .AN(n114), .B(n113), .Y(n134) );
  XOR2X1 U89 ( .A(I[0]), .B(I[3]), .Y(n116) );
  XOR2X1 U90 ( .A(I[1]), .B(I[2]), .Y(n113) );
  XNOR2X1 U91 ( .A(I[0]), .B(I[4]), .Y(n94) );
  XOR2X1 U92 ( .A(I[3]), .B(I[4]), .Y(n26) );
  XNOR2X1 U93 ( .A(I[0]), .B(I[2]), .Y(n84) );
  XOR2X1 U94 ( .A(I[0]), .B(I[1]), .Y(n25) );
endmodule

