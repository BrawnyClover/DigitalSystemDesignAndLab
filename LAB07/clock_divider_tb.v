`timescale 10ns/1ns

module clock_divider_tb();

reg [1:0] sel;
reg clk;
reg rst;
wire rclk;
wire Qa, Qb, Qc, Qd;

clock_divider cd(clk, sel, rst, {Qd, Qc, Qb, Qa}, rclk);

initial begin
	clk = 1'b0;
	forever begin
		#0.5 clk = ~clk;
	end
end

initial begin
	sel = 2'b00;
	rst = 1'b0;
	#1 rst = 1'b1;
	#15 sel = 2'b01;
	#15 sel = 2'b10;
	#15 sel = 2'b11;
	end
endmodule