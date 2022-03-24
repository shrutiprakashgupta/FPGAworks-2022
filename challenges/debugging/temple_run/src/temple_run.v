`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 04:04:23 PM
// Design Name: 
// Module Name: temple_run
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

module temple_run(clk, rst, path_right, path_centre, path_left);
	input clk;
	input rst;
	output reg [1:0] path_right;
	output reg [1:0] path_centre;
	output reg [1:0] path_left;

    reg valid_clk;
    
    wire [2:0] move;
	reg [9:0] points;
	reg [15:0] flag;

	reg [4:0] get_coins0;
	reg [4:0] get_coins1;
	reg [4:0] get_obst0;
	reg [4:0] get_obst1;
	wire get_coins_new0 = get_coins0[3] ^ get_coins0[0] ^ 1;
	wire get_coins_new1 = get_coins1[3] ^ get_coins1[0] ^ 1;
	wire get_obst_new0 = get_obst0[3] ^ get_obst0[2] ^ get_obst0[1] ^ get_obst0[0] ^ 1;
	wire get_obst_new1 = get_obst0[3] ^ get_obst0[2] ^ get_obst1[1] ^ get_obst1[0] ^ 1;

	wire [1:0] coin_pos = {get_coins_new1, get_coins_new0};
	wire [1:0] obst_pos = {get_coins_new1 ^ get_obst_new1, get_coins_new0 ^ get_obst_new0};

	wire [1:0] path_taken = (move[2]) ? path_right : (move[1] ? path_centre : path_left);  

    ila_1 ila_debugger (.clk(clk), .probe0(valid_clk), .probe1(path_right), .probe2(path_centre), .probe3(path_left), .probe4(points), .probe5(flag), .probe6(move));
    vio_0 vio_debugger (.clk(clk), .probe_in0(valid_clk), .probe_in1(path_right), .probe_in2(path_centre), .probe_in3(path_left), .probe_in4(points), .probe_in5(flag), .probe_out0(move));

    always @(posedge clk) begin
        if(rst) begin
            valid_clk <= 1'b1;
        end else begin
            if(valid_clk == 1'b0) begin
                valid_clk <= 1'b1;
            end else begin
                if(path_right > path_centre) begin
                    if(path_right > path_left) begin
                        if(move == 3'b100) begin
                            valid_clk <= 1'b0;
                        end
                    end else begin
                        if(move == 3'b001) begin
                            valid_clk <= 1'b0;
                        end
                    end
                end else begin
                    if(path_centre > path_left) begin
                        if(move == 3'b010) begin
                            valid_clk <= 1'b0;
                        end
                    end else begin
                        if(move == 3'b001) begin
                            valid_clk <= 1'b0;
                        end
                    end
                end
            end
        end
    end

	always @(posedge valid_clk) begin
		if(rst) begin
			path_right <= 2'd0;
		end else begin
			if(coin_pos == 2'd1) begin
				path_right <= `coin;
			end else begin
				if(obst_pos == 2'd1) begin
					path_right <= `obst;
				end else begin
					path_right <= `clear;
				end
			end
		end
	end

	always @(posedge valid_clk) begin
		if(rst) begin
			path_centre <= 2'd0;
		end else begin
			if(coin_pos == 2'd2) begin
				path_centre <= `coin;
			end else begin
				if(obst_pos == 2'd2) begin
					path_centre <= `obst;
				end else begin
					path_centre <= `clear;
				end
			end
		end
	end

	always @(posedge valid_clk) begin
		if(rst) begin
			path_left <= 2'd0;
		end else begin
			if(coin_pos == 2'd3) begin
				path_left <= `coin;
			end else begin
				if(obst_pos == 2'd3) begin
					path_left <= `obst;
				end else begin
					path_left <= `clear;
				end
			end
		end
	end

	always @(posedge valid_clk) begin
		if(rst) begin
			get_coins0 <= 5'b11101;
			get_coins1 <= 5'b10101;
			get_obst0 <= 5'b10001;
			get_obst1 <= 5'b01101;
			points <= 10'd0;
		end else begin
			get_coins0 <= {get_coins_new0, get_coins0[4:1]};
			get_coins1 <= {get_coins_new1, get_coins1[4:1]};
			get_obst0 <= {get_obst_new0, get_obst0[4:1]};
			get_obst1 <= {get_obst_new1, get_obst1[4:1]};
			points <= points + 10'd1;
		end
	end

	always @(posedge valid_clk) begin
	   if(rst) begin
	       flag <= 16'b0000_0000_0000_0000;
	   end else begin
           if(points >= 10'd1000) begin
                flag <= 16'b1001_0111_0001_1001;
           end else begin
                flag <= 16'b0000_0000_0000_0000;
           end
	   end
	end
endmodule
