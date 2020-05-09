`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:22 11/16/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );

	//����ΪIF������ź�
	wire [31:0] PC_F, NPC_F, Instr_F, PC4_F, PC8_F;
	
	//����ΪID������ź�
	wire [31:0] Instr_D, PC4_D, PC8_D;
	wire [31:0] RS_D, RT_D, EXT_D;
	wire Branch_D, Cmp_D, j_D, jal_D, jr_D;
	wire [1:0] ExtOp_D;

	//����ΪEX������ź�
	wire [31:0] Instr_E, PC4_E, PC8_E, RS_E, RT_E, EXT_E, ALUResult_E;
	wire ALUSrc_E, RegWrite_E;	
	wire [3:0] ALUOp_E;
	
	//����ΪMEM������ź� 
	wire [31:0] Instr_M, PC4_M, PC8_M, ALUResult_M, RT_M, DM_M;
	wire MemWrite_M, RegWrite_M;
	
	//����ΪWB������ź�
	wire [31:0] Instr_W, PC4_W, PC8_W, ALUResult_W, DM_W;
	wire RegWrite_W, MemtoReg_W, jal_W;
	wire [1:0] RegDst_W;
	wire [4:0] WriteReg_Addr;
	wire [31:0] WriteReg_Data;
	
	//����Ϊ����ͻ��Ԫ�йص��ź�
	wire StallF, StallD, FlushE;
	
	//����Ϊ��ת����Ԫ�йص��ź�
	wire [2:0] ForwardRSD, ForwardRTD, ForwardRSE, ForwardRTE;
	wire [1:0] ForwardRTM;
	wire [31:0] MFRSD, MFRTD, MFRSE, MFRTE, MFRTM;

//**********************************************************************
//����ΪIF���֣�����PC��IM�����֣�*******************************************
//**********************************************************************
		
	//����PC����������PCֵ
	PC PC(
		.clk(clk),
		.reset(reset),
		.PCUpdate(StallF),
		.PCIn( ((Branch_D & Cmp_D) | j_D | jal_D | jr_D ) ? NPC_F : PC_F+4),
		.PCOut(PC_F)
	);

	//����IM��ȡ����PC��ȡָ��
	IM IM(
		.PC(PC_F),
		.Instr(Instr_F)
	);
	
//**********************************************************************
//����ΪIF����************************************************************
//**********************************************************************
//����ΪID����************************************************************
//**********************************************************************
	
	//����IF/ID
	IF_ID IF_ID(
		.clk(clk),
		.reset(reset),
		.IF_ID_EN(StallD),
		.IRIn(Instr_F),
		.IROut(Instr_D),
		.PC4In(PC_F+4),
		.PC4Out(PC4_D),
		.PC8In(PC_F+8),
		.PC8Out(PC8_D)	
	);

	//����Controller_D������ID������Ҫ�Ŀ����ź�
	Controller Controller_D (
		//��������ָ����������룬����Bin��Branchָ���й�
		.Op(Instr_D[31:26]), 
		.Funct(Instr_D[5:0]), 
		//���ڼĴ������ڴ��д�ź�
		//.RegWrite(RegWrite_D),
		//.MemtoReg(MemtoReg_D), 
		//.MemWrite(MemWrite_D), 
		//���ڶ�·ѡ�������ź�λ
		//.ALUSrc(ALUSrc_D),
		//.ALUOp(ALUOp_D),
		//.RegDst(RegDst_D), 
		.ExtOp(ExtOp_D),
		//Branch��ר���ź�
		.Branch(Branch_D),
		.j(j_D),
		.jal(jal_D),
		.jr(jr_D)
	);		

	//����GRF
	GRF GRF (
		.clk(clk), 
		.reset(reset),
		.RegWrite(RegWrite_W), 
		.PC(PC8_W-8),
		.A1(Instr_D[25:21]), 
		.A2(Instr_D[20:16]), 
		.A3(WriteReg_Addr), 
		.WD3(WriteReg_Data), 
		.RD1(RS_D), 
		.RD2(RT_D)
	);
	//����EXT
	EXT EXT(
		.Imm16(Instr_D[15:0]),
		.Ext32(EXT_D),
		.ExtOp(ExtOp_D)
	);
	
	//����CMP�Ķ�·ѡ����
	CMP_MUX CMP_MUX(
		.ForwardRSD(ForwardRSD),
		.ForwardRTD(ForwardRTD),
		.GRF_RD1(RS_D),
		.GRF_RD2(RT_D),
		.ALUResult_M(ALUResult_M),
		.PC8_M(PC8_M),
		.WriteData_M(WriteReg_Data),
		.MFRSD(MFRSD),
		.MFRTD(MFRTD)
	);
	
	assign Cmp_D = (MFRSD == MFRTD) ? 1 : 0;

	NPC NPC(
		.Instr(Instr_D),
		.PC4(PC4_D),
		.NPC(NPC_F),
		.Branch(Branch_D),
		.Cmp(Cmp_D),
		.j(j_D),
		.jal(jal_D),
		.jr(jr_D),
		.RS_D(RS_D)
	 );
	
	//**************************************************
	//����ΪID����****************************************
	//**************************************************
	//����ΪEX����****************************************
	//**************************************************
	
	//����ID/EX
	ID_EX ID_EX(
		.clk(clk),
		.clr(FlushE),
		.reset(reset),
		.IRIn(Instr_D),
		.IROut(Instr_E),
		.PC4In(PC4_D),
		.PC4Out(PC4_E),
		.PC8In(PC8_D),
		.PC8Out(PC8_E),
		.RSIn(RS_D),
		.RSOut(RS_E),
		.RTIn(RT_D),
		.RTOut(RT_E),
		.EXTIn(EXT_D),
		.EXTOut(EXT_E)
	);

	//����Controller_E������EX������Ҫ�Ŀ����ź�
	Controller Controller_E (
		//��������ָ����������룬����Bin��Branchָ���й�
		.Op(Instr_E[31:26]), 
		.Funct(Instr_E[5:0]), 
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite_E),
		//.MemtoReg(MemtoReg_D), 
		//.MemWrite(MemWrite_D), 
		//���ڶ�·ѡ�������ź�λ
		.ALUSrc(ALUSrc_E),
		.ALUOp(ALUOp_E)
		//.RegDst(RegDst_D)
		//.ExtOp(ExtOp_D),
		//Branch��ר���ź�
		//.Branch(Branch_D)	
	);		
	
	ALU_MUX ALU_MUX(
		.ForwardRSE(ForwardRSE),
		.ForwardRTE(ForwardRTE),
		.RS_E(RS_E),
		.RT_E(RT_E),
		.WriteData_M(WriteReg_Data),
		.ALUResult_M(ALUResult_M),
		.PC8_M(PC8_M),
		.MFRSE(MFRSE),
		.MFRTE(MFRTE)
	);
	
	ALU ALU(
		.A(MFRSE),
		.B( (ALUSrc_E) ? EXT_E : MFRTE),
		.C(ALUResult_E),
		.ALUOp(ALUOp_E)
	);
	
	//**************************************************
	//����ΪEX����****************************************
	//**************************************************
	//����ΪMEM����***************************************
	//**************************************************

	//����EX_MEM
	EX_MEM EX_MEM(
		.clk(clk),
		.reset(reset),
		.IRIn(Instr_E),
		.IROut(Instr_M),
		.PC4In(PC4_E),
		.PC4Out(PC4_M),
		.PC8In(PC8_E),
		.PC8Out(PC8_M),
		.ALUResultIn(ALUResult_E),
		.ALUResultOut(ALUResult_M),
		.RTIn(MFRTE),
		.RTOut(RT_M)
	);

	//����Controller_M������MEM������Ҫ�Ŀ����ź�
	Controller Controller_M (
		//��������ָ����������룬����Bin��Branchָ���й�
		.Op(Instr_M[31:26]), 
		.Funct(Instr_M[5:0]), 
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite_M),
		//.MemtoReg(MemtoReg_D), 
		.MemWrite(MemWrite_M)
		//���ڶ�·ѡ�������ź�λ
		//.ALUSrc(ALUSrc_D),
		//.ALUOp(ALUOp_D),
		//.RegDst(RegDst_D), 
		//.ExtOp(ExtOp_D),
		//Branch��ר���ź�
		//.Branch(Branch_D)	
	);		
	
	DM_MUX DM_MUX(
		.RT_M(RT_M),
		.WriteData_M(WriteReg_Data),
		.ForwardRTM(ForwardRTM),
		.MFRTM(MFRTM)
	);
	
	//����DM
	DM DM (
		.clk(clk), 
		.reset(reset),
		.PC(PC8_M-8),
		.A(ALUResult_M), 
		.WD(MFRTM), 
		.RD(DM_M),
		.MemWrite(MemWrite_M)
	);	
	
	//**************************************************
	//����ΪMEM����***************************************
	//**************************************************
	//����ΪWB����****************************************
	//**************************************************

	//����MEM_WB
	MEM_WB MEM_WB(
		.clk(clk),
		.reset(reset),
		.IRIn(Instr_M),
		.IROut(Instr_W),
		.PC4In(PC4_M),
		.PC4Out(PC4_W),
		.PC8In(PC8_M),
		.PC8Out(PC8_W),
		.ALUResultIn(ALUResult_M),
		.ALUResultOut(ALUResult_W),
		.RDIn(DM_M),
		.RDOut(DM_W)
	);
	
	//����Controller_W������WB������Ҫ�Ŀ����ź�
	Controller Controller_W (
		//��������ָ����������룬����Bin��Branchָ���й�
		.Op(Instr_W[31:26]), 
		.Funct(Instr_W[5:0]), 
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite_W),
		.MemtoReg(MemtoReg_W),
		//.MemWrite(MemWrite_M), 
		//���ڶ�·ѡ�������ź�λ
		//.ALUSrc(ALUSrc_D),
		//.ALUOp(ALUOp_D),
		.RegDst(RegDst_W), 
		//.ExtOp(ExtOp_D),
		//Branch��ר���ź�
		//.Branch(Branch_D)	
		.jal(jal_W)
	);		

	WriteBack_Addr_MUX WriteBack_Addr_MUX (
    .rd(Instr_W[15:11]), 
    .rt(Instr_W[20:16]), 
    .ra(5'h1f), 
    .RegDst(RegDst_W), 
    .WriteAddr(WriteReg_Addr)
    );

	WriteBack_Data_MUX WriteBack_Data_MUX (
    .MemtoReg(MemtoReg_W), 
    .jal(jal_W), 
    .PC8_W(PC8_W), 
    .ALUResult_W(ALUResult_W), 
    .DM_W(DM_W), 
    .WriteData(WriteReg_Data)
    );

//**************************************************
//����ΪWB����****************************************
//**************************************************
//����ΪStall����*************************************
//**************************************************

	Stall Stall(
    .IR_D(Instr_D),
    .IR_E(Instr_E),
    .IR_M(Instr_M),	
	 .RegWrite_E(RegWrite_E),
	 .RegWrite_M(RegWrite_M),
	 .StallF(StallF),
	 .StallD(StallD),
	 .FlushE(FlushE)
    );
	
	 Forward Forward(
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.IR_D(Instr_D),
		.IR_E(Instr_E),
		.IR_M(Instr_M),
		.IR_W(Instr_W),
		.ForwardRSD(ForwardRSD),
		.ForwardRTD(ForwardRTD),
		.ForwardRSE(ForwardRSE),
		.ForwardRTE(ForwardRTE),
		.ForwardRTM(ForwardRTM)
    );
	
endmodule
