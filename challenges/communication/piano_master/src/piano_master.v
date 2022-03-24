`timescale 1ns / 1ps

module piano_master #(parameter CLKS_PER_BIT = 868)
    (
        input i_Clock,
        input i_RX_Serial,
        output o_TX_Serial
    );
 
 localparam prompt_size = 3;
 localparam prompt_data = "A\r\n";
 localparam flag_size = 21;
 localparam flag_data = "Py5er1al_is_aw9s0Me\r\n";

 localparam data_size = (prompt_size > flag_size) ? prompt_size : flag_size;
 localparam prompt_pad = (data_size - prompt_size)*8;
 localparam flag_pad = (data_size - flag_size)*8;
 localparam counter_size = $clog2(data_size);

 wire       rx_done;        
 wire [7:0] rx_data;        
 
 reg        tx_begin;      
 wire       tx_active;     
 wire       tx_done;       
 reg  [7:0] tx_data;      

 reg  [1:0] state;         
 reg  [7:0] recv_chr;
 reg  [counter_size-1:0] counter;
 reg  [counter_size-1:0] counter_max;
 reg  [4:0] note_counter;
 reg  [11:0] streak_counter;
 reg  [data_size*8-1:0] data;
 
 reg  [7:0] prompt_data_old;
 wire [(prompt_size*8)-1:0] prompt_data_wire;
 wire new_bit = note_counter[4] ^ note_counter[2] ^ 1;
 assign prompt_data_wire = {(8'd64+note_counter),"\r\n"};
 
 localparam SHOW = 2'b00;
 localparam ACTV = 2'b01;
 localparam TRNS = 2'b10;
 localparam RECV = 2'b11;
 
 UART_RX #(.CLKS_PER_BIT(CLKS_PER_BIT)) receiver
  (
   .i_Clock(i_Clock),
   .i_RX_Serial(i_RX_Serial),
   .o_RX_DV(rx_done),
   .o_RX_Byte(rx_data)
   );

 UART_TX #(.CLKS_PER_BIT(CLKS_PER_BIT)) transmitter
  (
   .i_Clock(i_Clock),
   .i_TX_DV(tx_begin),
   .i_TX_Byte(tx_data), 
   .o_TX_Active(tx_active),
   .o_TX_Serial(o_TX_Serial),
   .o_TX_Done(tx_done)
   );

always @(posedge i_Clock) begin
        case (state)
            SHOW : begin
                state <= ACTV;
                tx_begin <= 1'b1;
                tx_data <= data[(data_size*8)-1:(data_size*8)-8];
				counter <= counter + 1'd1;     
				data <= data << 8;   
            end
            ACTV: begin         
                tx_begin <= 1'b0;   
                if(tx_begin == 1'b1) begin
                    state <= TRNS;
                end
                else begin
					if(counter <= counter_max) begin
						state <= SHOW;
					end
					else begin
                    	if(rx_done == 1'b1) begin
                        	state <= RECV;
                        	recv_chr <= rx_data;
                    	end
                    	else begin
                        	state <= ACTV;
                    	end
                	end
            	end
            end
            TRNS : begin
                if(tx_done == 1'b1) begin
                    state <= ACTV;
                end
                else begin
                    state <= TRNS;
                end
            end
            RECV : begin
                state <= SHOW;
                tx_begin <= 1'b0;
                tx_data <= 8'd0;
				counter <= counter_size*{1'd0};
                if(recv_chr == prompt_data_old) begin
                    if(streak_counter == 12'b1111_1111_1111) begin
                        data[(data_size*8)-1:flag_pad] <= flag_data;
					    counter_max <= flag_size;
					    note_counter <= 5'b10000;
					    streak_counter <= 4'd0;
                    end
                    else begin
					    data[(data_size*8)-1:prompt_pad] <= prompt_data_wire;
					    counter_max <= prompt_size;
					    note_counter <= {new_bit, note_counter[4:1]};
					    streak_counter <= streak_counter + 12'd1;
					    prompt_data_old <= prompt_data_wire[(prompt_size*8)-1:(prompt_size*8)-8];
                    end
                end
                else begin
                    data[(data_size*8)-1:prompt_pad] <= prompt_data_wire;
					counter_max <= prompt_size;
					note_counter <= 5'b10000;
					streak_counter <= 4'd0;
					prompt_data_old <= prompt_data_wire[(prompt_size*8)-1:(prompt_size*8)-8];
                end
            end
            default : begin
                state <= SHOW;
                tx_begin <= 1'b0;
                tx_data <= 8'd0;
				recv_chr <= 8'd0;
				counter <= counter_size*{1'd0};		
				data[(data_size*8)-1:prompt_pad] <= prompt_data_wire;
				counter_max <= prompt_size;
				note_counter <= 5'b10000;
				streak_counter <= 4'd0;
				prompt_data_old <= prompt_data_wire[(prompt_size*8)-1:(prompt_size*8)-8];
            end
        endcase
    end

endmodule
