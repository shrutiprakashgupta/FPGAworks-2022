#include <verilated.h> 
#include <iostream> 
#include "Vtop.h" 

Vtop *top; // Instantiation of model
vluint64_t main_time = 0; // Current simulation time

double sc_time_stamp() { 
    return main_time; 
}

int main(int argc, char** argv) {
	
    Verilated::commandArgs(argc, argv); 
    top = new Vtop; // Create model

    // Setting inputs to the default values initially
    top->sys_clk = 0;
    top->sys_rst = 1;
    top->sda_slave = 0x0; 

    // Defining variables to be used in testbench
    // For testbench FSM
    int state = 0; 
    int read = 0;
    // For storing signal values (originally in Hex) in Decimal (or int type variable)
    int sda;
    int sda_old = 1;
    int scl_old = 0;
    // For storing Slave id and Verifying the connection 
    int id = 0;
    int connection_detected = 0;
    // Flag data  
    int data[18] = {flag_bits_here_padded_with_1s_for_the_acknowledgment_bit} 
    int data_sent = 0;
    int data_counter = 0;

    while(connection_detected == 0) {
    	top->eval(); // Evaluate model
    	if (main_time >= 15) {
    	    top->sys_rst = 0; // Deassert reset after first 15 time units (Note: Reset is active high)
    	}
    	if ((main_time % 10) == 0) {
    	    top->sys_clk = 0; // Toggle clock
    	}
    	if ((main_time % 10) == 5) {
    	    top->sys_clk = 1;
    	}
        if(top->sys_rst == 0x0) {
            if (state == 0) {
                if ((top->scl == 0x1) & (sda_old == 0x1) & (top->sda == 0x0)) {
                    state = 1; //Start bit detected
                }
            } else {
                if (top->scl == 0x0) {
                    read = 1;
                } else {
                    if (read == 1) {
                        sda = top->sda; // SDA bit read
                        id = (id*2) + sda;
                        read = 0;
                        std::cout << "Time : " << main_time << " Id : " << id << " Detected : " << connection_detected << std::endl;
                    }
                }
            }
            sda_old = top->sda;
        }
    	main_time++; // Time passes...
        if (id == 407) {    //Corresponding to 7 bit slave adderess + 1 bit for Read/Write + 1 Acknowledgment bit
            std::cout << "Correct" << std::endl;
            connection_detected = 1;
            //Now slave is validated for transaction, and the flag will be sent 
        }
    }

    // Sending the flag
    while(data_sent == 0){
	    if ((main_time % 10) == 0) {
	        top->sys_clk = 0; // Toggle clock
	    }
	    if ((main_time % 10) == 5) {
	        top->sys_clk = 1;
	    }
        if(top->sys_rst == 0) {
            if(top->scl == 0x0) {
                top->sda_slave = data[data_counter]; //send each bit of flag
            } else {
                if(scl_old == 0) {
                    data_counter++;
                }
            }
            scl_old = top->scl;
            top->eval();
            main_time++;
            if(data_counter == 18) { // Each part of flag is 8 bit + 1 acknowledgment bit for each part
                data_sent = 1;
            }
        }
    }
    top->final(); // Done simulating
    delete top;
}
