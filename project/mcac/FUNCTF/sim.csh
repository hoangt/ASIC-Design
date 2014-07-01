#!/bin/csh -f

set DES = "FUNCTF" ;
set INCA = "./INCA_libs" ;

set RTL = 0 ;
set VEC = 0 ;
set SPI = 0 ;
set NET = 0 ;
set NCSIM = 1 ;
set GUI = 1 ;

set NC = "ncverilog +ncaccess+r +nclinedebug +ncvpicompat+1364v1995 +nowarnTFNPC +nowarnIWFA +nowarnSVTL +nowarnSDFNCAP"
set XL = "verilog +access+r +linedebug +nowarnTFNPC +nowarnIWFA +nowarnSVTL +nowarnSDFA"

set i = 1 ;

#
# collect arguments
#
while ( $i <= $#argv )
  switch ( ${argv[${i}]} )
    case "-r":
      set RTL = 1 ;
      breaksw
    case "-n":
      set NET = 1 ;
      breaksw
    case "-v":
      set VEC = 1 ;
      breaksw
    case "-xl":
      set NCSIM = 0 ;
      breaksw
    case "-ng":
      set GUI = 0 ;
      breaksw
    default:
      breaksw
  endsw
  @ i = $i + 1 ;
end

#
# check if any arguments are passed, and only 1 argument is passed
#
if ((( $RTL == 0 ) && ( $NET == 0 )) || (( $RTL == 1 ) && ( $NET == 1 ))) then
  echo "USAGE : $0 [-r] [-n] [-v] [-ng] [-xl]"
  echo "        -r   : simulate RTL";
  echo "        -n   : simulate scan inserted netlist";
  echo " Note: only pass one of -r or -n";
  echo "        -v   : use vector based testbench";
  echo " Note: Default is to use the behavioral testbench";
  echo "        -ng  : do not start gui";
  echo " Note: Default is to use the GUI";
  echo "        -xl  : simulate using Verilog-XL";
  echo " Note: Default is to use NC Verilog";
  exit
endif

if ( $NCSIM == 1 ) then
  set SIM = "${NC}"
else
  set SIM = "${XL}"
endif

if ( $GUI == 1 ) then
  set RGUI = "+gui"
else
  set RGUI = ""
endif

if ( $VEC == 1 ) then
  set RVEC = ".vec"
else
  set RVEC = ""
endif


\rm -rf ${INCA}

if ( $RTL == 1 ) then

  ${SIM} \
	${RGUI} -s \
	-f etc/${DES}${RVEC}.rtl.f \

endif

if ( $NET == 1 ) then

  ${SIM} \
	${RGUI} -s \
	-f etc/${DES}${RVEC}.gate.f \

endif


