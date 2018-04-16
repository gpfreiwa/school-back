/*
 *  The register file.  ra, rb, and rd are the address of the a, b, and d registers.
 *  The signal writed must be a 1 for the destination (d) register to be written.
 */
module rf
#(
   bw = 8,
   aw = 4
 )
 (
  input  logic [aw-1:0] ra,
  input  logic [aw-1:0] rb,
  input  logic [aw-1:0] rd,
  output logic [bw-1:0] a,
  output logic [bw-1:0] b,
  input  logic [bw-1:0] d,
  input  logic          writed,
  input  logic          clk,
  input  logic          rst
 );

  parameter nr = 1 << aw;  

  /* DO NOT change the following line or the grader will fail!
   * Use these registers and no others!
   */
  logic  [bw-1:0] R    [nr-1:0];
  logic  En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF; 

always_comb begin
	unique case (ra)
		4'b0000: a = R[0];
		4'b0001: a = R[1];
		4'b0010: a = R[2];
		4'b0011: a = R[3];
		4'b0100: a = R[4];
		4'b0101: a = R[5];
		4'b0110: a = R[6];
		4'b0111: a = R[7];
		4'b1000: a = R[8];
		4'b1001: a = R[9];
		4'b1010: a = R[10];
		4'b1011: a = R[11];
		4'b1100: a = R[12];
		4'b1101: a = R[13];
		4'b1110: a = R[14];
		4'b1111: a = R[15];
		default: a = '0;
	endcase
	unique case (rb)
		4'b0000: b = R[0];
		4'b0001: b = R[1];
		4'b0010: b = R[2];
		4'b0011: b = R[3];
		4'b0100: b = R[4];
		4'b0101: b = R[5];
		4'b0110: b = R[6];
		4'b0111: b = R[7];
		4'b1000: b = R[8];
		4'b1001: b = R[9];
		4'b1010: b = R[10];
		4'b1011: b = R[11];
		4'b1100: b = R[12];
		4'b1101: b = R[13];
		4'b1110: b = R[14];
		4'b1111: b = R[15];
		default: b = '0;
	endcase
	unique case ({writed,rd})
		5'b10000: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b1000000000000000;  
		5'b10001: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0100000000000000;  
		5'b10010: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0010000000000000;  
		5'b10011: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0001000000000000;  
	 	5'b10100: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000100000000000; 
		5'b10101: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000010000000000;  
		5'b10110: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000001000000000; 
		5'b10111: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000100000000; 
		5'b11000: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000010000000; 
		5'b11001: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000001000000; 
		5'b11010: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000100000; 
		5'b11011: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000010000; 
		5'b11100: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000001000; 
		5'b11101: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000000100; 
		5'b11110: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000000010; 
		5'b11111: {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000000001; 
		default : {En0,En1,En2,En3,En4,En5,En6,En7,En8,En9,EnA,EnB,EnC,EnD,EnE,EnF} = 16'b0000000000000000; 
	endcase
end

dff #(bw) reg0(.d(d),.q(R[0]), .en(En0),.clk(clk),.rst(rst));
dff #(bw) reg1(.d(d),.q(R[1]), .en(En1),.clk(clk),.rst(rst));
dff #(bw) reg2(.d(d),.q(R[2]), .en(En2),.clk(clk),.rst(rst));
dff #(bw) reg3(.d(d),.q(R[3]), .en(En3),.clk(clk),.rst(rst));
dff #(bw) reg4(.d(d),.q(R[4]), .en(En4),.clk(clk),.rst(rst));
dff #(bw) reg5(.d(d),.q(R[5]), .en(En5),.clk(clk),.rst(rst));
dff #(bw) reg6(.d(d),.q(R[6]), .en(En6),.clk(clk),.rst(rst));
dff #(bw) reg7(.d(d),.q(R[7]), .en(En7),.clk(clk),.rst(rst));
dff #(bw) reg8(.d(d),.q(R[8]), .en(En8),.clk(clk),.rst(rst));
dff #(bw) reg9(.d(d),.q(R[9]), .en(En9),.clk(clk),.rst(rst));
dff #(bw) rega(.d(d),.q(R[10]),.en(EnA),.clk(clk),.rst(rst));
dff #(bw) regb(.d(d),.q(R[11]),.en(EnB),.clk(clk),.rst(rst));
dff #(bw) regc(.d(d),.q(R[12]),.en(EnC),.clk(clk),.rst(rst));
dff #(bw) regd(.d(d),.q(R[13]),.en(EnD),.clk(clk),.rst(rst));
dff #(bw) rege(.d(d),.q(R[14]),.en(EnE),.clk(clk),.rst(rst));
dff #(bw) regf(.d(d),.q(R[15]),.en(EnF),.clk(clk),.rst(rst));

endmodule // rf
