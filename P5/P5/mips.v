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

	//以下为IF级别的信号
	wire [31:0] PC_F, NPC_F, Instr_F, PC4_F, PC8_F;
	
	//以下为ID级别的信号
	wire [31:0] Instr_D, PC4_D, PC8_D;
	wire [31:0] RS_D, RT_D, EXT_D;
	wire Branch_D, Cmp_D, j_D, jal_D, jr_D;
	wire [1:0] ExtOp_D;

	//以下为EX级别的信号
	wire [31:0] Instr_E, PC4_E, PC8_E, RS_E, RT_E, EXT_E, ALUResult_E;
	wire ALUSrc_E, RegWrite_E;	
	wire [3:0] ALUOp_E;
	
	//以下为MEM级别的信号 
	wire [31:0] Instr_M, PC4_M, PC8_M, ALUResult_M, RT_M, DM_M;
	wire MemWrite_M, RegWrite_M;
	
	//以下为WB级别的信号
	wire [31:0] Instr_W, PC4_W, PC8_W, ALUResult_W, DM_W;
	wire RegWrite_W, MemtoReg_W, jal_W;
	wire [1:0] RegDst_W;
	wire [4:0] WriteReg_Addr;
	wire [31:0] WriteReg_Data;
	
	//以下为跟冲突单元有关的信号
	wire StallF, StallD, FlushE;
	
	//以下为跟转发单元有关的信号
	wire [2:0] ForwardRSD, ForwardRTD, ForwardRSE, ForwardRTE;
	wire [1:0] ForwardRTM;
	wire [31:0] MFRSD, MFRTD, MFRSE, MFRTE, MFRTM;

//**********************************************************************
//以下为IF部分（包含PC和IM两部分）*******************************************
//**********************************************************************
		
	//调用PC部件来更新PC值
	PC PC(
		.clk(clk),
		.reset(reset),
		.PCUpdate(StallF),
		.PCIn( ((Branch_D & Cmp_D) | j_D | jal_D | jr_D ) ? NPC_F : PC_F+4),
		.PCOut(PC_F)
	);

	//调用IM获取根据PC获取指令
	IM IM(
		.PC(PC_F),
		.Instr(Instr_F)
	);
	
//**********************************************************************
//以上为IF部分************************************************************
//**********************************************************************
//以下为ID部分************************************************************
//**********************************************************************
	
	//调用IF/ID
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

	//调用Controller_D，生成ID级别需要的控制信号
	Controller Controller_D (
		//用来鉴别指令的三个输入，其中Bin与Branch指令有关
		.Op(Instr_D[31:26]), 
		.Funct(Instr_D[5:0]), 
		//关于寄存器和内存读写信号
		//.RegWrite(RegWrite_D),
		//.MemtoReg(MemtoReg_D), 
		//.MemWrite(MemWrite_D), 
		//用于多路选择器的信号位
		//.ALUSrc(ALUSrc_D),
		//.ALUOp(ALUOp_D),
		//.RegDst(RegDst_D), 
		.ExtOp(ExtOp_D),
		//Branch的专用信号
		.Branch(Branch_D),
		.j(j_D),
		.jal(jal_D),
		.jr(jr_D)
	);		

	//调用GRF
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
	//调用EXT
	EXT EXT(
		.Imm16(Instr_D[15:0]),
		.Ext32(EXT_D),
		.ExtOp(ExtOp_D)
	);
	
	//调用CMP的多路选择器
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
	//以上为ID部分****************************************
	//**************************************************
	//以下为EX部分****************************************
	//**************************************************
	
	//调用ID/EX
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

	//调用Controller_E，生成EX级别需要的控制信号
	Controller Controller_E (
		//用来鉴别指令的三个输入，其中Bin与Branch指令有关
		.Op(Instr_E[31:26]), 
		.Funct(Instr_E[5:0]), 
		//关于寄存器和内存读写信号
		.RegWrite(RegWrite_E),
		//.MemtoReg(MemtoReg_D), 
		//.MemWrite(MemWrite_D), 
		//用于多路选择器的信号位
		.ALUSrc(ALUSrc_E),
		.ALUOp(ALUOp_E)
		//.RegDst(RegDst_D)
		//.ExtOp(ExtOp_D),
		//Branch的专用信号
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
	//以上为EX部分****************************************
	//**************************************************
	//以下为MEM部分***************************************
	//**************************************************

	//调用EX_MEM
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

	//调用Controller_M，生成MEM级别需要的控制信号
	Controller Controller_M (
		//用来鉴别指令的三个输入，其中Bin与Branch指令有关
		.Op(Instr_M[31:26]), 
		.Funct(Instr_M[5:0]), 
		//关于寄存器和内存读写信号
		.RegWrite(RegWrite_M),
		//.MemtoReg(MemtoReg_D), 
		.MemWrite(MemWrite_M)
		//用于多路选择器的信号位
		//.ALUSrc(ALUSrc_D),
		//.ALUOp(ALUOp_D),
		//.RegDst(RegDst_D), 
		//.ExtOp(ExtOp_D),
		//Branch的专用信号
		//.Branch(Branch_D)	
	);		
	
	DM_MUX DM_MUX(
		.RT_M(RT_M),
		.WriteData_M(WriteReg_Data),
		.ForwardRTM(ForwardRTM),
		.MFRTM(MFRTM)
	);
	
	//调用DM
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
	//以上为MEM部分***************************************
	//**************************************************
	//以下为WB部分****************************************
	//**************************************************

	//调用MEM_WB
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
	
	//调用Controller_W，生成WB级别需要的控制信号
	Controller Controller_W (
		//用来鉴别指令的三个输入，其中Bin与Branch指令有关
		.Op(Instr_W[31:26]), 
		.Funct(Instr_W[5:0]), 
		//关于寄存器和内存读写信号
		.RegWrite(RegWrite_W),
		.MemtoReg(MemtoReg_W),
		//.MemWrite(MemWrite_M), 
		//用于多路选择器的信号位
		//.ALUSrc(ALUSrc_D),
		//.ALUOp(ALUOp_D),
		.RegDst(RegDst_W), 
		//.ExtOp(ExtOp_D),
		//Branch的专用信号
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
//以上为WB部分****************************************
//**************************************************
//以下为Stall部分*************************************
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
