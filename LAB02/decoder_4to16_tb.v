`timescale 10ns/1ns

module decoder_4to16_tb();

reg en;
reg [3:0] inp;
wire [15:0] out;
integer i, j, k, l, m;


decoder_4to16 d4to16(en, inp, out);

initial begin
	for(i=0; i<2; i = i+1) begin
		en<= i[0];
		for(j=0; j<2; j = j+1) begin
			for(k=0; k<2; k = k+1) begin
				for(l=0; l<2; l = l+1) begin
					for(m=0; m<2; m = m+1) begin
							$display("start tb");
							inp<={j[0], k[0], l[0], m[0]};
							#10 $display("tb en : %1b, inp : %4b, %1b, %1b, %1b, %1b, %1b", en, inp, i, j, k, l, m);
					end
				end
			end
		end
	end
end
endmodule