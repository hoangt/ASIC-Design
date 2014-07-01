#!/bin/csh -f

# check if any arguments are passed, and at least 2 arguments are passed
#
if (( $#argv == 0 ) || ( $#argv < 2 )) then
  echo "USAGE : $0 -mod <module name> [-help]"
  echo "        -help     : print this message"
  exit
endif

set HELP = 0 ;

set i = 1 ;

#
# collect arguments
#
while ( $i <= $#argv )
  switch ( ${argv[${i}]} )
    case "-mod":
      @ i = $i + 1 ;
      set module = $argv[${i}] ;
      breaksw
    case "-help":
      set HELP = 1 ;
      breaksw
    default:
      breaksw
  endsw
  @ i = $i + 1 ;
end

#
# check if path was set
#
if (! $?module) then
  echo "USAGE : $0 -mod <module name> [-help]"
  echo "        -help     : print this message"
  exit
endif

echo "module == $module"

set root = /home/mai/work/rit/ee720/cproj/mcac_bs
set template_dir = ${root}/template/hier_module

set MOD = EXPAND

set modules = ( ${module} )
set srcs = (src/${MOD}_test.v src/${MOD}_vec_test.v src/${MOD}.v)
set dcs = (dc/${MOD}_config.tcl)
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
		foreach dc (${dcs})
			set file = `echo ${dc} | sed -e "s/${MOD}/${module}/"`
			mv ${dc} ${file}
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
