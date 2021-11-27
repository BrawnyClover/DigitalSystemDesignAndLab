`timescale 10ns/1ps

module full_adder_tb;

reg A, B, cin;
wire sum, cout;

full_adder fa(A, B, cin, sum, cout);

initial begin
		A<=0; B<=0; cin<=0;
		#10	A<=0; B<=0; cin<=1;
		#10	A<=0; B<=1; cin<=0;
		#10	A<=0; B<=1; cin<=1;
		#10	A<=1; B<=0; cin<=0;
		#10	A<=1; B<=0; cin<=1;
		#10	A<=1; B<=1; cin<=0;
		#10	A<=1; B<=1; cin<=1;
	end
endmodule
	