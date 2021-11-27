module BCD_adder_1dgt(
	inp1, inp2, cin, res, cout
);

input [3:0] inp1;
input [3:0] inp2;
input cin;

output wire [3:0] res;
output cout;

wire [3:0] fa1_s;
wire [3:0] fa2_inp;
wire fa1_cout;
wire c_ignore;
wire w1, w2, c_out;

full_adder_4 fa1(inp1, inp2, cin, fa1_s, fa1_cout);
full_adder_4 fa2(fa1_s, fa2_inp, 0, res, c_ignore);

assign w1 = fa1_s[3]&fa1_s[2];
assign w2 = fa1_s[3]&fa1_s[1];
assign c_out = fa1_cout | w1 | w2;
assign fa2_inp = {1'b0,c_out,c_out,1'b0};
assign cout = c_out;

endmodule