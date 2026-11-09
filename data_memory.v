//128 byte 8 bit Data Memory behavioral description
module data_memory(Reset,Address,Read,Write,Datain,Clock,Dataout); 
  input Reset ;
  input [7:0] Datain ;
  input Read,Write,Clock ;
  input [6:0] Address ;
  output [7:0] Dataout ;
  reg [7:0] Dataout ;
  reg [7:0] mem[0:127] ;
  
  always @(posedge Clock)
    begin
      if(~Reset)
        begin
          if(Read==1) Dataout= mem[Address];
          else if(Write==1) mem[Address]=Datain ;
        end
      else
        begin
          Dataout<=8'bz ;
          mem[0]<=8'b00111001 ;
          mem[1]<=8'b11111111 ;
          mem[2]<=8'b00001010 ;
          mem[3]<=8'b00001110 ;
          mem[4]<=8'b00000011 ;
        end
    end
endmodule

