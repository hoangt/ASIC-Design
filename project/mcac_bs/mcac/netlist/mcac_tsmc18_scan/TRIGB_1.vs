
module TRIGB_1 ( TR, nP, nR );
  input [0:0] nP;
  output [0:0] nR;
  input TR;
  wire   nP_0_, nR_0_;
  assign nP_0_ = nP[0];
  assign nR[0] = nR_0_;

  NOR2BX1 U2 ( .AN(nP_0_), .B(TR), .Y(nR_0_) );
endmodule

