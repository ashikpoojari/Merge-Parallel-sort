module controlfifo (input gt, input e1, input e2, output rd1, output rd2,output sel1,output wr);

wire w1,w2,w3,w4,w5,w6;

not	n1(w1,gt),
	n2(w2,e1),
	n3(w3,e2);

and	a3(w6,w2,w1);

or	r1(w4,e2,w1),
	r2(w5,e1,gt),
	r3(wr,w2,w3),
	r4(sel1,w6,e2);

and	a1(rd1,w4,w2),
	a2(rd2,w3,w5);
endmodule
