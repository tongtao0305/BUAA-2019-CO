`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:57 11/17/2019 
// Design Name: 
// Module Name:    Stall 
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
module Stall(
	 //����ָ�����Ҫ���ݵļĴ�����ַ
    input [4:0] A1,
	 input [4:0] A2,
	 //���������Ҫ���ݵļĴ������ź�
    input Tuse_RSD,
	 input Tuse_RTD,
	 input Tuse_RSE,
	 input Tuse_RTE,
	 input Tuse_RTM,
	 //�����в����źŵ�EX, MEM, WB�׶ε��ź�
	 input [1:0] Tnew_E,
	 input [1:0] Tnew_M,
	 input [1:0] Tnew_W,
	 input [4:0] A3_E,
	 input [4:0] A3_M,
	 input [4:0] A3_W,
	 input RegWrite_E,
	 input RegWrite_M,
	 input RegWrite_W,
	 //��������������ź�
	 output StallF,
	 output StallD,
	 output FlushE
    );
	 
	wire Stall, Stall_RSD_E, Stall_RSD_M, Stall_RTD_E, Stall_RTD_M, Stall_RSE_E, Stall_RTE_E;
	
	assign Stall_RSD_E = Tuse_RSD & (Tnew_E > 0) & (A1 == A3_E) & RegWrite_E & (A1 != 0);
	assign Stall_RSD_M = Tuse_RSD & (Tnew_M > 0) & (A1 == A3_M) & RegWrite_M & (A1 != 0);
	assign Stall_RTD_E = Tuse_RTD & (Tnew_E > 0) & (A2 == A3_E) & RegWrite_E & (A2 != 0);
	assign Stall_RTD_M = Tuse_RTD & (Tnew_M > 0) & (A2 == A3_M) & RegWrite_M & (A2 != 0);	
		
	assign Stall_RSE_E = Tuse_RSE & (Tnew_E == 2'b10) & (A1 == A3_E) & RegWrite_E & (A1 != 0);
	assign Stall_RTE_E = Tuse_RTE & (Tnew_E == 2'b10) & (A2 == A3_E) & RegWrite_E & (A2 != 0);

	assign Stall = Stall_RSD_E | Stall_RSD_M | Stall_RTD_E | Stall_RTD_M | Stall_RSE_E | Stall_RTE_E;
	
	//����Stall�ź������Ӧ�Ŀ����ź�
   assign StallF = !Stall;
   assign StallD = !Stall;
   assign FlushE = Stall;	

endmodule	