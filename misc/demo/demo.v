`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2022 08:59:49 PM
// Design Name: 
// Module Name: demo
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


module demo(clk, switch, led);
    input clk;
    input switch;
    output reg led;
    
    always @(posedge clk) begin
        if(switch == 1'b1) begin
            led <= 1'b1;
        end else begin
            led <= 1'b0;
        end
    end
endmodule
