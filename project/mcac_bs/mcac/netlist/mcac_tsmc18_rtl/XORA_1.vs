
module XORA_1 ( DQn, DQ, Un );
  input [10:0] DQn;
  input [15:0] DQ;
  output Un;
  wire   DQn_10_, DQ_15_;
  assign DQn_10_ = DQn[10];
  assign DQ_15_ = DQ[15];

  XOR2XL U1 ( .A(DQn_10_), .B(DQ_15_), .Y(Un) );
endmodule

