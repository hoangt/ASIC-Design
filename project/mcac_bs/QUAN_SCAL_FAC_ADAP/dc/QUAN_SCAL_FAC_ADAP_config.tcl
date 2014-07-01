#
# read verilog source files for mcac
#
set all_modules [list \
"QUAN_SCAL_FAC_ADAP" \
"../FUNCTW/src/FUNCTW" \
"../FILTD/src/FILTD" \
"../LIMB/src/LIMB" \
"../DELAY/src/DELAY" \
"../FILTE/src/FILTE" \
"../MIX/src/MIX" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
