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
	 input Branch,
	 input Cmp,
	 input j,
	 input jal,
	 input jr,
	 input [31:0] RS_D
	 );
	
	initial begin
		NPC = 32'h00003000; 
	end
		//对PC的值进行更新
	always @(*) begin
			//如果满足Branch指令跳转的条件则进行跳转
			if (Branch && Cmp)
				NPC <= PC4 + {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
			//如果为j或者jal指令则根据PC和Instr计算NPC
			else if (j | jal)
				NPC <= {{PC4[31:28]},{Instr[25:0]},{2{1'b0}}};
			//如果为jalr或者jr指令则根据寄存器读取的地址存入PC
			else if (jr)
				NPC <= RS_D;
			else 
				NPC <= PC4;
	end  

endmodule
