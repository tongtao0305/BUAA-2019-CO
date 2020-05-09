`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:45 12/01/2018 
// Design Name: 
// Module Name:    Forward 
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
module Forward(
	 //五个数据位点需要的地址信号
    input [4:0] A1_D,
    input [4:0] A2_D,
	 input [4:0] A1_E,
    input [4:0] A2_E,
	 input [4:0] A2_M,	 
	 //以下为三个产生数据阶段的信号
	 input RegWrite_E,
    input RegWrite_M,
    input RegWrite_W,
	 input [4:0] A3_E,
    input [4:0] A3_M,
	 input [4:0] A3_W,	 
	 input [1:0] Tnew_E,
	 input [1:0] Tnew_M,
	 input [1:0] Tnew_W,
	 //以下为五个输出的转发信号
    output [2:0] ForwardRSD,
    output [2:0] ForwardRTD,
    output [2:0] ForwardRSE,
    output [2:0] ForwardRTE,
    output [2:0] ForwardRTM,
	 //以下为jal和jalr的特判信号
	 input jal_E,
	 input jalr_E,
	 input jal_M,
	 input jalr_M,
	 input jal_W,
	 input jalr_W	 
    );
	 
	 assign ForwardRSD = (A1_D == A3_E) & (Tnew_E == 2'b00) & (A3_E != 0) & (jal_E | jalr_E) & RegWrite_E? 3'b001:		// EX 阶段有jal指令，转发至 PC8_E
								(A1_D == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & !(jal_M| jalr_M) & RegWrite_M? 3'b010:		// MEM 阶段有cal_j,cal_i指令，转发至 ALUResult_M
								(A1_D == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & (jal_M | jalr_M) & RegWrite_M? 3'b011:		// MEM 阶段有jal指令，转发至 PC8_M
								(A1_D == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & !(jal_W| jalr_W) & RegWrite_W? 3'b100:		// WB 阶段有cal_j,cal_i,load指令，转发至 WriteReg_Data
								(A1_D == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & (jal_W | jalr_W) & RegWrite_W? 3'b101:		// WB 阶段有jal指令，转发至 PC8_W
								3'b000;																													//无需转发，数据依然为GRF_RD1
																															 
	 assign ForwardRTD = (A2_D == A3_E) & (Tnew_E == 2'b00) & (A3_E != 0) & (jal_E | jalr_E) & RegWrite_E? 3'b001:		// EX 阶段有jal指令，转发至 PC8_E
								(A2_D == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & !(jal_M| jalr_M) & RegWrite_M? 3'b010:		// MEM 阶段有cal_j,cal_i指令，转发至 ALUResult_M
								(A2_D == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & (jal_M | jalr_M) & RegWrite_M? 3'b011:		// MEM 阶段有jal指令，转发至 PC8_M
								(A2_D == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & !(jal_W| jalr_W) & RegWrite_W? 3'b100:		// WB 阶段有cal_j,cal_i,load指令，转发至 WriteReg_Data
								(A2_D == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & (jal_W | jalr_W) & RegWrite_W? 3'b101:		// WB 阶段有jal指令，转发至 PC8_W
								3'b000;																													//无需转发，数据依然为GRF_RD2
								
	 assign ForwardRSE = (A1_E == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & !(jal_M| jalr_M) & RegWrite_M? 3'b001:		// MEM 阶段有cal_j,cal_i指令，转发至 ALUResult_M
								(A1_E == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & (jal_M | jalr_M) & RegWrite_M? 3'b010:		// MEM 阶段有jal指令，转发至 PC8_M
								(A1_E == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & !(jal_W| jalr_W) & RegWrite_W? 3'b011:		// WB 阶段有cal_j,cal_i,load指令，转发至 WriteReg_Data
								(A1_E == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & (jal_W | jalr_W) & RegWrite_W? 3'b100:		// WB 阶段有jal指令，转发至 PC8_W
								3'b000;																													//无需转发，数据依然为RS_E
								
	 assign ForwardRTE = (A2_E == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & !(jal_M| jalr_M) & RegWrite_M? 3'b001:		// MEM 阶段有cal_j,cal_i指令，转发至 ALUResult_M
								(A2_E == A3_M) & (Tnew_M == 2'b00) & (A3_M != 0) & (jal_M | jalr_M) & RegWrite_M? 3'b010:		// MEM 阶段有jal指令，转发至 PC8_M
								(A2_E == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & !(jal_W| jalr_W) & RegWrite_W? 3'b011:		// WB 阶段有cal_j,cal_i,load指令，转发至 WriteReg_Data
								(A2_E == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & (jal_W | jalr_W) & RegWrite_W? 3'b100:		// WB 阶段有jal指令，转发至 PC8_W
								3'b000;																													//无需转发，数据依然为RT_E
								
	 assign ForwardRTM = (A2_M == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & !(jal_W| jalr_W) & RegWrite_W? 3'b001:		// WB 阶段有cal_j,cal_i,load指令，转发至 WriteReg_Data
								(A2_M == A3_W) & (Tnew_W == 2'b00) & (A3_W != 0) & (jal_W | jalr_W) & RegWrite_W? 3'b100:		// WB 阶段有jal指令，转发至 PC8_W
								3'b000;																													//无需转发，数据依然为RT_M
	
endmodule


