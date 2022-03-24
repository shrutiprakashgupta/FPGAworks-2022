`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name: is_it_random 
// Module Name: is_it_random
// Target Devices: Basys3
// Description: Pseudo random number generator block
//////////////////////////////////////////////////////////////////////////////////

`define INIT 1'b0
`define ACTIVE 1'b1

module is_it_random(clk, o_tx_serial);
    input clk;
    output o_tx_serial;
    
	localparam CLKS_PER_BIT = 217;

	reg tx_begin;
	reg [7:0] tx_data;
	wire tx_active;
	wire tx_done;
	
	reg state;
	reg [10:0] lfsr_bits;
	wire new_bit = lfsr_bits[9] ^ lfsr_bits[6] ^ lfsr_bits[3] ^ lfsr_bits[0] ^ 1;
    
    UART_TX #(.CLKS_PER_BIT(CLKS_PER_BIT)) transmitter
    (
        .i_Clock(clk),
        .i_TX_DV(tx_begin),
        .i_TX_Byte(tx_data), 
        .o_TX_Active(tx_active),
        .o_TX_Serial(o_tx_serial),
        .o_TX_Done(tx_done)
    );

	always @(posedge clk) begin
		case(state)
			`INIT : begin
				if(lfsr_bits[0] == 1'b1) begin
					tx_data <= 8'h30;
				end else begin 
					tx_data <= 8'h31;
				end
				tx_begin <= 1'b1;
				state <= `ACTIVE;
				lfsr_bits <= {new_bit,lfsr_bits[10:1]};
			end
			`ACTIVE : begin
				tx_begin <= 1'b0;
				if(tx_active && (!tx_done)) begin
					state <= `ACTIVE;
				end
				else begin
					state <= `INIT;
				end
			end
			default : begin
				state <= `INIT;
				lfsr_bits <= 11'b1111_1111_111;
			end
		endcase
	end

endmodule