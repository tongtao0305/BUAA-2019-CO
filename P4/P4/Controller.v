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
	 input [4:0] ThirdIn,
    //关于寄存器和内存读写信号
	 output RegWrite,
    output MemWrite,	 
	 output MemtoReg,
	 //用于多路选择器的信号位
    output [1:0] RegDst,
    output [1:0] ALUSrc,	 
    output [1:0] ExtOp,	 
    output [3:0] ALUOp,	 
	 //Jump和Branch的专用信号
	 output [2:0] Jump,
    output [2:0] Branch
    );
	
	//以下为r型指令
	wire r, addu, subu;
	assign r = !Op[5] & !Op[4] & !Op[3] & !Op[2] & !Op[1] &!Op[0];
	assign addu = r & (Funct[5] & !Funct[4] & !Funct[3] & !Funct[2] & !Funct[1] & !Funct[0]);	//addu = 000000 + 100001 
	assign subu = r & (Funct[5] & !Funct[4] & !Funct[3] & !Funct[2] & Funct[1] & !Funct[0]);	//subu = 000000 + 100011  
	//以下为i型和j型指令
	wire ori, lw, sw, lui;
	assign ori = !Op[5] & !Op[4] & Op[3] & Op[2] & !Op[1] & Op[0];	//ori = 001101
	assign lw = Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & Op[0];	//lw = 100011
	assign sw = Op[5] & !Op[4] & Op[3] & !Op[2] & Op[1] & Op[0];	//sw = 101011
	assign lui = !Op[5] & !Op[4] & Op[3] & Op[2] & Op[1] & Op[0];	//lui = 001111
	//Jump指令
	wire j, jal, jalr, jr;
	assign j = !Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & !Op[0];		//j = 000010
	assign jal = !Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & Op[0];	//jal = 000011
	assign jalr = r & (!Funct[5] & !Funct[4] & Funct[3] & !Funct[2] & !Funct[1] & Funct[0]);	//jalr = 000000 + 001001 
	assign jr = r & (!Funct[5] & !Funct[4] & Funct[3] & !Funct[2] & !Funct[1] & !Funct[0]);	//jr = 000000 + 001000 
	//Branch型指令
	wire beq, bne, bgez, bgtz, blez, bltz;
	assign beq = !Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & !Op[0];	//beq = 000100 
	assign bne = !Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & Op[0];	//bne = 000101 
	assign bgez = (!Op[5] & !Op[4] & !Op[3] & !Op[2] & !Op[1] & Op[0]) & (!ThirdIn[4] & !ThirdIn[3] & !ThirdIn[2] & !ThirdIn[1] & ThirdIn[0]);	//bgez = 000001 + 00001
	assign bgtz = (!Op[5] & !Op[4] & !Op[3] & Op[2] & Op[1] & Op[0]) & (!ThirdIn[4] & !ThirdIn[3] & !ThirdIn[2] & !ThirdIn[1] & !ThirdIn[0]);	//bgtz = 000111 + 00000	
	assign blez = (!Op[5] & !Op[4] & !Op[3] & Op[2] & Op[1] & !Op[0]) & (!ThirdIn[4] & !ThirdIn[3] & !ThirdIn[2] & !ThirdIn[1] & !ThirdIn[0]);	//blez = 000110 + 00000
	assign bltz = (!Op[5] & !Op[4] & !Op[3] & !Op[2] & !Op[1] & Op[0]) & (!ThirdIn[4] & !ThirdIn[3] & !ThirdIn[2] & !ThirdIn[1] & !ThirdIn[0]);	//bltz = 000001 + 00000		
	//内存操作指令
	wire lbu, lhu, lwl, sb, sh, swl;
	assign lbu = Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & !Op[0];
	assign lhu = Op[5] & !Op[4] & !Op[3] & Op[2] & !Op[1] & Op[0];
	assign lwl = Op[5] & !Op[4] & !Op[3] & !Op[2] & Op[1] & !Op[0];
	assign sb = Op[5] & !Op[4] & Op[3] & !Op[2] & !Op[1] & !Op[0];
	assign sh = Op[5] & !Op[4] & Op[3] & !Op[2] & !Op[1] & Op[0];
	assign swl = Op[5] & !Op[4] & Op[3] & !Op[2] & Op[1] & !Op[0];


	//输出信号
	assign RegWrite = addu | subu | ori | lw | lui | jal | jalr/*ori | jal | lbu | lhu | lwl*/;
	assign MemWrite = sw /*| sb | sh | swl*/;	
	assign MemtoReg = lw /*| lbu | lhu | lwl*/;
	
	assign RegDst[1] = jal;
	assign RegDst[0] = addu | subu | jalr;

	assign ALUSrc[1] = bgez | bgtz | blez | bltz;
	assign ALUSrc[0] = ori | lw |sw | lui;

	assign ExtOp[1] = lw | sw;
	assign ExtOp[0] = lui;
	
	assign ALUOp[3] = 0;
	assign ALUOp[2] = 0;
	assign ALUOp[1] = ori;
	assign ALUOp[0] = subu + beq;
	
	assign Jump[2] = j | jal | jalr | jr;
	assign Jump[1] = jalr | jr;
	assign Jump[0] = jal | jr;
	
	assign Branch[2] = bgtz | blez | bltz;
	assign Branch[1] = bne | bgez | bltz;
	assign Branch[0] = beq | bgez | blez;
	
endmodule
