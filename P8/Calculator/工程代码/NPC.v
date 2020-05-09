`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:16 11/16/2019 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
	 input [31:0] Instr,
    input [31:0] PC4,
    output reg [31:0] NPC,
	 //Branch指令相关信号
	 input [2:0] Branch,
	 input [31:0] MFRSD,
	 input [31:0] MFRTD,
	 input [2:0] Jump,
	 input Interrupt,
	 input ERET,
	 input [31:0] EPC	 
	 );
	
		//对PC的值进行更新
	always @(*) begin
			//如果满足Branch指令跳转的条件则进行跳转
			if (Interrupt)
				NPC <= 32'h00004180;
			else if (ERET)
				NPC <= EPC;
			else if ((Branch == 3'b001 & MFRSD == MFRTD) |					//beq
				 (Branch == 3'b010 & MFRSD != MFRTD) |					//bne
				 (Branch == 3'b100 & $signed(MFRSD) <= 0) |			//blez
				 (Branch == 3'b101 & $signed(MFRSD) >  0) |			//bgtz
				 (Branch == 3'b110 & $signed(MFRSD) <  0) |			//bltz
				 (Branch == 3'b111 & $signed(MFRSD) >= 0)) 			//bgez
				NPC <= PC4 + {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
			//如果为j或者jal指令则根据PC和Instr计算NPC
			else if (Jump[2] == 1 & Jump[1] == 0)
				NPC <= {{PC4[31:28]}, {Instr[25:0]}, {2{1'b0}}};
			//如果为jalr或者jr指令则根据寄存器读取的地址存入PC
			else if (Jump[2] == 1 & Jump[1] == 1)
				NPC <= MFRSD;
			else 
				NPC <= PC4 + 4;
	end  

endmodule
