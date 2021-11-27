`timescale 1ns/1ns

module full_adder_1(
	inp1, inp2, cin, s, cout
);
	
initial begin
	#1 $display("delay");
	#1 $display("occurs");
end
	input inp1, inp2, cin;
	output s, cout;
	wire w1, w2, w3, w4, w5;

	assign w1 = inp1^inp2;
	assign w2 = w1^cin;
	assign w3 = cin&w1;
	assign w4 = inp1&inp2;
	assign w5 = w4|w3;

	assign s = w2;
	assign cout = w5;

endmodule