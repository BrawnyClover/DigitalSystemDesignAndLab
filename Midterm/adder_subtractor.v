module adder_subtractor(
	A, B, m, S, V
);

input [3:0] A;
input [3:0] B;
input m;
output [3:0] S;
output V;

wire [3:0] compB;

complement_1s c1s(B, m, compB);
csa cs(A, compB, m, S, V);

endmodule
 



