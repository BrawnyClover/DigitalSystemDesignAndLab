module main(
    rst, clk, resetn, keypad_in, seg_display, array_en, LCD_E,LCD_RS,LCD_RW, LCD_DATA
);

    parameter   g_init = 3'b000,
                g_ingame = 3'b001,
                g_gameend = 3'b010,
                g_wrong = 3'b011;

    // 7segment input
    input rst,clk;
    input [11:0]keypad_in;

    // 7segment output
    output [6:0]seg_display;
    output [7:0]array_en;

    // textlcd input
    input resetn;

    // textlcd output
    output LCD_E,LCD_RS,LCD_RW;
    output [7:0]LCD_DATA;
    
    wire [11:0]scan_out;
    wire valid;
    wire [7:0]r0,r1;
    wire [7:0]seg_0,seg_1;
    wire en;

    reg [2:0] output_command; // 000 : correct!, 
                               // 001 : game failed!,
                               // 010 : up, 
                               // 011 : down,
                               // 100 : retry?
                               // 101 : game start!
                               // 110 : enter any number
    reg [2:0] state;
    wire [31:0] input_dec;
    wire [31:0] random_number;

    reg[31:0] target;

    integer trial_left = 3;

    keypad_scan KS(rst, clk, keypad_in, scan_out, valid);
    display DP(rst, clk, scan_out, valid, r0,r1, en);
    register RG1(clk, rst, r0, seg_0);
    register RG2(clk, rst, r1, seg_1);
    seg_controller SC(clk, rst, seg_0, seg_1, seg_display, array_en);
    textlcd tlcd(rst, clk, output_command, LCD_E, LCD_RS, LCD_RW, LCD_DATA);
    random_generator random_gen(clk, rand);

    reg_to_dec rtc(seg_0, seg_1, input_dec); // register에 저장된 7seg 신호를 10진법으로 바꾸는 모듈

    always @(posedge clk) begin
        case(state)  // * 버튼을 누르지 않아도 자동으로 state가 넘어갸야 하는 state
            g_init:begin 
                output_command = 3'b110; // lcd에 enter any number 출력
                target = random_number; // 랜덤 숫자 생성
                state = g_ingame; // ingame state로 state 변경
            end
            g_wrong:begin
                state = g_ingame; // ingame state로 state 변경
            end
        endcase

        if(en == 1'b1)begin 
            // * 버튼을 눌러야 state가 넘어갸야 하는 state -> 입력이 필요한 state
            // ingame state의 경우 정답에 대한 입력이 필요
            // gameend state의 경우 재시작 여부에 대한 입력이 필요
            case(state)
            g_ingame:begin
                if(input_dec == target) begin // 정답일 때
                    output_command = 3'b000; // lcd에 correct 출력
                    state = g_gameend;
                end
                else begin // 오답일 때
                    trial_left = trial_left - 1;
                    if(trial_left == 0) begin
                        state = g_gameend;
                        output_command = 3'b100; // lcd에 retry? 출력
                    end
                    else if(input_dec > target) begin
                        state = g_wrong;
                        output_command = 3'b011; // lcd에 down 출력
                    end
                    else if(input_dec < target) begin
                        state = g_wrong;
                        output_command = 3'b010; // lcd에 up 출력
                    end
                    else begin
                    $display("something is strange..");
                    end
                end
            end

            g_gameend:begin
                if(input_dec == 0) begin // 다시 안하는 경우
                    
                end
                else if(input_dec == 1) begin // 다시 하는 경우
                    state = g_init;
                    output_command = 3'b101; // lcd에 game start! 출력
                end
            end
        endcase
    end
    end
endmodule