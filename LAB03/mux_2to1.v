module mux_2to1(
	inp1, inp2, sel, out
);
	input wire [3:0] inp1;
	input wire [3:0]	inp2;
	input	wire sel;
	output wire [3:0] out;
	
	wire [3:0] w1;
	wire [3:0] w2;
	
	assign w1[0] = inp1[0]&(!sel);
	assign w1[1] = inp1[1]&(!sel);
	assign w1[2] = inp1[2]&(!sel);
	assign w1[3] = inp1[3]&(!sel);
	
	assign w2[0] = inp2[0]&(sel);
	assign w2[1] = inp2[1]&(sel);
	assign w2[2] = inp2[2]&(sel);
	assign w2[3] = inp2[3]&(sel);
	
	assign out[0] = w1[0]|w2[0];
	assign out[1] = w1[1]|w2[1];
	assign out[2] = w1[2]|w2[2];
	assign out[3] = w1[3]|w2[3];
	
	
endmodule