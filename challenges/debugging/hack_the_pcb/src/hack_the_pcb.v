module hack_the_pcb(key, unlock);
    input [7:0] key;
    output [18:0] unlock;

    assign unlock[0] = (key == 8'd83) ? 1'b1 : 1'b0;
    assign unlock[1] = (key == 8'd52) ? 1'b1 : 1'b0;
    assign unlock[2] = (key == 8'd116) ? 1'b1 : 1'b0;
    assign unlock[3] = (key == 8'd95) ? 1'b1 : 1'b0;
    assign unlock[4] = (key == 8'd115) ? 1'b1 : 1'b0;
    assign unlock[5] = (key == 8'd48) ? 1'b1 : 1'b0;
    assign unlock[6] = (key == 8'd49) ? 1'b1 : 1'b0;
    assign unlock[7] = (key == 8'd118) ? 1'b1 : 1'b0;
    assign unlock[8] = (key == 8'd101) ? 1'b1 : 1'b0;
    assign unlock[9] = (key == 8'd82) ? 1'b1 : 1'b0;
    assign unlock[10] = (key == 8'd95) ? 1'b1 : 1'b0;
    assign unlock[11] = (key == 8'd105) ? 1'b1 : 1'b0;
    assign unlock[12] = (key == 8'd53) ? 1'b1 : 1'b0;
    assign unlock[13] = (key == 8'd95) ? 1'b1 : 1'b0;
    assign unlock[14] = (key == 8'd71) ? 1'b1 : 1'b0;
    assign unlock[15] = (key == 8'd114) ? 1'b1 : 1'b0;
    assign unlock[16] = (key == 8'd57) ? 1'b1 : 1'b0;
    assign unlock[17] = (key == 8'd97) ? 1'b1 : 1'b0;
    assign unlock[18] = (key == 8'd55) ? 1'b1 : 1'b0;
endmodule
