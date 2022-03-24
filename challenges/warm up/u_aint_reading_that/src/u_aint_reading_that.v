`timescale 1ns / 1ps

module u_aint_reading_that #(parameter CLKS_PER_BIT = 868)
    (
        input i_Clock,
        input i_RX_Serial,
        output o_TX_Serial
    );
 
 localparam prompt_size = 15;
 localparam prompt_data = "Press f key: \r\n";
 localparam flag_size = 19;
 localparam flag_data = "7he_us6_uart_f10g\r\n";

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
 reg  [data_size*8-1:0] data;
 
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
                if(recv_chr == "f") begin
					data[(data_size*8)-1:flag_pad] <= flag_data;
					counter_max <= flag_size;
                end
                else begin
					data[(data_size*8)-1:prompt_pad] <= prompt_data;
					counter_max <= prompt_size;
                end
            end
            default : begin
                state <= SHOW;
                tx_begin <= 1'b0;
                tx_data <= 8'd0;
				recv_chr <= 8'd0;
				counter <= counter_size*{1'd0};		
				data[(data_size*8)-1:prompt_pad] <= prompt_data;
				counter_max <= prompt_size;
            end
        endcase
    end

endmodule
