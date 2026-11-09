//1kB 14 bit instruction Memory behavioral description
module instruction_Memory(Reset,Address,Read,Write,Datain,Clock,Dataout);
  input Reset ; 
  input [13:0] Datain ;
  input Read,Write,Clock ;
  input [9:0] Address ;
  output [13:0] Dataout ;
  reg [13:0] Dataout ;
  reg [13:0] mem[0:1023] ;
  
  always @(posedge Clock)
   begin
     if(~Reset)
       begin
         if(Read==1) Dataout<= mem[Address];
         else if(Write==1) mem[Address]<=Datain ;
       end
	  else
	    begin
		   Dataout<=14'bz;
			mem[1]<=14'b00100000001111; // Load AC=M[15]
			mem[2]<=14'b00000000010101; // And AC,M[21]
			mem[3]<=14'b00010000010110; // Add AC,M[22]			
			mem[4]<=14'b00100000010111; // Load AC,M[23]
			mem[5]<=14'b00110000010111; // Save AC,M[23]
			mem[6]<=14'b01000010000000; // ShR AC	
			mem[7]<=14'b01110001000000; // ShL AC		
			mem[8]<=14'b00110000111111; // Save AC,M[127]	
			mem[9]<=14'b01110001000000; // ShL AC
			mem[10]<=14'b01000000001000; // BUN To 8	
			
		 /*MyMEM[ 9]=16'b1001000000000000; // OUTR AC
		   MyMEM[10]=16'b1000000000001010; // Jump to 10*/
		 end
   end
endmodule

