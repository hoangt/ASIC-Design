#
# read verilog source files for mcac
#
set all_modules [list \
"IN_PCM" \
"../EXPAND/src/EXPAND"\
"../SUBTA/src/SUBTB"\
"../G711/src/G711"\
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
