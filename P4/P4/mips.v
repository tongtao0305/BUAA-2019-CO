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
	
	wire [31:0] Instr;	//32位指令
	wire [4:0] rs, rt, rd;
	wire [4:0] ThirdIn;	
	wire [5:0] Op, Funct;
	reg [31:0] PC;
	wire [31:0] NPC;
	
	wire MemtoReg, MemWrite;	
	wire [1:0] RegDst, ALUSrc, ExtOp;
	wire [2:0] Jump;
	wire [2:0] Branch;
	
	wire [3:0] ALUOp;	//Control模块相关参数
	wire [15:0] Imm16;
	wire [31:0] Ext32;	
	wire [1:0] Zero;
	wire [31:0] ALUResult;	//ALU模块相关参数
	wire [31:0] RD1,RD2;	//GRF
	wire [31:0] WD, RD;	//DM
	
	
	//初始化第一条指令的地址
	initial begin
		PC = 32'h00003000;
	end
	
	
	//以下为B指令的判断部分
	wire B, beq, bne, bgez, bgtz, blez, bltz, less0, equal0, greater0;
	assign less0 = !Zero[1] & !Zero[0];
	assign equal0 = !Zero[1] & Zero[0];
	assign greater0= Zero[1] & !Zero[0];
	assign beq = !Branch[2] & !Branch[1] & Branch[0]; 
	assign bne = !Branch[2] & Branch[1] & !Branch[0]; 
	assign bgez = !Branch[2] & Branch[1] & Branch[0]; 
	assign bgtz = Branch[2] & !Branch[1] & !Branch[0]; 
	assign blez = Branch[2] & !Branch[1] & Branch[0]; 
	assign bltz = Branch[2] & Branch[1] & !Branch[0]; 
	assign B = (beq & equal0) + (bne & (less0 | greater0)) +
				  (bgez & (equal0 + greater0)) + (bgtz & greater0) +
				  (blez & (less0 + equal0)) + (bltz & less0);
	
	//对PC的值进行更新
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			PC <= 32'h00003000;
		end
		else begin
			PC <= PC + 4;
			/*
			if (B)
				//若有Branch指令进行相应的跳转
				PC <= {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
			else begin
				//根据Jump信号进行相应的跳转
				case (Jump)
					3'b000 : PC <= PC + 4;
					3'b100 : PC <= {{Instr[31:28]},{Instr[25:0]},{2{1'b0}}};
					3'b101 : PC <= {{Instr[31:28]},{Instr[25:0]},{2{1'b0}}};
					3'b110 : PC <= RD1;
					3'b111 : PC <= RD1;
					default PC <= PC + 4;
				endcase
			end
			*/
		end 
	end 
	
	/*
	//调用NPC以计算下一个32位PC信号
	NPC NPCC(
		.Instr(Instr),
		//以下两个为PC相关的信号
		.PC(PC),
		.NPC(NPC),
		//以下两个是跟Branch指令相关的输入信号
		.Branch(Branch),
		.Zero(Zero),	 
		//以下是跟Jump指令相关的输入信号
		.Jump(Jump),	
		.jr(RD1)
    );
	 */
	
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
		.ExtOp(Extop)
    );

	//调用Controller，生成控制信号
	Controller Controller (
		//用来鉴别指令的三个输入，其中Bin与Branch指令有关
		.Op(Op), 
		.Funct(Funct), 
		.ThirdIn(ThirdIn),
		//关于寄存器和内存读写信号
		.RegWrite(RegWrite),
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		//用于多路选择器的信号位
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.ExtOp(ExtOp),
		.ALUOp(ALUOp),
		//Jump和Branch的专用信号
		.Jump(Jump),
		.Branch(Branch)	
	);


	//调用GRF
	GRF GRF (
		.PC(PC),
		.A1(rs), 
		.A2(rt), 
		.A3((RegDst[1]) ? 5'b11111 : ( (RegDst[0])? rd : rt ) ), 
		.RD1(RD1), 
		.RD2(RD2),	
		.WD((MemtoReg) ? RD :( (Jump ==2'b00) ? ALUResult : PC + 4) ), 
		.RegWrite(RegWrite), 
		.clk(clk), 
		.reset(reset)
	);
	
	
	//调用ALU
	ALU ALU (
		.A(RD1), 
		.B((ALUSrc[1]) ? 32'h000000000 : ( (ALUSrc[0])? Ext32 : RD2 ) ), 
		.C(ALUResult),
		.Zero(Zero), 
		.ALUOp(ALUOp)
	);
	

	//调用DM
	DM DM (
		.PC(PC),
		.A(ALUResult[9:0]), 
		.WD(WD), 
		.RD(RD),
		.MemWrite(MemWrite), 
		.clk(clk), 
		.reset(reset)
	);
	
endmodule
