# Description

The job of an ASIC designer is to write an RTL code. This is an abstracted language, which means that it does not define the logic in terms of real-world hardware components and connections between them. This is done in the next step, called Synthesis.

This step converts the code into a set of logic gates, connecting several pins and wires, generating the required behaviour. This combination of gates and the connecting wires between them is the netlist, which we are providing here. Our original code was implementing a lock, i.e. it had "key" as its input, the "unlock" signal as its output. A unique key value was specified, which unlocked the lock.</br>

But we have forgotten the key, because we had to make this problem. Can you reverse this IC to find it?
# Hint

The key should have different values for each bit of the unlock signal. The FLAG simply consists of ASCII characters represented by the **8-bit keys** corresponding to each bit of the unlock signal.

# Hint 2 
Worth 40 

A SAT solver is an algorithm for establishing satisfiability. In simple words, you can say that inputs 1 to 10 pass through some logic gate to generate output signal. And if the gates are known, the SAT solver can find a combination of 10 input bits which would generate a 1 at the output signal.
U can surly find some Python library to do this easily.
# Points

160
