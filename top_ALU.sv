// Code your testbench here
// or browse Examples

module top_ALU
  ();

  logic [3:0] alu_a, alu_b, alu_out, opcode;
  logic alu_cin, alu_cout, alu_OF, alu_zero, clk;

  assign opcode = 4'b0101;
  assign alu_cin = 1'b1; 

  ALU firstALU(alu_a, alu_b, opcode, alu_cin, alu_out, alu_cout, alu_OF, alu_zero); 
  
  // clock
  initial begin 
    clk = 1'b0 ;
    while(1) begin
      #500 clk = 1'b0 ;
      #500 clk = 1'b1 ;
    end
  end
  
  // How long
  initial begin
    repeat(17) @(posedge clk) ; 
    $finish(1) ; 
  end

  //Driver Model
  int i;
  always @(negedge clk) begin
     alu_a = $random();
     alu_b = $random();
  end
  
  //Monitor
  always @(posedge clk) begin
     #1 ;
     $write( " %b", alu_a) ;
     $write( " ," );
     $write( " %b", alu_b) ;
     $write( " ," );
     $write( " %b", alu_out);
     $write( " ," );
     $write( " %b", alu_cout);
     $write( " ," );
     $write( " %b", alu_OF);
     $write( " ," );
     $write( " %b", alu_zero);
     $write("\n");
  end
   
endmodule
  
