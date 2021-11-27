module clock_divider(
	clk, sel, rst, clks, rclk
);

input clk;
input [1:0] sel;
input rst;
wire cout;

output wire [3:0] clks;
output rclk;

bit_counter_4 bc4(clk, 1'b1, rst, clks, cout);
assign rclk = clks[sel];

endmodule