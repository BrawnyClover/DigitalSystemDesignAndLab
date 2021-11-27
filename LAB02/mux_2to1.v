module mux_2to1(
	inp1, inp2, sel, out
);
	input inp1, inp2, sel;
	output out;
	reg out;
	
	always @(inp1 or inp2 or sel)begin
		case(sel)
			0 : out = inp1;
			1 : out = inp2;
			default : out = inp1;
		endcase
	end
endmodule