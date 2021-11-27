`timescale 10ns/1ns

module adder_subtractor_tb();

reg [3:0] A;
reg [3:0] B;
reg m;

wire V;
wire [3:0] S;

adder_subtractor adsu(A, B, m, S, V);

initial begin
	A = 4'b1010;
	B = 4'b0101;
	m = 1'b1;
	#1 m = 1'b0;
	#1 
	m = 1'b1;
	A = 4'b1011;
	B = 4'b0111;
	#1 m = 1'b0;
end
endmodule