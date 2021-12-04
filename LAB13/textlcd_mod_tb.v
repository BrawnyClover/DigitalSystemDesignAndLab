`timescale 1ps/1ps

module textlcd_mod_tb();

reg resetn,clk;
wire LCD_E,LCD_RS,LCD_RW;
wire [7:0]LCD_DATA;

textlcd tlcd(resetn,clk,LCD_E,LCD_RS,LCD_RW,LCD_DATA);

initial begin
    clk = 1'b0;
    forever begin
        #0.5 clk = ~clk;
    end
end

initial begin
    resetn = 1;
    #0.5 resetn = 0;
    #0.5 resetn = 1;
end

endmodule