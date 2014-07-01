
/* TON_TRAN_DET_test.v
*
* Module: TON_TRAN_DET testbench
*
* Authors:
* Pratheep Joe Siluvai
* *
* Description:
* This file reads C-code generated vectors and tests RTL verilog code against them.
* The device under test is the TON_TRAN_DET module.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.0		pi4810		03/30/2014	Module created.
*
*/

///////////////////////
//Module Declaration //
///////////////////////

module TON_TRAN_DET_test ();

`define NUM_TESTS 8
`define MAX_STR_LENGTH 80
`define NUM_VECTORS 19880
`define HALF_TEST_CLK_PER 4
`define HALF_SYSCLK_PER 1

///////////////
// Registers //
///////////////
reg		rstn = 1'b0;
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
reg	[23:0]	out_memory1  [0:`NUM_VECTORS-1];
reg	[23:0]	out_memory2  [0:`NUM_VECTORS-1];



reg 	[15:0] A2P,DQ;
reg	TR,R1;
reg	[18:0] YL;                 
reg  	CLK;
//reg	[1:0] rate; 

reg
	test_clk,	//clock for verification
	law,	// == 1 if running alaw vectors
	new_vector_set;	// Toggles high when changing vector set

///////////
// Wires //
///////////

wire	TR,TDP;


//*** Vector File Path List
integer		file;
integer		status = 0;


//*** Module Instantiation ***

TON_TRAN_DET dut(
        .A2P(A2P),
        .R1(R1),
        .YL(YL),
        .DQ(DQ),
	.TDP(TDP)
        .TR(TR),
	.CLK(CLK)
    );

//*** System clock gen ***
always #`HALF_SYSCLK_PER sysclk = ~sysclk;
//*** Test clock gen ***
always #`HALF_TEST_CLK_PER test_clk = ~test_clk;


////////////////////////////
// Read Test Vector Files //
////////////////////////////


//*** Load Vectors ***
initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/TON_TRAN_DET_tsmc18_scan.sdf",TON_TRAN_DET_test.dut);
`endif
    // open f file
    file = $fopen("etc/TON_TRAN_DET.vec.test.f","r");
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
      rstn = 1'b0;
      @(negedge test_clk);
      rstn = 1'b1;
      fork
        pass_vect;
	check_vect;
      join
      testing = ~testing;
      test_count = test_count + 4'd1;
      $display("** Testing completed. Test count = %d.", test_count);
      status = (test_count == `NUM_TESTS);
    end
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
        A2P <= in_memory1[j];
        YL <= in_memory2[j];
        DQ <= in_memory3[j];       
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
      if ((TR != check1) | (TDP != check2)) begin
        $display("** Vector failed comparison! Output1: %h; Output2: %h; Expected1: %h; Expected2: %h", 
	  TR, TDP, out_memory1[j][14:0], out_memory2[j][14:0]);
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

endmodule
