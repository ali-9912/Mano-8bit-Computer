module CPU(Clock,Reset,FGI_ON,FGO_ON,Output_Regwr,input_Regrd,INP,OUT);
  input Clock,Reset,FGI_ON,FGO_ON ;
  input [7:0] INP ;
  output [7:0] OUT ;
  output Output_Regwr,input_Regrd ;
  
  wire [2:0] opcod ;
  wire i,r,e,fgi,fgo,pcld,pcinr,pccl,arld,arinr,arcl,drld,drinr,acld,acinr,IEN_out,R_J,R_K,FGI_J,FGI_K,FGO_J,FGO_K,
       accl,darld,irld,trld,alus2,alus1,alus0,datard,datawr,instrd,instwr,mselect,E_wir,IEN_J,IEN_K ;
  wire [3:0] addressbuspin ;
  wire [1:0] databuspin ;
  wire [7:0] acout ;
  wire [7:0] drout,drin,W ;
  wire [9:0] instr ;
  wire [9:0] pcout,arout,trout;
  wire [13:0] instmemout ;
  wire [13:0] addresscommon ;
  wire [7:0] datacommon ;
  wire [6:0] darout ;
  assign W= mselect ? INP : drout ;
  assign OUT=datacommon ;
  
  JK_FF E_ff(Clock,Reset,e,1'b0,E_wir,);
  JK_FF IEN_ff(Clock,Reset,IEN_J,IEN_K,IENout,) ;
  JK_FF R_ff(Clock,Reset,R_J,R_K,r,) ;
  JK_FF FGI_ff(Clock,Reset,FGI_ON,FGI_K,fgi,);
  JK_FF FGO_ff(Clock,Reset,FGO_ON,FGO_K,fgo,);
  
  ControlUnit ins1(.Clock(Clock),.Reset(Reset),.Opcode(opcod),.Inst(instr),.I(i),.R(r),.E(E_wir),.FGI(fgi),
                   .FGO(fgo),.ien_out(IENout),.AC(acout),.DR(drout),.AddressBusPin(addressbuspin),
                   .DataBusPin(databuspin),.PCload(pcld),.PCincr(pcinr),.PCclear(pccl),.ARload(arld),
                   .ARincr(arinr),.ARclear(arcl),.DRload(drld),.DRincr(drinr),.ACload(acld),.ACincr(acinr),
                   .ACclear(accl),.DARload(darld),.IRload(irld),.TRload(trld),.ALUS2(alus2),.ALUS1(alus1),
                   .ALUS0(alus0),.DatamemoryRead(datard),.DatamemoryWrite(datawr),.InstructionmemoryRead(instrd),
                   .InstructionmemoryWrite(instwr),.Select(mselect),.Ien_on(IEN_J),.Ien_off(IEN_K),.r_on(R_J),
                   .r_off(R_K),.fgi_off(FGI_K),.fgo_off(FGO_K),.Output_Regwr(Output_Regwr),.input_Regrd(input_Regrd)
                   );
                   
  Processor ins2(.Clock(Clock),.Reset(Reset),.PCin(addresscommon[9:0]),.ARin(addresscommon[9:0]),.IRin(addresscommon),
                 .TRin(addresscommon[9:0]),.ALUin(W),.PCload(pcld),.PCincr(pcinr),.PCclear(pccl),.ARload(arld),
                 .ARincr(arinr),.ARclear(arcl),.ACload(acld),.ACincr(acinr),.ACclear(accl),.IRload(irld),
                 .TRload(trld),.ALUS2(alus2),.ALUS1(alus1),.ALUS0(alus0),.C_in(1'b0),.PCout(pcout),.ARout(arout),
                 .ACout(acout),.TRout(trout),.Opcode(opcod),.Inst(instr),.E(e),.I(i)
                 );
  
  instruction_Memory ins3(.Reset(Reset),.Address(arout),.Read(instrd),.Write(instwr),
                          .Datain(addresscommon),.Clock(Clock),.Dataout(instmemout));
  
  data_memory ins4(.Reset(Reset),.Address(darout),.Read(datard),.Write(datawr),
                   .Datain(datacommon),.Clock(Clock),.Dataout(drin));
  
  DAR ins5(.I(instr[6:0]),.Clock(Clock),.LD(darld),.W(darout));
  
  DR ins6(.I(drin),.Clock(Clock),.LD(drld),.INCR(drinr),.W(drout));
  
  AddressBus ins7(.X(addressbuspin),.AR(arout),.PC(pcout),.TR(trout),.MEM(instmemout),.B(addresscommon));
  
  DataBus ins8(.X(databuspin),.AC(acout),.DR(drout),.B(datacommon));
  
endmodule

