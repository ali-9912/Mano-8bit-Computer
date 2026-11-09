module Decoder1to2(S,Y);
 input S ;
 output [1:0] Y ;
 
 not n1(Y[0],S) ;
 assign Y[1]=S ;
endmodule
