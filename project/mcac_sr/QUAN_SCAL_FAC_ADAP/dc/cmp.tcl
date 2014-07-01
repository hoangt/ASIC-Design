
#
# set design name
#
set design_name QUAN_SCAL_FAC_ADAP

set my_type "_rtl"

set my_max_area 0
#
# compile effort can be: low, medium, high
#
set my_compile_effort "high"

set hdlin_enable_presto false
set hdlin_keep_signal_name all

set bus_naming_style {%s[%d]}
set bus_inference_style {%s[%d]}

#/* connect to all ports in the design, even if driven by the same net */
#/* compile_fix_multiple_port_nets = true */
set_fix_multiple_port_nets -all -buffer_constants

#/* do not allow wire type tri in the netlist */
set verilogout_no_tri true

#/* to fix those pesky escaped names */
#/* to be used with 'change_names -hierarchy' */
#/* after a compile - should only be needed in */
#/* extreme cases when 'bus_naming_style' isn't fully working */
define_name_rules Verilog -allowed {a-z A-Z 0-9 _} -first_restricted {0-9 _} -replacement_char "__" -type cell
define_name_rules Verilog -allowed {a-z A-Z 0-9 _ []} -first_restricted {0-9 _} -replacement_char "__" -type port
define_name_rules Verilog -allowed {a-z A-Z 0-9 _} -first_restricted {0-9 _} -replacement_char "__" -type net
set default_name_rules Verilog

#/* set technology library */

set tsmc18 "/classes/eeee720/maieee/lib/tsmc-0.18/synopsys"
set stdcells5u "../../lib/tech/synopsys"

set search_path [list . [format "%s%s"  $synopsys_root "/libraries/syn"] $tsmc18 ./include ./src]

remove_design -all
file mkdir "./netlist" "./sdf" "./spf" "./report" "./report/dc" "./report/pt"
set report_dir "./report/dc/"

set hdlin_use_cin true
set synlib_model_map_effort "high"
set hdlout_uses_internal_busses true
# Turn on auto wire load selection
# (library must support this feature)
set auto_wire_load_selection true

set tech_lib _tsmc18

set library_name "typical"
set target_library [list typical.db]
set link_library [concat  [concat  "*" $target_library] $synthetic_library]
set synlib_wait_for_design_license "DesignWare"

#
# read source files
#
source "dc/${design_name}_config.tcl"

current_design $design_name

redirect [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { echo [concat [format "%s%s"  {Compile effort is } $my_compile_effort]] }

link

redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { echo [concat {Pre-compile check_design}] }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { check_design }

#
# apply constraints
#
source "cons/${design_name}_cons_defaults.tcl"
source "cons/${design_name}_clocks_cons.tcl"
source "cons/${design_name}_cons.tcl"

set_max_area $my_max_area
set_critical_range 1 [current_design]


redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_fsm }

#
# logic synthesis
#
current_design $design_name
compile -map_effort $my_compile_effort
ungroup -all -flatten
compile -map_effort $my_compile_effort

current_design $design_name
change_names -hierarchy

#
# write reports
#
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { echo [concat {Post-compile check_design}] }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { check_design }

redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_resources }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_area }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_reference }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s" $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_net_fanout -high_fanout }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_clocks }
redirect -append [format "%s%s"  [format "%s%s"  [format "%s%s"  $report_dir $design_name] $tech_lib] "_dc.rpt"] { report_timing -sign 4 -max_paths 10 }

#
# Write Netlist and SDF
#
current_design $design_name
write -hierarchy -format verilog $design_name -output [format "%s%s"  [format "%s%s"  [format "%s%s"  "./netlist/" $design_name] $tech_lib] "${my_type}.vs"]
write_sdf -context verilog [format "%s%s"  [format "%s%s"  [format "%s%s"  "./sdf/" $design_name] $tech_lib] "${my_type}.sdf"]

current_design $design_name
set hier_dir [format "%s%s%s%s%s%s" "./netlist" "/" $design_name $tech_lib ${my_type} "/"]
file mkdir $hier_dir

current_design $design_name
write -format verilog -output [format "%s%s" [format "%s%s" $hier_dir $design_name] ".vs"] $design_name

foreach_in_collection this_cell [find design -hierarchy] {
  current_design $this_cell
  set current_cell [get_attribute [get_designs $this_cell] full_name]
  write -format verilog -output [format "%s%s" [format "%s%s" $hier_dir $current_cell] ".vs"] $current_cell
}


current_design $design_name
