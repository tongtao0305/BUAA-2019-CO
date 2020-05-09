`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:19:44 10/14/2019 
// Design Name: 
// Module Name:    IM 
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
module IM(
	 input clk,
	 input clk2,
    input [31:0] PC,
    output [31:0] Instr
    );
	
	wire [31:0] Instr_temp;
	InstructionMemory InstructionMemory (.clka(clk2), .wea(4'b0000), .addra(PC/4), .dina(32'd0), .douta(Instr_temp));
	
	//从指令存储器中读取指令
	assign Instr = ((PC[1:0] == 2'b00) & (32'h0000 <= PC) & (PC <= 32'h1FFF)) ? Instr : 32'h0;

endmodule
