`timescale 1us/1us // 1MHz = 1us

module piano_mod_tb();

reg clk, rst_x;
reg [11:0] keypad_in;
wire out;

    
piano piano_module(clk, rst_x, keypad_in, out);

initial begin
    clk = 0;
    forever begin
        #0.5 clk <= ~clk;
    end
end

initial begin
    rst_x = 1;
    #0.5 rst_x = 0;
    #0.5 rst_x = 1;
    keypad_in = 12'b0000000000001;
    #4000 keypad_in = 12'b0000000000010;
    #4000 keypad_in = 12'b0000000000100;
    #4000 keypad_in = 12'b0000000001000;
    #4000 keypad_in = 12'b0000000010000;
    #4000 keypad_in = 12'b0000000100000;
    #4000 keypad_in = 12'b0000001000000;
    #4000 keypad_in = 12'b0000010000000;
    #4000 keypad_in = 12'b0000100000000;
    #4000 keypad_in = 12'b0001000000000;
    #4000 keypad_in = 12'b0010000000000;
    #4000 keypad_in = 12'b1000000000000;
end

endmodule