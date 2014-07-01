
module test;

wire  scan_out0;

reg  clk, reset;
reg  scan_in0, scan_en;

EXPAND top(
      //  .reset(reset),
      //  .clk(clk),
      //  .scan_in0(scan_in0),
      //  .scan_en(scan_en),
     //   .scan_out0(scan_out0)
	.SIN(S),
	.LAW(LAW),
	.SOUT(SL)
    );

reg  [13:0] S;
reg         LAW;
wire [13:0] SL;
wire [13:0] SL_test;
integer i,j;


wire [13:0]


initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/EXPAND_tsmc18_scan.sdf", test.top);
`endif
   // clk = 1'b0;
   // reset = 1'b0;
  //  scan_in0 = 1'b0;
  //  scan_en = 1'b0;
    i = 0;	
    while(i<10)
	begin 
	   i = i + 1;
	   j = i;
	  #1 S <= $random(i)%(14'h3FFF); 
	   i = j;
	   LAW <= ~LAW;	
	end
    $finish;
end

assign SSS = LAW?SS[12]:SS[13];
assign SSM = SS;
assign SSQ = LAW?SSM[13:1]:SS;
assign SL_test = SSS?(15'd16384-SSQ): SSQ;
/*
always(SL_test or SL)
begin
	if(SL_test == SL)
		begin	
		 $display("EXPAND : For S = %b and Y = %b test is successful ",S,Y); 
		end
	   else
		begin
		 $display("EXPAND : test Failed For S = %b and Y = %b ",S,Y); 
		 $stop;
		end
end*/

endmodule
