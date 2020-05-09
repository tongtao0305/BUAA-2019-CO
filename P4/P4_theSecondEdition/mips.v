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
	 
	reg [31:0] PC;					//32位PC地址
	wire [31:0] Instr;			//32位指令
	wire [4:0] rs, rt, rd;
	wire [5:0] Op, Funct;
	
	//以下三行为Control模块相关参数
	wire RegWrite, MemtoReg, MemWrite;	
	wire [1:0] RegDst, ALUSrc, ExtOp; 
	wire [3:0] ALUOp;	
	
	wire [15:0] Imm16;
	wire [31:0] Ext32;	
	wire [31:0] Zero;
	wire [31:0] ALUResult;	//ALU模块相关参数
	wire [31:0] RD1, RD2, RDA, RDB;	//GRF
	wire [31:0] WD, RD;	//DM
	wire j, jal, jalr, jr;	//Jump类型指令信号
	wire beq, bne;	//Branch类型指令信号
	wire b, h, w;

	
	//初始化第一条指令的地址
	initial begin
		PC = 32'h00003000;
	end
	
	//对PC的值进行更新
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			PC <= 32'h00003000;
		end
		else begin
			//如果满足Branch指令跳转的条件则进行跳转
			if ((beq && Zero == 0)||(bne && Zero != 0))
				PC <= PC + 4 + {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
			//如果为j或者jal指令则根据PC和Instr计算NPC
			else if (j | jal)
				PC <= {{Instr[31:28]},{Instr[25:0]},{2{1'b0}}};
			//如果为jalr或者jr指令则根据寄存器读取的地址存入PC
			else if (jalr | jr)
				PC <= RD1;
			else 
				PC <= PC + 4;
		end 
	end 
	
	//调用IM从指令存储器中获取32位指令	
	IM IM(
		.PC(PC),
		.Instr(Instr)
    );
	
	//从指令获取指令代码、寄存器地址、立即数
	assign Op = Instr[31:26];	
	assign rs = Instr[25:21];
	assign rt = Instr[20:16];
	assign rd = Instr[15:11];
	assign Funct = Instr[5:0];
	assign Imm16 = Instr[15:0];
	
	//调用EXT，将16位立即数扩展成32位
	EXT EXT(
		.Imm16(Imm16),
		.Ext32(Ext32),
		.ExtOp(ExtOp)
    );

	//调用Controller，生成控制信号
	Controller Controller (
		//用来鉴别指令的输入
		.Op(Op), 
		.Funct(Funct), 
		//关于寄存器和内存读写信号
		.RegWrite(RegWrite),
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		//用于多路选择器的信号位
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.ExtOp(ExtOp),
		.ALUOp(ALUOp),
		//Branch相关指令信号
		.beq(beq),
		.bne(bne),
		//Jump相关指令信号
		.j(j),
		.jal(jal),
		.jalr(jalr),
		.jr(jr),
		.b(b),
		.h(h),
		.w(w)
	);

	assign WD = (jal | jalr) ? (PC+4) :((MemtoReg) ? RD : ALUResult);

	//调用GRF
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
	
	//RDA和RDB为ALU的两个输入
	assign RDA = RD1;
	assign RDB = (ALUSrc[1]) ? 32'h00000000 : ( (ALUSrc[0])? Ext32 : RD2 ) ;
	
	//调用ALU
	ALU ALU (
		.A(RDA), 
		.B(RDB), 
		.C(ALUResult),
		.Zero(Zero), 
		.ALUOp(ALUOp)
	);
	
	//调用DM
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
