`timescale 100ps/1ps //시간 단위 0.1ns, 해상도 1ps

module tb();
    reg clk;
    initial forever #(5) clk <= ~clk; //0.5ns마다 clk 반전(주기 1ns)
    initial begin
        clk <= 1; //초기 clk 1 할당
    end

    reg rst;
    reg [11:0]keypad_in;
    wire [6:0]seg_display;
    wire [7:0]array_en;

    TOP D1(rst, clk, keypad_in, seg_display, array_en);

    initial begin
        rst <= 0;
        #10
        rst <= 1;
        #10

        keypad_in <= 12'b000000000010; //press 2
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b100000000000; //press #
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b001000000000; //press 0
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b100000000000; //press #
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b001000000000; //press 0
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b100000000000; //press #
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b000000000001; //press 1
        #100
        keypad_in <= 0; //key up
        #100
        keypad_in <= 12'b010000000000; //press *
        #100
        keypad_in <= 0; //key up
    end
endmodule