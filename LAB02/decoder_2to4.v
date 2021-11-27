module decoder_2to4(
	en, inp, out
);

input en;
input [1:0] inp;
output [3:0] out;
reg [3:0] out;



always @ (*) begin
	
	if(en == 1'b0)begin
		out <= 4'b0000;
		$display("2to4 en : %1b, inp : %2b, out : %4b", en, inp, out);
	end
	else begin
		if(inp == 2'b00) begin
			out <= 4'b0001;
			$display("2to4 en : %1b, inp : %2b, out : %4b", en, inp, out);
			end
		else if(inp == 2'b01) begin
			out <= 4'b0010;
			$display("2to4 en : %1b, inp : %2b, out : %4b", en, inp, out);
		end
		else if(inp == 2'b10) begin
			out <= 4'b0100;
			$display("2to4 en : %1b, inp : %2b, out : %4b", en, inp, out);
		end
		else begin
			out <= 4'b1000;
			$display("2to4 en : %1b, inp : %2b, out : %4b", en, inp, out);
		end
	end

end
endmodule
