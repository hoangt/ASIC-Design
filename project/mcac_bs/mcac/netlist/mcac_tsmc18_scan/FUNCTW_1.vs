
module FUNCTW_1 ( I, RATE, WI );
  input [4:0] I;
  input [1:0] RATE;
  output [11:0] WI;
  wire   n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21;

  AND2X2 U38 ( .A(n79), .B(n20), .Y(n60) );
  DLY1X1 U3 ( .A(I[2]), .Y(n4) );
  OAI31X1 U4 ( .A0(n34), .A1(n29), .A2(n67), .B0(n68), .Y(n36) );
  INVX1 U5 ( .A(n34), .Y(n17) );
  AOI211X1 U6 ( .A0(n6), .A1(n15), .B0(n21), .C0(n32), .Y(n31) );
  NAND2BX1 U7 ( .AN(n34), .B(n86), .Y(n30) );
  XOR2X1 U8 ( .A(n86), .B(n29), .Y(n80) );
  NAND3XL U9 ( .A(n11), .B(n1), .C(n17), .Y(n28) );
  INVX2 U10 ( .A(n29), .Y(n1) );
  AOI221X1 U11 ( .A0(n12), .A1(n14), .B0(n20), .B1(n15), .C0(n55), .Y(n54) );
  AOI31X1 U12 ( .A0(n18), .A1(n15), .A2(n44), .B0(n13), .Y(n64) );
  AOI21XL U13 ( .A0(n44), .A1(n45), .B0(n10), .Y(n43) );
  INVXL U14 ( .A(n46), .Y(n10) );
  NAND3XL U15 ( .A(n14), .B(n80), .C(n73), .Y(n84) );
  AOI221X1 U16 ( .A0(n21), .A1(n82), .B0(n18), .B1(n60), .C0(n61), .Y(n59) );
  NOR2X1 U17 ( .A(n14), .B(n86), .Y(n63) );
  CLKINVX3 U18 ( .A(n67), .Y(n14) );
  AOI222X1 U19 ( .A0(n15), .A1(n44), .B0(n17), .B1(n63), .C0(n12), .C1(n29), 
        .Y(n85) );
  INVX1 U20 ( .A(n45), .Y(n15) );
  AOI211XL U21 ( .A0(n60), .A1(n45), .B0(n70), .C0(n55), .Y(n76) );
  OAI31X2 U22 ( .A0(n16), .A1(n1), .A2(n11), .B0(n47), .Y(n70) );
  XNOR2X1 U23 ( .A(n3), .B(I[4]), .Y(n67) );
  NAND3XL U24 ( .A(n73), .B(n1), .C(n63), .Y(n75) );
  NAND4X1 U25 ( .A(n18), .B(n20), .C(n79), .D(n15), .Y(n83) );
  DLY1X1 U26 ( .A(I[0]), .Y(n3) );
  OAI211X1 U27 ( .A0(n14), .A1(n56), .B0(n1), .C0(n57), .Y(n53) );
  NAND4X1 U28 ( .A(n68), .B(n62), .C(n84), .D(n85), .Y(WI[0]) );
  INVX1 U29 ( .A(n1), .Y(n2) );
  INVX1 U30 ( .A(n33), .Y(n9) );
  NAND2X1 U31 ( .A(n57), .B(n81), .Y(n34) );
  INVX1 U32 ( .A(n86), .Y(n11) );
  INVX1 U33 ( .A(n72), .Y(n18) );
  NOR2XL U34 ( .A(n19), .B(n81), .Y(n73) );
  INVXL U35 ( .A(n71), .Y(n8) );
  NOR2X1 U36 ( .A(n50), .B(n79), .Y(n44) );
  XOR2XL U37 ( .A(I[1]), .B(n4), .Y(n48) );
  XNOR2XL U39 ( .A(n3), .B(n4), .Y(n77) );
  NAND3XL U40 ( .A(n17), .B(n80), .C(n67), .Y(n46) );
  OAI32XL U41 ( .A0(n14), .A1(n19), .A2(n1), .B0(n9), .B1(n16), .Y(n66) );
  AOI21XL U42 ( .A0(n15), .A1(n60), .B0(n13), .Y(n51) );
  NAND2XL U43 ( .A(n11), .B(n81), .Y(n56) );
  NAND3XL U44 ( .A(n45), .B(n72), .C(n60), .Y(n40) );
  INVXL U45 ( .A(n35), .Y(n6) );
  AOI22XL U46 ( .A0(n63), .A1(n57), .B0(n17), .B1(n14), .Y(n58) );
  NOR2XL U47 ( .A(n48), .B(n47), .Y(n61) );
  NAND4XL U48 ( .A(n2), .B(n57), .C(n14), .D(n56), .Y(n74) );
  NAND2XL U49 ( .A(n8), .B(n42), .Y(WI[11]) );
  NAND3XL U50 ( .A(n27), .B(n7), .C(n28), .Y(WI[9]) );
  OAI211XL U51 ( .A0(n29), .A1(n30), .B0(n8), .C0(n31), .Y(WI[8]) );
  NOR3XL U52 ( .A(n33), .B(n34), .C(n1), .Y(n32) );
  NAND3BXL U53 ( .AN(n48), .B(n77), .C(n78), .Y(n52) );
  NAND3XL U54 ( .A(n78), .B(n48), .C(n77), .Y(n68) );
  NAND2XL U55 ( .A(n39), .B(n40), .Y(n38) );
  OR2XL U56 ( .A(n82), .B(n39), .Y(n42) );
  AOI31XL U57 ( .A0(n17), .A1(n33), .A2(n2), .B0(n38), .Y(n37) );
  AOI211XL U58 ( .A0(n67), .A1(n12), .B0(n70), .C0(n71), .Y(n69) );
  AOI211XL U59 ( .A0(n9), .A1(n17), .B0(n66), .C0(n36), .Y(n65) );
  NAND4XL U60 ( .A(n52), .B(n49), .C(n53), .D(n54), .Y(WI[5]) );
  INVX1 U61 ( .A(n30), .Y(n12) );
  INVX1 U62 ( .A(n73), .Y(n16) );
  NAND2X1 U63 ( .A(n14), .B(n11), .Y(n33) );
  NAND2X1 U64 ( .A(n73), .B(n9), .Y(n49) );
  XOR2X1 U65 ( .A(n3), .B(I[1]), .Y(n82) );
  XNOR2X1 U66 ( .A(I[1]), .B(I[3]), .Y(n79) );
  INVX1 U67 ( .A(WI[11]), .Y(n7) );
  NAND2X1 U68 ( .A(n44), .B(n72), .Y(n35) );
  NAND2X1 U69 ( .A(n52), .B(n83), .Y(n71) );
  XNOR2XL U70 ( .A(n4), .B(I[4]), .Y(n29) );
  NAND2X1 U71 ( .A(n21), .B(n82), .Y(n62) );
  XNOR2X1 U72 ( .A(I[1]), .B(I[4]), .Y(n86) );
  INVX1 U73 ( .A(n52), .Y(n13) );
  NAND2BX1 U74 ( .AN(n47), .B(n48), .Y(n27) );
  INVX1 U75 ( .A(n57), .Y(n19) );
  NAND2X1 U76 ( .A(n39), .B(n35), .Y(n55) );
  OAI21XL U77 ( .A0(n15), .A1(n35), .B0(n7), .Y(WI[10]) );
  OAI221XL U78 ( .A0(n49), .A1(n2), .B0(n50), .B1(n18), .C0(n51), .Y(n41) );
  NAND2BX1 U79 ( .AN(n77), .B(n78), .Y(n47) );
  NOR3X1 U80 ( .A(n78), .B(n20), .C(n21), .Y(n57) );
  INVX1 U81 ( .A(n50), .Y(n20) );
  INVX1 U82 ( .A(n39), .Y(n21) );
  NAND4X1 U83 ( .A(n74), .B(n46), .C(n75), .D(n76), .Y(WI[1]) );
  NAND4X1 U84 ( .A(n49), .B(n40), .C(n62), .D(n69), .Y(WI[2]) );
  NAND4BXL U85 ( .AN(n61), .B(n42), .C(n64), .D(n65), .Y(WI[3]) );
  NAND3X1 U86 ( .A(n58), .B(n51), .C(n59), .Y(WI[4]) );
  NAND4BXL U87 ( .AN(n41), .B(n42), .C(n27), .D(n43), .Y(WI[6]) );
  NAND3BX1 U88 ( .AN(n36), .B(n8), .C(n37), .Y(WI[7]) );
  NOR2X1 U89 ( .A(n5), .B(RATE[0]), .Y(n78) );
  NAND2X1 U90 ( .A(RATE[0]), .B(n5), .Y(n50) );
  NAND2X1 U91 ( .A(RATE[0]), .B(RATE[1]), .Y(n39) );
  INVX1 U92 ( .A(RATE[1]), .Y(n5) );
  XOR2XL U93 ( .A(n4), .B(I[3]), .Y(n72) );
  XOR2XL U94 ( .A(n3), .B(I[3]), .Y(n45) );
  XOR2XL U95 ( .A(I[3]), .B(I[4]), .Y(n81) );
endmodule

