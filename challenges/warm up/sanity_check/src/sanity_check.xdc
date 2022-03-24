## This file is a .xdc for the Basys3 rev B board

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name clk -period 10.00 -waveform {0 5} [get_ports clk]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {flag_led[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {flag_led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[1]}]
set_property PACKAGE_PIN U19 [get_ports {flag_led[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[2]}]
set_property PACKAGE_PIN V19 [get_ports {flag_led[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[3]}]
set_property PACKAGE_PIN W18 [get_ports {flag_led[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[4]}]
set_property PACKAGE_PIN U15 [get_ports {flag_led[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[5]}]
set_property PACKAGE_PIN U14 [get_ports {flag_led[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[6]}]
set_property PACKAGE_PIN V14 [get_ports {flag_led[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[7]}]
set_property PACKAGE_PIN V13 [get_ports {flag_led[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[8]}]
set_property PACKAGE_PIN V3 [get_ports {flag_led[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[9]}]
set_property PACKAGE_PIN W3 [get_ports {flag_led[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[10]}]
set_property PACKAGE_PIN U3 [get_ports {flag_led[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[11]}]
set_property PACKAGE_PIN P3 [get_ports {flag_led[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[12]}]
set_property PACKAGE_PIN N3 [get_ports {flag_led[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[13]}]
set_property PACKAGE_PIN P1 [get_ports {flag_led[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[14]}]
set_property PACKAGE_PIN L1 [get_ports {flag_led[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {flag_led[15]}]