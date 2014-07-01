#
# read verilog source files for mcac
#
set all_modules [list \
"OUT_PCM" \
"../COMPRESS/src/COMPRESS" \
"../EXPAND/src/EXPAND" \
"../SUBTA/src/SUBTA" \
"../LOG/src/LOG" \
"../SUBTB/src/SUBTB" \
"../SYNC/src/SYNC" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
