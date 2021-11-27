`timescale 1ns/1ns
module temp_tb();

reg [6:0] inp1;
wire [6:0] out1;

temp tmp(inp1, out1);

initial begin
inp1 = 0;
#10 
inp1 = 6'b000000;
#10
inp1 = 6'b000001;
end

endmodule