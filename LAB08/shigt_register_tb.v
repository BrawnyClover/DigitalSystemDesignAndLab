`timescale 10ns/1ns

module shift_register_tb();

reg clk;
reg rst_x;
reg [2:0] set;
reg [3:0] mode;
wire [7:0] data_out;

shift_register sr(clk, rst_x, set, mode, data_out);

initial begin
	clk = 1'b1;
	forever begin
			#0.5 clk = ~clk;
	end
end

initial begin
	rst_x = 1'b0;
	#1
	rst_x = 1'b1;
	#1
	set = 3'b101;
	mode = 4'b0001;
	#1
	mode = 4'b0010;
	#5
	mode = 4'b0100;
	#5
	mode = 4'b1000;
end
endmodule

		