module shiftregister8bit(out,I,S1,S0,MSB,LSB);
  input [7:0] I ;
  input S1,S0 ;
  input MSB,LSB ;
  output reg [7:0] out ;
  
  always @(S1,S0)
   begin 	
	  case({S1,S0})
		2'b00 : out<= I ;
		2'b01 : out<= {MSB,out[7:1]} ;
		2'b10 : out<= {out[6:0],LSB} ;
	   2'b11	: out<= 8'bx ;
	  endcase  	
	end 
endmodule 
