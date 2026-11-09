module TR(I,Clock,LD,W);
 input [9:0] I ;
 input Clock,LD ;
 output reg [9:0] W;
  
 always @(posedge Clock)
   begin
    if(LD) W<=I;
   end
endmodule
