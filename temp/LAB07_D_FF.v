module LAB07_D_FF(CLK,D,Q,NQ);
input CLK, D;
output Q,NQ;

reg sr1_r;
reg sr2_s;

wire sr1_q, sr1_nq;
wire sr2_q, sr2_nq;

LAB07_SR_LATCH SR1(sr2_nq, sr1_r, sr1_q, sr1_nq);//Latch 1
LAB07_SR_LATCH SR2(sr2_s,D,sr2_q,sr2_nq);//Latch 2
LAB07_SR_LATCH SR3(sr1_nq, sr2_q,Q,NQ);//Latch 3

always @ (posedge CLK) begin
	sr2_s <= CLK & sr1_nq;
	sr1_r <= CLK;
end

endmodule