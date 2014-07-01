/* IG711_vec_test.v
*
* Module: test
*
* Authors: 
* Matt Pendel
*
* Description:
* Generic vector test bench.
* Pulls all vector tests from file ./etc/IG711.vec.test.f
* Number of input and outputs are hardcoded into tb.
* Room for improvement: 
* Make the ordering of the in/out assignments
* more elegant. Right now, the f file has to be ordered the same way
* as the module is instantiated. Also, the different widths of the
* module ports cause issue, so they are explictly defined/selected.
*
* Revision History:
* _Rev #_	_Author(s)_	_Date_		_Changes_
* 1.00		Sheenam		??		Module Created.
* 1.10		Matt Pendel	3/30/2014	Prettied-up the code.
*						Rewrote a few blocks for
*						simplicity.
*/

////////////////////////////////////
//Module instantiation
module IG711 (LAW, is, imag, inv
           
       );
///////////////////////////////////
//Input initialization
input LAW , is;             
input [12:0] imag;
 
////////////////////////////////////
//Output initialization
output [7:0] inv;

////////////////////////////////////
//Wire and reg initialization
reg [6:0] ymag;
reg [7:0] temp;
wire [12:0] mag;

assign inv = temp;
assign mag = LAW ? 
	      imag : 
	      ((imag >= 13'h1FdF) ? 13'h1fff : imag + 12'd33);

always @(mag or LAW) begin
  case (LAW) 
  //aLaw
    1'b1:
      casez(mag)		
	13'b?0000000????? :ymag = {3'b000,mag[4:1]}; 
	13'b?0000001????? :ymag = {3'b001,mag[4:1]};
	13'b?000001?????? :ymag = {3'b010,mag[5:2]};
	13'b?00001??????? :ymag = {3'b011,mag[6:3]};
	13'b?0001???????? :ymag = {3'b100,mag[7:4]};
	13'b?001????????? :ymag = {3'b101,mag[8:5]};
	13'b?01?????????? :ymag = {3'b110,mag[9:6]};
	13'b?1??????????? :ymag = {3'b111,mag[10:7]};
	default		:  ymag = 8'd0;
      endcase
  //uLaw
    1'b0:
      casez(mag)		
	13'b00000001????? :ymag = {3'b000,mag[4:1]};
	13'b0000001?????? :ymag = {3'b001,mag[5:2]};
	13'b000001??????? :ymag = {3'b010,mag[6:3]};
	13'b00001???????? :ymag = {3'b011,mag[7:4]};
	13'b0001????????? :ymag = {3'b100,mag[8:5]};
	13'b001?????????? :ymag = {3'b101,mag[9:6]};
	13'b01??????????? :ymag = {3'b110,mag[10:7]};
	13'b1???????????? :ymag = {3'b111,mag[11:8]};
	default		:  ymag = 8'd0;
      endcase
  endcase
end

always @ (is or LAW or ymag) begin
  if (LAW)
    temp = {is, ymag} ^ 8'hd5;
  else
    temp = {is, ymag} ^ 8'hff;
end

endmodule // IG711

