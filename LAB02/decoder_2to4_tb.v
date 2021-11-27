`timescale 10ns/1ns

module decoder_2to4_tb();

reg en;
reg [1:0] inp;
wire [3:0] out;

decoder_2to4 d2to4(en, inp, out);

initial begin

	en<=1'b0; inp<=2'b00;
	#10 inp<=2'b01;
	#10 inp<=2'b10;
	#10 inp<=2'b11; $display("en : %1b done", en);
	
	#10 en<=1'b1; inp<=2'b00;
	#10 inp<=2'b01;
	#10 inp<=2'b10;
	#10 inp<=2'b11; $display("en : %1b done", en);
	
end
endmodule