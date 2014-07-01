#
# read verilog source files for mcac
#
set all_modules [list \
"TON_TRAN_DET" \
"../TONE/src/TONE" \
"../TRIGB/src/TRIGB" \
"../DELAY/src/DELAY" \
"../TRANS/src/TRANS" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
