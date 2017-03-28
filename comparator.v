module comparator 
# (parameter W = 32)
(input [W-1:0] ival, input [W-1:0] yval, output reg gt);

always @ (*) begin

  if (ival   > yval)
    gt =1;
  else
    gt =0;

end

endmodule
