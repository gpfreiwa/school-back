module ALU
(
input logic signed [3:0] aluin_a,
input logic signed [3:0] aluin_b,
input logic [3:0] opcode,
input Cin,
output logic signed [3:0] alu_out,
output logic Cout,
output logic OF,
output logic zero);

logic [7:0] A;
assign A = {aluin_a[3],aluin_a[3],aluin_a[3],aluin_a[3],aluin_a};
assign check1 = (aluin_a[3] ~^ aluin_b[3]);
assign check2 = (alu_out > 5'd31);
assign fcheck = check1 & check2;

always_comb begin
   unique case (opcode)
	4'b0111 : {Cout,alu_out} = aluin_a + aluin_b;
	4'b0110 : {Cout,alu_out} = aluin_a + aluin_b + Cin;
	4'b0101 : {Cout,alu_out} = aluin_a + (~aluin_b + 1);
	4'b0100 : {Cout,alu_out} = {1'b0,aluin_a} >> aluin_b;
	4'b0011 : {Cout,alu_out} = A >>> aluin_b;
	4'b0010 : {Cout,alu_out} = {1'b0,aluin_a} << aluin_b;
	4'b0001 : {Cout,alu_out} = {1'b0,aluin_a} <<< aluin_b;
	4'b0000 : {Cout,alu_out} = ~({1'b0,aluin_a});
   endcase
  
   unique case (opcode)
	4'b0111 : OF = fcheck ? 1'b1 : 1'b0;
	4'b0110 : OF = fcheck ? 1'b1 : 1'b0;
	4'b0101 : OF = fcheck ? 1'b1 : 1'b0;
	default OF = 1'b0;
   endcase
end

assign zero = alu_out ? 1'b0 : 1'b1;

endmodule
