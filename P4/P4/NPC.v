`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:22 10/14/2019 
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
    //�����Ǽ���NPC������ź�
	 input [31:0] PC,
    output reg [31:0] NPC,
    //�����ǹ���Branchָ�������ź�
	 input [2:0] Branch,
    input [1:0] Zero,
    //�����ǹ���Jumpָ�������ź�
	 input [2:0] Jump,
	 input [31:0] jr 
	 );

	 //����ΪBָ����жϲ���
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

	always @(*) begin
		if (B)
			//����Branchָ�������Ӧ����ת
			NPC <= {{14{Instr[15]}},{Instr[15:0]},{2{1'b0}}};
		else begin
			//����Jump�źŽ�����Ӧ����ת
			case (Jump)
				3'b000 : NPC <= PC + 4;
				3'b100 : NPC <= {{Instr[31:28]},{Instr[25:0]},{2{1'b0}}};
				3'b101 : NPC <= {{Instr[31:28]},{Instr[25:0]},{2{1'b0}}};
				3'b110 : NPC <= jr;
				3'b111 : NPC <= jr;
				default NPC <= PC + 4;
			endcase
		end
	end
		
endmodule
