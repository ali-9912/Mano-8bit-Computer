module PC(I,Clock,LD,INCR,CL,W);
 input [9:0] I ;
 input Clock,LD,INCR,CL ;
 output reg [9:0] W;
  
 always @(posedge Clock)
   begin
    if(LD) W<=I;
    else if(INCR) W<=W+1 ;
    else if(CL)   W<=0 ;
   end
endmodule
