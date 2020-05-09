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
    output reg [31:0] C,
    input [3:0] ALUOp,
    output [31:0] Zero,
	 output reg [31:0] Two
    );

	integer i;

	always @(*) begin
		case(ALUOp)
			4'b0000 : C = A + B;
			4'b0001 : C = A - B;
			4'b0010 : C = A | B;
			default : C = 32'h0;
		endcase
		
		Two = 0;
		if (A[31]==0) begin
			for (i=30;i>=0;i=i-1) begin
				Two = Two + A[i];
			end
		end
		
		$display("***%b %d",  A, Two); 
		
	end
	
	assign Zero = C;

endmodule
