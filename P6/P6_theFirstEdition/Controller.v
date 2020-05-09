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
	 //指令
    input [31:0] Instr,
    //关于寄存器和内存读写信号
	 output RegWrite,
    output MemtoReg,
	 output MemWrite,	  
	 //用于多路选择器的信号位
    output ALUSrc,	 
	 output [3:0] ALUOp,	
	 output [1:0] RegDst,
    output [1:0] ExtOp,	 
    //指令输出信号
	 output [1:0] Store,
	 output [2:0] Load,
	 output [2:0] Branch,
	 output [2:0] Jump,
	 //乘除指令相关信号
	 output MDMStart,
	 output MDMAddr,
	 output MDMWrite,
	 output [2:0] MDMOp,
	 output [1:0] MDMtoReg,
	 output MDMHILO,
	 output MDMHILOTF,
	 //用于转发的信号
	 output Tuse_RSD,
	 output Tuse_RTD,
	 output Tuse_RSE,
	 output Tuse_RTE,
	 output Tuse_RTM,
	 output reg [1:0] Tnew_D
    );
	 
	wire [5:0] Op, Fun;
	assign Op = Instr[31:26];
	assign Fun = Instr[5:0];
	 
	//Nop指令
	wire NOP;
	assign NOP = (Instr == 32'b0);
	
	//以下为第一类指令，用到RS寄存器的R型指令
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
	
	//以下为第二类指令，没有用到RS寄存器的R型指令
	wire R2, SLL, SRL, SRA;
	assign SLL = (Op == 6'b000000) && (Fun == 6'b000000) &(!NOP);
	assign SRL = (Op == 6'b000000) && (Fun == 6'b000010);
	assign SRA = (Op == 6'b000000) && (Fun == 6'b000011);
	assign R2 = SLL | SRL | SRA;
	
	//以下为第三类指令，用到RS寄存器的I型指令
	wire I1, ADDI, ADDIU, ANDI, ORI, XORI, SLTI, SLTIU;
	assign ADDI	=	(Op == 6'b001000);
	assign ADDIU=	(Op == 6'b001001);
	assign ANDI	=	(Op == 6'b001100);
	assign ORI	=	(Op == 6'b001101);
	assign XORI	=	(Op == 6'b001110);
	assign SLTI	=	(Op == 6'b001010);
	assign SLTIU=	(Op == 6'b001011);
	assign I1 = ADDI | ADDIU | ANDI | ORI | XORI | SLTI | SLTIU;
   
	//以下为第四类指令，没有用到RS寄存器的I型指令
	wire I2, LUI;
	assign LUI = (Op == 6'b001111);	
	assign I2 = LUI;
	
	//以下为第五类指令，STORE型指令	
	wire SB, SH, SW;
	assign SB = (Op == 6'b101000);
	assign SH = (Op == 6'b101001);
	assign SW = (Op == 6'b101011);
	assign Store[1] = SH | SW;
	assign Store[0] = SB | SW;
	
	//以下为第六类指令，LOAD型指令
	wire LB, LBU, LH, LHU, LW;
	assign LB	=	(Op == 6'b100000);
	assign LBU	=	(Op == 6'b100100);
	assign LH	=	(Op == 6'b100001);
	assign LHU	=	(Op == 6'b100101);
	assign LW	=	(Op == 6'b100011);
	assign Load[2] = LHU | LW;
	assign Load[1] = LBU | LH;
	assign Load[0] = LB | LH | LW;

	//以下为第七类指令，Branch型指令
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

	//以下为第八类指令，Jump型指令
	assign J		=	(Op == 6'b000010);
	assign JAL	=	(Op == 6'b000011);
	assign JALR	=	(Op == 6'b000000) & (Fun == 6'b001001) & (Instr[20:16] == 5'b00000) & (Instr[10:6] == 5'b00000);
	assign JR	=	(Op == 6'b000000) & (Fun == 6'b001000) & (Instr[20:11] == 5'b00000) & (Instr[10:6] == 5'b00000);
	assign Jump[2] = J | JAL | JALR | JR;
	assign Jump[1] = JALR | JR;
	assign Jump[0] = JAL | JR;		
	
	//以下为第九类指令，乘除指令
	wire MULT, MULTU, DIV, DIVU, MADD, MADDU, MSUB, MSUBU;
	assign MULT	=	(Op == 6'b000000) & (Fun == 6'b011000) & (Instr[15:6] == 0);
	assign MULTU=	(Op == 6'b000000) & (Fun == 6'b011001) & (Instr[15:6] == 0);
	assign DIV	=	(Op == 6'b000000) & (Fun == 6'b011010) & (Instr[15:6] == 0);
	assign DIVU	=	(Op == 6'b000000) & (Fun == 6'b011011) & (Instr[15:6] == 0);
	
	assign MADD	=	(Op == 6'b011100) & (Fun == 6'b000000) & (Instr[15:6] == 0);
	assign MADDU=	(Op == 6'b011100) & (Fun == 6'b000001) & (Instr[15:6] == 0);
	assign MSUB	=	(Op == 6'b011100) & (Fun == 6'b000100) & (Instr[15:6] == 0);
	assign MSUBU=	(Op == 6'b011100) & (Fun == 6'b000101) & (Instr[15:6] == 0);	
	
	assign MDMHILO = MULT | MULTU | DIV | DIVU | (MADD | MSUB);

	wire MDMMT, MDMMF, MFHI, MFLO, MTHI, MTLO;
	assign MFHI =	(Op == 6'b000000) & (Fun == 6'b010000) & (Instr[25:16] == 0);
	assign MFLO =	(Op == 6'b000000) & (Fun == 6'b010010) & (Instr[25:16] == 0);
	assign MTHI =	(Op == 6'b000000) & (Fun == 6'b010001) & (Instr[20:6] == 0);
	assign MTLO =	(Op == 6'b000000) & (Fun == 6'b010011) & (Instr[20:6] == 0);
	assign MDMMT = MTHI | MTLO;
	assign MDMMF = MFHI | MFLO;
	assign MDMHILOTF = MDMHILO | MDMMT | MDMMF | (MADD | MSUB);	

	


	//这是新增指令，不要慌






	//输出乘除信号
	assign MDMStart = MULT | MULTU | DIV | DIVU | (MADD | MSUB);
	assign MDMWrite = MDMMT;
	
	assign MDMAddr = (MTHI | MFHI) ? 0 : 1;
	
	assign MDMtoReg[1] = MFLO;
	assign MDMtoReg[0] = MFHI;
	
	assign MDMOp[2] = MFHI | MFLO | MTHI | MTLO | (MADD | MSUB);
	assign MDMOp[1] = DIV | DIVU | MSUB;
	assign MDMOp[0] = MULT | DIV | MADD;		

		
	//输出信号
	assign RegWrite = R1 | R2 | I1 | I2 | (Load > 0) | (JAL | JALR) | MDMMF;
	assign MemWrite = (Store > 0);	
	assign MemtoReg = (Load > 0);
	
	assign RegDst[1] = JAL;
	assign RegDst[0] = R1 | R2 | JALR | MDMMF;

	assign ALUSrc = I1 | I2 | (Store > 0) | (Load > 0);

	assign ExtOp[1] = (ADDI | ADDIU | SLTI | SLTIU) | (Store > 0) | (Load > 0);
	assign ExtOp[0] = (LUI);
	
	assign ALUOp[3] = (SRLV | SRAV | XOR | NOR | SLT | SLTU) |
							(XORI | SLTI | SLTIU);
	assign ALUOp[2] = (SLL |SRL | SRA | SLLV | SLT | SLTU) |
							(SLTI | SLTIU);
	assign ALUOp[1] = (SRA | SLLV | AND | OR | XOR | NOR) |
							(ANDI | ORI | XORI);
	assign ALUOp[0] = (SUB | SUBU | SRL | SLLV | SRAV | OR | NOR | SLTU) | 
							(ORI | SLTIU);
	
	assign Tuse_RSD = (Branch > 0) | JR | JALR; 
	assign Tuse_RTD = (Branch > 0 & !Branch[2]); 
	assign Tuse_RSE = R1 | I1 | (Load > 0) | (Store > 0) | MDMHILO | MDMMT;
	assign Tuse_RTE = R1 | R2 | MDMHILO;
	assign Tuse_RTM = (Store > 0);
	 
	always @(*) begin
		if (R1 | R2 | I1 | I2 | MDMMF)
			Tnew_D <= `T_ALU + 1;
		else if (Load > 0)
			Tnew_D <= `T_DM + 1;
		else 
			Tnew_D <= `T_PC;
	end
	
endmodule