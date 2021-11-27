`timescale 10ns/1ns;

module seq_blknonblk_tb();

reg clk, a, b, c, d, e;
wire blk_y, non_y;

seq_blk s_blk(clk, a, b, c, d, e, blk_y);
seq_nonblk s_non(clk, a, b, c, d, e, non_y);

initial begin
	#0
	clk = 1'b0;
	clk = ~clk;
	forever
		#1 clk = ~clk;
end

initial begin
	#0 a=1'b0; b=1'b0; c=1'b0; d=1'b0; e=1'b0;
	
	// m=0 n=0 e=0
	#2 a=1'b0; b=1'b0; c=1'b0; d=1'b0; e=1'b0;
	
	// m=1 n=0 e=0
	#2 a=1'b1; b=1'b1; c=1'b0; d=1'b0; e=1'b0;
	
	// m=0 n=1 e=0
	#2 a=1'b0; b=1'b0; c=1'b1; d=1'b0; e=1'b0;
	
	// m=0 n=0 e=1
	#2 a=1'b0; b=1'b0; c=1'b0; d=1'b0; e=1'b1;
	
	// m=1 n=0 e=1
	#2 a=1'b1; b=1'b1; c=1'b0; d=1'b0; e=1'b1;
	
	// m=1 n=1 e=0
	#2 a=1'b1; b=1'b1; c=1'b1; d=1'b0; e=1'b0;
	
	// m=1 n=1 e=1
	#2 a=1'b1; b=1'b1; c=1'b1; d=1'b0; e=1'b1;
end
endmodule