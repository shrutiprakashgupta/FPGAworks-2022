module switch_it_on (clk, switch, flag_led, flag_enable);
	
	input clk;
	input [3:0] switch;
	output reg [6:0] flag_led;
	output reg [3:0] flag_enable;

    reg [17:0] counter;
    reg [8:0]  step;

    initial begin
        counter <= 18'd0;
        step <= 3'd0;
    end
        
	always @(posedge clk) begin
	   if(counter < 18'd160000) begin
	       counter <= counter + 18'd1;
	   end else begin
	       counter <= 18'd0;
	       step <= step + 3'd1;
	   end
	end
	
	always @(*) begin
	   if(switch == 4'b0110) begin
           if(step[8]) begin
               case(step[1:0])
                   2'b00: begin
                       flag_led <= 7'b1111_001;    //1
                       flag_enable <= 4'b1110;
                   end
                   2'b01: begin
                       flag_led <= 7'b0000_000;    //8
                       flag_enable <= 4'b1101;
                   end
                   2'b10: begin
                       flag_led <= 7'b0000_010;    //6
                       flag_enable <= 4'b1011;
                   end
                   2'b11: begin
                       flag_led <= 7'b0110_000;    //3
                       flag_enable <= 4'b0111;
                   end
               endcase
           end else begin
               case(step[1:0])
                   2'b00: begin
                       flag_led <= 7'b0100_100;    //2
                       flag_enable <= 4'b1110;
                   end
                   2'b01: begin
                       flag_led <= 7'b1111_000;    //7
                       flag_enable <= 4'b1101;
                   end
                   2'b10: begin
                       flag_led <= 7'b1111_001;    //1
                       flag_enable <= 4'b1011;
                   end
                   2'b11: begin
                       flag_led <= 7'b0010_000;    //9
                       flag_enable <= 4'b0111;
                   end
               endcase
           end
        end else begin
            flag_led <= 7'b1111_111;
            flag_enable <= 4'b1111;
        end  
	end
	
endmodule 