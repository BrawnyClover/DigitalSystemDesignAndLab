module shift_register(
	clk, rst_x, set, mode, data_out 
);

input clk, rst_x;
input [2:0] set;
input [3:0] mode;
output reg [7:0] data_out;

always @ (posedge clk, negedge rst_x) begin
	if(rst_x == 0) data_out <= 8'b00000000;
	else begin
		case(mode)
			4'b0001: begin
				case(set)
					3'b000: data_out <= 8'b00000001;
					3'b001: data_out <= 8'b00000010;
					3'b010: data_out <= 8'b00000100;
					3'b011: data_out <= 8'b00001000;
					3'b100: data_out <= 8'b00010000;
					3'b101: data_out <= 8'b00100000;
					3'b110: data_out <= 8'b01000000;
					3'b111: data_out <= 8'b10000000;
					endcase
			end
			4'b0010: data_out <= {data_out[6:0], data_out[7]};
			4'b0100: data_out <= {data_out[0], data_out[7:1]};
			4'b1000 : data_out <= data_out;
			default : data_out <= data_out;
		endcase
	end
end
endmodule
			
			
