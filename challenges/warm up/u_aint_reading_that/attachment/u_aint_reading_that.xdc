## This file is a general .xdc for the Basys3 rev B board

# Clock signal
set_property PACKAGE_PIN W5 [get_ports i_Clock]
set_property IOSTANDARD LVCMOS33 [get_ports i_Clock]
create_clock -period 10.000 -name i_Clock -waveform {0.000 5.000} -add [get_ports i_Clock]

#USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports i_RX_Serial]
set_property IOSTANDARD LVCMOS33 [get_ports i_RX_Serial]
set_property PACKAGE_PIN A18 [get_ports o_TX_Serial]
set_property IOSTANDARD LVCMOS33 [get_ports o_TX_Serial]
#Transmitter with reference to the computer

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
