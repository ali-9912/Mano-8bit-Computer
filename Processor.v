module Processor(Clock,Reset,PCin,ARin,IRin,TRin,ALUin,PCload,
                 PCincr,PCclear,ARload,ARincr,ARclear,ACload,
                 ACincr,ACclear,IRload,TRload,ALUS2,ALUS1,ALUS0,C_in,
                 PCout,ARout,ACout,TRout,Inst,Opcode,E,I);
                 
  input Clock,Reset,PCload,PCincr,PCclear,ARload,ARincr,ARclear,
        ACload,ACincr,ACclear,IRload,TRload,ALUS2,ALUS1,ALUS0,C_in ;
  input [9:0] PCin,ARin ;
  input [13:0] IRin ;
  input [9:0] TRin ;
  input [7:0] ALUin ;        
  output E,I ;
  output [2:0] Opcode ;
  output [9:0] Inst ;
  output [9:0] PCout,ARout ;
  output [7:0] ACout ;
  output [9:0] TRout ;
  
  wire [7:0] ACin ;
  wire [13:0] IRout ;
  
  assign Opcode={IRout[12],IRout[11],IRout[10]} ;
  assign Inst ={IRout[9],IRout[8],IRout[7],IRout[6],IRout[5],IRout[4],IRout[3],IRout[2],IRout[1],IRout[0]};
  assign I=IRout[13] ;
  
  PC ins1(PCin,Clock,PCload,PCincr,PCclear,PCout);
  AR ins2(ARin,Clock,ARload,ARincr,ARclear,ARout);
  IR ins3(IRin,Clock,IRload,IRout); 
  TR ins4(TRin,Clock,TRload,TRout);
  Accumulator ins5(ACin,Clock,ACload,ACincr,ACclear,ACout);
  ALU ins6(ACout,ALUin,{ALUS2,ALUS1,ALUS0},C_in,ACin,E); 
  
endmodule

