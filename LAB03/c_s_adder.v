module c_s_adder(
	inp1, inp2, c_in, s_out, c_out
);

input [7:0] inp1;
input [7:0] inp2;
input c_in;
output wire [7:0] s_out;
output wire c_out;

wire c_3to0;
wire c_7to4_0, c_7to4_1;
wire [3:0] s_0;
wire [3:0] s_1;

full_adder_4 fa1(inp1[3:0], inp2[3:0], c_in, s_out[3:0], c_3to0);
full_adder_4 fa2(inp1[7:4], inp2[7:4], 0, s_0[3:0], c_7to4_0);
full_adder_4 fa3(inp1[7:4], inp2[7:4], 1, s_1[3:0], c_7to4_1);

mux_2to1 mux_c(c_7to4_0, c_7to4_1, c_3to0, c_out);
mux_2to1 mux_s(s_0[3:0], s_1[3:0], c_3to0, s_out[7:4]);

endmodule