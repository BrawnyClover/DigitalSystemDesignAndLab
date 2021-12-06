`timescale 10ps/1ps

module step_mod_tb();

reg RESETN, CLK, SENSE;
reg OPP;

wire STEP_A, STEP_B, STEP_AN, STEP_BN;

step step_m(RESETN, CLK, SENSE, OPP, STEP_A, STEP_B, STEP_AN, STEP_BN);

initial begin
    CLK = 1'b1;
    forever begin
        #0.5 CLK = ~CLK;
    end
end

initial begin
    SENSE = 1'b0;
    #2 SENSE = 1'b0;
    forever begin
        #7 SENSE = 1'b1;
        #1 SENSE = 1'b0;
    end
end

initial begin
    RESETN = 1'b1;
    OPP = 1'b1;
    #1 RESETN = 1'b0;
    #1 RESETN = 1'b1;
    #100 OPP = 1'b0;
end

endmodule