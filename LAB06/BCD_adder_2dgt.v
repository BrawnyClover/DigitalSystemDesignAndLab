module BCD_adder_2dgt(
	inp1, inp2, cin, sum, cout
);

input [7:0] inp1;
input [7:0] inp2;
input cin;
output wire [7:0] sum;
output cout;
wire ba1_cout;

BCD_adder_1dgt ba1(inp1[3:0], inp2[3:0], cin, sum[3:0], ba1_cout);
BCD_adder_1dgt ba2(inp1[7:4], inp2[7:4], ba1_cout, sum[7:4], cout);

endmodule;