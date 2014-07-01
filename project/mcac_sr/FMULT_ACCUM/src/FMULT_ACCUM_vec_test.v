/* FMULT_ACCUM_vec_test.v
*
* Module: test
*
* Authors: 
* Matt Pendel
*
* Description:
* Generic vector test bench.
* Pulls all vector tests from file ./etc/FMULT_ACCUM.vec.f
* Number of input and outputs are hardcoded into tb.
* Room for improvement: 
* Make the ordering of the in/out assignments
* more elegant. Right now, the f file has to be ordered the same way
* as the module is instantiated. Also, the different widths of the
* module ports cause issue, so they are explictly defined/selected.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		MGP		03/25/2014	Module Created.
* 1.01		rph6644		04/16/2014	renamed the R signal to reset,
* 1.02		Levs		04/16/2014	wired in the scan chain signals
* as it is in the unit under test.
*/
module test;
`define NUM_TESTS 8
`define MAX_STR_LENGTH 80
`define NUM_VECTORS 19880
`define HALF_TEST_CLK_PER 17
`define HALF_SYSCLK_PER 1

//*** Wires and Regs ***
reg		R = 1'b1;
reg		r_start ;
reg		sysclk = 1'b0;
reg		test_clk = 1'b0;
reg	[8*`MAX_STR_LENGTH-1:0]	
		s;
reg	[2:0]	errcode = 3'd0;
reg		
		testing = 1'b0;
reg	[3:0]	test_count = 4'd0;
reg	[23:0]	check1, check2;
//*** Vectors Memories/Wires ***
reg	[23:0]  in_memory1   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory2   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory3   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory4   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory5   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory6   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory7   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory8   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory9   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory10  [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory11  [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory12  [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory13  [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory14  [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory15  [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory16  [0:`NUM_VECTORS-1];
reg	[23:0]	out_memory1  [0:`NUM_VECTORS-1];
reg	[23:0]	out_memory2  [0:`NUM_VECTORS-1];
reg	[15:0]	r_in1, r_in2, r_in3, r_in4, r_in5,
		r_in6, r_in7, r_in8 ;
reg	[10:0]	r_in9, r_in10, r_in11, r_in12,
		r_in13, r_in14, r_in15, r_in16 ;
wire	[14:0]	w_out1, w_out2 ;

//*** Vector File Path List
integer		file;
integer		status = 0;

//*** Module Instantiation ***
FMULT_ACCUM top(
	.clk  (sysclk),
	.reset (R),
	.start_trig (test_clk),
        .A1 (r_in1),
        .A2 (r_in2),
	.B1 (r_in3),
	.B2 (r_in4),
	.B3 (r_in5),
	.B4 (r_in6),
	.B5 (r_in7),
	.B6 (r_in8),
	.SR1  (r_in9),
	.SR2  (r_in10),
	.DQ1  (r_in11),
	.DQ2  (r_in12),
	.DQ3  (r_in13),
	.DQ4  (r_in14),
	.DQ5  (r_in15),
	.DQ6  (r_in16),
	.SEZ  (w_out1),
	.SE   (w_out2)
	, .test_mode(1'b0), .scan_enable(1'b0), .scan_in0(1'b0), .scan_in1(1'b0), .scan_in2('b0), .scan_in3(1'b0), .scan_in4(1'b0)
);

//*** System clock gen ***
always #`HALF_SYSCLK_PER sysclk = ~sysclk;
//*** Test clock gen ***
always #`HALF_TEST_CLK_PER test_clk = ~test_clk;

//*** Load Vectors ***
initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/FMULT_ACCUM_tsmc18_scan.sdf", test.top);
`endif
    // open f file
    file = $fopen("etc/FMULT_ACCUM.vec.test.f","r");
    if (!file) errcode = 3'b001;	    // could not open file
      else if (file == -1) errcode = 3'b010;  // empty file
      else $display("** F File Loaded.");
    // load memories
    while (!status) begin
	// inputs
      $display("** Beginning new test...");
      status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory1);
      $display("** %s Input1 Vector File Loaded.",s);
      status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory2);
      $display("** %s Input2 Vector File Loaded.",s);
      status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory3);
      $display("** %s Input3 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory4);
      $display("** %s Input4 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory5);
      $display("** %s Input5 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory6);
      $display("** %s Input6 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory7);
      $display("** %s Input7 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory8);
      $display("** %s Input8 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory9);
      $display("** %s Input9 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory10);
      $display("** %s Input10 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory11);
      $display("** %s Input11 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory12);
      $display("** %s Input12 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory13);
      $display("** %s Input13 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory14);
      $display("** %s Input14 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory15);
      $display("** %s Input15 Vector File Loaded.",s);
     status = $fgets(s,file);
      if (!status) errcode = 3'b011;	    // invalid syntax
      $readmemh(s,in_memory16);
      $display("** %s Input16 Vector File Loaded.",s);

	// outputs
      status = $fgets(s,file);
      if (!status) errcode = 3'b100;	    // invalid syntax
      $readmemh(s,out_memory1);
      $display("** %s Output1 Vector File Loaded.",s);
      status = $fgets(s,file);
      if (!status) errcode = 3'b100;	    // invalid syntax
      $readmemh(s,out_memory2);
      $display("** %s Output2 Vector File Loaded.",s);
	
	// begin testing
      R = 1'b1;
      @(negedge test_clk);
      R = 1'b0;
      fork
        pass_vect;
	check_vect;
      join
      testing = ~testing;
      test_count = test_count + 4'd1;
      $display("** Testing completed. Test count = %d.", test_count);
      //status = $feof(file);
      //if (test_count == 'd4) r_law = ~r_law;  // change law
      status = (test_count == `NUM_TESTS);
    end
    // simulation complete
    //$display("** EOF met in *.vec.test.f. Simulation end.");
    $display("** All tests run. Simulation end.");
    $fclose(file);
    $finish;
end

//*** Pass vectors ***
task pass_vect;
  integer j;
begin
  for (j=0;j<`NUM_VECTORS;j=j+1) begin
      @(posedge test_clk);
        r_in1 <= in_memory1[j];
        r_in2 <= in_memory2[j];
        r_in3 <= in_memory3[j];
        r_in4 <= in_memory4[j];
        r_in5 <= in_memory5[j];
        r_in6 <= in_memory6[j];
        r_in7 <= in_memory7[j];
        r_in8 <= in_memory8[j];
        r_in9 <= in_memory9[j];
        r_in10 <= in_memory10[j];
        r_in11 <= in_memory11[j];
        r_in12 <= in_memory12[j];
        r_in13 <= in_memory13[j];
        r_in14 <= in_memory14[j];
        r_in15 <= in_memory15[j];
        r_in16 <= in_memory16[j];
  end
end
endtask

//*** Vadliate Outputs ***
task check_vect;
  integer j;
begin
  for (j=0;j<`NUM_VECTORS;j=j+1) begin
    @(negedge test_clk);
      check1 = out_memory1[j];
      check2 = out_memory2[j];
      if ((w_out1 != check1) | (w_out2 != check2)) begin
        $display("** Vector failed comparison! Output1: %h; Output2: %h; Expected1: %h; Expected2: %h", 
	  w_out1, w_out2, out_memory1[j][14:0], out_memory2[j][14:0]);
`ifdef BREAKONERR
        $stop;
`endif
`ifdef VERBOSE
      end else begin
	$display("** Vector passed comparison!");
`endif
      end
  end
end
endtask

//*** Error Handler ***
`ifndef NERRHNDLR
always @(errcode) begin
  case(errcode)
    3'b001:
      $display("** ERROR: Could not open *.vec.test.f!");
    3'b010:
      $display("** ERROR: *.vec.test.f is empty!");
    3'b011:
      $display("** ERROR: Failed reading input vector path.");
    3'b100:
      $display("** ERROR: Failed reading output vector path.");
  endcase
  if (errcode!=0) $stop;
end
`endif

endmodule // test

