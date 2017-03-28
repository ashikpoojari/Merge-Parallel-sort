module mux 
# (parameter W = 32)
(input [W-1:0] in1, input [W-1:0] in2, input sel, output reg [W-1:0] out );


always @ (*) begin
   
//$display("--------mux---------");
//$monitor ($time, " in1=%d, in2=%d, in3=%d, out=%d", in1, in2, sel, out);
   if (sel)
	out =in1;
   else
	out =in2;
end

endmodule
