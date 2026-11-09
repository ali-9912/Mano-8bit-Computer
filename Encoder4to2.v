module Encoder4to2(I,Q);
  input [3:0] I ;
  output [1:0] Q ;
  wire m0,m1,m2,V ;
 
  assign m0= ~I[0]&I[1];
  assign m1= ~I[0]&~I[1]&I[2];
  assign m2= ~I[0]&~I[1]&~I[2]&I[3];
  assign V=I[0]|I[1]|I[2]|I[3] ;
  assign Q[0]= V ? (m0|m2):1'bz ;
  assign Q[1]= V ? (m1|m2):1'bz ;
 
endmodule