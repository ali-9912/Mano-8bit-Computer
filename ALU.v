//8 bit ALU
module ALU(AC,X,S,C_in,W,E);
  input [7:0] AC,X ;
  input [2:0] S ;
  input C_in ;
  output [7:0] W ;
  output E ;
  
  wire M1,M0,K1,K0,N1,N0 ;
  wire [7:0] Q,L,B ;
  assign M1= S[2]&~S[1] ;
  assign M0= (~S[2]&~S[0])|(~S[2]&S[1]) ;
  assign K1= ~(S[0]|S[1]|S[2]) ;
  assign K0=~S[2]&S[1]&S[0] ;
  assign N1=S[2]&~S[1]&S[0] ;
  assign N0=S[2]&~S[1]&~S[0] ;
  
  fulladder8bit  a1(Q,E,AC,X,C_in);
  logicunit8bit  a2(AC,X,K1,K0,L) ;
  shiftregister8bit a3(B,AC,N1,N0,E,E);
  Mux4to1 a4(Q,L,B,,M1,M0,W);
  
endmodule 

