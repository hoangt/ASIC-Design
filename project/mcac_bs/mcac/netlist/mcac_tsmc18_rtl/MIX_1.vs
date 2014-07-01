
module MIX_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n4, n5, n1;
  wire   [12:2] carry;

  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  XOR3X2 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .Y(n4) );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_10 ( .A(B[10]), .B(A[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(n5) );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  BUFX4 U1 ( .A(n4), .Y(SUM[12]) );
  AND2X2 U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
  BUFX4 U3 ( .A(n5), .Y(SUM[8]) );
  XOR2XL U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


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
         b_3_, b_4_, b_5_, a_0_, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376;
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
  INVX1 U199 ( .A(n301), .Y(n282) );
  DLY1X1 U200 ( .A(a_7_), .Y(n283) );
  CLKINVX3 U201 ( .A(n295), .Y(n320) );
  NAND2X2 U202 ( .A(n295), .B(n318), .Y(n292) );
  XNOR2X4 U203 ( .A(a_2_), .B(n295), .Y(n335) );
  XNOR2X2 U204 ( .A(a_4_), .B(n295), .Y(n337) );
  XNOR2X2 U205 ( .A(a_6_), .B(n295), .Y(n339) );
  XNOR2X2 U206 ( .A(a_5_), .B(n295), .Y(n338) );
  XNOR2X2 U207 ( .A(a_8_), .B(n295), .Y(n341) );
  XNOR2X2 U208 ( .A(a_9_), .B(n295), .Y(n342) );
  BUFX12 U209 ( .A(b_1_), .Y(n295) );
  DLY1X1 U210 ( .A(a_1_), .Y(n284) );
  XOR2X4 U211 ( .A(b_4_), .B(n322), .Y(n285) );
  INVX8 U212 ( .A(n296), .Y(n322) );
  CLKINVX3 U213 ( .A(b_0_), .Y(n318) );
  OAI22XL U214 ( .A0(a_1_), .A1(n292), .B0(n335), .B1(n318), .Y(n334) );
  OAI22X1 U215 ( .A0(n336), .A1(n292), .B0(n337), .B1(n318), .Y(n156) );
  XNOR2XL U216 ( .A(a_1_), .B(n296), .Y(n348) );
  INVX1 U217 ( .A(n284), .Y(n312) );
  XNOR2X1 U218 ( .A(a_3_), .B(n295), .Y(n336) );
  BUFX3 U219 ( .A(b_3_), .Y(n296) );
  INVX1 U220 ( .A(n326), .Y(n304) );
  AOI21X1 U221 ( .A0(n346), .A1(n318), .B0(n320), .Y(n146) );
  NAND2X4 U222 ( .A(n291), .B(n361), .Y(n331) );
  OAI2BB1X1 U223 ( .A0N(n291), .A1N(n331), .B0(n296), .Y(n319) );
  NAND2X1 U224 ( .A(n95), .B(n94), .Y(n290) );
  OAI2BB1X1 U225 ( .A0N(n285), .A1N(n287), .B0(n297), .Y(n321) );
  OAI22X1 U226 ( .A0(n335), .A1(n292), .B0(n336), .B1(n318), .Y(n157) );
  OAI22X2 U227 ( .A0(n347), .A1(n331), .B0(n291), .B1(n348), .Y(n143) );
  MX2X1 U228 ( .A(n332), .B(n333), .S0(a_0_), .Y(n329) );
  OAI22X1 U229 ( .A0(n338), .A1(n292), .B0(n339), .B1(n318), .Y(n154) );
  BUFX3 U230 ( .A(n293), .Y(n286) );
  OAI22X1 U231 ( .A0(n339), .A1(n292), .B0(n340), .B1(n318), .Y(n153) );
  CLKINVX3 U232 ( .A(n334), .Y(n310) );
  BUFX3 U233 ( .A(b_5_), .Y(n297) );
  NAND3X2 U234 ( .A(n288), .B(n289), .C(n290), .Y(n327) );
  OR2X2 U235 ( .A(n328), .B(n306), .Y(n288) );
  OR2X2 U236 ( .A(n328), .B(n308), .Y(n289) );
  XNOR2X1 U237 ( .A(b_6_), .B(n297), .Y(n293) );
  NAND2X1 U238 ( .A(n293), .B(b_6_), .Y(n294) );
  NAND2X4 U239 ( .A(n285), .B(n376), .Y(n287) );
  ADDHX1 U240 ( .A(n157), .B(n143), .CO(n95), .S(n96) );
  ADDHX1 U241 ( .A(n155), .B(n97), .CO(n91), .S(n92) );
  XNOR2X2 U242 ( .A(a_7_), .B(n295), .Y(n340) );
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
  NOR3XL U255 ( .A(n320), .B(n310), .C(n284), .Y(n332) );
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
  NOR2X1 U295 ( .A(n310), .B(n291), .Y(n333) );
  OAI22X1 U296 ( .A0(n337), .A1(n292), .B0(n338), .B1(n318), .Y(n155) );
  OAI22X1 U297 ( .A0(n340), .A1(n292), .B0(n341), .B1(n318), .Y(n152) );
  OAI22X1 U298 ( .A0(n341), .A1(n292), .B0(n342), .B1(n318), .Y(n151) );
  OAI22X1 U299 ( .A0(n342), .A1(n292), .B0(n343), .B1(n318), .Y(n150) );
  XNOR2X1 U300 ( .A(a_10_), .B(n295), .Y(n343) );
  XNOR2X1 U301 ( .A(a_11_), .B(n295), .Y(n344) );
  XNOR2X1 U302 ( .A(a_12_), .B(n295), .Y(n345) );
  XNOR2X1 U303 ( .A(a_13_), .B(n295), .Y(n346) );
  XNOR2X1 U304 ( .A(a_0_), .B(n296), .Y(n347) );
  OAI22X1 U305 ( .A0(n348), .A1(n331), .B0(n291), .B1(n349), .Y(n142) );
  OAI22X1 U306 ( .A0(n349), .A1(n331), .B0(n291), .B1(n350), .Y(n141) );
  XNOR2X1 U307 ( .A(a_2_), .B(n296), .Y(n349) );
  OAI22X1 U308 ( .A0(n350), .A1(n331), .B0(n291), .B1(n351), .Y(n140) );
  XNOR2X1 U309 ( .A(a_3_), .B(n296), .Y(n350) );
  OAI22X1 U310 ( .A0(n351), .A1(n331), .B0(n291), .B1(n352), .Y(n139) );
  XNOR2X1 U311 ( .A(a_4_), .B(n296), .Y(n351) );
  OAI22X1 U312 ( .A0(n352), .A1(n331), .B0(n291), .B1(n353), .Y(n138) );
  XNOR2X1 U313 ( .A(a_5_), .B(n296), .Y(n352) );
  OAI22X1 U314 ( .A0(n353), .A1(n331), .B0(n291), .B1(n354), .Y(n137) );
  XNOR2X1 U315 ( .A(a_6_), .B(n296), .Y(n353) );
  XNOR2X1 U316 ( .A(n283), .B(n296), .Y(n354) );
  XNOR2X1 U317 ( .A(a_8_), .B(n296), .Y(n355) );
  XNOR2X1 U318 ( .A(a_9_), .B(n296), .Y(n356) );
  XNOR2X1 U319 ( .A(a_10_), .B(n296), .Y(n357) );
  OAI22X1 U320 ( .A0(n358), .A1(n331), .B0(n291), .B1(n359), .Y(n132) );
  XNOR2X1 U321 ( .A(a_11_), .B(n296), .Y(n358) );
  XNOR2X1 U322 ( .A(a_12_), .B(n296), .Y(n359) );
  XNOR2X1 U323 ( .A(a_13_), .B(n296), .Y(n360) );
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
  XNOR2X1 U339 ( .A(n282), .B(n297), .Y(n370) );
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
endmodule


module MIX_1_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n43, n45, n46, n48, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n65,
         n67, n68, n70, n72, n73, n74, n76, n78, n79, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, DIFF_0_, DIFF_1_,
         DIFF_2_, DIFF_3_, DIFF_4_, DIFF_5_, DIFF_6_, DIFF_7_, DIFF_8_,
         DIFF_9_, DIFF_10_, DIFF_11_, DIFF_12_, DIFF_13_, B_0_, B_1_, B_2_,
         B_3_, B_4_, B_5_, B_6_, B_7_, B_8_, B_9_, B_10_, B_11_, B_12_, A_0_,
         A_1_, A_2_, A_3_, A_4_, A_5_, A_6_, A_7_, A_8_, A_9_, A_10_, A_11_,
         A_12_, n157, n158, n159, n160, n161, n162, n163;
  assign DIFF[0] = DIFF_0_;
  assign DIFF[1] = DIFF_1_;
  assign DIFF[2] = DIFF_2_;
  assign DIFF[3] = DIFF_3_;
  assign DIFF[4] = DIFF_4_;
  assign DIFF[5] = DIFF_5_;
  assign DIFF[6] = DIFF_6_;
  assign DIFF[7] = DIFF_7_;
  assign DIFF[8] = DIFF_8_;
  assign DIFF[9] = DIFF_9_;
  assign DIFF[10] = DIFF_10_;
  assign DIFF[11] = DIFF_11_;
  assign DIFF[12] = DIFF_12_;
  assign DIFF[13] = DIFF_13_;
  assign B_0_ = B[0];
  assign B_1_ = B[1];
  assign B_2_ = B[2];
  assign B_3_ = B[3];
  assign B_4_ = B[4];
  assign B_5_ = B[5];
  assign B_6_ = B[6];
  assign B_7_ = B[7];
  assign B_8_ = B[8];
  assign B_9_ = B[9];
  assign B_10_ = B[10];
  assign B_11_ = B[11];
  assign B_12_ = B[12];
  assign A_0_ = A[0];
  assign A_1_ = A[1];
  assign A_2_ = A[2];
  assign A_3_ = A[3];
  assign A_4_ = A[4];
  assign A_5_ = A[5];
  assign A_6_ = A[6];
  assign A_7_ = A[7];
  assign A_8_ = A[8];
  assign A_9_ = A[9];
  assign A_10_ = A[10];
  assign A_11_ = A[11];
  assign A_12_ = A[12];

  OAI21X4 U3 ( .A0(n17), .A1(n15), .B0(n16), .Y(n14) );
  AOI21X4 U9 ( .A0(n22), .A1(n163), .B0(n19), .Y(n17) );
  OAI21X4 U17 ( .A0(n23), .A1(n52), .B0(n24), .Y(n22) );
  INVX4 U123 ( .A(B_6_), .Y(n98) );
  CLKINVX3 U124 ( .A(n61), .Y(n60) );
  OAI21X2 U125 ( .A0(n74), .A1(n62), .B0(n63), .Y(n61) );
  OAI21X2 U126 ( .A0(n41), .A1(n35), .B0(n36), .Y(n34) );
  INVX4 U127 ( .A(n52), .Y(n51) );
  AOI21X4 U128 ( .A0(n53), .A1(n61), .B0(n54), .Y(n52) );
  INVX1 U129 ( .A(B_2_), .Y(n102) );
  INVX2 U130 ( .A(B_3_), .Y(n101) );
  NAND2X1 U131 ( .A(n102), .B(A_2_), .Y(n72) );
  AOI21X1 U132 ( .A0(n162), .A1(n1), .B0(n76), .Y(n74) );
  AOI21X1 U133 ( .A0(n161), .A1(n48), .B0(n43), .Y(n41) );
  INVX1 U134 ( .A(B_0_), .Y(n104) );
  NAND2BX1 U135 ( .AN(n35), .B(n36), .Y(n6) );
  NAND2BX1 U136 ( .AN(n30), .B(n31), .Y(n5) );
  NAND2BX1 U137 ( .AN(n55), .B(n56), .Y(n9) );
  NAND2BX1 U138 ( .AN(n58), .B(n59), .Y(n10) );
  NAND2BX1 U139 ( .AN(n27), .B(n28), .Y(n4) );
  NAND2BX1 U140 ( .AN(n15), .B(n16), .Y(n2) );
  NOR2X1 U141 ( .A(n30), .B(n27), .Y(n25) );
  NAND2X1 U142 ( .A(n25), .B(n33), .Y(n23) );
  INVX4 U143 ( .A(B_1_), .Y(n103) );
  INVX1 U144 ( .A(n50), .Y(n48) );
  INVX1 U145 ( .A(B_8_), .Y(n96) );
  INVX1 U146 ( .A(B_4_), .Y(n100) );
  NOR2X1 U147 ( .A(n96), .B(A_8_), .Y(n35) );
  INVX1 U148 ( .A(B_12_), .Y(n92) );
  INVX1 U149 ( .A(n21), .Y(n19) );
  AOI21X2 U150 ( .A0(n25), .A1(n34), .B0(n26), .Y(n24) );
  NAND2X1 U151 ( .A(n98), .B(A_6_), .Y(n50) );
  INVX1 U152 ( .A(B_7_), .Y(n97) );
  NOR2X1 U153 ( .A(n104), .B(A_0_), .Y(n79) );
  INVX1 U154 ( .A(n74), .Y(n73) );
  AOI21X1 U155 ( .A0(n160), .A1(n70), .B0(n65), .Y(n63) );
  NOR2X1 U156 ( .A(n99), .B(A_5_), .Y(n55) );
  NOR2X1 U157 ( .A(n100), .B(A_4_), .Y(n58) );
  NAND2X1 U158 ( .A(n100), .B(A_4_), .Y(n59) );
  INVX1 U159 ( .A(B_10_), .Y(n94) );
  INVX1 U160 ( .A(B_9_), .Y(n95) );
  NOR2X1 U161 ( .A(n40), .B(n35), .Y(n33) );
  NOR2X1 U162 ( .A(n55), .B(n58), .Y(n53) );
  OAI21XL U163 ( .A0(n55), .A1(n59), .B0(n56), .Y(n54) );
  NOR2X1 U164 ( .A(n94), .B(A_10_), .Y(n27) );
  NOR2X1 U165 ( .A(n95), .B(A_9_), .Y(n30) );
  INVX1 U166 ( .A(B_11_), .Y(n93) );
  CLKINVX3 U167 ( .A(n14), .Y(DIFF_13_) );
  OR2X2 U168 ( .A(n102), .B(A_2_), .Y(n159) );
  AOI21X1 U169 ( .A0(n73), .A1(n159), .B0(n70), .Y(n68) );
  NAND2X1 U170 ( .A(n96), .B(A_8_), .Y(n36) );
  AOI21XL U171 ( .A0(n51), .A1(n33), .B0(n34), .Y(n32) );
  NAND2X1 U172 ( .A(n159), .B(n160), .Y(n62) );
  XOR2X1 U173 ( .A(n13), .B(n79), .Y(DIFF_1_) );
  XOR2X1 U174 ( .A(n51), .B(n157), .Y(DIFF_6_) );
  AND2X1 U175 ( .A(n158), .B(n50), .Y(n157) );
  XNOR2X1 U176 ( .A(n104), .B(A_0_), .Y(DIFF_0_) );
  NAND2X1 U177 ( .A(n99), .B(A_5_), .Y(n56) );
  OR2X2 U178 ( .A(n98), .B(A_6_), .Y(n158) );
  NAND2X1 U179 ( .A(n95), .B(A_9_), .Y(n31) );
  NAND2XL U180 ( .A(n158), .B(n161), .Y(n40) );
  AOI21XL U181 ( .A0(n51), .A1(n38), .B0(n39), .Y(n37) );
  NAND2XL U182 ( .A(n161), .B(n45), .Y(n7) );
  AOI21XL U183 ( .A0(n51), .A1(n158), .B0(n48), .Y(n46) );
  NAND2XL U184 ( .A(n159), .B(n72), .Y(n12) );
  NAND2XL U185 ( .A(n160), .B(n67), .Y(n11) );
  NAND2XL U186 ( .A(n162), .B(n78), .Y(n13) );
  NAND2XL U187 ( .A(n163), .B(n21), .Y(n3) );
  NAND2XL U188 ( .A(n92), .B(A_12_), .Y(n16) );
  NAND2XL U189 ( .A(n94), .B(A_10_), .Y(n28) );
  INVX1 U190 ( .A(n40), .Y(n38) );
  INVX1 U191 ( .A(n41), .Y(n39) );
  INVX1 U192 ( .A(n45), .Y(n43) );
  INVX1 U193 ( .A(n67), .Y(n65) );
  OAI21XL U194 ( .A0(n31), .A1(n27), .B0(n28), .Y(n26) );
  XOR2X1 U195 ( .A(n32), .B(n5), .Y(DIFF_9_) );
  XNOR2X1 U196 ( .A(n29), .B(n4), .Y(DIFF_10_) );
  OAI21XL U197 ( .A0(n32), .A1(n30), .B0(n31), .Y(n29) );
  XOR2X1 U198 ( .A(n46), .B(n7), .Y(DIFF_7_) );
  XOR2X1 U199 ( .A(n37), .B(n6), .Y(DIFF_8_) );
  INVX1 U200 ( .A(n72), .Y(n70) );
  XOR2X1 U201 ( .A(n60), .B(n10), .Y(DIFF_4_) );
  XNOR2X1 U202 ( .A(n57), .B(n9), .Y(DIFF_5_) );
  OAI21XL U203 ( .A0(n60), .A1(n58), .B0(n59), .Y(n57) );
  XNOR2X1 U204 ( .A(n73), .B(n12), .Y(DIFF_2_) );
  XOR2X1 U205 ( .A(n68), .B(n11), .Y(DIFF_3_) );
  INVX1 U206 ( .A(n78), .Y(n76) );
  INVX1 U207 ( .A(n79), .Y(n1) );
  XOR2X1 U208 ( .A(n17), .B(n2), .Y(DIFF_12_) );
  XNOR2X1 U209 ( .A(n22), .B(n3), .Y(DIFF_11_) );
  NOR2X1 U210 ( .A(n92), .B(A_12_), .Y(n15) );
  OR2X2 U211 ( .A(n101), .B(A_3_), .Y(n160) );
  OR2X2 U212 ( .A(n97), .B(A_7_), .Y(n161) );
  NAND2X1 U213 ( .A(n93), .B(A_11_), .Y(n21) );
  NAND2X1 U214 ( .A(n97), .B(A_7_), .Y(n45) );
  NAND2X1 U215 ( .A(n103), .B(A_1_), .Y(n78) );
  NAND2X1 U216 ( .A(n101), .B(A_3_), .Y(n67) );
  INVX1 U217 ( .A(B_5_), .Y(n99) );
  OR2X2 U218 ( .A(n103), .B(A_1_), .Y(n162) );
  OR2X2 U219 ( .A(n93), .B(A_11_), .Y(n163) );
endmodule


module MIX_1 ( AL, YU, YL, Y );
  input [6:0] AL;
  input [12:0] YU;
  input [18:0] YL;
  output [12:0] Y;
  wire   N18, DIFM_13_, N32, N9, N8, N7, N6, N5, N4, N3, N2, N14, N13, N12,
         N11, N10, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95;
  wire   [13:1] DIF;
  wire   [14:1] PRODM;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8;
  assign N9 = YU[7];
  assign N8 = YU[6];
  assign N7 = YU[5];
  assign N6 = YU[4];
  assign N5 = YU[3];
  assign N4 = YU[2];
  assign N3 = YU[1];
  assign N2 = YU[0];
  assign N14 = YU[12];
  assign N13 = YU[11];
  assign N12 = YU[10];
  assign N11 = YU[9];
  assign N10 = YU[8];

  MIX_1_DW01_add_0 add_60 ( .A({1'b0, 1'b0, YL[18:6]}), .B({n70, n71, n72, n73, 
        n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, N32}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, Y}) );
  MIX_1_DW_mult_uns_0 mult_58 ( .a({DIFM_13_, n93, n94, n95, n84, n85, n86, 
        n87, n88, n89, n90, n91, n92, N18}), .b(AL), .product({PRODM, N32, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7}) );
  MIX_1_DW01_sub_3 sub_0_root_sub_0_root_sub_55 ( .A({1'b1, 1'b0, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}), .B({1'b0, 1'b0, 
        YL[18:6]}), .CI(1'b0), .DIFF({SYNOPSYS_UNCONNECTED__8, DIF, N18}) );
  XNOR2X2 U3 ( .A(DIF[7]), .B(n5), .Y(n86) );
  XOR2X2 U5 ( .A(DIF[1]), .B(n33), .Y(n92) );
  NOR2X1 U6 ( .A(n60), .B(n17), .Y(n61) );
  AND2X2 U7 ( .A(n15), .B(N18), .Y(n33) );
  AND2X2 U8 ( .A(n19), .B(n15), .Y(n20) );
  NOR2X1 U9 ( .A(DIF[5]), .B(n24), .Y(n9) );
  OR2X2 U10 ( .A(n27), .B(DIF[4]), .Y(n24) );
  AND2X2 U11 ( .A(n38), .B(n15), .Y(n59) );
  INVX1 U12 ( .A(n15), .Y(n68) );
  INVX1 U13 ( .A(N18), .Y(n32) );
  INVX1 U14 ( .A(DIF[4]), .Y(n29) );
  XNOR2X1 U15 ( .A(DIF[8]), .B(n4), .Y(n85) );
  XNOR2X1 U16 ( .A(DIF[9]), .B(n3), .Y(n84) );
  INVX1 U17 ( .A(n41), .Y(n52) );
  INVX1 U18 ( .A(n43), .Y(n49) );
  OR2X2 U19 ( .A(n51), .B(n17), .Y(n6) );
  BUFX8 U20 ( .A(DIF[13]), .Y(n15) );
  BUFX4 U21 ( .A(n68), .Y(n17) );
  XNOR2X2 U22 ( .A(DIF[2]), .B(n2), .Y(n91) );
  NOR2XL U23 ( .A(n14), .B(n17), .Y(n21) );
  NAND2BXL U24 ( .AN(PRODM[11]), .B(n51), .Y(n43) );
  NOR2X1 U25 ( .A(n13), .B(n17), .Y(n22) );
  NOR2BX1 U26 ( .AN(n15), .B(n9), .Y(n23) );
  OR2XL U27 ( .A(n12), .B(n17), .Y(n3) );
  OR2X2 U28 ( .A(n10), .B(n17), .Y(n5) );
  XOR2X1 U29 ( .A(n29), .B(n28), .Y(n89) );
  NAND2XL U30 ( .A(n15), .B(n27), .Y(n28) );
  NOR2X1 U31 ( .A(n56), .B(n17), .Y(n57) );
  NOR2XL U32 ( .A(n47), .B(n17), .Y(n48) );
  XNOR2X1 U33 ( .A(DIF[3]), .B(n1), .Y(n90) );
  NAND2XL U34 ( .A(n15), .B(n30), .Y(n1) );
  NAND2XL U35 ( .A(n15), .B(n31), .Y(n2) );
  OR2X1 U36 ( .A(n11), .B(n17), .Y(n4) );
  XOR2X1 U37 ( .A(n26), .B(n25), .Y(n88) );
  NAND2XL U38 ( .A(n14), .B(n18), .Y(n19) );
  NOR2BX1 U39 ( .AN(n9), .B(DIF[6]), .Y(n10) );
  XNOR2X2 U40 ( .A(PRODM[11]), .B(n6), .Y(n73) );
  INVX1 U41 ( .A(n36), .Y(n62) );
  NAND2BX1 U42 ( .AN(PRODM[4]), .B(n64), .Y(n36) );
  INVX1 U43 ( .A(n39), .Y(n56) );
  NAND2BX1 U44 ( .AN(PRODM[7]), .B(n58), .Y(n39) );
  INVX1 U45 ( .A(n38), .Y(n58) );
  NAND2BX1 U46 ( .AN(PRODM[6]), .B(n60), .Y(n38) );
  INVX1 U47 ( .A(n37), .Y(n60) );
  NAND2BX1 U48 ( .AN(PRODM[5]), .B(n62), .Y(n37) );
  NAND2BX1 U49 ( .AN(PRODM[9]), .B(n54), .Y(n41) );
  INVX1 U50 ( .A(n42), .Y(n51) );
  NAND2BXL U51 ( .AN(PRODM[10]), .B(n52), .Y(n42) );
  INVX1 U52 ( .A(n40), .Y(n54) );
  NAND2BX1 U53 ( .AN(PRODM[8]), .B(n56), .Y(n40) );
  NOR2X1 U54 ( .A(PRODM[1]), .B(N32), .Y(n7) );
  INVX1 U55 ( .A(n34), .Y(n66) );
  NAND2BX1 U56 ( .AN(PRODM[2]), .B(n7), .Y(n34) );
  INVX1 U57 ( .A(n35), .Y(n64) );
  NAND2BX1 U58 ( .AN(PRODM[3]), .B(n66), .Y(n35) );
  INVX1 U59 ( .A(n44), .Y(n47) );
  NAND2BXL U60 ( .AN(PRODM[12]), .B(n49), .Y(n44) );
  XOR2X1 U61 ( .A(PRODM[13]), .B(n48), .Y(n71) );
  NOR3BX1 U62 ( .AN(n15), .B(DIF[12]), .C(n19), .Y(DIFM_13_) );
  INVX1 U63 ( .A(DIF[11]), .Y(n18) );
  XOR2X1 U64 ( .A(DIF[12]), .B(n20), .Y(n93) );
  XOR2X1 U65 ( .A(DIF[6]), .B(n23), .Y(n87) );
  XOR2X1 U66 ( .A(DIF[11]), .B(n21), .Y(n94) );
  XOR2X1 U67 ( .A(DIF[10]), .B(n22), .Y(n95) );
  NAND2XL U68 ( .A(n15), .B(n24), .Y(n25) );
  AND2X2 U69 ( .A(N32), .B(n15), .Y(n8) );
  NAND2BX1 U70 ( .AN(DIF[1]), .B(n32), .Y(n31) );
  OR2X2 U71 ( .A(DIF[2]), .B(n31), .Y(n30) );
  OR2X2 U72 ( .A(DIF[3]), .B(n30), .Y(n27) );
  NOR2BX1 U73 ( .AN(n10), .B(DIF[7]), .Y(n11) );
  NOR2BX1 U74 ( .AN(n11), .B(DIF[8]), .Y(n12) );
  NOR2BX1 U75 ( .AN(n12), .B(DIF[9]), .Y(n13) );
  NOR2BX1 U76 ( .AN(n13), .B(DIF[10]), .Y(n14) );
  NOR2X1 U77 ( .A(PRODM[13]), .B(n45), .Y(n46) );
  NAND2X1 U78 ( .A(n47), .B(n15), .Y(n45) );
  XOR2X1 U79 ( .A(PRODM[14]), .B(n46), .Y(n70) );
  INVX1 U80 ( .A(DIF[5]), .Y(n26) );
  XOR2X1 U81 ( .A(PRODM[2]), .B(n69), .Y(n82) );
  NOR2X1 U82 ( .A(n7), .B(n17), .Y(n69) );
  XOR2X1 U83 ( .A(PRODM[9]), .B(n55), .Y(n75) );
  XOR2X1 U84 ( .A(PRODM[8]), .B(n57), .Y(n76) );
  XOR2X1 U85 ( .A(PRODM[7]), .B(n59), .Y(n77) );
  XOR2X1 U86 ( .A(PRODM[5]), .B(n63), .Y(n79) );
  NOR2X1 U87 ( .A(n62), .B(n17), .Y(n63) );
  XOR2X1 U88 ( .A(PRODM[6]), .B(n61), .Y(n78) );
  XOR2X1 U89 ( .A(PRODM[3]), .B(n67), .Y(n81) );
  NOR2X1 U90 ( .A(n66), .B(n17), .Y(n67) );
  XOR2X1 U91 ( .A(PRODM[4]), .B(n65), .Y(n80) );
  NOR2X1 U92 ( .A(n64), .B(n17), .Y(n65) );
  XOR2X1 U93 ( .A(PRODM[1]), .B(n8), .Y(n83) );
  XOR2X1 U94 ( .A(PRODM[10]), .B(n53), .Y(n74) );
  XOR2X2 U95 ( .A(PRODM[12]), .B(n50), .Y(n72) );
  NOR2X2 U96 ( .A(n49), .B(n17), .Y(n50) );
  NOR2X2 U97 ( .A(n52), .B(n17), .Y(n53) );
  NOR2X2 U98 ( .A(n54), .B(n17), .Y(n55) );
endmodule

