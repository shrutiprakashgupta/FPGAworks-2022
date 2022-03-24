`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 05:06:24 PM
// Design Name: 
// Module Name: tb_temple_run
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define clear 2'b01
`define coin  2'b10
`define obst  2'b00

function bit [2:0] decide_move(input bit [1:0] path_right, input bit [1:0] path_centre, input bit [1:0] path_left);
	if(path_right > path_centre) begin
		if(path_right > path_left) begin
			decide_move = 3'b100; 
		end else begin
			decide_move = 3'b001;
		end
	end else begin
		if(path_centre > path_left) begin
			decide_move = 3'b010;
		end else begin
			decide_move = 3'b001;
		end
	end
endfunction

module tb_temple_run();
	reg clk;
	reg rst;
	reg [2:0] move;
	wire [1:0] path_right;
	wire [1:0] path_centre;
	wire [1:0] path_left;

	always #5 clk <= ~clk;

	temple_run uut (.clk(clk), .rst(rst), .move(move), .path_right(path_right), .path_centre(path_centre), .path_left(path_left));

	initial begin
		clk <= 1'b0;
		rst <= 1'b1;
		move <= decide_move(path_right, path_centre, path_left);
		#15;
		rst <= 1'b0;
		move <= decide_move(path_right, path_centre, path_left);
		#5;
		repeat(20) begin
			#5;
			move <= decide_move(path_right, path_centre, path_left);
			#5;
		end
		$finish();
	end
endmodule