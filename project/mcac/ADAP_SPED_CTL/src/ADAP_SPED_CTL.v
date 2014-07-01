
module ADAP_SPED_CTL (
           I,
           RATE,
           F,
       );

input
    [4:0] I;                      // 5 bit //FUNCTF
input 
    [1:0] RATE;			////2 bit signal determining rate, 11 corresponds to 16kBits/s, 10 to 24, etc.	


output
    
                 
reg [2:0] FI; // 3 bit signed magnitude output of F(I)//FUNCTF


//CODE

FUNCTF func (
.RATE(RATE),
.I(I),
.FI(FI)
);

endmodule // ADAP_SPED_CTL
