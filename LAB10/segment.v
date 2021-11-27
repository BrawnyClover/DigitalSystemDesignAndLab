module segment(
	i_clk,
    i_reset_n,
	i_binary,
	SEG_COM, 
    SEG_DATA
);

input           i_clk, i_reset_n;
input  [7:0]    i_binary;
output [7:0]    SEG_COM;
output [6:0]    SEG_DATA;


wire [6:0] segment_100, segment_10, segment_1;
wire [9:0] bcd;

reg [3:0] freq_count;
reg       freq_count_3_reg;  
reg [3:0] binary_count;


binary_to_BCD u1(i_binary, bcd);

BCD_to_7segment u2_1(bcd[3:0],	segment_1); // 1의 자리
BCD_to_7segment u2_2(bcd[7:4],	segment_10); //10의 자리
BCD_to_7segment u2_3({1'b0,1'b0,bcd[9:8]},	segment_100); //100의 자리

SevenSeg_CTRL u3(i_clk, i_reset_n, segment_1,segment_10,segment_100, 0,0,0,0,0, SEG_COM, SEG_DATA);

endmodule