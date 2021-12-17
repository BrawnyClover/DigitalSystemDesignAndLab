module display(rst, clk, scan_data, valid, r0,r1, en);
  input rst, clk;
  input [11:0]scan_data;
  input valid;
  output [6:0]r0,r1;
  reg [6:0]r0,r1;
  output reg en;
  reg [11:0]r8;
  reg r9;
  reg [6:0]w;
  
  initial en <= 0;
  
  always@(posedge clk or negedge rst) begin
    if (!rst) begin
      r8 <= 12'b000000000000;
      r9 <= 3'b000;
      en <= 0;
      w <= 7'b1111110;
      r0 <= 0;
      r1 <= 0;
    end
    else begin
      en <= 0; // 매 클럭마다 en을 초기화한다 -> *키가 눌린 시점에서만 en이 1이 되도록 하기 위함
      if (valid) begin
        case(scan_data)
        12'b000000000001 : begin w <= 7'b0110000; end // 1
        12'b000000000010 : begin w <= 7'b1101101; end // 2
        12'b000000000100 : begin w <= 7'b1111001; end // 3
        12'b000000001000 : begin w <= 7'b0110011; end // 4
        12'b000000010000 : begin w <= 7'b1011011; end // 5
        12'b000000100000 : begin w <= 7'b1011111; end // 6
        12'b000001000000 : begin w <= 7'b1110010; end // 7
        12'b000010000000 : begin w <= 7'b1111111; end // 8
        12'b000100000000 : begin w <= 7'b1111011; end // 9
        12'b001000000000 : begin en <= 1; end         // * 다음 상태로 넘어가는 특수키
        12'b010000000000 : begin w <= 7'b1111110; end // 0
        12'b100000000000 : begin r9 <= r9 + 1; w <= 7'b1111110; end // #
        endcase
      end      
      else begin   
        case(r9)
          3'b000 : r0 <= w;
          3'b001 : r1 <= w;
        endcase
      end
    end
  end
endmodule   
      
      
        
