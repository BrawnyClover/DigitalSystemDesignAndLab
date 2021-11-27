`timescale 10ns/1ps
module mux_2to1_tb();

reg inp1, inp2, sel, err;
wire out, ans;
integer i, j, k;

mux_2to1 m1(inp1, inp2, sel, out);

assign ans = sel ? inp2 : inp1;

initial begin
	err <= 1'b0;
	for(i=0; i<2; i = i+1) begin
		sel <= i[0];
		for(j=0; j<2; j = j+1) begin
			inp1 <= j[0];
			for(k=0; k<2; k = k+1) begin
				inp2 <= k[0];
				#5 $display("sel : %1b, out : %1b", sel, out);
				if(ans != out) err<=1'b1;
			end
		end
	end
end
endmodule

