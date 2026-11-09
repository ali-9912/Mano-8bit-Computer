module Decoder4to16(En,I,Q);
 input En;
 input [3:0] I ;
 output [15:0] Q ;
 wire [3:0] E ;
 
 Decoder2to4 N1(En,I[3:2],E);
 Decoder2to4 N2(E[0],I[1:0],Q[3:0]);
 Decoder2to4 N3(E[1],I[1:0],Q[7:4]);
 Decoder2to4 N4(E[2],I[1:0],Q[11:8]);
 Decoder2to4 N5(E[3],I[1:0],Q[15:12]);
endmodule
