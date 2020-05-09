`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:01 11/19/2019 
// Design Name: 
// Module Name:    AT 
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
`define T_ALU 2'b01
`define T_DM 2'b10
`define T_PC 2'b00

module AT(
    input [31:0] IR,
	 output [4:0] A1,
	 output [4:0] A2,	 
	 output Tuse_RSD,
	 output Tuse_RTD,
	 output Tuse_RSE,
	 output Tuse_RTE,
	 output Tuse_RTM,
	 output reg [1:0] Tnew_D
    );
	
	 //����ָ�����Op��Funct
	 wire [5:0] op, fun;
	 assign op = IR[31:26];
	 assign fun = IR[5:0];	 
	 
	 //����ָ������������ݵĵ�ַ
	 assign A1 = IR[25:21];
	 assign A2 = IR[20:16];
	 
	 //����ָ���ȡ����ָ������
	 wire addu, subu, lw, sw, ori, lui, beq, j, jal, jr, jalr, nop, bgezal;
	 assign addu =(op == 6'b000000 && fun == 6'b100001) ? 1 : 0;
	 assign subu = (op == 6'b000000 && fun ==6'b100011) ? 1 : 0;
	 assign jr = (op == 6'b000000 && fun == 6'b001000) ? 1 : 0;
	 assign beq = (op == 6'b000100) ? 1 : 0;
	 assign ori = (op == 6'b001101) ? 1 : 0;
	 assign sw = (op == 6'b101011) ? 1 : 0;
	 assign lw = (op == 6'b100011) ? 1 : 0;
	 assign lui = (op == 6'b001111) ? 1 : 0;
	 assign jal = (op == 6'b000011) ? 1 : 0;
	 assign j = (op == 6'b000010) ? 1 : 0;
	 assign nop = (IR == 0) ? 1 : 0;
	 assign jalr = (op == 6'b000000 && fun == 6'b001001) ? 1 : 0;
	 assign bgezal = (op == 6'b000001) ? 1 : 0;
	 
	 //����ָ���ȡ�������������Ƿ���Ҫ��������
	 assign Tuse_RSD = (beq + jr + jalr + bgezal);
	 assign Tuse_RSE = (addu + subu + ori + lui + lw + sw);
	 assign Tuse_RTD = (beq + bgezal);
	 assign Tuse_RTE = (addu + subu);
	 assign Tuse_RTM = (sw);
	 
	 //����ָ���ȡ��ָ���IF/ID�Ĵ�����ʼ�����������ݴ���Ĵ�����Ҫ��ʱ��
	 always @(*) begin
		//cal_r | cal_i
		if(addu | subu | ori | lui)
			Tnew_D <= `T_ALU + 1;
		//load
		else if (lw)
			Tnew_D <= `T_DM + 1;
		else 
			Tnew_D <= `T_PC;
	 end

endmodule

