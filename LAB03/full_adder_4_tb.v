`timescale 10ns/1ns

module full_adder_4_tb();

	reg [3:0] inp1;
	reg [3:0] inp2;
	reg c_in;
	wire [3:0] s_out;
	wire c_out;
	
	full_adder_4 fa4(inp1, inp2, c_in, s_out, c_out);
	
	initial begin
		inp1 = 4'b1111; inp2 = 4'b1111; c_in = 1'b0;
		#10 inp1 = 4'b1110; inp2 = 4'b1101;
		#10 inp1 = 4'b0111; inp2 = 4'b1011;
		#10 inp1 = 4'b0011; inp2 = 4'b0101;
	end
endmodule
		