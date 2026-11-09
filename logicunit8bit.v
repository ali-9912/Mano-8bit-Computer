//8 bit logic unit 
module logicunit8bit(AC,X,k1,k0,W);
  input [7:0] AC ;
  input [7:0] X ;
  input k1,k0;
  output [7:0] W ;
  
  logicunit bit0(AC[0],X[0],k1,k0,W[0]);
  logicunit bit1(AC[1],X[1],k1,k0,W[1]);
  logicunit bit2(AC[2],X[2],k1,k0,W[2]);
  logicunit bit3(AC[3],X[3],k1,k0,W[3]);
  logicunit bit4(AC[4],X[4],k1,k0,W[4]);
  logicunit bit5(AC[5],X[5],k1,k0,W[5]);
  logicunit bit6(AC[6],X[6],k1,k0,W[6]);
  logicunit bit7(AC[7],X[7],k1,k0,W[7]);
endmodule

