module latch_blk(en, a, b, c, y);

input en, a, b, c;
output y;
reg m, y;

always @(en or a or b or c) begin
	if(en) begin
		m = ~(a|b);
		y = ~(m&c);
	end
end
endmodule

module latch_nonblk(en, a, b, c, y);

input en, a, b, c;
output y;
reg m, y;

always @(en or a or b or c) begin
	if(en) begin
		m <= ~(a|b);
		y <= ~(m&c);
	end
end
endmodule