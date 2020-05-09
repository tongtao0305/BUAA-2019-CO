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
	 //Branchָ������ź�
	 input [2:0] Branch,
	 input [31:0] MFRSD,
	 input [31:0] MFRTD,
	 input [2:0] Jump,
	 input Interrupt,
	 input ERET,
	 input [31:0] EPC	 
	 );
	
		//��PC��ֵ���и���
	always @(*) begin
			//�������Branchָ����ת�������������ת
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
			//���Ϊj����jalָ�������PC��Instr����NPC
			else if (Jump[2] == 1 & Jump[1] == 0)
				NPC <= {{PC4[31:28]}, {Instr[25:0]}, {2{1'b0}}};
			//���Ϊjalr����jrָ������ݼĴ�����ȡ�ĵ�ַ����PC
			else if (Jump[2] == 1 & Jump[1] == 1)
				NPC <= MFRSD;
			else 
				NPC <= PC4 + 4;
	end  

endmodule
