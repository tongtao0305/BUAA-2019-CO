`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:43 10/14/2019 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [31:0] A,
    input [31:0] B,
	 input [4:0] s,
    output reg [31:0] C,
    input [3:0] ALUOp
    );

	always @(*) begin
		case(ALUOp)
			4'b0000 : C = A + B;							//add, addu
			4'b0001 : C = A - B;							//sub, subu
			4'b0010 : C = A & B;							//and
			4'b0011 : C = A | B;							//or
			4'b0100 : C = B << s;						//sll
			4'b0101 : C = B >> s;						//srl
			4'b0110 : C = $signed(B) >>> s;			//sra
			4'b0111: C = B << A[4:0];					//sllv
			4'b1000: C = B >> A[4:0];					//srlv	
			4'b1001: C = $signed(B) >>> A[4:0];		//srav
			4'b1010: C = (A & ~B) | (~A & B);		//xor
			4'b1011: C = ~(A | B);						//nor
			4'b1100: C = $signed(A) < $signed(B);	//slt
			4'b1101: C = A < B;							//sltu
			default : C = 32'h00000000;
		endcase
	end

endmodule
