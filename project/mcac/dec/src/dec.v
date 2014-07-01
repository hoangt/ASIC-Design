
module dec (
           reset,
           clk,
           scan_in0,
           scan_en,
           scan_out0
       );

input
    reset,                      // system reset
    clk;                        // system clock

input
    scan_in0,                   // test scan mode data input
    scan_en;                    // test scan mode enable

output
    scan_out0;                  // test scan mode data output


endmodule // dec
