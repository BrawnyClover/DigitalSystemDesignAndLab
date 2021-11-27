module complement_1s(
	in, m, out
);

input [3:0] in;
input m;
output [3:0] out;

assign out[0] = in[0]+m;
assign out[1] = in[1]+m;
assign out[2] = in[2]+m;
assign out[3] = in[3]+m;

endmodule