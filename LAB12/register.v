module register(clk, rst, in, en, out);
  input clk, rst, en;
  input [6:0]in;
  output reg [6:0]out;
  
  reg [6:0] data;
  
  always@(posedge clk or negedge rst) begin
    if (!rst) begin
      out <= 7'b0000000;
    end
    else begin
      if (en) begin
			data <= in;
			out <= data;
		end
		else begin
			out <= 7'b0000000;
		end
    end
  end
endmodule