// cpu_v2.sv

module cpu_v2
(
  input  logic 	   clk,
  input  logic 	   rst,
  output logic     halt
);

parameter ibw = 16;
parameter dbw =  8;
parameter aw  =  8;

logic [aw-1:0]	PC,nextPC;
logic [3:0]	opcode,regAddrA,regAddrB,regAddrD;
logic [dbw-1:0]	Aout,Bout,regData;
logic [ibw-1:0]	IR;
logic 		cmpj,jump,writed;

dff #(aw) myPC(.d(nextPC),.q(PC),.en(1'b1),.rst(rst),.clk(clk));
always_comb begin
	unique case ({cmpj,jump})
		{1'b0,1'b1}: nextPC = regData;
		{1'b1,1'b0}: nextPC = PC + regAddrD;
		default : nextPC = PC+1;
	endcase
end

assign opcode   = IR[15:12];
assign regAddrA = IR[11: 8];
assign regAddrB = IR[7 : 4];
assign regAddrD = IR[3 : 0];

//ALU
always_comb begin
	unique case (opcode)
		4'b0001: regData = {regAddrA,regAddrB};		//ldi
		4'b0010: regData = Aout + Bout; 		//add
		4'b0011: regData = Aout + regAddrB; 		//adi
		4'b0100: regData = Aout + (~Bout+1'b1);		//sub
		4'b0101: regData = Aout * Bout;			//mult
		4'b0110: regData = Aout / Bout;			//div
		4'b0111: regData = Bout + 1'b1;			//INC
		4'b1000: regData = Bout - 1'b1;			//DEC
		4'b1001: regData = Aout | Bout;			//NOR
		4'b1010: regData = Aout & Bout;			//AND
		4'b1011: regData = Aout ^ Bout;			//XOR
		4'b1100: regData = ~Bout;			//INV
		4'b1101: regData = {regAddrA,regAddrB};		//jmpq
		4'b1110: regData = {regAddrA,regAddrB};		//cndj
		default: regData = '0;
	endcase
end

assign halt = (opcode == 4'b0000);
assign jump = (opcode == 4'b1101);
assign cmpj = ((opcode == 4'b1110)&(Aout >= Bout));

always_comb begin
	unique case (opcode)
		4'b1101: writed = 1'b0;
		4'b1110: writed = 1'b0;
		4'b1111: writed = 1'b0;
		4'b0000: writed = 1'b0;
		default: writed = 1'b1;
	endcase
end


  /* DO NOT change the name "register" below, or the grader will fail!   */
  rf #(dbw, 4) registers
                   (.ra(regAddrA), .rb(regAddrB), .rd(regAddrD), .a(Aout), .b(Bout), .d(regData),
                    .writed(writed),
                    .clk( clk ), .rst( rst ) );


  /* DO NOT change the name "MEM" below, or the grader will fail!   */
  memory  #( .bW(ibw), .aW(aw), .eC(50) )     MEM
           ( .writeAddr(PC), .readAddr (PC),
             .writeData('0),
             .readData (IR),
             .writeEn  ('0),
             .clk      ( clk )
           );

endmodule

