module Mux2to1(DR,INR,S,X);
 input [7:0] DR ;
 input [7:0] INR ;
 input S ;
 output [7:0] X ;
 
 assign X= S ? DR : INR ;
 
endmodule
  