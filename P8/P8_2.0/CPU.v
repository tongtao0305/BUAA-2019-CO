`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:48:36 12/14/2019 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	 input clk,
	 input reset,
	 //������P7�¼ӵ��ź�
	 input [7:2] HWInt,		//6��Ӳ���ж�����	 
	 input [31:0] PrRD,		//��Bridgeģ����������
	 output PrWe,				//cpuдʹ��
	 //output [3:0] PrBE,		//4λ�ֽ�ʹ��
	 output [31:0] PrWD,		//�����Bridgeģ�������
	 output [31:0] PrAddr,	//32λ��ַ����
	 output [31:0] addr
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
	wire [2:0] Branch_E, Jump_E;
	wire [1:0] Store_E;
	wire [2:0] Load_E;
	
	//����ΪMEM������ź� 
	wire [31:0] Instr_M, PC4_M, PC8_M, ALUResult_M, RT_M, DM_M;
	wire MemWrite_M, RegWrite_M;
	wire [2:0] Branch_M, Jump_M;
	wire [1:0] Store_M;
	wire [2:0] Load_M;
	
	wire [31:0] CP0Out_M;	
	
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
		

	//����Ϊ���쳣�йص��ź�
	
	wire [4:0] ExcCode_FF, ExcCode_F, ExcCode_D,  ExcCode_DD, ExcCode_E, ExcCode_EE, ExcCode_M, ExcCode_MM;
	wire [31:0] EPC_M;
	
	wire MTC0_E, MTCO_M;
	
	wire Interrupt;	
	wire ERET_D, ERET_W;
	wire BD_D, BD_E, BD_M, BD_W;
//**********************************************************************
//����ΪIF���֣�����PC��IM�����֣�*******************************************
//**********************************************************************
		
	//����PC����������PCֵ
	PC PC(
		.clk(clk),
		.reset(reset),
		.PCUpdate(StallF | Interrupt),
		.PCIn( ((Branch_D > 0) | (Jump_D > 0) | Interrupt | ERET_D) ? NPC_F : PC_F+4),
		.PCOut(PC_F),
		.ExcCode(ExcCode_FF)
	);

	//����IM��ȡ����PC��ȡָ��
	IM IM(
		.PC(PC_F - 32'h3000),
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
		.Interrupt(Interrupt),
		.IF_ID_EN(StallD),
		.IRIn( (ERET_D & StallD) ? 32'h0 : Instr_F),
		.IROut(Instr_D),
		.PC4In( (ERET_D & StallD) ? NPC_F+4 : PC_F+4),
		.PC4Out(PC4_D),
		.PC8In( (ERET_D & StallD) ? NPC_F+8 : PC_F+8),
		.PC8Out(PC8_D),
		.ExcCodeIn(ExcCode_FF),
		.ExcCodeOut(ExcCode_D),
		.BDIn( ((Jump_D > 0) | (Branch_D > 0)) ),
		.BDOut(BD_D)
	
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
		.ExcCode(ExcCode_DD),
		.ERET(ERET_D)
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
		.Interrupt(Interrupt),
		.ERET(ERET_D),
		.EPC(EPC_M)
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
		.Interrupt(Interrupt),
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
		.TnewOut(Tnew_E),
		.ExcCodeIn( (ExcCode_DD > 0) ? ExcCode_DD : ExcCode_D ),
		.ExcCodeOut(ExcCode_E),
		.BDIn(BD_D),
		.BDOut(BD_E)
	);	
	 
	 wire ADD_E, ADDI_E, SUB_E;
	
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
		.Store(Store_E),
		.Load(Load_E),
		.Branch(Branch_E),
		.Jump(Jump_E),
		//���쳣�йص��ź�
		.ADD_E(ADD_E),
		.ADDI_E(ADDI_E),
		.SUB_E(SUB_E),
		.MTC0(MTC0_E)
    );
	 

	
	ALU ALU(
		.A(MFRSE),
		.B( (ALUSrc_E) ? EXT_E : MFRTE),
		.s(Instr_E[10:6]),
		.C(ALUResult_E),
		.ALUOp(ALUOp_E),
		.ADD_E(ADD_E),
		.ADDI_E(ADDI_E),
		.SUB_E(SUB_E),
		.Store(Store_E),
		.Load(Load_E),
		.ExcCode(ExcCode_EE)
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
		.Interrupt(Interrupt),
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
		.WriteAddrIn(WriteReg_Addr_E),
		.WriteAddrOut(WriteReg_Addr_M),
		.TnewIn(Tnew_E),
		.TnewOut(Tnew_M),
		.ExcCodeIn( (ExcCode_EE > 0) ? ExcCode_EE : ExcCode_E ),
		.ExcCodeOut(ExcCode_M),
		.BDIn(BD_E),
		.BDOut(BD_M)
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
		.Branch(Branch_M),
		.Jump(Jump_M),
		.MFC0(MFC0_M),
		.MTC0(MTC0_M),
		.ERET(ERET_M)			
    );
	 
	wire HitDM, EXLSet_M;
	assign HitDM = ( 32'h00000000 <= ALUResult_M & ALUResult_M <=32'h00002fff);
	assign EXLSet_M = Interrupt;	
	
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
		.MemWrite(MemWrite_M & !Interrupt & HitDM),		//���ж��쳣ʱ����д��
		.ExcCode(ExcCode_MM)
	);	
	

	
	CP0 CP0(
		.clk(clk),
		.reset(reset),   
		// ��������ǹ���CP0��д���ȡ�ź�
		.We(MTC0_M & !Interrupt),		// CP0дʹ���ź�
		.A1(Instr_M[15:11]),				// ��CP0�Ĵ������
		.A2(Instr_M[15:11]),				// дCP0�Ĵ������
		.DIn(MFRTM),						// CP0д������
		.DOut(CP0Out_M),					// CPO�������
		// �����Ǹ��ж��쳣�йص��ź�
		.PC(PC4_M-4),					// �ж��쳣��PC
		.ExcCode((ExcCode_MM > 0) ? ExcCode_MM : ExcCode_M ),		//	�ж��쳣������
		.HWInt(HWInt),						// �ⲿ�豸�ж�
		.Interrupt(Interrupt),			// �ж�����
		//�����ǹ���EXL���ź�
		.EXLSet(EXLSet_M),				// ������λSR��EXL
		.EXLClr(ERET_W),					// �������SR��EXL
		//�����Ǳ����쳣ʱ��PC
		.EPC(EPC_M),						// EPC�Ĵ��������NPC
		//�ж��ӳٲ۵��ź�
		.Jump(Jump_M > 0),
		.Branch(Branch_M > 0),
		.BDIn(BD_M)
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
		.Interrupt(Interrupt),
		.IRIn(Instr_M),
		.IROut(Instr_W),
		.PC4In(PC4_M),
		.PC4Out(PC4_W),
		.PC8In(PC8_M),
		.PC8Out(PC8_W),
		.ALUResultIn(ALUResult_M),
		.ALUResultOut(ALUResult_W),
		.RDIn( (MFC0_M) ? CP0Out_M : (HitDM) ? DM_M : PrRD),
		.RDOut(DM_W),
		.WriteAddrIn(WriteReg_Addr_M),
		.WriteAddrOut(WriteReg_Addr_W),
		.TnewIn(Tnew_M),
		.TnewOut(Tnew_W),
		.BDIn(BD_M),
		.BDOut(BD_W)
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
		.ERET(ERET_W)
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
		.FlushE(FlushE),
		.interruptstall((ERET_D & MTC0_E) | (ERET_D & MTC0_M))
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
	
	
	assign WriteReg_Data_E = (Jump_E == 3'b101 | Jump_E ==3'b110) ? PC8_E : 
									 PC8_E;
									 
	assign WriteReg_Data_M = (Jump_M == 3'b101 | Jump_M ==3'b110) ? PC8_M : 
									 ALUResult_M;
									 
	assign WriteReg_Data_W = (Jump_W == 3'b101 | Jump_W ==3'b110) ? PC8_W : 
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



	 //�����Ǹ��ⲿIO�Ĳ���
	 assign PrWe = (MemWrite_M & !Interrupt); 	//д�ź�
	 assign PrWD = MFRTM;							//�����Bridgeģ�������
	 assign PrAddr = ALUResult_M;					//32λ��ַ����	
	 assign addr = PC4_M - 4;




	
endmodule



