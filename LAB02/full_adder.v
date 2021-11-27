module full_adder(
	inp1, inp2, cin, sum, cout
);

	input inp1, inp2, cin;
	output sum, cout;
	
	wire w1, w2, w3, w4;
	
	xor XOR1(w1, inp1, inp2);
	xor XOR2(sum, cin, w1);
	
	and AND1(w2, w1, cin);
	and AND2(w3, inp1, inp2);
	
	or OR1(cout, w2, w3);
	
endmodule