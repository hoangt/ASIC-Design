/* IN_PCM_vec_test.v
*
* Module: test
*
* Authors: 
* Matt Pendel
*
* Description:
* Generic vector test bench.
* Pulls all vector tests from file ./etc/LIMC.vec.f
* Number of input and outputs are hardcoded into tb.
* Room for improvement: 
* Make the ordering of the in/out assignments
* more elegant. Right now, the f file has to be ordered the same way
* as the module is instantiated. Also, the different widths of the
* module ports cause issue, so they are explictly defined/selected.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		MGP		03/24/2014	Module Created.
*/
module test;
`define NUM_TESTS 8
`define MAX_STR_LENGTH 80
`define NUM_INPS  1
`define NUM_OUTPS 1
`define NUM_VECTORS 19880
`define HALF_TEST_CLK_PER 10

//*** Wires and Regs ***
reg		test_clk = 1'b0;
reg	[8*`MAX_STR_LENGTH-1:0]	
		s;
reg	[2:0]	errcode = 3'd0;
reg		
		testing = 1'b0;
reg	[3:0]	test_count = 4'd0;
//*** Vectors Memories/Wires ***
reg	[23:0]  in_memory1   [0:`NUM_VECTORS-1];
reg	[23:0]  in_memory2   [0:`NUM_VECTORS-1];
reg	[23:0]	out_memory  [0:`NUM_VECTORS-1];
reg		r_law = 1'd1;
reg	[7:0]	r_in1 ;
reg	[14:0]	r_in2 ;
wire	[15:0]	w_out ;

//*** Vector File Path List
integer		file;
integer		status = 0;

//*** Module Instantiation ***
IN_PCM top(
        .S  (r_in1),
        .SE (r_in2),
	.LAW(r_law),
	.D  (w_out)
);

//*** Test clock gen ***
always #`HALF_TEST_CLK_PER test_clk = ~test_clk;

//*** Load Vectors ***
initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/IN_PCM_tsmc18_scan.sdf", test.top);
`endif
    // open f file
    file = $fopen("etc/IN_PCM.vec.test.f","r");
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

	// outputs
      status = $fgets(s,file);
      if (!status) errcode = 3'b100;	    // invalid syntax
      $readmemh(s,out_memory);
      $display("** %s Output Vector File Loaded.",s);
	// begin testing
      @(negedge test_clk);
      fork
        pass_vect;
	check_vect;
      join
      testing = ~testing;
      test_count = test_count + 4'd1;
      $display("** Testing completed. Test count = %d.", test_count);
      //status = $feof(file);
      if (test_count == 'd4) r_law = ~r_law;  // change law
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
  end
end
endtask

//*** Vadliate Outputs ***
task check_vect;
  integer j;
begin
  for (j=0;j<`NUM_VECTORS;j=j+1) begin
    @(negedge test_clk);
      if (w_out != out_memory[j]) begin
        $display("** Vector failed comparison! Input1: %h; Input2: %h; Output: %h; Expected: %h", 
	  r_in1, r_in2, w_out, out_memory[j][15:0]);
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

