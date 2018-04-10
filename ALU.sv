module ALU
(
input logic [3:0] aluin_a,
input logic [3:0] aluin_b,
input logic [3:0] opcode,
input Cin,

output logic [3:0] alu_out,
output logic Cout,
output logic OF,
output logic zero);

logic [3:0] sum1,sum2,diff,carry1,carry2,carry3;
rippleadder ADDAB(aluin_a, aluin_b, 1'b0, sum1, carry1);
rippleadder AddC(aluin_a, aluin_b, Cin, sum2, carry2);
rippleadder SUB(aluin_a, ~(aluin_b), 1'b0, diff, carry3);


    always_comb begin
	unique case (opcode)
	    //match opcode with the operation.
	    //0111 = add
	    //0110 = add A and B and Cin
	    //0101 = sub A from B
	    //0100 = log. shift A right by amount B
	    //0011 = arith. shift A right by amount B
	    //0010 = log. shift A left by amount B
	    //0001 = arith. shift A left by amont B
	    //0000 = invert all bits in A
	
endmodule