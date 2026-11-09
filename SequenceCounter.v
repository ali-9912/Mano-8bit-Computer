module SequenceCounter(Reset,Clock,Q);
  input Reset,Clock ;
  output [2:0] Q ;
  wire T0,T1,T2 ;

  assign T2= (~Q[2]&Q[1]&Q[0])|(Q[2]&Q[1]&(~Q[0])) ;
  assign T1= (~Q[1]&Q[0]) | (~Q[2]&Q[0]) | (Q[2]&Q[1]&(~Q[0])) ;
  assign T0= ~Q[2] | ~Q[1] ;
 
  T_FF tff0(Q[0],T0,Clock,Reset);
  T_FF tff1(Q[1],T1,Clock,Reset);
  T_FF tff2(Q[2],T2,Clock,Reset);
 
endmodule 
