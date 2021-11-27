`timescale 1ns/10ps

module segment_tb;


reg         i_clk, i_reset_n;
reg [7:0]   i_binary;

wire [7:0]  SEG_COM;
wire [6:0]  SEG_DATA;

segment u_segment(
    .i_clk      (i_clk),
    .i_reset_n  (i_reset_n),
    .i_binary   (i_binary),
    .SEG_COM    (SEG_COM),
    .SEG_DATA   (SEG_DATA)
);


initial
begin
    i_clk = 1'b0;
    forever #1 i_clk = ~i_clk;
end

initial
begin
    i_reset_n = 1'b1;
    #4 i_reset_n = 1'b0;
end

integer i;
initial
begin
    i_binary <= 8'b01011111;
    #2
    for (i=1; i<10; i=i+1) begin
        #16 i_binary <= i_binary + 1'b1;
    end
end

endmodule