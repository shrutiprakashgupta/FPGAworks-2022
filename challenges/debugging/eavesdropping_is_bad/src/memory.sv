module memory #(parameter  ADDR = 10, DATA=8) (intf.memory_if mif);

integer i;
parameter mem_size = 1<<ADDR;
reg [31:0] memory_1k32 [mem_size];

wire active;
  
assign mif.pready = 1'b1;
// For periferals which guarentee transfer in 2 cycles, pready can be tied high
assign active = mif.penable & mif.pready;

always @(posedge mif.pclk) begin

    if(mif.preset_n == 1'b0) begin
        mif.prdata <= 0;
        for(i=0; i<mem_size; i=i+1) begin
          //memory_1k32[i] <= '{32{0}};
          memory_1k32[i] <= i;
        end
      //FPGAworks{t4e_am6a_apb_f1a9}
      memory_1k32[26*4] <= 70;
      memory_1k32[27*4] <= 80;
      memory_1k32[28*4] <= 71;
      memory_1k32[29*4] <= 65;
      memory_1k32[30*4] <= 119;
      memory_1k32[31*4] <= 111;
      memory_1k32[32*4] <= 114;
      memory_1k32[33*4] <= 107;
      memory_1k32[34*4] <= 115;
      memory_1k32[35*4] <= 123;
      memory_1k32[36*4] <= 116;
      memory_1k32[37*4] <= 52;
      memory_1k32[38*4] <= 101;
      memory_1k32[39*4] <= 95;
      memory_1k32[40*4] <= 97;
      memory_1k32[41*4] <= 109;
      memory_1k32[42*4] <= 54;
      memory_1k32[43*4] <= 97;
      memory_1k32[44*4] <= 95;
      memory_1k32[45*4] <= 97;
      memory_1k32[46*4] <= 112;
      memory_1k32[47*4] <= 98;
      memory_1k32[48*4] <= 95;
      memory_1k32[49*4] <= 102;
      memory_1k32[50*4] <= 49;
      memory_1k32[51*4] <= 97;
      memory_1k32[52*4] <= 103;
      memory_1k32[53*4] <= 125;
    end    
    else begin
        if(mif.psel == 1'b1) begin
            if(active == 1'b1) begin
                if (mif.pwrite == 1'b1) begin
                  for(i=0; i<DATA; i=i+1) begin
                    memory_1k32[mif.paddr][i] <= mif.pwdata[i];
                  end
                  $display("[%0t] Write: ADDR: %d, DATA: %d",$time(),mif.paddr,memory_1k32[mif.paddr]);
                end
                else begin
                  for(i=0; i<DATA; i=i+1) begin
                    mif.prdata[i] <= memory_1k32[mif.paddr][i];
                  end
                end
            end
        end
    end
end

endmodule