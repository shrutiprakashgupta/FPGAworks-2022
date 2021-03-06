## This file is a general .xdc for the Basys3 rev B board

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name clk -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {status[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[0]}]
set_property PACKAGE_PIN V16 [get_ports {status[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[1]}]
set_property PACKAGE_PIN W16 [get_ports {status[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[2]}]
set_property PACKAGE_PIN W17 [get_ports {status[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[3]}]
set_property PACKAGE_PIN W15 [get_ports {status[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[4]}]
set_property PACKAGE_PIN V15 [get_ports {status[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[5]}]
set_property PACKAGE_PIN W14 [get_ports {status[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[6]}]
set_property PACKAGE_PIN W13 [get_ports {status[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[7]}]
set_property PACKAGE_PIN V2 [get_ports {status[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[8]}]
set_property PACKAGE_PIN T3 [get_ports {status[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[9]}]
set_property PACKAGE_PIN T2 [get_ports {status[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[10]}]
set_property PACKAGE_PIN R3 [get_ports {status[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[11]}]
set_property PACKAGE_PIN W2 [get_ports {status[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[12]}]
set_property PACKAGE_PIN U1 [get_ports {status[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[13]}]
set_property PACKAGE_PIN T1 [get_ports {status[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[14]}]
set_property PACKAGE_PIN R2 [get_ports {status[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {status[15]}]
 

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
	
	
##Buttons
set_property PACKAGE_PIN U18 [get_ports rst]						
	set_property IOSTANDARD LVCMOS33 [get_ports rst]
