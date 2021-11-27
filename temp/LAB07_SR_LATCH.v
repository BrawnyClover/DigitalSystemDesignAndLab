module LAB07_SR_LATCH(
	S,R,Q,NQ
);

input S,R;
output reg Q,NQ;

always @(S, R) begin
	
	case({S,R})
		2'b00 : begin
			Q <= Q;
			NQ <= NQ;
		end
		2'b01 : begin
			Q <= 0;
			NQ <= 1;
		end
		2'b10 : begin
			Q <= 1;
			NQ <= 0;
		end
		default : begin
			Q <= 0;
			NQ <= 1;
		end
	endcase
end

endmodule