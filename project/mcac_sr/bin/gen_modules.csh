#!/bin/csh -f

set root = /home/mai/work/rit/ee720/cproj/mcac
set template_dir = ${root}/template/module
set mod_list = ${root}/etc/MODULES.txt 

set MOD = arb

set modules = (`cat ${mod_list}`)
set srcs = (src/${MOD}_test.v src/${MOD}_vec_test.v src/${MOD}.v)
set cons = ( \
			cons/${MOD}_clocks_all_cons.tcl \
			cons/${MOD}_clocks_cons.tcl \
			cons/${MOD}_cons_defaults.tcl \
			cons/${MOD}_cons.tcl \
)
set etcs = (etc/${MOD}.gate.f etc/${MOD}.rtl.f etc/${MOD}.vec.gate.f etc/${MOD}.vec.rtl.f)

foreach module (${modules})
	echo -n ${module}

	cd ${root}

	if (! -d ${module}) then
		mkdir ${module}
		cd ${module}
		(cd ${template_dir} ; tar cpf - .) | tar xpf -

		foreach src (${srcs})
			set file = `echo ${src} | sed -e "s/${MOD}/${module}/"`
			mv ${src} ${file}
		end
		foreach con (${cons})
			set file = `echo ${con} | sed -e "s/${MOD}/${module}/"`
			mv ${con} ${file}
		end
		foreach etc (${etcs})
			set file = `echo ${etc} | sed -e "s/${MOD}/${module}/"`
			mv ${etc} ${file}
		end
		foreach file (`find . -type f -print`)
			perl -p -i -e "s/${MOD}/${module}/g" $file
		end
		echo " done."
	else
		echo " already exists."
	endif
end
