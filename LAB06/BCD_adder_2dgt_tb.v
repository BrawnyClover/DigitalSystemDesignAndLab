`timescale 10ns/1ns;

module BCD_adder_2dgt_tb();

reg [7:0] inp1;
reg [7:0] inp2;
reg cin;
wire cout;
wire [7:0] sum;

BCD_adder_2dgt ba2(inp1, inp2, cin, sum, cout);

initial begin
	#0
	inp1 = 8'b00000000; // 0
	inp2 = 8'b00000000; // 0
	cin = 1'b0;
	#10
	inp1 = 8'b00000100; // 4
	inp2 = 8'b00000011; // 3
	cin = 1'b0;
	#10
	inp1 = 8'b00000110; // 6
	inp2 = 8'b00001000; // 8
	cin = 1'b0;
	#10
	inp1 = 8'b00010101; // 15
	inp2 = 8'b00110000; // 30
	cin = 1'b0;
	#10
	inp1 = 8'b01110010; // 72
	inp2 = 8'b01000101; // 45
	cin = 1'b0;
	#10
	inp1 = 8'b10011001; // 99
	inp2 = 8'b10011001; // 99
	cin = 1'b0;
	end
endmodule