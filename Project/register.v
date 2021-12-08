module register(clk, rst, in, out);
  input clk, rst;
  input [6:0]in;
  output reg [6:0]out;
  
  reg [6:0] data;
  
  always@(posedge clk or negedge rst) begin
    if (!rst) begin
      out <= 7'b0000000;
    end
    else begin
			data <= in;
			out <= data;
		end
    end

endmodule