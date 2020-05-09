`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:53 10/14/2019 
// Design Name: 
// Module Name:    Controller 
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
module Controller(
	 //��������ָ����������룬����ThirdIn��Branchָ���й�
    input [5:0] Op,
    input [5:0] Funct,
    //���ڼĴ������ڴ��д�ź�
	 output RegWrite,
    output MemtoReg,
	 output MemWrite,	  
	 //���ڶ�·ѡ�������ź�λ
    output ALUSrc,	 
	 output [3:0] ALUOp,	
	 output [1:0] RegDst,
    output [1:0] ExtOp,	 
    //Branch���ָ���ź�
	 output Branch,
	 output j,
	 output jal,
	 output jr
    );
	
	//����Ϊr��ָ��
	wire r, addu, subu;
	assign r = !Op[5] & !Op[4] & !Op[3] & !Op[2] & !Op[1] &!Op[0];
	assign addu = r & (Funct[5] & !Funct[4] & !Funct[3] & !Funct[2] & !Funct[1] & Funct[0]);	//addu = 000000 + 100001 
	assign subu = r & (Funct[5] & !Funct[4] & !Funct[3] & !Funct[2] & Funct[1] & Funct[0]);	//subu = 000000 + 100011  
	//����Ϊi��ָ��
	wire ori, lw, sw, lui;
	assign ori = !Op[5] & !Op[4] & Op[3] & Op[2] & !Op[1] & Op[0];	//ori = 001101
	assign lui = !Op[5] & !Op[4] & Op[3] & Op[2] & Op[1] & Op[0];	//lui = 001111
	assign lw = Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & Op[0];	//lw = 100011
	assign sw = Op[5] & !Op[4] & Op[3] & !Op[2] & Op[1] & Op[0];	//sw = 101011
	//����Ϊjump��ָ��
	assign j = !Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & !Op[0];		//j = 000010
	assign jal = !Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & Op[0];	//jal = 000011
	assign jr = r & (!Funct[5] & !Funct[4] & Funct[3] & !Funct[2] & !Funct[1] & !Funct[0]);	//jr = 000000 + 001000 
	//����ΪBranch��ָ��
	assign beq = !Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & !Op[0];	//beq = 000100 

	//����ź�
	assign RegWrite = addu | subu | ori | lw | lui | jal;
	assign MemWrite = sw;	
	assign MemtoReg = lw;
	
	assign RegDst[1] = jal;
	assign RegDst[0] = addu | subu;

	assign ALUSrc = ori | lw | sw | lui;

	assign ExtOp[1] = lw | sw;
	assign ExtOp[0] = lui;
	
	assign ALUOp[3] = 0;
	assign ALUOp[2] = 0;
	assign ALUOp[1] = ori;
	assign ALUOp[0] = subu | beq;
	
	assign Branch = beq;
	
endmodule
