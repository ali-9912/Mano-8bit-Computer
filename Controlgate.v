`timescale 1ns/1ns 

module Controlgate(Reset,I,R,E,FGI,FGO,ien_out,D,T,AC,B,DR,AddressBusPin,DataBusPin,PCload,
                   PCincr,PCclear,ARload,ARincr,ARclear,DRload,DRincr,ACload,ACincr,
						       ACclear,DARload,IRload,TRload,ALUS2,ALUS1,ALUS0,DatamemoryRead,DatamemoryWrite,
						       InstructionmemoryRead,InstructionmemoryWrite,Sel,Ien_on,Ien_off,R_on,R_off,
						       fgi_off,fgo_off,Counter_reset,Output_Regwr,input_Regrd);

 
 input [7:0] D ;
 input [7:0] T ;
 input [7:0] DR ;
 input [7:0] AC ;
 input [9:0] B ;
 input Reset,R,I,E,FGI,FGO,ien_out ;
 output PCload,PCincr,PCclear,ARload,ARincr,ARclear,
		    DRload,DRincr,ACload,ACincr,ACclear,Sel,R_on,R_off,Counter_reset,Output_Regwr,input_Regrd,
		    DARload,IRload,TRload,ALUS2,ALUS1,ALUS0,Ien_on,Ien_off,fgi_off,fgo_off,
		    DatamemoryRead,DatamemoryWrite,InstructionmemoryRead,InstructionmemoryWrite ;
		    
 output [3:0] AddressBusPin ;
 output [1:0] DataBusPin ;
		  
 wire a1,a2,a3,a4,a5,a6,a7,a8,r,p ;
 wire [7:0] n ;
 
 and S0(PCload,T[4],D[4]);
 and S1(PCclear,T[1],R);
 and S2(r,D[7],T[3],~I);
 and S3(p,D[7],I,T[3]) ;
 nor S4(a1,DR[0],DR[1],DR[2]);
 nor S5(a2,DR[3],DR[4],DR[5]);
 nor S6(a3,DR[6]|DR[7]);
 and S7(a4,a1,a2,a3) ;
 nor S8(a5,AC[0],AC[1],AC[2]);
 nor S9(a6,AC[3],AC[4],AC[5]);
 nor S10(a7,AC[6]|AC[7]);
 and S11(a8,a5,a6,a7) ;
 
 assign #200 Counter_reset= Reset|p|r|(R&T[2])|(D[0]&T[5])|(D[1]&T[5])|(D[2]&T[5])|(D[3]&T[4])|(D[4]&T[4])|(D[5]&T[5])|(D[6]&T[6]);
 assign PCincr = (~R & T[1])|(R&T[2])|(a4&D[6]&T[6])|(~AC[7]&r&B[4])|(AC[7]&r&B[3])|(a8&r&B[2])|(~E&r&B[1])|(FGI&p&B[7])|(FGO&p&B[6]) ;
 assign ARload = (~R&T[0]) ;
 assign ARincr = T[4]&D[5];
 assign ARclear = R&T[0] ;
 assign DRload = (D[0]&T[4])|(D[1]&T[4])|(D[2]&T[3])|(D[6]&T[4]) ;
 assign DRincr = D[6]&T[5] ;
 assign ACload = (D[0]&T[5])|(D[1]&T[5])|(D[2]&T[5])|(r&B[6])|(r&B[7])|(r&B[8]) ;
 assign ACincr = r&B[5];
 assign ACclear = r&B[9] ;
 assign DARload = ~R&T[2] ;
 assign IRload = ~R&T[1] ;
 assign TRload = R&T[0] ;
 assign #20 InstructionmemoryRead =~R&T[0] ;
 assign InstructionmemoryWrite =R&T[1] ;
 assign DatamemoryRead = (D[0]&T[4])|(D[1]&T[4])|(D[2]&T[3])|(D[6]&T[4]) ;
 assign DatamemoryWrite = (D[3]&T[4])|(D[5]&T[4])|(D[6]&T[6]) ;
 assign AddressBusPin[0]=(D[4]&T[4])|(D[5]&T[4]) ;
 assign AddressBusPin[1]=(~R&T[0])|(R&T[0])|(D[5]&T[4]) ;
 assign AddressBusPin[2]=R&T[1] ;
 assign AddressBusPin[3]=~R&T[1] ;
 assign DataBusPin[0]=D[6]&T[6] ;
 assign DataBusPin[1]=(D[3]&T[4])|(p&B[8]);
 assign Sel= p&B[9] ;
 assign Ien_on = p&B[5] ;
 assign Ien_off= (p&B[4])|(R&T[2]) ;
 assign R_on= ~T[0]&(~T[1])&(~T[2])&ien_out&(FGI|FGO) ;
 assign R_off = R&T[2] ;
 assign fgi_off = p&B[9] ;
 assign fgo_off = p&B[8] ;
 assign input_Regrd = FGI&p&B[9] ;
 assign Output_Regwr =FGO&p&B[8] ;
 
 assign n[0]=(D[2]&T[5])|(p&B[9]) ;
 assign n[1]=D[1]&T[5] ;
 assign n[2]=D[0]&T[5] ;
 assign n[3]=r&B[9] ;
 assign n[4]=r&B[7] ;
 assign n[5]=r&B[6] ;
 assign n[6]=1'b0 ;
 assign n[7]=1'b0 ;
 
 Encoder8to3 j0(n,{ALUS2,ALUS1,ALUS0});

endmodule 
