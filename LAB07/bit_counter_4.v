module bit_counter_4(
	clk, en, rst, cnt, cout
);

input clk, rst, en;
output reg [3:0] cnt;
output reg cout;


always @(posedge clk or negedge rst) begin
	if(en == 1) begin
		if(rst == 0) begin
			cnt <= 4'b0000;
			cout <= 1'b0;
		end
		else begin
			if(cnt == 4'b1111)begin
				cnt <= 4'b0000;
				cout <= 1'b1;
			end
			cnt <= cnt + 1;
		end
	end
end
endmodule