module full_adder(
	A, B, Cin, S, Cout
);

input A, B, Cin;
output wire S, Cout;

wire w1, w2, w3;

assign w1 = A^B;
assign w2 = Cin&w1;
assign w3 = A&B;

assign S = w1^Cin;
assign Cout = w2|w3;

endmodule

