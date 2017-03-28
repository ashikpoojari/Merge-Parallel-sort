module  sortvals 
# (parameter DATA_WIDTH = 32, NUM_WORDS = 32)
 ( 	input [DATA_WIDTH*NUM_WORDS-1:0] array_in,
	input  clk,input reset,
	output reg [DATA_WIDTH*NUM_WORDS-1:0] array_out,
	output reg done ); 

reg [DATA_WIDTH-1:0] array_intp [NUM_WORDS-1:0];
reg [DATA_WIDTH-1:0] array_outp [NUM_WORDS-1:0];
integer j,k,l,m,n,q;

reg [NUM_WORDS-1:0]p=31;
// write signal to fifo
wire wd1,wd21,wd22;

// read signal to fifo
wire rd11,rd12,rd13,rd14,rd21,rd22;

//empty signal from fifo
wire e11,e12,e13,e14,e21,e22;

//greater than signal
wire gt11,gt12,gt21;

wire wd51,rd51,e51,wd52,rd52,e52,gt51,sel51,wd61,wd31,rd31,e31,wd32,rd32,e32,wd33,rd33,e33,wd34,rd34,e34,wd35,
rd35,e35,wd36,rd36,e36,wd37,rd37,e37,wd38,rd38,e38,
gt31,gt32,gt33,gt34,sel31,sel32,sel33,sel34,wd41,rd41,e41,wd42,rd42,e42,wd43,rd43,e43,wd44,rd44,e44,gt41,gt42,
sel41,sel42,wd23,rd23,e23,wd24,rd24,e24,wd25,rd25,
e25,wd26,rd26,e26,wd27,rd27,e27,wd28,rd28,e28,wd29,rd29,e29,wd210,rd210,e210,
wd211,rd211,e211,wd212,rd212,e212,wd213,rd213,e213,wd214,rd214,e214,wd215,rd215,e215,wd216,rd216,e216,
gt22,gt23,gt24,gt25,gt26,gt27,gt28,sel22,sel23,sel24,sel25,sel26,sel27,sel28,rd15,e15,rd16,e16,rd17,e17,rd18,e18,rd19,e19,rd110,e110,rd111,e111,rd112,e112,rd113,e113,rd114,e114,rd115,e115,rd116,e116,
gt13,gt14,gt15,gt16,gt17,gt18,sel13,sel14,sel15,sel16,sel17,sel18;

wire rd117,e117,rd118,e118,rd119,e119,rd120,e120,rd121,e121,rd122,e122,rd123,e123,rd124,e124,rd125,e125,rd126,e126,
rd127,e127,rd128,e128,rd129,e129,rd130,e130,rd131,e131,rd132,e132,gt19,gt110,gt111,gt112,gt113,gt114,gt115,gt116,
sel19,sel110,sel111,sel112,sel113,sel114,sel115,sel116;

wire [DATA_WIDTH-1:0] d41,d42,d43,d44,d4141,d61,dcmp41,d4241,dcmp42,d4342,dcmp43,d4442,dcmp44,
d51,d52,d5161,dcmp51,d5261,dcmp52,d31,d3141,dcmp31,d32,d3241,dcmp32,d33,d3342,dcmp33,d34,d3442,dcmp34,d35,d3543,dcmp35,d36,d3643,dcmp36,d37,d3744,dcmp37,d38,d3844,dcmp38,
d23,d210,d2332,dcmp23,d21035,dcmp210,d24,d211,d2432,dcmp24,d21136,dcmp211,d25,d212,d2533,dcmp25,d21236,dcmp212,
d26,d213,d2633,dcmp26,d21337,dcmp213,d27,d214,d2734,dcmp27,d21437,dcmp214,d28,d215,d2834,dcmp28,d21538,dcmp215,
d29,d216,d2935,dcmp29,d21638,dcmp216,d11729,dcmp117,d11829,dcmp118,d119210,dcmp119,d120210,dcmp120,d121211,dcmp121,d122211,dcmp122,d123212,dcmp123
,d124212,dcmp124,d125213,dcmp125,d126213,dcmp126,d127214,dcmp127,d128214,dcmp128,d129215,dcmp129
,d130215,dcmp130,d131216,dcmp131,d132216,dcmp132,d1523,dcmp15,d11025,dcmp110,d1623,dcmp16,d11126,dcmp111,d1724,dcmp17,d11226,dcmp112,d1824,dcmp18,d11327,dcmp113,
d1925,dcmp19,d11427,dcmp114,d11528,dcmp115,d11628,dcmp116;





//full signal from fifo
reg f1;
wire Done,load;
wire [DATA_WIDTH-1:0] d1121,d1221,d1322,d1422,d21,d22,d2131,d2231;
wire [DATA_WIDTH-1:0] dcmp11,dcmp12,dcmp13,dcmp14,dcmp21,dcmp22;
wire sel11,sel12,sel21;

// 32 fifo in first layer
fifo1 fifoa11(array_intp[0],wd1,rd11,d1121,dcmp11,e11,clk,reset);
fifo1 fifoa12(array_intp[1],wd1,rd12,d1221,dcmp12,e12,clk,reset);
comparator cmp11(dcmp11,dcmp12,gt11);
controlfifo cntrl11(gt11,e11,e12,rd11,rd12,sel11,wd21);
mux mux11(d1121,d1221,sel11,d21);

fifo1 fifoa13(array_intp[2],wd1,rd13,d1322,dcmp13,e13,clk,reset);
fifo1 fifoa14(array_intp[3],wd1,rd14,d1422,dcmp14,e14,clk,reset);
comparator cmp12(dcmp13,dcmp14,gt12);
controlfifo cntrl12(gt12,e13,e14,rd13,rd14,sel12,wd22);
mux mux12(d1322,d1422,sel12,d22);

fifo1 fifoa15(array_intp[4],wd1,rd15,d1523,dcmp15,e15,clk,reset);
fifo1 fifoa16(array_intp[5],wd1,rd16,d1623,dcmp16,e16,clk,reset);
comparator cmp13(dcmp15,dcmp16,gt13);
controlfifo cntrl13(gt13,e15,e16,rd15,rd16,sel13,wd23);
mux mux13(d1523,d1623,sel13,d23);

fifo1 fifoa17(array_intp[6],wd1,rd17,d1724,dcmp17,e17,clk,reset);
fifo1 fifoa18(array_intp[7],wd1,rd18,d1824,dcmp18,e18,clk,reset);
comparator cmp14(dcmp17,dcmp18,gt14);
controlfifo cntrl14(gt14,e17,e18,rd17,rd18,sel14,wd24);
mux mux14(d1724,d1824,sel14,d24);

fifo1 fifoa19(array_intp[8],wd1,rd19,d1925,dcmp19,e19,clk,reset);
fifo1 fifoa110(array_intp[9],wd1,rd110,d11025,dcmp110,e110,clk,reset);
comparator cmp15(dcmp19,dcmp110,gt15);
controlfifo cntrl15(gt15,e19,e110,rd19,rd110,sel15,wd25);
mux mux15(d1925,d11025,sel15,d25);

fifo1 fifoa111(array_intp[10],wd1,rd111,d11126,dcmp111,e111,clk,reset);
fifo1 fifoa112(array_intp[11],wd1,rd112,d11226,dcmp112,e112,clk,reset);
comparator cmp16(dcmp111,dcmp112,gt16);
controlfifo cntrl16(gt16,e111,e112,rd111,rd112,sel16,wd26);
mux mux16(d11126,d11226,sel16,d26);

fifo1 fifoa113(array_intp[12],wd1,rd113,d11327,dcmp113,e113,clk,reset);
fifo1 fifoa114(array_intp[13],wd1,rd114,d11427,dcmp114,e114,clk,reset);
comparator cmp17(dcmp113,dcmp114,gt17);
controlfifo cntrl17(gt17,e113,e114,rd113,rd114,sel17,wd27);
mux mux17(d11327,d11427,sel17,d27);

fifo1 fifoa115(array_intp[14],wd1,rd115,d11528,dcmp115,e115,clk,reset);
fifo1 fifoa116(array_intp[15],wd1,rd116,d11628,dcmp116,e116,clk,reset);
comparator cmp18(dcmp115,dcmp116,gt18);
controlfifo cntrl18(gt18,e115,e116,rd115,rd116,sel18,wd28);
mux mux18(d11528,d11628,sel18,d28);

fifo1 fifoa117(array_intp[16],wd1,rd117,d11729,dcmp117,e117,clk,reset);
fifo1 fifoa118(array_intp[17],wd1,rd118,d11829,dcmp118,e118,clk,reset);
fifo1 fifoa119(array_intp[18],wd1,rd119,d119210,dcmp119,e119,clk,reset);
fifo1 fifoa120(array_intp[19],wd1,rd120,d120210,dcmp120,e120,clk,reset);
fifo1 fifoa121(array_intp[20],wd1,rd121,d121211,dcmp121,e121,clk,reset);
fifo1 fifoa122(array_intp[21],wd1,rd122,d122211,dcmp122,e122,clk,reset);
fifo1 fifoa123(array_intp[22],wd1,rd123,d123212,dcmp123,e123,clk,reset);
fifo1 fifoa124(array_intp[23],wd1,rd124,d124212,dcmp124,e124,clk,reset);
fifo1 fifoa125(array_intp[24],wd1,rd125,d125213,dcmp125,e125,clk,reset);
fifo1 fifoa126(array_intp[25],wd1,rd126,d126213,dcmp126,e126,clk,reset);
fifo1 fifoa127(array_intp[26],wd1,rd127,d127214,dcmp127,e127,clk,reset);
fifo1 fifoa128(array_intp[27],wd1,rd128,d128214,dcmp128,e128,clk,reset);
fifo1 fifoa129(array_intp[28],wd1,rd129,d129215,dcmp129,e129,clk,reset);
fifo1 fifoa130(array_intp[29],wd1,rd130,d130215,dcmp130,e130,clk,reset);
fifo1 fifoa131(array_intp[30],wd1,rd131,d131216,dcmp131,e131,clk,reset);
fifo1 fifoa132(array_intp[31],wd1,rd132,d132216,dcmp132,e132,clk,reset);


comparator cmp19(dcmp117,dcmp118,gt19);
comparator cmp110(dcmp119,dcmp120,gt110);
comparator cmp111(dcmp121,dcmp122,gt111);
comparator cmp112(dcmp123,dcmp124,gt112);
comparator cmp113(dcmp125,dcmp126,gt113);
comparator cmp114(dcmp127,dcmp128,gt114);
comparator cmp115(dcmp129,dcmp130,gt115);
comparator cmp116(dcmp131,dcmp132,gt116);

controlfifo cntrl19(gt19,e117,e118,rd117,rd118,sel19,wd29);
controlfifo cntrl110(gt110,e119,e120,rd119,rd120,sel110,wd210);
controlfifo cntrl111(gt111,e121,e122,rd121,rd122,sel111,wd211);
controlfifo cntrl112(gt112,e123,e124,rd123,rd124,sel112,wd212);
controlfifo cntrl113(gt113,e125,e126,rd125,rd126,sel113,wd213);
controlfifo cntrl114(gt114,e127,e128,rd127,rd128,sel114,wd214);
controlfifo cntrl115(gt115,e129,e130,rd129,rd130,sel115,wd215);
controlfifo cntrl116(gt116,e131,e132,rd131,rd132,sel116,wd216);

mux mux19(d11729,d11829,sel19,d29);
mux mux110(d119210,d120210,sel110,d210);
mux mux111(d121211,d122211,sel111,d211);
mux mux112(d123212,d124212,sel112,d212);
mux mux113(d125213,d126213,sel113,d213);
mux mux114(d127214,d128214,sel114,d214);
mux mux115(d129215,d130215,sel115,d215);
mux mux116(d131216,d132216,sel116,d216);

// 2 fifo in second layer
fifo2 fifoa21(d21,wd21,rd21,d2131,dcmp21,e21,clk,reset);
fifo2 fifoa22(d22,wd22,rd22,d2231,dcmp22,e22,clk,reset);
comparator cmp21(dcmp21,dcmp22,gt21);
controlfifo cntrl21(gt21,e21,e22,rd21,rd22,sel21,wd31);
mux mux21(d2131,d2231,sel21,d31);

fifo2 fifoa23(d23,wd23,rd23,d2332,dcmp23,e23,clk,reset);
fifo2 fifoa24(d24,wd24,rd24,d2432,dcmp24,e24,clk,reset);
fifo2 fifoa25(d25,wd25,rd25,d2533,dcmp25,e25,clk,reset);
fifo2 fifoa26(d26,wd26,rd26,d2633,dcmp26,e26,clk,reset);
fifo2 fifoa27(d27,wd27,rd27,d2734,dcmp27,e27,clk,reset);
fifo2 fifoa28(d28,wd28,rd28,d2834,dcmp28,e28,clk,reset);
fifo2 fifoa29(d29,wd29,rd29,d2935,dcmp29,e29,clk,reset);
fifo2 fifoa210(d210,wd210,rd210,d21035,dcmp210,e210,clk,reset);
fifo2 fifoa211(d211,wd211,rd211,d21136,dcmp211,e211,clk,reset);
fifo2 fifoa212(d212,wd212,rd212,d21236,dcmp212,e212,clk,reset);
fifo2 fifoa213(d213,wd213,rd213,d21337,dcmp213,e213,clk,reset);
fifo2 fifoa214(d214,wd214,rd214,d21437,dcmp214,e214,clk,reset);
fifo2 fifoa215(d215,wd215,rd215,d21538,dcmp215,e215,clk,reset);
fifo2 fifoa216(d216,wd216,rd216,d21638,dcmp216,e216,clk,reset);

comparator cmp22(dcmp23,dcmp24,gt22);
comparator cmp23(dcmp25,dcmp26,gt23);
comparator cmp24(dcmp27,dcmp28,gt24);
comparator cmp25(dcmp29,dcmp210,gt25);
comparator cmp26(dcmp211,dcmp212,gt26);
comparator cmp27(dcmp213,dcmp214,gt27);
comparator cmp28(dcmp215,dcmp216,gt28);


controlfifo cntrl22(gt22,e23,e24,rd23,rd24,sel22,wd32);
controlfifo cntrl23(gt23,e25,e26,rd25,rd26,sel23,wd33);
controlfifo cntrl24(gt24,e27,e28,rd27,rd28,sel24,wd34);
controlfifo cntrl25(gt25,e29,e210,rd29,rd210,sel25,wd35);
controlfifo cntrl26(gt26,e211,e212,rd211,rd212,sel26,wd36);
controlfifo cntrl27(gt27,e213,e214,rd213,rd214,sel27,wd37);
controlfifo cntrl28(gt28,e215,e216,rd215,rd216,sel28,wd38);


mux mux22(d2332,d2432,sel22,d32);
mux mux23(d2533,d2633,sel23,d33);
mux mux24(d2734,d2834,sel24,d34);
mux mux25(d2935,d21035,sel25,d35);
mux mux26(d21136,d21236,sel26,d36);
mux mux27(d21337,d21437,sel27,d37);
mux mux28(d21538,d21638,sel28,d38);

// 8 fifo in third layer
fifo4 fifoa31(d31,wd31,rd31,d3141,dcmp31,e31,clk,reset);
fifo4 fifoa32(d32,wd32,rd32,d3241,dcmp32,e32,clk,reset);
fifo4 fifoa33(d33,wd33,rd33,d3342,dcmp33,e33,clk,reset);
fifo4 fifoa34(d34,wd34,rd34,d3442,dcmp34,e34,clk,reset);
fifo4 fifoa35(d35,wd35,rd35,d3543,dcmp35,e35,clk,reset);
fifo4 fifoa36(d36,wd36,rd36,d3643,dcmp36,e36,clk,reset);
fifo4 fifoa37(d37,wd37,rd37,d3744,dcmp37,e37,clk,reset);
fifo4 fifoa38(d38,wd38,rd38,d3844,dcmp38,e38,clk,reset);

comparator cmp31(dcmp31,dcmp32,gt31);
comparator cmp32(dcmp33,dcmp34,gt32);
comparator cmp33(dcmp35,dcmp36,gt33);
comparator cmp34(dcmp37,dcmp38,gt34);

controlfifo cntrl31(gt31,e31,e32,rd31,rd32,sel31,wd41);
controlfifo cntrl32(gt32,e33,e34,rd33,rd34,sel32,wd42);
controlfifo cntrl33(gt33,e35,e36,rd35,rd36,sel33,wd43);
controlfifo cntrl34(gt34,e37,e38,rd37,rd38,sel34,wd44);

mux mux31(d3141,d3241,sel31,d41);
mux mux32(d3342,d3442,sel32,d42);
mux mux33(d3543,d3643,sel33,d43);
mux mux34(d3744,d3844,sel34,d44);

//4 fifo in fourth layer
fifo8 fifoa41(d41,wd41,rd41,d4141,dcmp41,e41,clk,reset);
fifo8 fifoa42(d42,wd42,rd42,d4241,dcmp42,e42,clk,reset);
fifo8 fifoa43(d43,wd43,rd43,d4342,dcmp43,e43,clk,reset);
fifo8 fifoa44(d44,wd44,rd44,d4442,dcmp44,e44,clk,reset);

comparator cmp41(dcmp41,dcmp42,gt41);
comparator cmp42(dcmp43,dcmp44,gt42);

controlfifo cntrl41(gt41,e41,e42,rd41,rd42,sel41,wd51);
controlfifo cntrl42(gt42,e43,e44,rd43,rd44,sel42,wd52);

mux mux41(d4141,d4241,sel41,d51);
mux mux42(d4342,d4442,sel42,d52);

//2 fifo in fiveth layer
fifo16 fifoa51(d51,wd51,rd51,d5161,dcmp51,e51,clk,reset);
fifo16 fifoa52(d52,wd52,rd52,d5261,dcmp52,e52,clk,reset);
comparator cmp51(dcmp51,dcmp52,gt51);
controlfifo cntrl51(gt51,e51,e52,rd51,rd52,sel51,wd61);
mux mux51(d5161,d5261,sel51,d61);



always@(posedge clk) begin
	//Conversion from flat array to 2-D array.
	if (load) begin
	l=0;
	for (j=0; j<NUM_WORDS; j=j+1) begin
		for (k=0; k<DATA_WIDTH; k=k+1)

		begin
			array_intp[j][k]<=array_in[l];
			l=l+1;
		end
	end
	end
end

always@(posedge clk) begin
	//Conversion from flat array to 2-D array.
	if (wd61) begin
	array_outp[p] = d61;
		if (p==0)begin
		   f1=1;
			//Conversion from 2-D array to flat array
			$display("out");
			m=0;
			for (n=0; n<NUM_WORDS; n=n+1) begin
				for (q=0; q<DATA_WIDTH; q=q+1)
				begin
					array_out [m] <= array_outp[n][q];
					m=m+1;
				end
			end
		end
	p=p-1;
	end
end

sortFsm sortfsmt(clk,reset,f1,wd1,load,Done);

always@(posedge clk) begin
done <= Done;
end

endmodule
