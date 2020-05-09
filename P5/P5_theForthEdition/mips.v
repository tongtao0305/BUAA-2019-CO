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
	wire [1:0] RegDst_D, ExtOp_D;
	wire [2:0] Branch_D, Jump_D;

	//����ΪEX������ź�
	wire [31:0] Instr_E, PC4_E, PC8_E, RS_E, RT_E, EXT_E, ALUResult_E, ALUResult;
	wire ALUSrc_E; 
	wire RegWrite_E;	
	wire [3:0] ALUOp_E;
	wire [2:0] Jump_E;

	
	//����ΪMEM������ź� 
	wire [31:0] Instr_M, PC4_M, PC8_M, ALUResult_M, RT_M, DM_M;
	wire MemWrite_M, RegWrite_M;
	wire [2:0] Jump_M;
	wire [1:0] Store_M;
	wire [2:0] Load_M;
	
	//����ΪWB������ź�
	wire [31:0] Instr_W, PC4_W, PC8_W, ALUResult_W, DM_W;
	wire RegWrite_W, MemtoReg_W;
	wire [2:0] Jump_W;
	wire [1:0] RegDst_W;
	wire [4:0] WriteReg_Addr;
	wire [31:0] WriteReg_Data;
	
	//����Ϊ����ͻ��Ԫ�йص��ź�
	wire StallF, StallD, FlushE;
	
	//����Ϊ��ת����Ԫ�йص��ź�
	wire [2:0] ForwardRSD, ForwardRTD, ForwardRSE, ForwardRTE, ForwardRTM;
	wire [31:0] MFRSD, MFRTD, MFRSE, MFRTE, MFRTM;

	wire Tuse_RSD, Tuse_RTD, Tuse_RSE, Tuse_RTE ,Tuse_RTM;
	wire [1:0] Tnew_D, Tnew_E, Tnew_M, Tnew_W;
	wire [4:0] WriteReg_Addr_D, WriteReg_Addr_E, WriteReg_Addr_M, WriteReg_Addr_W;
	wire [4:0] A1_D, A2_D, A1_E, A2_E, A1_M, A2_M, A1_W, A2_W;
	
	wire [31:0] WriteReg_Data_E, WriteReg_Data_M, WriteReg_Data_W;
		
	wire BGEZAL_D, BGEZAL_E, BGEZAL_M, BGEZAL_W;
	wire BLTZAL_D, BLTZAL_E, BLTZAL_M, BLTZAL_W;		
	wire TT1_E;
//**********************************************************************
//����ΪIF���֣�����PC��IM�����֣�*******************************************
//**********************************************************************
		
	//����PC����������PCֵ
	PC PC(
		.clk(clk),
		.reset(reset),
		.PCUpdate(StallF),
		.PCIn( ((Branch_D > 0) | (Jump_D > 0) | BGEZAL_D | BLTZAL_D) ? NPC_F : PC_F+4),
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
	Controller Controller_D(
		//ָ��
		.Instr(Instr_D),
		//���ڼĴ������ڴ��д�ź�
		//.RegWrite(RegWrite_D),
		//.MemtoReg(MemtoReg_D),
		//.MemWrite(MemWrite_D),	  
		//���ڶ�·ѡ�������ź�λ
		//.ALUSrc(ALUSrc_D),	 
		//.ALUOp(ALUOp_D),
		.RegDst(RegDst_D), 
		.ExtOp(ExtOp_D),
		//ָ������ź�
		//.Store(Store_D),
		//.Load(Load_D),
		.Branch(Branch_D),
		.Jump(Jump_D),
		//����ת�����ź�
		.Tuse_RSD(Tuse_RSD), 
		.Tuse_RTD(Tuse_RTD), 
		.Tuse_RSE(Tuse_RSE), 
		.Tuse_RTE(Tuse_RTE), 
		.Tuse_RTM(Tuse_RTM), 
		.Tnew_D(Tnew_D),
		.BGEZAL(BGEZAL_D),
		.BLTZAL(BLTZAL_D)
    );

	//����GRF
	GRF GRF (
		.clk(clk), 
		.reset(reset),
		.RegWrite(RegWrite_W), 
		.PC(PC8_W-8),
		.A1(Instr_D[25:21]), 
		.A2(Instr_D[20:16]), 
		.A3(WriteReg_Addr_W), 
		.WD3(WriteReg_Data_W), 
		.RD1(RS_D), 
		.RD2(RT_D)
	);
	//����EXT
	EXT EXT(
		.Imm16(Instr_D[15:0]),
		.Ext32(EXT_D),
		.ExtOp(ExtOp_D)
	);

	NPC NPC(
		.Instr(Instr_D),
		.PC4(PC4_D),
		.NPC(NPC_F),
		.Branch(Branch_D),
		.Jump(Jump_D),
		.MFRSD(MFRSD),
		.MFRTD(MFRTD),
		.BGEZAL(BGEZAL_D),
		.BLTZAL(BLTZAL_D)
	 );
	
	assign WriteReg_Addr_D = (RegDst_D == 2'b01) ? Instr_D[15:11] :
									 (RegDst_D == 2'b10) ? 5'h1f :
									 Instr_D[20:16];
	
	assign A1_D = Instr_D[25:21]; 
	assign A2_D = Instr_D[20:16]; 
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
		.RSIn(MFRSD),
		.RSOut(RS_E),
		.RTIn(MFRTD),
		.RTOut(RT_E),
		.EXTIn(EXT_D),
		.EXTOut(EXT_E),
		.A1In(A1_D),
		.A1Out(A1_E),
		.A2In(A2_D),
		.A2Out(A2_E),
		.WriteAddrIn(WriteReg_Addr_D),
		.WriteAddrOut(WriteReg_Addr_E),
		.TnewIn(Tnew_D),
		.TnewOut(Tnew_E)
	);	

	//����Controller_E������EX������Ҫ�Ŀ����ź�
	Controller Controller_E(
		//ָ��
		.Instr(Instr_E),
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite_E),
		//.MemtoReg(MemtoReg_D),
		//.MemWrite(MemWrite_D),	  
		//���ڶ�·ѡ�������ź�λ
		.ALUSrc(ALUSrc_E),	 
		.ALUOp(ALUOp_E),
		//.RegDst(RegDst_D), 
		//.ExtOp(ExtOp_D),
		//ָ������ź�
		//.Store(Store_D),
		//.Load(Load_D),
		//.Branch(Branch_D),
		.Jump(Jump_E),
		//����ת�����ź�
		//.Tuse_RSD(Tuse_RSD), 
		//.Tuse_RTD(Tuse_RTD), 
		//.Tuse_RSE(Tuse_RSE), 
		//.Tuse_RTE(Tuse_RTE), 
		//.Tuse_RTM(Tuse_RTM), 
		//.Tnew_D(Tnew_D)
		.BGEZAL(BGEZAL_E),
		.BLTZAL(BLTZAL_E),
		.TT1(TT1_E)
    );
	
	ALU ALU(
		.A(MFRSE),
		.B( (ALUSrc_E) ? EXT_E : MFRTE),
		.s(Instr_E[10:6]),
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
		.RTOut(RT_M),
		.A1In(A1_E),
		.A1Out(A1_M),
		.A2In(A2_E),
		.A2Out(A2_M),
		.WriteAddrIn(  (TT1_E & ALUResult_E[0] == 1) ? 5'b00000 :   WriteReg_Addr_E), //(TT1_E & ALUResult_E[0] == 1) ? 5'b00000 : 
		.WriteAddrOut(WriteReg_Addr_M),
		.TnewIn(Tnew_E),
		.TnewOut(Tnew_M)		
	);

	//����Controller_M������MEM������Ҫ�Ŀ����ź�
	Controller Controller_M(
		//ָ��
		.Instr(Instr_M),
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite_M),
		//.MemtoReg(MemtoReg_D),
		.MemWrite(MemWrite_M),	  
		//���ڶ�·ѡ�������ź�λ
		//.ALUSrc(ALUSrc_E),	 
		//.ALUOp(ALUOp_E),
		//.RegDst(RegDst_D), 
		//.ExtOp(ExtOp_D),
		//ָ������ź�
		.Store(Store_M),
		.Load(Load_M),
		//.Branch(Branch_D),
		.Jump(Jump_M),
		.BGEZAL(BGEZAL_M),
		.BLTZAL(BLTZAL_M)		
    );
	
	//����DM
	DM DM (
		.clk(clk), 
		.reset(reset),
		.Store(Store_M),
		.Load(Load_M),
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
		.RDOut(DM_W),
		.WriteAddrIn(WriteReg_Addr_M),
		.WriteAddrOut(WriteReg_Addr_W),
		.TnewIn(Tnew_M),
		.TnewOut(Tnew_W)		
	);

	//����Controller_W������WB������Ҫ�Ŀ����ź�
	Controller Controller_W(
		//ָ��
		.Instr(Instr_W),
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite_W),
		.MemtoReg(MemtoReg_W),
		//.MemWrite(MemWrite_D),	  
		//���ڶ�·ѡ�������ź�λ
		//.ALUSrc(ALUSrc_E),	 
		//.ALUOp(ALUOp_E),
		//.RegDst(RegDst_D), 
		//.ExtOp(ExtOp_D),
		//ָ������ź�
		//.Store(Store_D),
		//.Load(Load_D),
		//.Branch(Branch_D),
		.Jump(Jump_W),
		.BGEZAL(BGEZAL_W),
		.BLTZAL(BLTZAL_W)		
    );

//**************************************************
//����ΪWB����****************************************
//**************************************************
//����ΪStall��Forward����****************************
//**************************************************

	Stall Stall(
		.A1(A1_D),
		.A2(A2_D),
		.Tuse_RSD(Tuse_RSD), 
		.Tuse_RTD(Tuse_RTD), 
		.Tuse_RSE(Tuse_RSE), 
		.Tuse_RTE(Tuse_RTE), 
		.Tuse_RTM(Tuse_RTM), 
		.Tnew_E(Tnew_E),
		.Tnew_M(Tnew_M),
		.Tnew_W(Tnew_W),
		.A3_E(WriteReg_Addr_E),
		.A3_M(WriteReg_Addr_M),
		.A3_W(WriteReg_Addr_W),
		.RegWrite_E(RegWrite_E),
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.StallF(StallF),
		.StallD(StallD),
		.FlushE(FlushE)
    );
	
	 Forward Forward(
		.A1_D(A1_D),
		.A2_D(A2_D),
		.A1_E(A1_E),
		.A2_E(A2_E),
		.A2_M(A2_M),		
		.RegWrite_E(RegWrite_E),
		.RegWrite_M(RegWrite_M),
		.RegWrite_W(RegWrite_W),
		.A3_E(WriteReg_Addr_E),
		.A3_M(WriteReg_Addr_M),
		.A3_W(WriteReg_Addr_W),
		.Tnew_E(Tnew_E),
		.Tnew_M(Tnew_M),
		.Tnew_W(Tnew_W),
		.ForwardRSD(ForwardRSD),
		.ForwardRTD(ForwardRTD),
		.ForwardRSE(ForwardRSE),
		.ForwardRTE(ForwardRTE),
		.ForwardRTM(ForwardRTM)	
    );
	
	
	assign WriteReg_Data_E = (Jump_E == 3'b101 | Jump_E ==3'b110 | BGEZAL_E | BLTZAL_E) ? PC8_E : 	//jal, jalr, bgezal
									 PC8_E;
									 
	assign WriteReg_Data_M = (Jump_M == 3'b101 | Jump_M ==3'b110 | BGEZAL_M | BLTZAL_M) ? PC8_M : 
									 ALUResult_M;
									 
	assign WriteReg_Data_W = (Jump_W == 3'b101 | Jump_W ==3'b110 | BGEZAL_W | BLTZAL_W) ? PC8_W : 
									 (MemtoReg_W) ? DM_W : ALUResult_W;
	
	assign MFRSD = (ForwardRSD == 3'b001)  ? WriteReg_Data_E :
					   (ForwardRSD == 3'b010)  ? WriteReg_Data_M :
					   (ForwardRSD == 3'b011)  ? WriteReg_Data_W :
						RS_D;
					 
	assign MFRTD = (ForwardRTD == 3'b001)  ? WriteReg_Data_E :
					   (ForwardRTD == 3'b010)  ? WriteReg_Data_M :
					   (ForwardRTD == 3'b011)  ? WriteReg_Data_W :
						RT_D;

	assign MFRSE = (ForwardRSE == 3'b001)  ? WriteReg_Data_M :
					   (ForwardRSE == 3'b010)  ? WriteReg_Data_W :
						RS_E;
					 
	assign MFRTE = (ForwardRTE == 3'b001)  ? WriteReg_Data_M :
						(ForwardRTE == 3'b010)  ? WriteReg_Data_W : 
						RT_E;	
	
	assign MFRTM = (ForwardRTM == 3'b001)  ? WriteReg_Data_W :
					   RT_M;
	
endmodule
