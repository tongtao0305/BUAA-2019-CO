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
		//��PC��ֵ���и���
	always @(*) begin
			//�������Branchָ����ת�������������ת
			if (Branch && Cmp)
				NPC <= PC4 + {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
			//���Ϊj����jalָ�������PC��Instr����NPC
			else if (j | jal)
				NPC <= {{PC4[31:28]},{Instr[25:0]},{2{1'b0}}};
			//���Ϊjalr����jrָ������ݼĴ�����ȡ�ĵ�ַ����PC
			else if (jr)
				NPC <= RS_D;
			else 
				NPC <= PC4;
	end  

endmodule
