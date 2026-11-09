module IR(I,Clock,LD,W);
 input [13:0] I ;
 input Clock,LD ;
 output reg [13:0] W;
  
 always @(posedge Clock)
   begin
    if(LD) W<=I;
   end
endmodule
