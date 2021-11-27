`timescale 10ns/1ns

module c_s_adder_tb();

reg [7:0] inp1;
reg [7:0] inp2;
reg c_in;
wire c_out;
wire [7:0] s_out;


c_s_adder cs_adder(inp1, inp2, c_in, s_out, c_out);

initial begin
	inp1 = 8'b11111111; inp2 = 8'b11111111; c_in = 0;
	#10 inp1 = 8'b11111111; inp2 = 8'b11111111; c_in = 1;
	
	#10 inp1 = 8'b10101010; inp2 = 8'b01010101; c_in = 0;
	#10 inp1 = 8'b10101010; inp2 = 8'b01010101; c_in = 1;
	
	#10 inp1 = 8'b11110000; inp2 = 8'b00001111; c_in = 0;
	#10 inp1 = 8'b11110000; inp2 = 8'b00001111; c_in = 1;
	
	#10 inp1 = 8'b11001100; inp2 = 8'b11110000; c_in = 0;
	#10 inp1 = 8'b11001100; inp2 = 8'b11110000; c_in = 1;
	
	end
endmodule