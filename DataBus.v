module DataBus(X,AC,DR,B);
 input [1:0] X;
 input [7:0] AC ;
 input [7:0] DR ;
 output wire [7:0] B ;
 
 wire m ;
 wire [1:0] Y ;
 Encoder2to1 n1(X,m) ;
 Decoder1to2 n2(m,Y) ;
 bufif1 m0(B[0],AC[0],Y[1]) ;
 bufif1 m1(B[0],DR[0],Y[0]) ;
 bufif1 m2(B[1],AC[1],Y[1]) ;
 bufif1 m3(B[1],DR[1],Y[0]) ;
 bufif1 m4(B[2],AC[2],Y[1]) ;
 bufif1 m5(B[2],DR[2],Y[0]) ;
 bufif1 m6(B[3],AC[3],Y[1]) ;
 bufif1 m7(B[3],DR[3],Y[0]) ;
 bufif1 m8(B[4],AC[4],Y[1]) ;
 bufif1 m9(B[4],DR[4],Y[0]) ;
 bufif1 m10(B[5],AC[5],Y[1]) ;
 bufif1 m11(B[5],DR[5],Y[0]) ;
 bufif1 m12(B[6],AC[6],Y[1]) ;
 bufif1 m13(B[6],DR[6],Y[0]) ;
 bufif1 m14(B[7],AC[7],Y[1]) ;
 bufif1 m15(B[7],DR[7],Y[0]) ;
 
endmodule
