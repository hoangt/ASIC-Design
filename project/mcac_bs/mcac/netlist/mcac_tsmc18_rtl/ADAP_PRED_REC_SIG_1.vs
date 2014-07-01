
module ADAP_PRED_REC_SIG_1 ( DQ, RATE, clk, dly_strb, reset, TR, start_trig, 
        SE, A2, SR, done, test_mode, scan_enable, scan_in0, scan_in1, scan_in2, 
        scan_in3, scan_in4, scan_out0, scan_out1, scan_out2, scan_out3, 
        scan_out4 );
  input [15:0] DQ;
  input [1:0] RATE;
  output [14:0] SE;
  output [15:0] A2;
  output [15:0] SR;
  input clk, dly_strb, reset, TR, start_trig, test_mode, scan_enable, scan_in0,
         scan_in1, scan_in2, scan_in3, scan_in4;
  output done, scan_out0, scan_out1, scan_out2, scan_out3, scan_out4;
  wire   PK0, SIGPK, PK1, PK2, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15;
  wire   [14:0] SEZ;
  wire   [10:0] SR0;
  wire   [10:0] SR1;
  wire   [10:0] DQ0;
  wire   [10:0] DQ1;
  wire   [15:0] B1;
  wire   [10:0] DQ2;
  wire   [15:0] B2;
  wire   [10:0] DQ3;
  wire   [15:0] B3;
  wire   [10:0] DQ4;
  wire   [15:0] B4;
  wire   [10:0] DQ5;
  wire   [15:0] B5;
  wire   [10:0] DQ6;
  wire   [15:0] B6;
  wire   [10:0] SR2;
  wire   [15:0] A1;
  wire   [15:0] A2_int;
  wire   [15:0] A2T;
  wire   [15:0] A2R_int;
  wire   [15:0] A1T;
  wire   [15:0] A1P;
  wire   [15:0] A1R;

  ADDC_1 addc1 ( .DQ({DQ[15], n14, n13, n12, n11, n10, n9, n8, n7, n2, n6, 
        DQ[4:3], n5, n4, n3}), .SEZ(SEZ), .PK0(PK0), .SIGPK(SIGPK) );
  DELAY_RESET_STATE0_WIDTH1_3 delay1 ( .x(PK0), .reset(reset), .y(PK1), .clk(
        dly_strb), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  DELAY_RESET_STATE0_WIDTH1_2 delay2 ( .x(PK1), .reset(reset), .y(PK2), .clk(
        dly_strb), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  ADDB_1 addb1 ( .DQ({DQ[15], n14, n13, n12, n11, n10, n9, n8, n7, n2, n6, 
        DQ[4:3], n5, n4, n3}), .SE(SE), .SR(SR) );
  FLOATB_1 floatb1 ( .SR(SR), .SR0(SR0) );
  DELAY_020_11_15 delay3 ( .x(SR0), .reset(reset), .y(SR1), .clk(dly_strb), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  FLOATA_1 floata1 ( .DQ({DQ[15], n14, n13, n12, n11, n10, n9, n8, n7, n2, n6, 
        DQ[4:3], n5, n4, n3}), .DQ0(DQ0) );
  DELAYPREDIC_11 delaypredic1 ( .DQN(DQ0), .DQ({DQ[15], n14, n13, n12, n11, 
        n10, n9, n8, n7, n2, n6, DQ[4:3], n5, n4, n3}), .RATE(RATE), .TR(n15), 
        .reset(reset), .clk(dly_strb), .DQN1(DQ1), .B(B1), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0) );
  DELAYPREDIC_10 delaypredic2 ( .DQN(DQ1), .DQ({DQ[15], n14, n13, n12, n11, 
        n10, n9, n8, n7, n2, n6, DQ[4:3], n5, n4, n3}), .RATE(RATE), .TR(n15), 
        .reset(reset), .clk(dly_strb), .DQN1(DQ2), .B(B2), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0) );
  DELAYPREDIC_9 delaypredic3 ( .DQN(DQ2), .DQ({DQ[15], n14, n13, n12, n11, n10, 
        n9, n8, n7, n2, n6, DQ[4:3], n5, n4, n3}), .RATE(RATE), .TR(n15), 
        .reset(reset), .clk(dly_strb), .DQN1(DQ3), .B(B3), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0) );
  DELAYPREDIC_8 delaypredic4 ( .DQN(DQ3), .DQ({DQ[15], n14, n13, n12, n11, n10, 
        n9, n8, n7, n2, n6, DQ[4:3], n5, n4, n3}), .RATE(RATE), .TR(n15), 
        .reset(reset), .clk(dly_strb), .DQN1(DQ4), .B(B4), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0) );
  DELAYPREDIC_7 delaypredic5 ( .DQN(DQ4), .DQ({DQ[15], n14, n13, n12, n11, n10, 
        n9, n8, n7, n2, n6, DQ[4:3], n5, n4, n3}), .RATE(RATE), .TR(n15), 
        .reset(reset), .clk(dly_strb), .DQN1(DQ5), .B(B5), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0) );
  DELAYPREDIC_6 delaypredic6 ( .DQN(DQ5), .DQ({DQ[15], n14, n13, n12, n11, n10, 
        n9, n8, n7, n2, n6, DQ[4:3], n5, n4, n3}), .RATE(RATE), .TR(n15), 
        .reset(reset), .clk(dly_strb), .DQN1(DQ6), .B(B6), .scan_enable(1'b0), 
        .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), .scan_in3(1'b0), 
        .scan_in4(1'b0) );
  DELAY_020_11_14 delay4 ( .x(SR1), .reset(reset), .y(SR2), .clk(dly_strb), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  UPA2_1 upa21 ( .PK0(PK0), .PK1(PK1), .PK2(PK2), .A1(A1), .A2(A2_int), 
        .SIGPK(SIGPK), .A2T(A2T) );
  LIMC_1 limc1 ( .A2T(A2T), .A2P(A2) );
  TRIGB_WIDTH16_15 trigb1 ( .TR(n15), .nP(A2), .nR(A2R_int) );
  DELAY_RESET_STATE0_WIDTH16_15 delay5 ( .x(A2R_int), .reset(reset), .y(A2_int), .clk(dly_strb), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  UPA1_1 upa11 ( .PK0(PK0), .PK1(PK1), .A1(A1), .SIGPK(SIGPK), .A1T(A1T) );
  LIMD_1 limd1 ( .A1T(A1T), .A2P(A2), .A1P(A1P) );
  TRIGB_WIDTH16_14 trigb2 ( .TR(n15), .nP(A1P), .nR(A1R) );
  DELAY_RESET_STATE0_WIDTH16_14 delay6 ( .x(A1R), .reset(reset), .y(A1), .clk(
        dly_strb), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), 
        .scan_in2(1'b0), .scan_in3(1'b0), .scan_in4(1'b0) );
  FMULT_ACCUM_1 fmultaccum1 ( .reset(reset), .clk(clk), .start(start_trig), 
        .done(done), .A1(A1), .A2(A2_int), .B1(B1), .B2(B2), .B3(B3), .B4(B4), 
        .B5(B5), .B6(B6), .SR1(SR1), .SR2(SR2), .DQ1(DQ1), .DQ2(DQ2), .DQ3(DQ3), .DQ4(DQ4), .DQ5(DQ5), .DQ6(DQ6), .SE(SE), .SEZ(SEZ), .test_mode(test_mode), 
        .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2(1'b0), 
        .scan_in3(1'b0), .scan_in4(1'b0) );
  BUFX12 U1 ( .A(DQ[2]), .Y(n5) );
  INVX8 U2 ( .A(n1), .Y(n2) );
  CLKINVX4 U3 ( .A(DQ[6]), .Y(n1) );
  BUFX12 U4 ( .A(DQ[0]), .Y(n3) );
  BUFX3 U5 ( .A(DQ[12]), .Y(n12) );
  BUFX3 U6 ( .A(DQ[7]), .Y(n7) );
  BUFX3 U7 ( .A(DQ[14]), .Y(n14) );
  BUFX3 U8 ( .A(DQ[13]), .Y(n13) );
  BUFX3 U9 ( .A(DQ[11]), .Y(n11) );
  BUFX3 U10 ( .A(DQ[10]), .Y(n10) );
  BUFX3 U11 ( .A(DQ[8]), .Y(n8) );
  BUFX3 U12 ( .A(DQ[9]), .Y(n9) );
  BUFX16 U13 ( .A(DQ[1]), .Y(n4) );
  BUFX12 U14 ( .A(DQ[5]), .Y(n6) );
  BUFX3 U15 ( .A(TR), .Y(n15) );
endmodule

