#
# read verilog source files for mcac
#
set all_modules [list \
"ADAP_PRED_REC_SIG" \
"../ADDB/src/ADDB" \
"../ADDC/src/ADDC" \
"../DELAY/src/DELAY" \
"../DELAYPREDIC/src/DELAYPREDIC" \
"../FLOATA/src/FLOATA" \
"../FLOATB/src/FLOATB" \
"../FMULT/src/FMULT" \
"../FMULT_ACCUM/src/FMULT_ACCUM" \
"../LIMC/src/LIMC" \
"../LIMD/src/LIMD" \
"../TRIGB/src/TRIGB" \
"../UPA1/src/UPA1" \
"../UPA2/src/UPA2" \
"../UPB/src/UPB" \
"../XORA/src/XORA" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
