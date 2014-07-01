/******FLOAT_TEST*****
*Module:Test

Author: Shiv Sagar Muniraj

*Description
*Test bench for FLOATA

*/
module FLOATA_test;

////////////////////////////
///Wire and Register Instantiations



wire[15:0]DQ0;
reg[15:0]DQ; 
wire LAW;
integer i;
reg[15:0]MANT,EXP,MAG;


////////////////////////////////////
///Module Instantiation

FLOATA top(
   .DQ(DQ0),
   .DQ0(DQ),
    .LAW(LAW)
	);
 

     


////////////////////////////////
////Vector generation

	initial 
		begin
			$timeformat(-9,2,"ns", 16);
			`ifdef SDFSCAN
			$sdf_annotate("sdf/FLOAT_tsmc18_scan.sdf",test.top);
			`endif 

        for(i=0;i<1000;i=i+1)
	begin
	DQ0=$random(i)%16'hFFFF;
	end
	
	

   	#10 $display("**TEST COMPLETE");
	$finish;
	end
//////////////////////////////////////////

//Vaildation

	always @(DQ or DQ0)	
         	begin 
		
	         	if(MAG=>16'h4000)
			   begin 
			     EXP=15;
			     end
		        else if((16'h2000<=MAG)&&(MAG<=16'h3FFF))
			    begin
			   EXP=14;
			     end
	       	        else if(MAG=>16'h2000)
			    begin
			    EXP=14;
			    end
		        else if((16'h1000<=MAG)&&(MAG<=16'h1FFF))
			    begin
			   EXP=13;
			   end
		        else if((16'h0800<=MAG)&&(MAG<=16'h0FFF))
			    begin
			   EXP=12;
			   end
		        else if((16'h0400<=MAG)&&(MAG<=16'h07FF))
			     begin
			     EXP=11;
			     end
		        else if((16'h0200<=MAG)&&(MAG<=16'h03FF))
			     begin
			     EXP=10;
			     end
		        else if((16'h0100<=MAG)&&(MAG<=16'h01FF))
			     begin
			     EXP=9;
			     end
		        else if((16'h0080<=MAG)&&(MAG<=16'h00FF))
			     begin
			     EXP=8;
			     end
		        else if((16'h0040<=MAG)&&(MAG<=16'h007F))
			     begin
			     EXP=7;
			     end
		        else if((16'h0020<=MAG)&&(MAG<=16'h003F))
			     begin
		             EXP=6;
		             end
		        else if((16'h0010<=MAG)&&(MAG<=16'h001F))
		             begin
			     EXP=5;
			     end
		        else if((16'h0008<=MAG)&&(MAG<=16'h000F))
			     begin
			     EXP=4;
			     end
		        else if((16'h0004<=MAG)&&(MAG<=16'h0007))
			     begin
			     EXP=3;
			     end
		        else if((16'h0002<=MAG)&&(MAG<=16'h0003))
			     begin
			     EXP=2;
			     end
		        else if(MAG==16'h0001)
			     begin
			     EXP=1;
			     end
		        else if(MAG==0)
			     begin
			     EXP=0;
			     end
	end		
  		
	always @(DQ or DQ0)
		begin
                   if(MAG==0)
			 begin
		    	MANT="1<<5";
                            end
		     		else
 			 		begin
                            		MANT=(MAG<<6)>>EXP;
				 	end
			  begin
			    	DQ0=(DQS<<10)+(EXP<<6)+MANT;
		end
	end

  		endmodule
