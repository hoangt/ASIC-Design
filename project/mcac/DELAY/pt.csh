#!/bin/csh -f

set scr = time_scan 
pt_shell < pt/${scr}.tcl |& tee pt_shell_${scr}.log
