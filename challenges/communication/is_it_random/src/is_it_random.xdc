## This file is a general .xdc for the Basys3 rev B board

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk]

#USB-RS232 Interface
set_property PACKAGE_PIN A18 [get_ports o_tx_serial]
set_property IOSTANDARD LVCMOS33 [get_ports o_tx_serial]
#Transmitter with reference to the computer

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
