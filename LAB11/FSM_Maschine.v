module FSM_Maschine(
	i, rst, clk, out
);

input i, clk, rst;
output reg [3:0] out;

parameter [1:0] state_0 = 2'b00;
parameter [1:0] state_1 = 2'b01;
parameter [1:0] state_2 = 2'b10;
parameter [1:0] state_3 = 2'b11;

reg [1:0] finite_state;

always @ (negedge rst) begin
	if(~rst) begin
		finite_state <= state_0;
	end
end

always @ (posedge clk) begin
	case(finite_state)
	state_0 : begin
		case(i)
		0 : begin out <= 4; finite_state <= state_0; end
		1 : begin out <= 0; finite_state <= state_1; end
		endcase
	end
	state_1 : begin
		case(i)
		0 : begin out <= 4; finite_state <= state_1; end
		1 : begin out <= 1; finite_state <= state_2; end
		endcase	
	end
	state_2 : begin
		case(i)
		0 : begin out <= 4; finite_state <= state_2; end
		1 : begin out <= 2; finite_state <= state_3; end
		endcase
	end
	state_3 : begin
		case(i)
		0 : begin out <= 4; finite_state <= state_3; end
		1 : begin out <= 3; finite_state <= state_0; end
		endcase
	end
	endcase
end
endmodule