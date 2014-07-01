/* FMULT_test.v
*
* Module: test
*
* Authors:
* Matthew Pendel
*
* Description:
* Testbench for MULT.
* Runs a random test.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		All		02/25/2014	Testbench Created.
*
*/
module test;

`define NUM_VECTORS 1024

///////////////////////////////////////////
// Wire and Register Instantiations
//
wire  [15:0]   w16_otc;

reg   [10:0]  r11_ifl = 11'd0;
reg   [15:0]  r16_itc = 16'd0;
`ifdef VECT_TEST
reg   [31:0]  inp_vectors	[0:65536];
reg   [31:0]  gold_outp_vectors [0:65536];
reg   [15:0]  vector_addr = 16'd0;

wire  [15:0]  w16_golden_vector;
assign w16_golden_vector = gold_outp_vectors(vector_addr);
`elsif DIREC_TEST
integer op_fl, op_tc, op_result = 0;
`endif

///////////////////////////////////////////
// Module Instantiations
//
FMULT top (
  .I16_TC (r16_itc),
  .I11_FL (r11_ifl),
  .O16_TC (w16_otc)
);

///////////////////////////////////////////
// Functions
//
function [11:0] TC2FL(input integer a);
  integer mant, exp, sign;
  begin
    exp  = a / 10;
    mant = a >= 0 ? a : -a;
    sign = a <  0;
    TC2FL = {sign[0],exp[3:0],mant[5:0]};
  end
endfunction

///////////////////////////////////////////
// Vector Generation
//
initial
begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/FMULT_tsmc18_scan.sdf", test.top);
`endif
`ifdef DIREC_TEST
  r11_ifl <= 11'd0;
  r16_itc <= 16'd0;
  op_fl <= 0;
  op_tc <= 0;
  $display("** Running directed test...");
    // begin generation
  repeat (`NUM_VECTORS) begin
    op_fl <= $random % 16'hFFFF;
    op_tc <= $random % 16'hFFFF;
    #1 r16_itc <= op_tc;
    r11_ifl <= TC2FL(op_fl);
  end
  #10 $display("** Test Complete!");
  $finish;

`elsif VECT_TEST
  r11_ifl <= 11'd0;
  r16_itc <= 16'd0;
  vector_addr <= 16'd0;
  $display("** Running vector test...");
    // begin generation
  repeat (`NUM_VECTORS) begin
    r16_itc <= inp_vectors(vector_addr)[15:0];
    r11_ifl <= inp_vectors(vector_addr)[27:16];
    #1 vector_addr <= vector_addr + 1;
  end
  #10 $display("** Test Complete!");
  $finish;
`else
  $display("** No test selected. Rerun simulation with VECT_TEST");
  $display("** or DIREC_TEST defined. Other possible defines:");
  $display("** VERBOSE, BREAKONERR");
end
///////////////////////////////////////////
// Validation
//
`ifdef DIREC_TEST
always @(r16_itc or r11_ifl or w16_otc)
begin
  op_result = (((op_tc/4) * op_fl) + 48) / 16; // this isnt right.
  #1 if (w16_otc != op_result) begin
      $display("** OTC = %d when ITC = %d and IFL = %d", 
	w16_otc, op_tc, op_fl);
      $display("** Test Failed! Expecting %d", op_result);
`ifdef BREAKONERR 
      $stop;
`endif
    end 
`ifdef VERBOSE
      else $display("** Case ITC = %d, IFL = %d passed.", op_tc, op_fl);
`endif
end

`elsif VECT_TEST
always @(r16_itc or r11_ifl or w16_otc)
begin
  #1 if (w16_otc != w16_golden_vector) begin
    $display("** OTC = %d when ITC = %d and IFL = %d", 
	w16_otc, w16_itc, w11_flc);
      $display("** Test Failed! Expecting %d", w16_golden_vector);
`ifdef BREAKONERR
    $stop
`endif
  end
`ifdef VERBOSE
    else $display("** Case ITC = %d, IFL = %d passed.", w16_itc, w11_ifl);
`endif
end

`endif

endmodule
