module decoder_4to16(
	en, inp, out
);

input en;
input [3:0] inp;
output [15:0] out;
reg [15:0] out;
wire [3:0] dec_parent_out;
wire [3:0] dec1_out;
wire [3:0] dec2_out;
wire [3:0] dec3_out;
wire [3:0] dec4_out;

decoder_2to4 dec_parent(en, inp[3:2], dec_parent_out);

decoder_2to4 dec1(dec_parent_out[3], inp[1:0], dec1_out);
decoder_2to4 dec2(dec_parent_out[2], inp[1:0], dec2_out);
decoder_2to4 dec3(dec_parent_out[1], inp[1:0], dec3_out);
decoder_2to4 dec4(dec_parent_out[0], inp[1:0], dec4_out);

//assign out = {dec1_out, dec2_out, dec3_out, dec4_out};
always @(*) begin
	$display("4to16 dpo[3] : %1b, dpo[2] : %1b, dpo[1] : %1b, dpo[0] : %1b", dec_parent_out[3], dec_parent_out[2], dec_parent_out[1], dec_parent_out[0]);
	if(en == 1'b0)begin
		$display("4to16 not enabled en : %1b, inp : %4b", en, inp);
		out <= {16{1'b0}};
	end
	else begin
		$display("4to16 enabled en : %1b, inp : %4b", en, inp);
		out = {dec1_out, dec2_out, dec3_out, dec4_out};
	end
	$display("4to16 dpo[3] : %1b, dpo[2] : %1b, dpo[1] : %1b, dpo[0] : %1b", dec_parent_out[3], dec_parent_out[2], dec_parent_out[1], dec_parent_out[0]);
end
endmodule