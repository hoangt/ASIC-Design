#
# read verilog source files for mcac
#
set all_modules [list \
"dec" \
"IN_REG" \
"../ACCUM/src/ACCUM" \
"../ADAP_PRED_REC_SIG/src/ADAP_PRED_REC_SIG" \
"../ADAP_SPED_CTL/src/ADAP_SPED_CTL" \
"../ADDA/src/ADDA" \
"../ADDB/src/ADDB" \
"../ADDC/src/ADDC" \
"../ANTILOG/src/ANTILOG" \
"../COMPRESS/src/COMPRESS" \
"../CU/src/CU" \
"../DELAY/src/DELAY" \
"../DELAYPREDIC/src/DELAYPREDIC" \
"../EXPAND/src/EXPAND" \
"../FILTA/src/FILTA" \
"../FILTB/src/FILTB" \
"../FILTC/src/FILTC" \
"../FILTD/src/FILTD" \
"../FILTE/src/FILTE" \
"../FLOATA/src/FLOATA" \
"../FLOATB/src/FLOATB" \
"../FMULT/src/FMULT" \
"../FMULT_ACCUM/src/FMULT_ACCUM" \
"../FUNCTF/src/FUNCTF" \
"../FUNCTW/src/FUNCTW" \
"../I_ADAP_QUAN/src/I_ADAP_QUAN" \
"../IG711/src/IG711" \
"../G711/src/G711" \
"../LIMA/src/LIMA" \
"../LIMB/src/LIMB" \
"../LIMC/src/LIMC" \
"../LIMD/src/LIMD" \
"../LOG/src/LOG" \
"../MIX/src/MIX" \
"../OUT_PCM/src/OUT_PCM" \
"../QUAN_SCAL_FAC_ADAP/src/QUAN_SCAL_FAC_ADAP" \
"../RECONST/src/RECONST" \
"../SUBTA/src/SUBTA" \
"../SUBTB/src/SUBTB" \
"../SUBTC/src/SUBTC" \
"../SYNC/src/SYNC" \
"../TONE/src/TONE" \
"../TON_TRAN_DET/src/TON_TRAN_DET" \
"../TRANS/src/TRANS" \
"../TRIGA/src/TRIGA" \
"../TRIGB/src/TRIGB" \
"../UPA1/src/UPA1" \
"../UPA2/src/UPA2" \
"../UPB/src/UPB" \
"../XORA/src/XORA" \
"../CLOCK_GEN/src/CLOCK_GEN" \
"../RF/src/RF" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
