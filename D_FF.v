module D_FF(Q,Q_bar,D,clk,reset);
 input D,clk,reset; 
 output reg Q,Q_bar ;
 always @(posedge clk,posedge reset)
  begin
    if(reset)
      begin
        Q<= 1'b0 ;
        Q_bar<= 1'b1 ;
      end
    else
      begin
        Q<= D ;
        Q_bar<= ~D ;
      end
  end
endmodule    
