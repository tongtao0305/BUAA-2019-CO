`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:45 12/01/2018 
// Design Name: 
// Module Name:    Forward 
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
module Forward(
	 //�������λ����Ҫ�ĵ�ַ�ź�
    input [4:0] A1_D,
    input [4:0] A2_D,
	 input [4:0] A1_E,
    input [4:0] A2_E,
	 input [4:0] A2_M,	 
	 //����Ϊ�����������ݽ׶ε��ź�
	 input RegWrite_E,
    input RegWrite_M,
    input RegWrite_W,
	 input [4:0] A3_E,
    input [4:0] A3_M,
	 input [4:0] A3_W,	 
	 input [1:0] Tnew_E,
	 input [1:0] Tnew_M,
	 input [1:0] Tnew_W,
	 //����Ϊ��������ת���ź�
    output [2:0] ForwardRSD,
    output [2:0] ForwardRTD,
    output [2:0] ForwardRSE,
    output [2:0] ForwardRTE,
    output [2:0] ForwardRTM
    );
	 
	 assign ForwardRSD = (A1_D == A3_E) & (Tnew_E == 2'b00) & (A3_E != 0) & RegWrite_E? 3'b001:		// EX �׶���Ҫת��
								(A1_D == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & RegWrite_M? 3'b010:		// MEM �׶���Ҫת��
								(A1_D == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & RegWrite_W? 3'b011:		// WB �׶���Ҫת��
								3'b000;																							//����ת��
	
	 assign ForwardRTD = (A2_D == A3_E) & (Tnew_E == 2'b00) & (A3_E != 0) & RegWrite_E? 3'b001:		// EX �׶���Ҫת��
								(A2_D == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & RegWrite_M? 3'b010:		// MEM �׶���Ҫת��
								(A2_D == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & RegWrite_W? 3'b011:		// WB �׶���Ҫת��
								3'b000;																							//����ת��
								
	 assign ForwardRSE = (A1_E == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & RegWrite_M? 3'b001:		// MEM �׶���Ҫת��
								(A1_E == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & RegWrite_W? 3'b010:		// WB �׶���Ҫת��
								3'b000;																							//����ת��
								
	 assign ForwardRTE = (A2_E == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & RegWrite_M? 3'b001:		// MEM �׶���Ҫת��
								(A2_E == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & RegWrite_W? 3'b010:		// WB �׶���Ҫת��
								3'b000;																							//����ת��
	
	 assign ForwardRTM = (A2_M == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & RegWrite_W? 3'b001:		// WB �׶���Ҫת��
								3'b000;																							//����ת��
	
endmodule


