refresh_hw_vio [get_hw_vios {hw_vio_1}]
for {set i 0} {$i < 1000} {incr i} {
	set clk_val [get_property INPUT_VALUE [get_hw_probes valid_clk -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]]
	set path_right_val [get_property INPUT_VALUE [get_hw_probes path_right_OBUF -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]]
	# puts "Right "
	# puts $path_right_val
	set path_centre_val [get_property INPUT_VALUE [get_hw_probes path_centre_OBUF -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]]
	# puts "Centre "
	# puts $path_centre_val
	set path_left_val [get_property INPUT_VALUE [get_hw_probes path_left_OBUF -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]]
	# puts "Left "
	# puts $path_left_val
	if {$path_right_val > $path_centre_val} {
		if {$path_right_val > $path_left_val} {
			set move_val 4
		} else {
			set move_val 1
		}
	} else {
		if {$path_centre_val > $path_left_val} {
			set move_val 2
		} else {
			set move_val 1
		}
	}
	set_property OUTPUT_VALUE $move_val [get_hw_probes move -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]
	commit_hw_vio [get_hw_probes {move} -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]
	# puts "Move "
	# puts $move_val
	refresh_hw_vio [get_hw_vios {hw_vio_1}]
	set flag_val [get_property INPUT_VALUE [get_hw_probes flag -of_objects [get_hw_vios -of_objects [get_hw_devices xc7a35t_0] -filter {CELL_NAME=~"vio_debugger"}]]]
	if {$flag_val != 0x0000} {
		puts "Flag" 
		puts $flag_val
	}
}
