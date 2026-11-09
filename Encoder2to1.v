module Encoder2to1(X,S);
 input [1:0] X ;
 output reg S ;
 
 always @(X)
  begin
   case(X)
	 2'b0  : S=1'bz ;
	 2'b01 : S=1'b0 ;
	 2'b10 : S=1'b1 ;
	 2'b11 : S=1'bx ;
	endcase
  end  	
endmodule 