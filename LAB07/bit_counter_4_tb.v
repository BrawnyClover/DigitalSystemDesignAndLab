`timescale 10ns/1ns

module bit_counter_4_tb();

reg rst;
reg clk;
reg en;
wire cout;
wire [3:0] cnt;

bit_counter_4 bc4(clk, en, rst, cnt, cout);

initial begin
	en = 1'b1;
	clk = 1'b1;
	rst = 1'b0;
	forever begin
		#0.5
		clk = ~clk;
	end
end

initial begin
	#1 rst = 1'b1;
	#3 en = 1'b0;
	#3 en = 1'b1;
	#10.75 rst = 1'b0;
	#0.5 rst = 1'b1;
	
	end
endmodule