# Description

Eavesdropping is the act of secretly listening to a private conversation, without their consent in order to gather information. We are trying to do something similar with a Master-Slave system running on an FPGA. Here, the slave is a Memory block and the master is driving read/write transactions to the slave. A little snapshot of their conversation is procured and most probably the flag is hidden in there. Remember the format is FPGAworks{the_flag_here}.
# Hint

Worth 25 points

The flag was originally stored in the memory block. So try to track the transactions where memory block is sending its data (i.e. driver is reading data) out. Then search for the characters known from the flag format, i.e. FPGAworks{} in consecutive memory locations. 
# Points

180
