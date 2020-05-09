`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:11 10/14/2019 
// Design Name: 
// Module Name:    Datapath 
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
	 
	reg [31:0] PC;					//32λPC��ַ
	wire [31:0] Instr;			//32λָ��
	wire [4:0] rs, rt, rd;
	wire [5:0] Op, Funct;
	
	//��������ΪControlģ����ز���
	wire RegWrite, MemtoReg, MemWrite;	
	wire [1:0] RegDst, ALUSrc, ExtOp; 
	wire [3:0] ALUOp;	
	
	wire [15:0] Imm16;
	wire [31:0] Ext32;	
	wire [31:0] Zero;
	wire [31:0] ALUResult;	//ALUģ����ز���
	wire [31:0] RD1, RD2, RDA, RDB;	//GRF
	wire [31:0] WD, RD;	//DM
	wire j, jal, jalr, jr;	//Jump����ָ���ź�
	wire beq, bne;	//Branch����ָ���ź�
	wire b, h, w;

	
	//��ʼ����һ��ָ��ĵ�ַ
	initial begin
		PC = 32'h00003000;
	end
	
	//��PC��ֵ���и���
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			PC <= 32'h00003000;
		end
		else begin
			//�������Branchָ����ת�������������ת
			if ((beq && Zero == 0)||(bne && Zero != 0))
				PC <= PC + 4 + {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
			//���Ϊj����jalָ�������PC��Instr����NPC
			else if (j | jal)
				PC <= {{Instr[31:28]},{Instr[25:0]},{2{1'b0}}};
			//���Ϊjalr����jrָ������ݼĴ�����ȡ�ĵ�ַ����PC
			else if (jalr | jr)
				PC <= RD1;
			else 
				PC <= PC + 4;
		end 
	end 
	
	//����IM��ָ��洢���л�ȡ32λָ��	
	IM IM(
		.PC(PC),
		.Instr(Instr)
    );
	
	//��ָ���ȡָ����롢�Ĵ�����ַ��������
	assign Op = Instr[31:26];	
	assign rs = Instr[25:21];
	assign rt = Instr[20:16];
	assign rd = Instr[15:11];
	assign Funct = Instr[5:0];
	assign Imm16 = Instr[15:0];
	
	//����EXT����16λ��������չ��32λ
	EXT EXT(
		.Imm16(Imm16),
		.Ext32(Ext32),
		.ExtOp(ExtOp)
    );

	//����Controller�����ɿ����ź�
	Controller Controller (
		//��������ָ�������
		.Op(Op), 
		.Funct(Funct), 
		//���ڼĴ������ڴ��д�ź�
		.RegWrite(RegWrite),
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		//���ڶ�·ѡ�������ź�λ
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.ExtOp(ExtOp),
		.ALUOp(ALUOp),
		//Branch���ָ���ź�
		.beq(beq),
		.bne(bne),
		//Jump���ָ���ź�
		.j(j),
		.jal(jal),
		.jalr(jalr),
		.jr(jr),
		.b(b),
		.h(h),
		.w(w)
	);

	assign WD = (jal | jalr) ? (PC+4) :((MemtoReg) ? RD : ALUResult);

	//����GRF
	GRF GRF (
		.PC(PC),
		.A1(rs), 
		.A2(rt), 
		.A3((RegDst[1]) ? 5'b11111 : ( (RegDst[0])? rd : rt ) ), 
		.RD1(RD1), 
		.RD2(RD2),	
		.WD(WD), 
		.RegWrite(RegWrite), 
		.clk(clk), 
		.reset(reset),
		.w(w),
		.A(ALUResult)
	);
	
	//RDA��RDBΪALU����������
	assign RDA = RD1;
	assign RDB = (ALUSrc[1]) ? 32'h00000000 : ( (ALUSrc[0])? Ext32 : RD2 ) ;
	
	//����ALU
	ALU ALU (
		.A(RDA), 
		.B(RDB), 
		.C(ALUResult),
		.Zero(Zero), 
		.ALUOp(ALUOp)
	);
	
	//����DM
	DM DM (
		.PC(PC),
		.A(ALUResult), 
		.WD(RD2), 
		.RD(RD),
		.MemWrite(MemWrite), 
		.clk(clk), 
		.reset(reset),
		.b(b),
		.h(h),
		.w(w)
	);
	
endmodule
