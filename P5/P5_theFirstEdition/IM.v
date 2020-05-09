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
	
	//����һ��1024�ִ�С��ָ��洢����ÿ����Ϊ32λ
	reg [31:0] im[0:1023];
	
	//���ļ��ж�ȡָ������浽ָ��洢��
	initial begin 
		$readmemh("code.txt" , im) ;
	end
	
	//��ָ��洢���ж�ȡָ��
	assign Instr = im[PC[11:2]];

endmodule
