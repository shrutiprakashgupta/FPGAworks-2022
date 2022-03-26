`define IDLE 2'b00
`define START 2'b01
`define DATA_W 2'b10
`define DATA_R 2'b11
`define SLAVE_ADDR 7'b1100101

module top (sys_clk, sys_rst, scl, sda, sda_slave);

    input sys_clk;
    input sys_rst;
    output reg scl;
    output reg sda;
    input sda_slave;

    reg [7:0] i2c_data;
    reg [3:0] i2c_data_cntr;
    reg [1:0] i2c_state;
    /* verilator lint_off UNUSED */
    wire [3:0] i2c_data_index;
    /* verilator lint_on UNUSED */
    
    assign i2c_data_index = 4'd7 - i2c_data_cntr;

    always @(posedge sys_clk) begin
    	if (sys_rst) begin
    	    scl <= 1'b1;
    	    sda <= 1'b1;
    	end else begin
            case (i2c_state) 
                `IDLE : begin
                    i2c_state <= `START;
                    scl <= 1'b1;
                    sda <= 1'b0;
                    i2c_data <= {`SLAVE_ADDR, 1'b1};
                    i2c_data_cntr <= 4'd0;
                end
                `START : begin
                    scl <= 1'b0;
                    i2c_state <= `DATA_W;
                end
                `DATA_W : begin
                    if (i2c_data_cntr != 4'd7) begin
                        if (scl == 1'b0) begin
                            sda <= i2c_data[i2c_data_index[2:0]];
                            scl <= 1'b1;
                        end else begin
                            scl <= 1'b0;
                            i2c_data_cntr <= i2c_data_cntr + 4'd1;
                        end
                    end else begin
                        if (scl == 1'b0) begin
                            sda <= 1'b1;
                            scl <= 1'b1;
                        end else begin
                            scl <= 1'b0;
                            i2c_data_cntr <= 4'd0;
                            i2c_state <= `DATA_R;
                        end
                    end
                end
                `DATA_R : begin
                    if (i2c_data_cntr != 4'd8) begin
                        if (scl == 1'b0) begin
                            scl <= 1'b1;
                        end else begin
                            scl <= 1'b0;
                            i2c_data[i2c_data_index[2:0]] <= sda_slave;
                            i2c_data_cntr <= i2c_data_cntr + 4'd1;
                        end
                    end else begin
                        if (scl == 1'b0) begin
                            sda <= 1'b1;
                            scl <= 1'b1;
                            $display("%b", i2c_data);
                        end else begin
                            scl <= 1'b0;
                            i2c_data_cntr <= 4'd0;
                        end
                    end
                end
                default : begin 
                    i2c_state <= `IDLE; 
                    scl <= 1'b1;
                    sda <= 1'b1;
                    i2c_data <= {`SLAVE_ADDR, 1'b1};
                    i2c_data_cntr <= 4'd0;
                end 
            endcase
    	end
    end
endmodule
