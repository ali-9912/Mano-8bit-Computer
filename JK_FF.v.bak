module JK_FF(Clock,Reset,J,K,Q,Q_bar);
  input Clock,Reset,J,K ;
  output Q,Q_bar ;
  wire D ;
  assign D =(J&Q_bar)|(~K&Q);
  
  D_FF dff0(Q,Q_bar,D,Clock,Reset);
  
endmodule
