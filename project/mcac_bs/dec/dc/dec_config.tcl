set all_modules [list \
"dec" \
"../EXPAND/src/EXPAND" \
"IN_REG" \
"../SUBTA/src/SUBTA" \
"../I_ADAP_QUAN/src/I_ADAP_QUAN" \
"../ADAP_PRED_REC_SIG/src/ADAP_PRED_REC_SIG" \
"../QUAN_SCAL_FAC_ADAP/src/QUAN_SCAL_FAC_ADAP" \
"../ADAP_SPED_CTL/src/ADAP_SPED_CTL" \
"../TON_TRAN_DET/src/TON_TRAN_DET" \
"../ACCUM/src/ACCUM" \
"../ADAP_QUAN/src/ADAP_QUAN" \
"../ADDA/src/ADDA" \
"../ADDB/src/ADDB" \
"../ADDC/src/ADDC" \
"../ANTILOG/src/ANTILOG" \
"../COMPRESS/src/COMPRESS" \
"../CU/src/CU" \
"../DELAY/src/DELAY" \
"../DELAYPREDIC/src/DELAYPREDIC" \
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
"../G711/src/G711" \
"../IG711/src/IG711" \
"../IN_PCM/src/IN_PCM" \
"../LIMA/src/LIMA" \
"../LIMB/src/LIMB" \
"../LIMC/src/LIMC" \
"../LIMD/src/LIMD" \
"../LOG/src/LOG" \
"../MIX/src/MIX" \
"../QUAN/src/QUAN" \
"../RECONST/src/RECONST" \
"../SUBTB/src/SUBTB" \
"../SUBTC/src/SUBTC" \
"../SYNC/src/SYNC" \
"../TONE/src/TONE" \
"../TRANS/src/TRANS" \
"../TRIGA/src/TRIGA" \
"../TRIGB/src/TRIGB" \
"../UPA1/src/UPA1" \
"../UPA2/src/UPA2" \
"../UPB/src/UPB" \
"../XORA/src/XORA" \
"../CLOCK_GEN/src/CLOCK_GEN" \
"../OUT_PCM/src/OUT_PCM" \
"../RF/src/RF" \
]

echo ""
echo "Reading Verilog Source Files"
echo ""

foreach this_module $all_modules {
	read_file -format verilog [list [format "%s%s" $this_module ".v"]]
}
