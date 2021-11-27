`timescale 10ns/1ns

module FSM_Maschine_tb();

reg i;
reg rst;
reg clk;

wire [3:0] o;

FSM_Maschine fsmm(i, rst, clk, o);

initial begin
	clk <= 1;
	forever begin
		#0.5 clk = ~clk;
	end
end


initial begin
	i = 0; rst = 1;
	#0.5 rst = 0;
	#0.5 rst = 1;
	forever begin
		#1 i = ~i;
	end
end
endmodule