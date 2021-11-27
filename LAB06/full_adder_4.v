module full_adder_1(
	inp1, inp2, cin, s, cout
);
	input inp1, inp2, cin;
	output s, cout;
	wire w1, w2, w3, w4, w5;

	assign w1 = inp1^inp2;
	assign w2 = w1^cin;
	assign w3 = cin&w1;
	assign w4 = inp1&inp2;
	assign w5 = w4|w3;

	assign s = w2;
	assign cout = w5;

endmodule

module full_adder_4(
	inp1, inp2, c_in, s_out, c_out
);

	input wire [4:0] inp1;
	input wire [4:0] inp2;
	input wire c_in;
	output [4:0] s_out;
	output c_out;
	wire c1, c2, c3;
	
	full_adder_1 fa1(inp1[0], inp2[0], c_in, s_out[0], c1);
	full_adder_1 fa2(inp1[1], inp2[1], c1, s_out[1], c2);
	full_adder_1 fa3(inp1[2], inp2[2], c2, s_out[2], c3);
	full_adder_1 fa4(inp1[3], inp2[3], c3, s_out[3], c_out);
	
endmodule

