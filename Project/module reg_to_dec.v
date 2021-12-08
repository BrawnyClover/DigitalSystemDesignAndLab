module reg_to_dec(
    seg_0, seg_1, dec_out
);

input [7:0] seg_0;
input [7:0] seg_1;

output reg [31:0] dec_out;

integer ten, one;

always @ (seg_0 or seg_1) begin
    case(seg_0)
        7'b0110000 : ten = 1;
        7'b1101101 : ten = 2;
        7'b1111001 : ten = 3;
        7'b0110011 : ten = 4;
        7'b1011011 : ten = 5;
        7'b1011111 : ten = 6;
        7'b1110010 : ten = 7;
        7'b1111111 : ten = 8;
        7'b1111011 : ten = 9;
        7'b1111110 : ten = 0;
        default : ten = 0;
    endcase
    case(seg_1)
        7'b0110000 : one = 1;
        7'b1101101 : one = 2;
        7'b1111001 : one = 3;
        7'b0110011 : one = 4;
        7'b1011011 : one = 5;
        7'b1011111 : one = 6;
        7'b1110010 : one = 7;
        7'b1111111 : one = 8;
        7'b1111011 : one = 9;
        7'b1111110 : one = 0;
        default : one = 0;
    endcase
    dec_out = ten*10+one;
end
endmodule