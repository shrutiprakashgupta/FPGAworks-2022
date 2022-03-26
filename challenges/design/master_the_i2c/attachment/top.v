`define IDLE 2'b00
`define START 2'b01
`define DATA_W 2'b10
`define DATA_R 2'b11
`define SLAVE_ADDR 7'b1100101

module top (sys_clk, sys_rst, scl, sda, sda_slave);

    // IO Signals from the top module
    input sys_clk;
    input sys_rst;
    output reg scl;
    output reg sda;
    input sda_slave;

    // State variable for the I2C FSM
    reg [1:0] i2c_state;

    // 8 bit data to be sent or received from the I2C Serial port
    // 3 bit counter (i.e. 0 to 7) for addressing 8 data bits
    reg [7:0] i2c_data;
    reg [2:0] i2c_data_cntr;

    always @(posedge sys_clk) begin
    	if (sys_rst) begin
            // Default status of the SCL and SDA lines is high (while reset it
            // won't matter infact)
    	    scl <= 1'b1;
    	    sda <= 1'b1;
    	end else begin
            case (i2c_state) 
                // I2C FSM
                `IDLE : begin
                end
                `START : begin
                end
                `DATA_W : begin
                end
                `DATA_R : begin
                end
                default : begin 
                end 
            endcase
    	end
    end
endmodule
