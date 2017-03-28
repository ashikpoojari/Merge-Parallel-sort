module sortFsm (input clk, input reset, input full, output reg wd1,output reg load, 
              output reg done);


reg [2:0] cs, ns;

always @ (posedge clk, posedge reset) begin
  if (reset) 
     cs <= 0;
  else 
     cs <= ns;
end

always @(*) begin
  ns = cs;
  
  case (cs)
     //START  
     2'b00 :  begin
        	$display ("START");
      		wd1=0;load=1;
		done=0;
         	ns = 2'b01; 

     end
     //PRE SET
     2'b01 : begin
         	$display ("working");
 		wd1=1;load=0;
		done=0;
		ns = 2'b10;
     end

     2'b10 : begin
         	$display ("working");
 		wd1=0;load=0;
		done=0;
		if (full)
		ns = 2'b11;
    
     end

     //STOP
     2'b11 : begin
         	$display ("STOP");
		wd1=0;
		load=0;
     		done=1;

     end

     default : begin
	$display ("default");
     end

  endcase
end
  

endmodule
