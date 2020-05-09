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
    input [31:0] PC,
    output [31:0] Instr
    );
	
	//定义一个4096字大小的指令存储器，每个字为32位
	reg [31:0] im[4095:0];
	
	//从文件中读取指令，并保存到指令存储器
	initial begin 
		$readmemh("code.txt" , im) ;
		$readmemh("code_handler.txt", im, 1120, 2047);		
	end
	
	//从指令存储器中读取指令
	assign Instr = im[PC[13:2]];

endmodule
