# Description

The board is talking to you, infact it's spitting out the flag. If you don't have it already it's probably cause U Ain't Reading That. Once you get the flag, you will realize that *capital letters are significant*.
# Hint

Worth (10 points) </br>

## This file is the .xdc for the Basys3 rev B board

set_property PACKAGE_PIN W5 [get_ports i_Clock] </br>
set_property IOSTANDARD LVCMOS33 [get_ports i_Clock] </br>
create_clock -period 10.000 -name i_Clock -waveform {0.000 5.000} -add [get_ports i_Clock] </br>

\# USB-UART Port configuratio 
set_property PACKAGE_PIN B18 [get_ports i_RX_Serial] </br>
set_property IOSTANDARD LVCMOS33 [get_ports i_RX_Serial] </br>
set_property PACKAGE_PIN A18 [get_ports o_TX_Serial] </br>
set_property IOSTANDARD LVCMOS33 [get_ports o_TX_Serial] </br>

set_property CFGBVS GND [current_design] </br>
set_property CONFIG_VOLTAGE 1.8 [current_design] </br>

## You have unlocked the [Trump Card](https://github.com/shrutiprakashgupta/Basys3-gpio)
# Points

60
