module seq_blk(clk, a, b, c, d, e, y);

input clk, a, b, c, d, e;
output y;
reg m, n, y;

always @ (posedge clk) begin
	m = ~(a&b);
	n = c|d;
	y = ~(m|n|e);
end
endmodule

module seq_nonblk(clk, a, b, c, d, e, y);

input clk, a, b, c, d, e;
output y;
reg m, n, y;

always @ (posedge clk) begin
	m <= ~(a&b);
	n <= c|d;
	y <= ~(m|n|e);
end
endmodule