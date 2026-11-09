module ControlUnit(Clock,Reset,Inst,I,R,E,FGI,FGO,ien_out,AC,DR,Opcode,AddressBusPin,DataBusPin,PCload,PCincr,
                   PCclear,ARload,ARincr,ARclear,DRload,DRincr,ACload,ACincr,ACclear,DARload,IRload,
                   TRload,ALUS2,ALUS1,ALUS0,DatamemoryRead,DatamemoryWrite,InstructionmemoryRead,
						       InstructionmemoryWrite,Select,Ien_on,Ien_off,r_on,r_off,fgi_off,fgo_off,Output_Regwr,input_Regrd);
		               
	input Clock,Reset,I,R,E,FGI,FGO,ien_out ;
	input [2:0] Opcode ;
	input [9:0] Inst ;
   input [7:0] DR ;
   input [7:0] AC ;	
	output PCload,PCincr,PCclear,ARload,ARincr,ARclear,DRload,DRincr,Ien_on,Ien_off,fgi_off,fgo_off,
	       ACload,ACincr,ACclear,DARload,IRload,TRload,ALUS2,ALUS1,ALUS0,Select,r_on,r_off,
		     DatamemoryRead,DatamemoryWrite,InstructionmemoryRead,InstructionmemoryWrite,Output_Regwr,input_Regrd ;
	output [3:0] AddressBusPin ;
   output [1:0] DataBusPin ;
		     
	wire [7:0] T ;
	wire [7:0] D ;
	wire [2:0] A ;
	wire Counter_reset ;
	
	SequenceCounter tribit(Counter_reset,Clock,A);
	Decoder3to8 D1(A,T);
	Decoder3to8 D2(Opcode,D);
	Controlgate m1(Reset,I,R,E,FGI,FGO,ien_out,D,T,AC,Inst,DR,AddressBusPin,DataBusPin,
	               PCload,PCincr,PCclear,ARload,ARincr,ARclear,DRload,DRincr,
						ACload,ACincr,ACclear,DARload,IRload,TRload,
						ALUS2,ALUS1,ALUS0,DatamemoryRead,DatamemoryWrite,
						InstructionmemoryRead,InstructionmemoryWrite,Select,
						Ien_on,Ien_off,r_on,r_off,fgi_off,fgo_off,Counter_reset,Output_Regwr,input_Regrd);
	
endmodule
