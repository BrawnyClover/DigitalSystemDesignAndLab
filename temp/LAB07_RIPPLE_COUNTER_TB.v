`timescale 10ns/1ns
module LAB07_RIPPLE_COUNTER_TB;

reg clk;
wire Q1, Q2, Q4, Q8;
LAB07_RIPPLE_COUNTER RC0(clk, Q1, Q2, Q4, Q8);

initial begin
clk=1'b0;
end

always #0.5 clk=~clk;

endmodule
