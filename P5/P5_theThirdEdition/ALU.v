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
    input [3:0] ALUOp
    );

	always @(*) begin
		case(ALUOp)
			4'b0000 : C = A + B;
			4'b0001 : C = A - B;
			4'b0010 : C = A | B;
			default : C = 32'h0;
		endcase
	end

endmodule
