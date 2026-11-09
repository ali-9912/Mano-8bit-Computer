module Mux3to1(A,B,C,S1,S0,W);
input [7:0]A,B,C;
input S1,S0;
output reg [7:0]W;

always @(A or B or C or S1 or S0)
 begin
  W = 8'bz;
	case ({S1,S0})
		2'b00 : W = A ;
		2'b01 : W = B ;
		2'b10 : W = C ;
		2'b11 : W = 8'bx ;
	endcase
 end
//assign W= ({S1,S0}==2'b0)? A :({S1,S0}==2'b01)? B :({S1,S0}==2'b10)? C : 8'bx;
endmodule
