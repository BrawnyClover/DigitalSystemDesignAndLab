module random_generator(clk, out);

input clk;
output reg [31:0] out;

integer cnt;

initial cnt = 0;

always @ (posedge clk) begin
    cnt = cnt + 1;
    if(cnt == 50) cnt = 0;
    out = cnt;
end
endmodule