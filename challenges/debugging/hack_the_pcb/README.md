# Description

A circuit designer writes an RTL code in the beginning, which is further synthesized. This step converts the code into a set of logic gates, connecting several pins and wires, generating the required behaviour. The output from this step is a netlist, which we are providing here. Our original code was implementing a lock, i.e. it had "key" as its input, and it's one specific value unlocked the lock.</br>

But we have forgotten the key, because we had to make this problem. Can you find it?
# Hint

There are separate keys for each bit of the unlock signal. The FLAG simply consists of ASCII characters represented by the **8-bit keys** corresponding to each bit of the unlock signal.

# Hint 2 
Worth 40 

A SAT solver is an algorithm for establishing satisfiability. In simple words, you can say that inputs 1 to 10 pass through some logic gate to generate output signal. And if the gates are known, the SAT solver can find a combination of 10 input bits which would generate a 1 at the output signal.
# Points

160
