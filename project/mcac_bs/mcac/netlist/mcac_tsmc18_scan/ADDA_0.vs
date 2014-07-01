
module ADDA_0 ( DQLN, Y, DQL );
  input [11:0] DQLN;
  input [12:0] Y;
  output [11:0] DQL;
  wire   SYNOPSYS_UNCONNECTED__0;

  ADDA_0_DW01_add_11 add_44 ( .A({1'b0, DQLN}), .B({1'b0, 1'b0, Y[12:2]}), 
        .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, DQL}) );
endmodule

