module Decoder6to64(En,D,Q);
 input En;
 input [5:0] D ;
 output [63:0] Q ;
 wire [3:0] E ;
 
 Decoder2to4 N1(En,D[5:4],E);
 Decoder4to16 N2(E[0],D[3:0],Q[15:0]);
 Decoder4to16 N3(E[1],D[3:0],Q[31:16]);
 Decoder4to16 N4(E[2],D[3:0],Q[47:32]);
 Decoder4to16 N5(E[3],D[3:0],Q[63:48]);
endmodule
