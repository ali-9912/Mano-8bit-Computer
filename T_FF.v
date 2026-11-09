module T_FF(Q,T,clk,reset);
 output Q;
 input T,clk,reset ;
 wire D ;
 xor(D,T,Q);
 
 D_FF dff0(Q,,D,clk,reset) ;
 
endmodule  