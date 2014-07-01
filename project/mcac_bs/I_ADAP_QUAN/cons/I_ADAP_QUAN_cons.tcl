
current_design $design_name

#/* 10k gates in tsmc 0.18 */

#
# apply constraints
#

#
# clock constraints must already be defined
#

set hfo_nets [list "clk" "reset" "scan_enable" "test_mode"]

foreach_in_collection this_cell [find design -hierarchy] {
  current_design $this_cell
  foreach hfo_net $hfo_nets {
    foreach_in_collection this_port [find net $hfo_net] {
      set_ideal_network [list $this_port]
    }
    foreach_in_collection this_port [find port $hfo_net] {
      set_dont_touch_network [list $this_port]
    }
  }
}

current_design $design_name
set_false_path -from [list reset scan_enable]
set_driving_cell  -lib_cell DFFX1  -pin Q -library typical [list [remove_from_collection [all_inputs] [list clk reset scan_enable]]]
set_input_delay $INPUT_DELAY -clock clk [list [remove_from_collection [all_inputs] [list clk reset scan_enable]]]
set_input_delay 0 -clock clk [list clk reset scan_enable]
set_output_delay $OUTPUT_DELAY -clock clk [list [all_outputs]]
set_max_delay -from clk -to [list [all_outputs]] $OUTPUT_DELAY
set my_load [load_of typical/DFFX1/D]
set my_load [expr $my_load * $LOAD_MULT]
set_load $my_load [list [all_outputs]]

current_design $design_name

