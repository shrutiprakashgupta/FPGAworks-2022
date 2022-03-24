`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////
//Project: sanity_check
//Module: sanity_check
//Description: Turns on a set of LEDs when powered
//Target board: Basys3
////////////////////////////////////////////////////////////////////////////

module sanity_check (clk, flag_led);
	
	input clk;
	output reg [15:0] flag_led;

	always @(posedge clk) begin 
		flag_led <= 16'b1010_1110_0010_0000;
	end

endmodule