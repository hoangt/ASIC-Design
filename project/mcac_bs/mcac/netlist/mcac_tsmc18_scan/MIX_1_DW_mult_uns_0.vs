
module MIX_1_DW_mult_uns_0 ( a, b, product );
  input [13:0] a;
  input [6:0] b;
  output [20:0] product;
  wire   n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n44, n45, n46, n47, n48, n50, n51, n52, n53, n54, n55, n56, n58, n59,
         n60, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, a_13_, a_12_, a_11_, a_10_, a_9_, a_8_,
         a_7_, a_6_, a_5_, a_4_, a_3_, a_2_, a_1_, b_6_, product_6_,
         product_7_, product_8_, product_9_, product_10_, product_11_,
         product_12_, product_13_, product_14_, product_15_, product_16_,
         product_17_, product_18_, product_19_, product_20_, b_0_, b_1_, b_2_,
         b_3_, b_4_, b_5_, a_0_, n283, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376;
  assign a_13_ = a[13];
  assign a_12_ = a[12];
  assign a_11_ = a[11];
  assign a_10_ = a[10];
  assign a_9_ = a[9];
  assign a_8_ = a[8];
  assign a_7_ = a[7];
  assign a_6_ = a[6];
  assign a_5_ = a[5];
  assign a_4_ = a[4];
  assign a_3_ = a[3];
  assign a_2_ = a[2];
  assign a_1_ = a[1];
  assign b_6_ = b[6];
  assign product[6] = product_6_;
  assign product[7] = product_7_;
  assign product[8] = product_8_;
  assign product[9] = product_9_;
  assign product[10] = product_10_;
  assign product[11] = product_11_;
  assign product[12] = product_12_;
  assign product[13] = product_13_;
  assign product[14] = product_14_;
  assign product[15] = product_15_;
  assign product[16] = product_16_;
  assign product[17] = product_17_;
  assign product[18] = product_18_;
  assign product[19] = product_19_;
  assign product[20] = product_20_;
  assign b_0_ = b[0];
  assign b_1_ = b[1];
  assign b_2_ = b[2];
  assign b_3_ = b[3];
  assign b_4_ = b[4];
  assign b_5_ = b[5];
  assign a_0_ = a[0];

  ADDFX2 U10 ( .A(n45), .B(n46), .CI(n25), .CO(n24), .S(product_19_) );
  ADDFX2 U13 ( .A(n51), .B(n47), .CI(n26), .CO(n25), .S(product_18_) );
  ADDFX2 U15 ( .A(n55), .B(n59), .CI(n28), .CO(n27), .S(product_16_) );
  ADDFX2 U16 ( .A(n60), .B(n63), .CI(n29), .CO(n28), .S(product_15_) );
  ADDFX2 U17 ( .A(n64), .B(n66), .CI(n30), .CO(n29), .S(product_14_) );
  ADDFX2 U18 ( .A(n67), .B(n69), .CI(n31), .CO(n30), .S(product_13_) );
  ADDFX2 U19 ( .A(n70), .B(n72), .CI(n32), .CO(n31), .S(product_12_) );
  ADDFX2 U20 ( .A(n73), .B(n75), .CI(n33), .CO(n32), .S(product_11_) );
  ADDFX2 U21 ( .A(n76), .B(n78), .CI(n34), .CO(n33), .S(product_10_) );
  ADDFX2 U22 ( .A(n79), .B(n81), .CI(n35), .CO(n34), .S(product_9_) );
  ADDFX2 U23 ( .A(n82), .B(n84), .CI(n36), .CO(n35), .S(product_8_) );
  ADDFX2 U24 ( .A(n85), .B(n87), .CI(n37), .CO(n36), .S(product_7_) );
  ADDFX2 U25 ( .A(n88), .B(n89), .CI(n304), .CO(n37), .S(product_6_) );
  ADDFX2 U32 ( .A(n101), .B(n48), .CI(n321), .CO(n44), .S(n45) );
  ADDFX2 U33 ( .A(n313), .B(n114), .CI(n50), .CO(n46), .S(n47) );
  CMPR42X1 U35 ( .A(n56), .B(n102), .C(n115), .D(n53), .ICI(n319), .S(n52), 
        .ICO(n50), .CO(n51) );
  CMPR42X1 U36 ( .A(n103), .B(n116), .C(n130), .D(n299), .ICI(n58), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U38 ( .A(n131), .B(n117), .C(n299), .D(n62), .ICI(n320), .S(n60), 
        .ICO(n58), .CO(n59) );
  CMPR42X1 U40 ( .A(n146), .B(n104), .C(n118), .D(n132), .ICI(n65), .S(n64), 
        .ICO(n62), .CO(n63) );
  CMPR42X1 U41 ( .A(n147), .B(n105), .C(n119), .D(n133), .ICI(n68), .S(n67), 
        .ICO(n65), .CO(n66) );
  CMPR42X1 U42 ( .A(n148), .B(n106), .C(n120), .D(n134), .ICI(n71), .S(n70), 
        .ICO(n68), .CO(n69) );
  CMPR42X1 U43 ( .A(n149), .B(n107), .C(n121), .D(n135), .ICI(n74), .S(n73), 
        .ICO(n71), .CO(n72) );
  CMPR42X1 U44 ( .A(n150), .B(n108), .C(n122), .D(n136), .ICI(n77), .S(n76), 
        .ICO(n74), .CO(n75) );
  CMPR42X1 U45 ( .A(n151), .B(n109), .C(n123), .D(n137), .ICI(n80), .S(n79), 
        .ICO(n77), .CO(n78) );
  CMPR42X1 U46 ( .A(n152), .B(n110), .C(n124), .D(n138), .ICI(n83), .S(n82), 
        .ICO(n80), .CO(n81) );
  CMPR42X1 U47 ( .A(n153), .B(n111), .C(n125), .D(n139), .ICI(n86), .S(n85), 
        .ICO(n83), .CO(n84) );
  CMPR42X1 U48 ( .A(n112), .B(n154), .C(n126), .D(n140), .ICI(n91), .S(n88), 
        .ICO(n86), .CO(n87) );
  ADDFX2 U49 ( .A(n127), .B(n141), .CI(n92), .CO(n89), .S(n90) );
  ADDFX2 U51 ( .A(n156), .B(n128), .CI(n142), .CO(n93), .S(n94) );
  CLKINVX3 U201 ( .A(n295), .Y(n320) );
  NAND2X2 U202 ( .A(n295), .B(n318), .Y(n292) );
  XNOR2X2 U208 ( .A(a_9_), .B(n295), .Y(n342) );
  XOR2X4 U211 ( .A(b_4_), .B(n322), .Y(n285) );
  CLKINVX3 U213 ( .A(b_0_), .Y(n318) );
  OAI22XL U214 ( .A0(a_1_), .A1(n292), .B0(n335), .B1(n318), .Y(n334) );
  OAI22X1 U215 ( .A0(n336), .A1(n292), .B0(n337), .B1(n318), .Y(n156) );
  XNOR2XL U216 ( .A(a_1_), .B(b_3_), .Y(n348) );
  INVX1 U217 ( .A(a_1_), .Y(n312) );
  INVX1 U220 ( .A(n326), .Y(n304) );
  AOI21X1 U221 ( .A0(n346), .A1(n318), .B0(n320), .Y(n146) );
  OAI2BB1X1 U223 ( .A0N(n291), .A1N(n331), .B0(b_3_), .Y(n319) );
  NAND2X1 U224 ( .A(n95), .B(n94), .Y(n290) );
  OAI2BB1X1 U225 ( .A0N(n285), .A1N(n287), .B0(n297), .Y(n321) );
  OAI22X1 U229 ( .A0(n338), .A1(n292), .B0(n339), .B1(n318), .Y(n154) );
  BUFX3 U230 ( .A(n293), .Y(n286) );
  OAI22X1 U231 ( .A0(n339), .A1(n292), .B0(n340), .B1(n318), .Y(n153) );
  CLKINVX3 U232 ( .A(n334), .Y(n310) );
  BUFX3 U233 ( .A(b_5_), .Y(n297) );
  NAND3X2 U234 ( .A(n288), .B(n289), .C(n290), .Y(n327) );
  OR2X2 U235 ( .A(n328), .B(n306), .Y(n288) );
  OR2X2 U236 ( .A(n328), .B(n308), .Y(n289) );
  NAND2X4 U239 ( .A(n285), .B(n376), .Y(n287) );
  ADDHX1 U240 ( .A(n157), .B(n143), .CO(n95), .S(n96) );
  AOI222X2 U243 ( .A0(n329), .A1(n96), .B0(n330), .B1(n329), .C0(n330), .C1(
        n96), .Y(n328) );
  AOI222X2 U244 ( .A0(n327), .A1(n90), .B0(n327), .B1(n93), .C0(n93), .C1(n90), 
        .Y(n326) );
  OAI22XL U245 ( .A0(n359), .A1(n331), .B0(n291), .B1(n360), .Y(n131) );
  NAND2BXL U246 ( .AN(n294), .B(a_13_), .Y(n324) );
  OAI22XL U247 ( .A0(n372), .A1(n287), .B0(n285), .B1(n373), .Y(n117) );
  INVX1 U248 ( .A(n56), .Y(n299) );
  INVXL U249 ( .A(a_6_), .Y(n303) );
  INVXL U250 ( .A(a_10_), .Y(n316) );
  INVXL U251 ( .A(a_11_), .Y(n315) );
  INVXL U252 ( .A(a_12_), .Y(n314) );
  INVXL U253 ( .A(a_13_), .Y(n298) );
  OAI22XL U254 ( .A0(n375), .A1(n287), .B0(n285), .B1(n323), .Y(n114) );
  NOR3XL U255 ( .A(n320), .B(n310), .C(a_1_), .Y(n332) );
  XOR2X4 U256 ( .A(b_2_), .B(n320), .Y(n291) );
  OAI22XL U257 ( .A0(n343), .A1(n292), .B0(n344), .B1(n318), .Y(n149) );
  OAI22XL U258 ( .A0(n344), .A1(n292), .B0(n345), .B1(n318), .Y(n148) );
  OAI22XL U259 ( .A0(n345), .A1(n292), .B0(n346), .B1(n318), .Y(n147) );
  OAI22XL U260 ( .A0(n294), .A1(n309), .B0(n286), .B1(n307), .Y(n108) );
  OAI22XL U261 ( .A0(n367), .A1(n287), .B0(n285), .B1(n368), .Y(n122) );
  OAI22XL U262 ( .A0(n354), .A1(n331), .B0(n291), .B1(n355), .Y(n136) );
  OAI22XL U263 ( .A0(n294), .A1(n307), .B0(n286), .B1(n305), .Y(n107) );
  OAI22XL U264 ( .A0(n368), .A1(n287), .B0(n285), .B1(n369), .Y(n121) );
  OAI22XL U265 ( .A0(n355), .A1(n331), .B0(n291), .B1(n356), .Y(n135) );
  OAI22XL U266 ( .A0(n370), .A1(n287), .B0(n285), .B1(n371), .Y(n119) );
  OAI22XL U267 ( .A0(n357), .A1(n331), .B0(n291), .B1(n358), .Y(n133) );
  OAI22XL U268 ( .A0(n369), .A1(n287), .B0(n285), .B1(n370), .Y(n120) );
  OAI22XL U269 ( .A0(n356), .A1(n331), .B0(n291), .B1(n357), .Y(n134) );
  OAI22XL U270 ( .A0(n294), .A1(n302), .B0(n286), .B1(n301), .Y(n104) );
  OAI22XL U271 ( .A0(n371), .A1(n287), .B0(n285), .B1(n372), .Y(n118) );
  OAI22XL U272 ( .A0(n374), .A1(n287), .B0(n285), .B1(n375), .Y(n115) );
  OAI22XL U273 ( .A0(n360), .A1(n331), .B0(n291), .B1(n322), .Y(n130) );
  OAI22XL U274 ( .A0(n294), .A1(n300), .B0(n286), .B1(n316), .Y(n103) );
  OAI22XL U275 ( .A0(n373), .A1(n287), .B0(n285), .B1(n374), .Y(n116) );
  OAI22XL U276 ( .A0(n294), .A1(n315), .B0(n286), .B1(n314), .Y(n48) );
  INVX1 U277 ( .A(a_2_), .Y(n311) );
  INVX1 U278 ( .A(a_3_), .Y(n309) );
  INVX1 U279 ( .A(n283), .Y(n302) );
  INVX1 U280 ( .A(a_8_), .Y(n301) );
  INVX1 U281 ( .A(a_9_), .Y(n300) );
  INVX1 U282 ( .A(a_4_), .Y(n307) );
  INVX1 U283 ( .A(a_5_), .Y(n305) );
  INVX1 U284 ( .A(n95), .Y(n308) );
  INVX1 U285 ( .A(n94), .Y(n306) );
  ADDFX2 U286 ( .A(n52), .B(n54), .CI(n27), .CO(n26), .S(product_17_) );
  INVX1 U287 ( .A(n48), .Y(n313) );
  INVX1 U288 ( .A(n297), .Y(n323) );
  INVX1 U289 ( .A(a_0_), .Y(n317) );
  XOR2X1 U290 ( .A(n324), .B(n325), .Y(product_20_) );
  XOR2X1 U291 ( .A(n44), .B(n24), .Y(n325) );
  OAI32X1 U292 ( .A0(n323), .A1(a_0_), .A2(n285), .B0(n323), .B1(n287), .Y(n97) );
  OAI22X1 U293 ( .A0(n294), .A1(n301), .B0(n286), .B1(n300), .Y(n56) );
  OAI32X1 U294 ( .A0(n322), .A1(a_0_), .A2(n291), .B0(n322), .B1(n331), .Y(
        n330) );
  OAI22X1 U296 ( .A0(n337), .A1(n292), .B0(n338), .B1(n318), .Y(n155) );
  OAI22X1 U297 ( .A0(n340), .A1(n292), .B0(n341), .B1(n318), .Y(n152) );
  OAI22X1 U298 ( .A0(n341), .A1(n292), .B0(n342), .B1(n318), .Y(n151) );
  OAI22X1 U299 ( .A0(n342), .A1(n292), .B0(n343), .B1(n318), .Y(n150) );
  XNOR2X1 U300 ( .A(a_10_), .B(n295), .Y(n343) );
  XNOR2X1 U301 ( .A(a_11_), .B(n295), .Y(n344) );
  XNOR2X1 U302 ( .A(a_12_), .B(n295), .Y(n345) );
  XNOR2X1 U303 ( .A(a_13_), .B(n295), .Y(n346) );
  XNOR2X1 U304 ( .A(a_0_), .B(b_3_), .Y(n347) );
  XNOR2X1 U307 ( .A(a_2_), .B(b_3_), .Y(n349) );
  XNOR2X1 U309 ( .A(a_3_), .B(b_3_), .Y(n350) );
  XNOR2X1 U311 ( .A(a_4_), .B(b_3_), .Y(n351) );
  XNOR2X1 U313 ( .A(a_5_), .B(b_3_), .Y(n352) );
  XNOR2X1 U315 ( .A(a_6_), .B(b_3_), .Y(n353) );
  XNOR2X1 U316 ( .A(n283), .B(b_3_), .Y(n354) );
  XNOR2X1 U317 ( .A(a_8_), .B(b_3_), .Y(n355) );
  XNOR2X1 U318 ( .A(a_9_), .B(b_3_), .Y(n356) );
  XNOR2X1 U319 ( .A(a_10_), .B(b_3_), .Y(n357) );
  OAI22X1 U320 ( .A0(n358), .A1(n331), .B0(n291), .B1(n359), .Y(n132) );
  XNOR2X1 U321 ( .A(a_11_), .B(b_3_), .Y(n358) );
  XNOR2X1 U322 ( .A(a_12_), .B(b_3_), .Y(n359) );
  XNOR2X1 U323 ( .A(a_13_), .B(b_3_), .Y(n360) );
  XNOR2X1 U324 ( .A(n322), .B(b_2_), .Y(n361) );
  NOR2X1 U325 ( .A(n285), .B(n317), .Y(n128) );
  OAI22X1 U326 ( .A0(n362), .A1(n287), .B0(n285), .B1(n363), .Y(n127) );
  XNOR2X1 U327 ( .A(a_0_), .B(n297), .Y(n362) );
  OAI22X1 U328 ( .A0(n363), .A1(n287), .B0(n285), .B1(n364), .Y(n126) );
  XNOR2X1 U329 ( .A(a_1_), .B(n297), .Y(n363) );
  OAI22X1 U330 ( .A0(n364), .A1(n287), .B0(n285), .B1(n365), .Y(n125) );
  XNOR2X1 U331 ( .A(a_2_), .B(n297), .Y(n364) );
  OAI22X1 U332 ( .A0(n365), .A1(n287), .B0(n285), .B1(n366), .Y(n124) );
  XNOR2X1 U333 ( .A(a_3_), .B(n297), .Y(n365) );
  OAI22X1 U334 ( .A0(n366), .A1(n287), .B0(n285), .B1(n367), .Y(n123) );
  XNOR2X1 U335 ( .A(a_4_), .B(n297), .Y(n366) );
  XNOR2X1 U336 ( .A(a_5_), .B(n297), .Y(n367) );
  XNOR2X1 U337 ( .A(a_6_), .B(n297), .Y(n368) );
  XNOR2X1 U338 ( .A(n283), .B(n297), .Y(n369) );
  XNOR2X1 U340 ( .A(a_9_), .B(n297), .Y(n371) );
  XNOR2X1 U341 ( .A(a_10_), .B(n297), .Y(n372) );
  XNOR2X1 U342 ( .A(a_11_), .B(n297), .Y(n373) );
  XNOR2X1 U343 ( .A(a_12_), .B(n297), .Y(n374) );
  XNOR2X1 U344 ( .A(a_13_), .B(n297), .Y(n375) );
  XNOR2X1 U345 ( .A(n323), .B(b_4_), .Y(n376) );
  NOR2X1 U346 ( .A(n286), .B(n317), .Y(n112) );
  OAI22X1 U347 ( .A0(n294), .A1(n317), .B0(n286), .B1(n312), .Y(n111) );
  OAI22X1 U348 ( .A0(n312), .A1(n294), .B0(n286), .B1(n311), .Y(n110) );
  OAI22X1 U349 ( .A0(n294), .A1(n311), .B0(n286), .B1(n309), .Y(n109) );
  OAI22X1 U350 ( .A0(n294), .A1(n305), .B0(n286), .B1(n303), .Y(n106) );
  OAI22X1 U351 ( .A0(n294), .A1(n303), .B0(n286), .B1(n302), .Y(n105) );
  OAI22X1 U352 ( .A0(n294), .A1(n316), .B0(n286), .B1(n315), .Y(n102) );
  OAI22X1 U353 ( .A0(n294), .A1(n314), .B0(n286), .B1(n298), .Y(n101) );
  XNOR2XL U1 ( .A(b_6_), .B(n297), .Y(n293) );
  XNOR2X2 U2 ( .A(a_3_), .B(n295), .Y(n336) );
  OAI22X2 U3 ( .A0(n347), .A1(n331), .B0(n291), .B1(n348), .Y(n143) );
  XNOR2X1 U4 ( .A(a_2_), .B(n295), .Y(n335) );
  MX2X2 U5 ( .A(n332), .B(n333), .S0(a_0_), .Y(n329) );
  OAI22XL U6 ( .A0(n335), .A1(n292), .B0(n336), .B1(n318), .Y(n157) );
  XOR2X1 U7 ( .A(n301), .B(n297), .Y(n370) );
  OAI22XL U8 ( .A0(n348), .A1(n331), .B0(n291), .B1(n349), .Y(n142) );
  NOR2XL U9 ( .A(n310), .B(n291), .Y(n333) );
  OAI22XL U11 ( .A0(n349), .A1(n331), .B0(n291), .B1(n350), .Y(n141) );
  OAI22XL U12 ( .A0(n350), .A1(n331), .B0(n291), .B1(n351), .Y(n140) );
  OAI22XL U14 ( .A0(n351), .A1(n331), .B0(n291), .B1(n352), .Y(n139) );
  OAI22XL U26 ( .A0(n352), .A1(n331), .B0(n291), .B1(n353), .Y(n138) );
  OAI22XL U27 ( .A0(n353), .A1(n331), .B0(n291), .B1(n354), .Y(n137) );
  CLKBUFX8 U28 ( .A(b_1_), .Y(n295) );
  XNOR2X1 U29 ( .A(a_5_), .B(n295), .Y(n338) );
  INVX4 U30 ( .A(b_3_), .Y(n322) );
  NAND2X4 U31 ( .A(n291), .B(n361), .Y(n331) );
  XNOR2X1 U34 ( .A(a_4_), .B(n295), .Y(n337) );
  BUFX3 U37 ( .A(a_7_), .Y(n283) );
  XNOR2X1 U39 ( .A(a_8_), .B(n295), .Y(n341) );
  XNOR2X1 U50 ( .A(a_7_), .B(n295), .Y(n340) );
  XNOR2X1 U52 ( .A(a_6_), .B(n295), .Y(n339) );
  ADDHXL U53 ( .A(n155), .B(n97), .CO(n91), .S(n92) );
  NAND2X2 U54 ( .A(n293), .B(b_6_), .Y(n294) );
endmodule

