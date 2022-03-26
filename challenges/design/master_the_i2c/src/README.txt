[*] I2C is one of the simplest serial communication protocols. 
You can find more about it here (https://www.ti.com/lit/an/slva704/slva704.pdf). 
Now the challenge goes as follows:

1. You are given a `top.v` file, which has the I/O declarations for the I2C "master" block. 
2. Along with it is the `sim_main.cpp` file. It's a testbench file for Verilator. 
Verilator is an Open source tool which compiles the testbench to generate an executable. This file can further be used to run the simulation without wasting time in building everytime you make a change in the Verilog design code. 
3. This executable is given, with the name "Vtop".

You need to do the following: 
Write the I2C Finite state machine Verilog code so that the top module works as an I2C master. This master then interacts with the testbench doing the following: 
1. Sending the Slave address and Read (1 bit) in the first cycle. 
2. Unless the slave address is correct, the testbench won't reply back.
3. If the slave address is correct, the testbench will send the 16-bits of flag in next two cycles.
4. You again need to read these flag-bits from (inside) the master.
There you go, you have the flag now!

A little more detail on the I2C protocol here:
It should have the following bit sequence : 
7 bits (for Slave Address) + 1 bit (for Read(1)/Write(0)) + (1 bit) (Acknowledge bit (always 1))
8 bits (for Data) + (1 bit) (Acknowledge bit (always 1))

