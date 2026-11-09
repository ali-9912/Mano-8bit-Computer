//8 bit Accumulator 
module Accumulator(I,Clock,LD,INCR,CL,W);
  input [7:0] I ;
  input Clock,LD,INCR,CL ;
  output reg [7:0] W;
  
  always @(posedge Clock)
   begin
    if(LD) W<=I;
    else if(INCR) W<=W+1'b1 ;
    else if(CL) W<=0 ;
   end
endmodule 