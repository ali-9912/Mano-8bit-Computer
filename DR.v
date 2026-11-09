module DR(I,Clock,LD,INCR,W);
 input [7:0] I ;
 input Clock,LD,INCR ;
 output reg [7:0] W;
  
 always @(posedge Clock)
   begin
    if(LD) W<=I;
    else if(INCR) W<=W+1'b1 ;
   end
endmodule
