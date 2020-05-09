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
	 //用来鉴别指令的三个输入，其中ThirdIn与Branch指令有关
    input [5:0] Op,
    input [5:0] Funct,
    //关于寄存器和内存读写信号
	 output RegWrite,
    output MemWrite,	 
	 output MemtoReg,
	 //用于多路选择器的信号位
    output [1:0] RegDst,
    output [1:0] ALUSrc,	 
    output [1:0] ExtOp,	 
    output [3:0] ALUOp,	 
    //Branch相关指令信号
	 output beq,
	 output bne,
	 //Jump相关指令信号
	 output j,
	 output jal,
	 output jalr,
	 output jr,
	 //以下为内存操作指令
	 output b,
	 output h,
	 output w
    );
	
	//以下为r型指令
	wire r, addu, subu;
	assign r = !Op[5] & !Op[4] & !Op[3] & !Op[2] & !Op[1] &!Op[0];
	assign addu = r & (Funct[5] & !Funct[4] & !Funct[3] & !Funct[2] & !Funct[1] & Funct[0]);	//addu = 000000 + 100001 
	assign subu = r & (Funct[5] & !Funct[4] & !Funct[3] & !Funct[2] & Funct[1] & Funct[0]);	//subu = 000000 + 100011  
	//以下为i型指令
	wire ori, lw, sw, lui;
	assign ori = !Op[5] & !Op[4] & Op[3] & Op[2] & !Op[1] & Op[0];	//ori = 001101
	assign lw = Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & Op[0];	//lw = 100011
	assign sw = Op[5] & !Op[4] & Op[3] & !Op[2] & Op[1] & Op[0];	//sw = 101011
	assign lui = !Op[5] & !Op[4] & Op[3] & Op[2] & Op[1] & Op[0];	//lui = 001111
	//以下为jump型指令
	assign j = !Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & !Op[0];		//j = 000010
	assign jal = !Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & Op[0];	//jal = 000011
	assign jalr = r & (!Funct[5] & !Funct[4] & Funct[3] & !Funct[2] & !Funct[1] & Funct[0]);	//jalr = 000000 + 001001 
	assign jr = r & (!Funct[5] & !Funct[4] & Funct[3] & !Funct[2] & !Funct[1] & !Funct[0]);	//jr = 000000 + 001000 
	//以下为Branch型指令
	assign beq = !Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & !Op[0];	//beq = 000100 
	assign bne = !Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & Op[0];	//bne = 000101 
	
	//内存操作指令
	wire lbu, lhu, lwl, sb, sh, swl;
	assign lbu = Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & !Op[0];	//100100
	assign lhu = Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & Op[0];		//100101
	assign lwl = Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & !Op[0];
	assign sb = Op[5] & !Op[4] & Op[3] & !Op[2] & !Op[1] & !Op[0];		//101000
	assign sh = Op[5] & !Op[4] & Op[3] & !Op[2] & !Op[1] & Op[0];		//101001
	assign swl = Op[5] & !Op[4] & Op[3] & !Op[2] & Op[1] & !Op[0];


	//输出信号
	assign RegWrite = addu | subu | ori | lw | lui | jal | jalr | lbu | lhu | lwl;
	assign MemWrite = sw | sb | sh | swl;	
	assign MemtoReg = lw | lbu | lhu | lwl;
	
	assign RegDst[1] = jal;
	assign RegDst[0] = addu | subu | jalr;

	assign ALUSrc[1] = 0;
	assign ALUSrc[0] = ori | lw | sw | lui | lbu | lhu | sb | sh;

	assign ExtOp[1] = lw | sw | sb | sh;
	assign ExtOp[0] = lui;
	
	assign ALUOp[3] = 0;
	assign ALUOp[2] = 0;
	assign ALUOp[1] = ori;
	assign ALUOp[0] = subu | beq;
	
	assign b = lbu | sb;
	assign h = lhu | sh;
	assign w = lwl | swl;
	
endmodule
