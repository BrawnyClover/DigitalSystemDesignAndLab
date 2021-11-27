`timescale 10ns/1ns;
module latch_blknonblk_tb();

reg en, a, b, c;
wire blk_y, non_y;

latch_blk l_blk(en, a, b, c, blk_y);
latch_nonblk l_non(en, a, b, c, non_y);

initial begin
#0 a = 1'b0; b = 1'b0; c = 1'b1; en = 1'b1;

// m change, enabled
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b1;
// m change, disabled
#1 a = 1'b0; b = 1'b0; c = 1'b1; en = 1'b0;
// m not change, enabled
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b1;

// m change, enabled
#1 a = 1'b0; b = 1'b0; c = 1'b1; en = 1'b1;
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b1;
// m change, disabled
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b0;
// m not change, enabled
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b1;

// m change, enabled
#1 a = 1'b0; b = 1'b0; c = 1'b1; en = 1'b1;
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b1;
// m change, disabled
#1 a = 1'b0; b = 1'b0; c = 1'b1; en = 1'b0;
#1 a = 1'b0; b = 1'b0; c = 1'b1; en = 1'b0;
// m not change, enabled
#1 a = 1'b1; b = 1'b0; c = 1'b1; en = 1'b1;
	
end
endmodule