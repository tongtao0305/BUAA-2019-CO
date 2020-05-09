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
`define T_PC 2'b00
`define T_ALU 2'b01
`define T_DM 2'b10

module Controller(
	 //ָ��
    input [31:0] Instr,
    //���ڼĴ������ڴ��д�ź�
	 output RegWrite,
    output MemtoReg,
	 output MemWrite,	  
	 //���ڶ�·ѡ�������ź�λ
    output ALUSrc,	 
	 output [3:0] ALUOp,	
	 output [1:0] RegDst,
    output [1:0] ExtOp,	 
    //ָ������ź�
	 output [1:0] Store,
	 output [2:0] Load,
	 output [2:0] Branch,
	 output [2:0] Jump,
	 //����ת�����ź�
	 output Tuse_RSD,
	 output Tuse_RTD,
	 output Tuse_RSE,
	 output Tuse_RTE,
	 output Tuse_RTM,
	 output reg [1:0] Tnew_D,
	 //��������ź�
	 output BGEZAL,
	 output BLTZAL,
	 output TT1
    );
	 
	wire [5:0] Op, Fun;
	assign Op = Instr[31:26];
	assign Fun = Instr[5:0];
	 
	//Nopָ��
	wire NOP;
	assign NOP = (Instr == 32'b0);
	
	//����Ϊ��һ��ָ��õ�RS�Ĵ�����R��ָ��
	wire R1, ADD, ADDU, SUB, SUBU, SLLV, SRLV, SRAV, AND, OR, XOR, NOR, SLT, SLTU; 
	assign ADD	=	(Op == 6'b000000)	&&	(Fun == 6'b100000);
	assign ADDU	=	(Op == 6'b000000)	&& (Fun == 6'b100001);
	assign SUB	=	(Op == 6'b000000) && (Fun == 6'b100010);
	assign SUBU	=	(Op == 6'b000000) && (Fun == 6'b100011);
	assign SLLV	=	(Op == 6'b000000) && (Fun == 6'b000100);
	assign SRLV	=	(Op == 6'b000000) && (Fun == 6'b000110);
	assign SRAV	=	(Op == 6'b000000) && (Fun == 6'b000111);
	assign AND	=	(Op == 6'b000000) && (Fun == 6'b100100);
	assign OR	=	(Op == 6'b000000) && (Fun == 6'b100101);
	assign XOR	=	(Op == 6'b000000) && (Fun == 6'b100110);
	assign NOR	=	(Op == 6'b000000) && (Fun == 6'b100111);
	assign SLT	=	(Op == 6'b000000) && (Fun == 6'b101010);
	assign SLTU	=	(Op == 6'b000000) && (Fun == 6'b101011);
	assign R1 = ADD | ADDU | SUB | SUBU | SLLV | SRLV | SRAV | AND | OR | XOR | NOR | SLT | SLTU;
	
	//����Ϊ�ڶ���ָ�û���õ�RS�Ĵ�����R��ָ��
	wire R2, SLL, SRL, SRA;
	assign SLL = (Op == 6'b000000) && (Fun == 6'b000000) && (!NOP);
	assign SRL = (Op == 6'b000000) && (Fun == 6'b000010);
	assign SRA = (Op == 6'b000000) && (Fun == 6'b000011);
	assign R2 = SLL | SRL | SRA;
	
	//����Ϊ������ָ��õ�RS�Ĵ�����I��ָ��
	wire I1, ADDI, ADDIU, ANDI, ORI, XORI, SLTI, SLTIU;
	assign ADDI	=	(Op == 6'b001000);
	assign ADDIU=	(Op == 6'b001001);
	assign ANDI	=	(Op == 6'b001100);
	assign ORI	=	(Op == 6'b001101);
	assign XORI	=	(Op == 6'b001110);
	assign SLTI	=	(Op == 6'b001010);
	assign SLTIU=	(Op == 6'b001011);
	assign I1 = ADDI | ADDIU | ANDI | ORI | XORI | SLTI | SLTIU;
   
	//����Ϊ������ָ�û���õ�RS�Ĵ�����I��ָ��
	wire I2, LUI;
	assign LUI = (Op == 6'b001111);	
	assign I2 = LUI;
	
	//����Ϊ������ָ�STORE��ָ��	
	wire SB, SH, SW;
	assign SB = (Op == 6'b101000);
	assign SH = (Op == 6'b101001);
	assign SW = (Op == 6'b101011);
	assign Store[1] = SH | SW;
	assign Store[0] = SB | SW;
	
	//����Ϊ������ָ�LOAD��ָ��
	wire LB, LBU, LH, LHU, LW;
	assign LB	=	(Op == 6'b100000);
	assign LBU	=	(Op == 6'b100100);
	assign LH	=	(Op == 6'b100001);
	assign LHU	=	(Op == 6'b100101);
	assign LW	=	(Op == 6'b100011);
	assign Load[2] = LHU | LW;
	assign Load[1] = LBU | LH;
	assign Load[0] = LB | LH | LW;

	//����Ϊ������ָ�Branch��ָ��
	wire BEQ, BNE, BLEZ, BGTZ, BLTZ, BGEZ;	
	assign BEQ	=	(Op == 6'b000100);
	assign BNE	=	(Op == 6'b000101);
	assign BLEZ =	(Op == 6'b000110) && (Instr[20:16] == 5'b00000);
	assign BGTZ =	(Op == 6'b000111) && (Instr[20:16] == 5'b00000);
	assign BLTZ =	(Op == 6'b000001) && (Instr[20:16] == 5'b00000);
	assign BGEZ =	(Op == 6'b000001) && (Instr[20:16] == 5'b00001);
	assign Branch[2] = BLEZ | BGTZ | BLTZ | BGEZ;
	assign Branch[1] = BNE | BLTZ | BGEZ;
	assign Branch[0] = BEQ | BGTZ | BGEZ;	

	//����Ϊ�ڰ���ָ�Jump��ָ��
	assign J		=	(Op == 6'b000010);
	assign JAL	=	(Op == 6'b000011);
	assign JALR	=	(Op == 6'b000000) & (Fun == 6'b001001) & (Instr[20:16] == 5'b00000) & (Instr[10:6] == 5'b00000);
	assign JR	=	(Op == 6'b000000) & (Fun == 6'b001000) & (Instr[20:11] == 5'b00000) & (Instr[10:6] == 5'b00000);
	assign Jump[2] = J | JAL | JALR | JR;
	assign Jump[1] = JALR | JR;
	assign Jump[0] = JAL | JR;		
	
	//��������ָ���Ҫ�ţ����ͣ�
	assign BGEZAL = (Op == 6'b000001) & (Instr[20:16] == 5'b10001);
	assign BLTZAL = (Op == 6'b000001) & (Instr[20:16] == 5'b10000);	
	assign TT1 = (Op == 6'b000000) && (Fun == 6'b110000);
		
	//����ź�
	assign RegWrite = R1 | R2 | I1 | I2 | (Load > 0) | (JAL | JALR) | BGEZAL | BLTZAL | TT1;
	assign MemWrite = (Store > 0);	
	assign MemtoReg = (Load > 0);
	
	
	assign RegDst = (R1 | R2 | JALR | TT1) ? 		2'b01 :		//rd
						 (JAL | BGEZAL | BLTZAL) ? 		2'b10 : 		//ra31
						 2'b00;										//rt

	assign ALUSrc = I1 | I2 | (Store > 0) | (Load > 0);		//��Ҫ�õ�������

	assign ExtOp = (LUI) ? 																				2'b01 :	//��λ����
						((ADDI | ADDIU | SLTI | SLTIU) | (Store > 0) | (Load > 0)) ? 		2'b10 :	//������չ
						2'b00;																							//��λ����
	
	assign ALUOp[3] = (SRLV | SRAV | XOR | NOR | SLT | SLTU) |
							(XORI | SLTI | SLTIU);
	assign ALUOp[2] = (SLL |SRL | SRA | SLLV | SLT | SLTU) |
							(SLTI | SLTIU);
	assign ALUOp[1] = (SRA | SLLV | AND | OR | XOR | NOR) |
							(ANDI | ORI | XORI);
	assign ALUOp[0] = (SUB | SUBU | SRL | SLLV | SRAV | OR | NOR | SLTU) | 
							(ORI | SLTIU);
	
	assign Tuse_RSD = (Branch > 0) | JR | JALR | BGEZAL | BLTZAL; 
	assign Tuse_RTD = (Branch > 0 & !Branch[2]); 
	assign Tuse_RSE = R1 | I1 | (Load > 0) | (Store > 0) | TT1;
	assign Tuse_RTE = R1 | R2 | TT1;
	assign Tuse_RTM = (Store > 0);
	 
	always @(*) begin
		if (R1 | R2 | I1 | I2 | TT1)
			Tnew_D <= `T_ALU + 1;
		else if (Load > 0)
			Tnew_D <= `T_DM + 1;
		else 
			Tnew_D <= `T_PC;
	end
	
endmodule