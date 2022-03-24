`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 08:06:48 PM
// Design Name: 
// Module Name: the_third_eye
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

module the_third_eye(clk, key_switch, show_button);
    input clk;
    input [15:0] key_switch;
    input show_button;
    reg [15:0] flag;
    
    wire [15:0] valid_switch;
    reg shown;
    reg shown_prev;
    
    ila_1 debugger (.clk(clk),.probe0(valid_switch),.probe1(shown),.probe2(flag));
    
    assign valid_switch[0] = (key_switch[0] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[1] = (key_switch[1] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[2] = (key_switch[2] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[3] = (key_switch[3] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[4] = (key_switch[4] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[5] = (key_switch[5] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[6] = (key_switch[6] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[7] = (key_switch[7] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[8] = (key_switch[8] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[9] = (key_switch[9] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[10] = (key_switch[10] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[11] = (key_switch[11] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[12] = (key_switch[12] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[13] = (key_switch[13] == 1'b0) ? 1'b1 : 1'b0;
    assign valid_switch[14] = (key_switch[14] == 1'b1) ? 1'b1 : 1'b0;
    assign valid_switch[15] = (key_switch[15] == 1'b1) ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        case (shown)
            1'b0 : begin
                if(show_button) begin
                    shown <= 1'b1;
                end else begin
                    shown <= 1'b0;
                end
            end
            1'b1 : begin
                shown <= 1'b1;
            end
            default : begin
                shown <= 1'b0;
            end
        endcase
        shown_prev <= shown;
    end
    
    always @(posedge clk) begin
        if((!shown_prev)&shown) begin
            if(& valid_switch) begin
                flag <= 16'b1011_0101_0110_1011;
            end else begin
                flag <= 16'b0000_0000_0000_0000;
            end
        end else begin
            flag <= 16'b0000_0000_0000_0000;
        end
    end
endmodule
