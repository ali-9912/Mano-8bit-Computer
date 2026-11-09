module Decoder2to4(I,Q);
 input [1:0] I ;
 output [3:0] Q ;
 
 assign Q[0] = ~I[1] & ~I[0] ;
 assign Q[1] = ~I[1] & I[0] ;
 assign Q[2] =  I[1] & ~I[0] ;
 assign Q[3] =  I[1] & I[0] ;
endmodule
 