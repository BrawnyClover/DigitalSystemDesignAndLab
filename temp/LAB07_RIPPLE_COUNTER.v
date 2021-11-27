module LAB07_RIPPLE_COUNTER(CLK,Q1,Q2,Q4,Q8);

input CLK;
output Q1,Q2,Q4,Q8;
wire NQ8;
supply1 p;

LAB07_JK_FF JK1(.CLK(CLK),.J(p),.K(p),.Q(Q1),.NQ());
LAB07_JK_FF JK2(.CLK(Q1),.J(NQ8),.K(p),.Q(Q2),.NQ());
LAB07_JK_FF JK3(.CLK(Q2),.J(p),.K(p),.Q(Q4),.NQ());
LAB07_JK_FF JK4(.CLK(Q1),.J(Q2&Q4),.K(p),.Q(Q8),.NQ(NQ8));

endmodule

