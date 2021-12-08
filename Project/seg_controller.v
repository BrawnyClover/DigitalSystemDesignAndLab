module seg_controller(
  input clk,
  input rst_x,
  input[6:0]seg_0,
  input[6:0]seg_1,
  output[6:0]seg_display,
  output[7:0]array_en);
  
  reg[6:0] seg_display_internal;
  reg[7:0] array_en_internal;
  
  reg[2:0] scan_loc;
  
  always@(posedge clk or negedge rst_x) begin
    if(~rst_x) begin
      array_en_internal <= 8'b00000000;
      seg_display_internal <= 7'b0000000;
      scan_loc <= 3'b000;
    end
    else begin
      if(scan_loc == 3'b111) begin
        scan_loc <= 3'b000;
      end
    else begin
      scan_loc <= scan_loc + 1'b1;
    end
    case(scan_loc)
      3'd0: begin array_en_internal <= 8'b11111110; seg_display_internal <= seg_0; end
      3'd1: begin array_en_internal <= 8'b11111101; seg_display_internal <= seg_1; end
      default: begin array_en_internal <= 8'b11111111; seg_display_internal <= seg_0; end
    endcase
  end
end

  assign seg_display = seg_display_internal;
  assign array_en = array_en_internal;
      

endmodule