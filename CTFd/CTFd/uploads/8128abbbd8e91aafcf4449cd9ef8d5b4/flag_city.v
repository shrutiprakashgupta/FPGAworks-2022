`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: flag_city
// Project Name: flag_city 
// Target Devices: Basys3 
//////////////////////////////////////////////////////////////////////////////////

`define fit 		2'b00
`define attacked 	2'b01
`define hurt 		2'b10
`define no_change 	2'b11

`define idle 		2'b00
`define wander 		2'b01
`define evade 		2'b10
`define first_aid 	2'b11

`define dest 		4'd8

module flag_city(
	
	input clk,
	input rst,
	input [15:0] status,

	output reg [15:0] flag_led
);

	reg [2:0] counter;
	reg [1:0] action;
	reg [3:0] location;
	wire [15:0] curr_status = status << 2*counter; 
	
	always @(posedge clk) begin
		if (!rst) begin
			flag_led = 16'b0000_0000_0000_0000;
		end else begin
			if (location != `dest) begin
				flag_led = 16'b0000_0000_0000_0000;
			end else begin
				flag_led = {flag_here};
			end
		end
	end

	always @(posedge clk )begin
		if(!rst) begin
			counter = 3'b000;
		end else begin
			counter = counter + 3'b001; 
		end
	end

	always @(posedge clk) begin
		action = take_action(rst, curr_status); 
	end

	always @(posedge clk) begin
		if(!rst) begin
			location = 4'd0; 
		end else begin
			case(location)
				4'd0 : begin
					if(action == `evade) begin
						location <= 4'd1; 
					end else begin
						location <= 4'd0; 
					end
				end
				4'd1 : begin
					if(action == `evade) begin
						location <= 4'd2;
					end else begin
						location <= 4'd0; 
					end
				end
				4'd2 : begin
					if(action == `wander) begin
						location <= 4'd3; 
					end else begin
						location <= 4'd0; 
					end
				end
				4'd3 : begin
					if(action == `evade) begin
						location <= 4'd4; 
					end else begin
						location <= 4'd0; 
					end
				end
				4'd4 : begin
					if(action == `first_aid) begin
						location <= 4'd5; 
					end else begin
						location <= 4'd0; 
					end
				end
				4'd5 : begin
					if(action == `wander) begin
						location <= 4'd6; 
					end else begin
						location <= 4'd0; 
					end
				end
				4'd6 : begin
					if(action == `wander) begin
						location <= 4'd7; 
					end else begin
						location <= 4'd0; 
					end
				end
				4'd7 : begin
					if(action == `first_aid) begin
						location <= `dest; 
					end else begin
						location <= 4'd0; 
					end
				end
				`dest : begin
					location <= `dest;
				end
				default : begin
					location <= 4'd0; 
				end
			endcase
		end
	end

	function [1:0] take_action (input rst, [15:0]curr_status);
		if(!rst) begin
			take_action = `idle;
		end else begin
			if(curr_status[15:14] == `fit) 
				take_action = `wander;
			else if (curr_status[15:14] == `attacked)
				take_action = `evade;
			else if (curr_status[15:14] == `hurt)
				take_action = `first_aid;
		end
	endfunction 

endmodule

