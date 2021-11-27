module mux(
	in1, in2, sel, out
);
input in1, in2, sel;
output reg out;

always @(in1, in2, sel) begin
	case(sel)
		1'b0: out = in1;
		1'b1: out = in2;
	endcase
end

endmodule
	


module csa(
	A, B, Cin, S, V
);

input [3:0] A;
input [3:0] B;
input Cin;
output wire [3:0] S;
output wire V;

wire c1, c2, c3, c4, c5, c6;
wire s1, s2, s3, s4;
wire mo1, mo2;

full_adder f1(A[0], B[0], Cin, S[0], c1);
full_adder f2(A[1], B[1], c1, S[1], c2);

full_adder f3(A[2], B[2], 0, s1, c3);
full_adder f4(A[3], B[3], c3, s2, c4);

full_adder f5(A[2], B[2], 1, s3, c5);
full_adder f6(A[3], B[3], c5, s4, c6);

mux m1(c3, c5, c2, mo1);
mux m2(s1, s3, c2, S[2]);
mux m3(s2, s4, c2, S[3]);
mux m4(c4, c6, c2, mo2);

assign V = mo1^mo2;

endmodule