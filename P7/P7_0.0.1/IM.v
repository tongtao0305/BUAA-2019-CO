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
	
	//����һ��4096�ִ�С��ָ��洢����ÿ����Ϊ32λ
	reg [31:0] im[4095:0];
	
	//���ļ��ж�ȡָ������浽ָ��洢��
	initial begin 
		$readmemh("code.txt" , im) ;
		$readmemh("code_handler.txt", im, 1120, 2047);		
	end
	
	//��ָ��洢���ж�ȡָ��
	assign Instr = im[PC[13:2]];

endmodule
