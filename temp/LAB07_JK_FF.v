module LAB07_JK_FF(CLK,J,K,Q,NQ);

input CLK,J,K;
output Q,NQ;
reg JK;

LAB07_D_FF D1(~CLK,JK,Q,NQ);

always @ (negedge CLK) begin
	JK <= (J&NQ)|(~K&Q);
end

endmodule