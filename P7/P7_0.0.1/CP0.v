`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:29 12/15/2019 
// Design Name: 
// Module Name:    CP0 
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
module CP0(
	input clk,
	input reset,   
	// ��������ǹ���CP0��д���ȡ�ź�
	input We,					// CP0дʹ���ź�
	input [4:0] A1,			// ��CP0�Ĵ������
	input [4:0] A2,			// дCP0�Ĵ������
	input [31:0] DIn,			// CP0д������
	output [31:0] DOut,		// CPO�������
	// �����Ǹ��ж��쳣�йص��ź�
	input [31:0] PC,			// �ж��쳣��PC
	input [6:2] ExcCode,		//	�ж��쳣������
	input [5:0] HWInt,		// �ⲿ�豸�ж�
	output Interrupt,				// �ж�����
	//�����ǹ���EXL���ź�
	input EXLSet,				// ������λSR��EXL
	input EXLClr,				// �������SR��EXL
	//�����Ǳ����쳣ʱ��PC
	output [31:0] EPC,		// EPC�Ĵ��������NPC
	//�ж��ӳٲ۵��ź�
	input Jump,
	input Branch
	);
	
	//����SR��ʹ�õ��ļĴ���λ
	//SR = {16'b0, im, 8'b0, exl, ie}
	reg [15:10] im;
	reg exl, ie;
	//����Cause��ʹ�õ��ļĴ���λ
	//CAUSE = {bd, 15'b0, hwint_pend[15:10], 3'b0, exccode[6:2], 2'b0}
	reg bd;	
	reg [15:10] hwint_pend;
	reg [6:2] exccode;
	//����EPC��ʹ�õ��ļĴ���λ
	reg [31:0] epc;
	//����PRId��ʹ�õ��ļĴ���λ
	reg [31:0] PRId;	
	
	//���EPC��ֵ
	assign EPC = epc;
	//���DOut��ָ
	assign DOut = (A1 == 5'd12) ? {16'b0, im, 8'b0, exl, ie} :
					  (A1 == 5'd13) ? {bd, 15'b0, hwint_pend[15:10], 3'b0, exccode[6:2], 2'b0} : 
					  (A1 == 5'd14) ? epc :
					  (A1 == 5'd15) ? PRId :
					  32'h0;	
	
	//���岢�ж��ⲿ�жϺ��ڲ��쳣
	wire IntReq, ExcReq;
	assign IntReq = (|(HWInt[5:0] & im[15:10])) & ie & !exl ;
	assign ExcReq = (ExcCode != 5'b00000) & (~exl);
	assign Interrupt = IntReq | ExcReq;
	
	initial begin
		im <= 6'b0;
		exl <= 0;
		ie <= 0;
		hwint_pend <= 6'b0;
		exccode <= 0;
		bd <= 0;
		epc <= 0;	
		PRId = 32'h12345678;			//PRId���ⶨ��һ����ʼֵ
	end
	
	always @(posedge clk) begin
		hwint_pend <= HWInt;
		//��λ�ź�
		if (reset) begin
			im <= 6'b0;
			exl <= 0;
			ie <= 0;
			hwint_pend <= 6'b0;
			exccode <= 0;
			bd <= 0;
			epc <= 0;
		end
		else begin
			//CP0�Ĵ���д��
			if (We) begin
				case (A2) 
					5'd12 : {im, exl, ie} <= {DIn[15:10], DIn[1], DIn[0]};
					5'd13 : {hwint_pend} <= {DIn[15:10]};
					5'd14 : {epc} <= {DIn[31:0]};
					5'd15 : PRId <= DIn;
				endcase
			end			
			
			//����epc��ֵ
			epc <= (Interrupt && bd) ? {PC[31:2], 2'b00} - 4 :
					 (Interrupt &&!bd) ? {PC[31:2], 2'b00} :
					 epc;	
			
			//����bdֵ
			if (PC < 32'h00004180) begin
				if (bd == 1'b0) begin
					if (Branch | Jump) begin
						bd <= 1'b1;
					end
				end
				else if (bd == 1'b1) begin
					if (exl == 1'b0 & Interrupt == 1'b0) begin
						bd <= 1'b0;
					end
				end
			end
			else begin
				bd <= bd;
			end
			
			// ��EXL������λ�����
			if (EXLSet | Interrupt) begin
				exl <= 1'b1;
				exccode <= ExcCode;
			end
			if (EXLClr) begin
				exl <= 1'b0;
				bd <= 1'b0;
			end	
		end	
	end

endmodule
