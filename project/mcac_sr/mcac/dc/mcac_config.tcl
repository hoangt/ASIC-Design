#
# read verilog source files for mcac
#
set all_modules [list \
"accum_stat" \
"alu_32" \
"mult_32" \
"execute_i" \
"decode_i" \
"data_bus_mach" \
"port_bus_mach" \
"prog_bus_mach" \
"tdsp_core_glue" \
"tdsp_core_mach" \
"arb" \
"digit_reg" \
"data_sample_mux" \
"dma" \
"results_conv" \
"spi" \
"tdsp_core" \
"tdsp_data_mux" \
"tdsp_ds_cs" \
"test_control" \
"ulaw_lin_conv" \
"ram_128x16_test" \
"ram_256x16_test" \
"rom_512x16_0" \
"rom_512x16_1" \
"dtmf_recvr_core" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
