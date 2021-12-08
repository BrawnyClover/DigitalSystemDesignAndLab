
module textlcd(resetn,clk,output_command,LCD_E,LCD_RS,LCD_RW,LCD_DATA);

input resetn,clk;
input [2:0] output_command;    // 000 : correct!, 
                               // 001 : game failed!,
                               // 010 : up, 
                               // 011 : down,
                               // 100 : retry?
                               // 101 : game start!
                               // 110 : enter any number
output LCD_E,LCD_RS,LCD_RW;
output [7:0]LCD_DATA;

wire LCD_E;
reg LCD_RS,LCD_RW;
reg [7:0] LCD_DATA;
reg [2:0] state;

parameter   delay          =3'b000, 
            function_set   =3'b001,
            entry_mode     =3'b010,
            disp_onoff     =3'b011,
            line1          =3'b100,  
            line2          =3'b101,
            delay_t        =3'b110,
            clear_disp     =3'b111;

integer CNT;

always @(negedge resetn or posedge clk)
begin
   if(!resetn) state = delay;
   else begin
    // TODO: change state
    case(state)
        delay :         if(!(CNT<70))  begin state <= function_set;  end
        function_set :  if(!(CNT<30))  begin state <= entry_mode;  end
        entry_mode :    if(!(CNT<30))  begin state <= disp_onoff;  end
        disp_onoff :    if(!(CNT<30))  begin state <= line1;  end
        line1 :         if(!(CNT<20))  begin state <= line2;  end
        line2 :         if(!(CNT<20))  begin state <= delay_t;  end
        delay_t :       if(!(CNT<400)) begin state <= clear_disp;  end
        clear_disp :    if(!(CNT<200)) begin state <= line1;  end
    endcase
   end
end


always @(negedge resetn or posedge clk)
begin
   if(!resetn) CNT=0;
   else
    // TODO: count up CNT
    
	 case(state)
		delay :    begin    
			if(!(CNT<70))  begin CNT = 0;  end 
			else begin CNT = CNT+1; end 
		end
        function_set : begin  if(!(CNT<30))  begin CNT = 0;  end else begin CNT = CNT+1; end end
        entry_mode : begin   if(!(CNT<30))  begin CNT = 0;  end else begin CNT = CNT+1; end end
        disp_onoff :  begin  if(!(CNT<30))  begin CNT = 0;  end else begin CNT = CNT+1; end end
        line1 :     begin    if(!(CNT<20))  begin CNT = 0;  end else begin CNT = CNT+1; end end
        line2 :      begin   if(!(CNT<20))  begin CNT = 0;  end else begin CNT = CNT+1; end end
        delay_t :    begin   if(!(CNT<400)) begin CNT = 0;  end else begin CNT = CNT+1; end end
        clear_disp : begin   if(!(CNT<200)) begin CNT = 0;  end else begin CNT = CNT+1; end end
		  
	endcase
	$display(CNT);
end




always @(negedge resetn or posedge clk)
begin
    if(!resetn) 
    begin
        LCD_RS=1'b1;
        LCD_RW=1'b1;
        LCD_DATA=8'b00000000;
    end
    else
    begin   
        case(state)
        function_set:    
        begin
            LCD_RS=1'b0;
            LCD_RW=1'b0;
            LCD_DATA=8'b00111000;
        end
        disp_onoff:      
        begin
            LCD_RS=1'b0;
            LCD_RW=1'b0;
            LCD_DATA=8'b00001100;
        end
        entry_mode:      
        begin
            LCD_RS=1'b0;
            LCD_RW=1'b0;
            LCD_DATA=8'b00000110;
        end
        line1:         
        begin
            LCD_RW=1'b0;
            case(output_command)
            3'b000 : begin // correct!
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01000011;/*C*/ end // U
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101111;/*o*/ end // P
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100011;/*c*/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110100;/*t*/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100001;/*!*/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            3'b001 : begin // game failed!
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100111;/*g*/ end
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100001;/*a*/ end
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101101;/*m*/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100110;/*f*/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100001;/*a*/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101001;/*i*/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101100;/*l*/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01100100;/*d*/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100001;/*!*/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            3'b010 : begin // up
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01010101;/*U*/ end // U
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01010000;/*P*/ end // P
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            3'b011 : begin // down
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01000100;/*D*/ end
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01001111;/*O*/ end
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01010111;/*W*/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01001110;/*N*/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            3'b100 : begin // retry?
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end 
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110100;/*t*/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01111001;/*y*/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00111111;/*?*/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            3'b101 : begin // game start!
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100111;/*g*/ end
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100001;/*a*/ end
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101101;/*m*/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110011;/*s*/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110100;/*t*/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100001;/*a*/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01110100;/*t*/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100001;/*!*/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            3'b110 : begin // enter any number
                case(CNT)
                    0:      begin LCD_RS = 1'b0;      LCD_DATA=8'b10000000;/*address*/ end
                    1:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    2:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101110;/*n*/ end
                    3:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110100;/*t*/ end
                    4:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    5:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    6:      begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    7:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01100001;/*a*/ end
                    8:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01101110;/*n*/ end
                    9:      begin LCD_RS = 1'b1;      LCD_DATA=8'b01111001;/*y*/ end
                    10:     begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                    11:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01101110;/*n*/ end
                    12:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01110101;/*u*/ end
                    13:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01101101;/*m*/ end
                    14:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01100010;/*b*/ end
                    15:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01100101;/*e*/ end
                    16:     begin LCD_RS = 1'b1;      LCD_DATA=8'b01110010;/*r*/ end
                    default:begin LCD_RS = 1'b1;      LCD_DATA=8'b00100000;/**/ end
                endcase
            end
            endcase
        end
        line2:         begin
            LCD_RW=1'b0;
            case(CNT)
                0:      begin LCD_RS=1'b0;        LCD_DATA=8'b11000000;/*address*/ end
            endcase
        end
        delay_t:         
        begin
            LCD_RS=1'b0;
            LCD_RW=1'b0;
            LCD_DATA=8'b00000010;
        end
        clear_disp:    
        begin
            LCD_RS=1'b0;
            LCD_RW=1'b0;
            LCD_DATA=8'b00000001;
        end
        default:         
        begin
            LCD_RS=1'b1;
            LCD_RW=1'b1;
            LCD_DATA=8'b00000000;
        end
        endcase
    end
end

assign LCD_E=clk;

endmodule
