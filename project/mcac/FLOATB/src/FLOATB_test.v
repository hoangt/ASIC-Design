/****FLOATB_test****
*Module:TEST

Author: Shiv Sagar Muniraj

*DESCRIPTION
*TEST BENCH FOR FLOATB
                     */
module FLOATB_test;
////////////////////////////
//Wire and Register Instantiation


wire  SR0_1[15:0] ;

reg  SR_2[15:0] ;
wire LAW;
wire SRS;
wire MAG[14:0];
integer i;
wire EXP[14:0];
wire MANT[8:0];
wire DQ0,DQS[14:0];

/////////////////////////////////
///Module INSTANTIATION 



FLOATB top(
  .SR(SR0_1),
  .SR0(SR_2),
  .LAW(LAW)
    );
/////////////////////////////////
//Vector generation 


initial
begin
    $timeformat(-9,2,"ns", 16);
	`ifdef SDFSCAN
    $sdf_annotate("sdf/FLOATB_tsmc18_scan.sdf", test.top);
	`endif

  for(i=0;i<1000;i=i+1)
	begin
  SR_2=$random(i)% 16'hFFFF;
   end 
   
#10 $display("**TEST COMPLETE");
$finish;
end
/////////////////////////
///Vaildation


	always@(SR0_1 or SR_2)
    

	begin

         if(SRS==1)
  begin  
     assign MAG=(65536-SR_2)&32767;
  end
    	else
  
   begin
    assign MAG=SR;
   end
 
	if(MAG>=16384)
	begin
	EXP=15;
	end
	else if(8192&&MAG&&16383)
 	begin
        EXP=14;
	end
	else if(4096&&MAG&&8191)
	begin
	EXP=13;
	end
	else if(2048&&MAG&&4095)
	begin
	EXP=12;
	end
	else if(1024&&MAG&&2047)
	begin
	EXP=11;
	end
	else if(512&&MAG&&1023)
	begin
	EXP=10;
	end
	else if(256&&MAG&&511)
	begin
	EXP=9;
	end
	else if(128&&MAG&&255)
	begin
	EXP=8;
	end
	else if(64&&MAG&&127)
	begin
	EXP=7;
	end
	else if(32&&MAG&&63)
	begin
	EXP=6;
	end
	else if(16&&MAG&&31)
	begin
	EXP=5;
	end
	else if(8&&MAG&&15)
	begin
	EXP=4;
	end
	else if(4&&MAG&&3)
	begin
	EXP=3;
	end
	else if(2&&MAG&&3)
	begin
	EXP=2;
	end
	else if(MAG==1)
	begin
	EXP=1;
	end
	else if(MAG==0)
	begin
	EXP=0;
	end
      
   if(MAG==0)
	begin
	assign MANT="1<<5";
	end
 	   else
		begin
		    MANT=(MAG<<6)>>EXP;
			end
    
	assign DQ0=(DQS<<10)+(EXP<<6)+MANT;

	
	
     end

endmodule
