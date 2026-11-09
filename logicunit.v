//1 bit logic unit
module logicunit(A,X,S1,S0,W);
 input A,X;
 input S1,S0 ;
 output reg W ;
 wire C0,C1 ;
  
 and(C0,A,X);
 not(C1,A);
  
 always @(S1,S0,A,X)
   begin
     W=1'bz ;
     case({S1,S0})
       2'b00 : W=C0 ;
       2'b01 : W=C1 ;
       2'b10 : W=X  ;
		 2'b11 : W=1'bx ;
     endcase
   end
 //assign W=({S1,S0}==2'b0)? C0 :({S1,S0}==2'b01) ? C1 :({S1,S0}==2'b10)? X : 1'bx ;	
endmodule 
