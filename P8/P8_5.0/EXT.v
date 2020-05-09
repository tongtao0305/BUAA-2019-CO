`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:20 10/14/2019 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0] Imm16,
    output reg [31:0] Ext32,
    input [1:0] ExtOp
    );

	always @(*) begin
		case (ExtOp)
			2'b00 : Ext32 = {16'b0000000000000000,Imm16[15:0]};
			2'b01 : Ext32 = {Imm16[15:0],16'b0000000000000000};
			2'b10 : Ext32 = {{16{Imm16[15]}},Imm16[15:0]};
			default Ext32 = 32'h00000000;
		endcase
	end

endmodule
