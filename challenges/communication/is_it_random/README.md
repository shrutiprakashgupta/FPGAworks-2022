# Description

We have found a bit file which seems to be generating gibbrish. It's output is just random combination of 1s and 0s. But we are sure that there is an underlying pattern, cause the numbers repeat!

Can you find the logic? 
# Hint

## Hint 1 
You can read the output at the serial terminal, with baud rate 460830. 

FPGAs commonly use random number generators which produce a large sequence of bits which seem to be random but are actually deterministic, given that initial state is known. Let the underlying RNG here be XYZ with the terms in characteristic polynomial (also known as taps) being a, b and c. Then the flag has the form FPGAworks{XYZ[a,b,c]}.
## Hint 2

The most common form of Pseudo random number generators implemented on hardware are LFSRs. For every N-bits LFSR, there are some special combination of taps, with which the N-bit LFSR is capable of generating a sequence of 2^N-1 samples (before repeating). The standard initial state in such cases is all N-bits initialized with 1s.

Hint for 40 points.
# Points

160
