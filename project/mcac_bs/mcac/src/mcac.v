//The mcac module that calls the enc and dec blocks
//Author - Sadiq Pasha.
//Date 4/18/2014.

module mcac(
	reset,				// reset signal
	rate,				// RATE varable
	clk,				// Sys clk
	law,				// Law variable
	enc_s,				// PCM input word
	enc_i,				// ADPCM output
	enc_s_clk,				// channel clk for DEC
	enc_s_fs,			// Channel Sync for DEC
	enc_i_clk,
	enc_i_fs,
	dec_i,
	dec_s,
	dec_i_clk,
	dec_i_fs,
	dec_s_clk,
	dec_s_fs,
	scan_in0,
	scan_in1,
	scan_in2,
	scan_in3,
	scan_in4,
    	scan_enable,
    	test_mode,
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4
);
//encoder wires

input		reset, law;
input	[1:0]	rate;
input		scan_in0,
		scan_in1,
		scan_in2,
		scan_in3,
		scan_in4,
    		scan_enable,
    		test_mode;
output	
	scan_out0,
	scan_out1,
	scan_out2,
	scan_out3,
	scan_out4;

input	[7:0]	enc_s;
input		enc_s_clk,enc_s_fs, clk;


output	[7:0]	enc_i;    
output    enc_i_clk, enc_i_fs;

//decoder wires

output	[7:0]	dec_s;
output		dec_s_clk,dec_s_fs;

input	[7:0]	dec_i;    // after RF replace I by data_out
input     dec_i_clk, dec_i_fs;
 
//instantiate the encoder

enc mcac_enc (
	.enc_s(enc_s),				// PCM input word
	.reset(reset),				// reset signal
	.rate(rate),				// RATE varable
	.clk(clk),				// Sys clk
	.law(law),				// Law variable
	.enc_i(enc_i),				// ADPCM output
	.enc_s_clk(enc_s_clk),				// channel clk for DEC
	.enc_s_fs(enc_s_fs),			// Channel Sync for DEC
	.enc_i_clk(enc_i_clk),
	.enc_i_fs(enc_i_fs),
	.scan_in0(),
	.scan_in1(),
	.scan_in2(),
	.scan_in3(),
	.scan_in4(),
    	.scan_enable(),
    	.test_mode(test_mode),
	.scan_out0(),
	.scan_out1(),
	.scan_out2(),
	.scan_out3(),
	.scan_out4()
	);

//instantiate the dcoder

dec mcac_dec (
	.dec_s(dec_s),				// PCM output word
	.reset(reset),				// reset signal
	.rate(rate),				// RATE varable
	.clk(clk),				// Sys clk
	.law(law),				// Law variable
	.dec_i(dec_i),				// ADPCM output
	.dec_s_clk(dec_s_clk),				// channel clk for DEC
	.dec_s_fs(dec_s_fs),			// Channel Sync for DEC
	.dec_i_clk(dec_i_clk),
	.dec_i_fs(dec_i_fs), 
    	.test_mode(test_mode),
	.scan_in0(),
	.scan_in1(),
	.scan_in2(),
	.scan_in3(),
	.scan_in4(),
	.scan_out0(),
	.scan_out1(),
	.scan_out2(),
	.scan_out3(),
	.scan_out4(),
	.scan_enable()
	);

endmodule
