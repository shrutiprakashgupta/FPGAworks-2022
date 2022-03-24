# Description

Eavesdropping is the act of secretly listening to a private conversation, without their consent in order to gather information. We are trying to do something similar with a Master-Slave system running on an FPGA. A little snapshot of their conversation is procured and as the slave had the flag, it's most probably hidden in there. Can you find it?
# Hint

Worth 40 points

VCD or Verilog Core Dump file contains the signal values from a simulation waveform. You can analyze this file with the help of GTKwave, which is an open source waveform viewer tool.</br>
The flag was originally stored in the memory block. So try to track the transactions where memory block is sending its data (i.e. driver is reading data) out. Then search for the characters known from the flag format, i.e. FPGAworks{} in consecutive memory locations. 
# Points

180
