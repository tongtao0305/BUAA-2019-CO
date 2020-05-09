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
`define _LW    6'b100011
`define _SW    6'b101011
`define _ADDU  12'b000000100001
`define _SUBU  12'b000000100011
`define _BEQ   6'b000100
`define _ORI   6'b001101
`define _LUI   6'b001111
`define _J		6'b000010
`define _JAL   6'b000011
`define _JR    12'b000000001000

`define OP 31:26
`define FUNCT 5:0
`define rs 25:21
`define rt 20:16
`define rd 15:11


//以下为指令类型的编号
`define CAL_R	4'h1
`define CAL_I	4'h2
`define BEQ		4'h3
`define LOAD	4'h4
`define SAVE	4'h5
`define J		4'h6
`define JAL		4'h7
`define JR		4'h8


module Forward(
    input RegWrite_M,
    input RegWrite_W,
    input [31:0] IR_D,
    input [31:0] IR_E,
    input [31:0] IR_M,
    input [31:0] IR_W,
    output [2:0] ForwardRSD,
    output [2:0] ForwardRTD,
    output [2:0] ForwardRSE,
    output [2:0] ForwardRTE,
    output [1:0] ForwardRTM
    );
	 
	wire [3:0] ID; 
   wire [3:0] EX; 
   wire [3:0] MEM; 
   wire [3:0] WB; 
	
	InstrRecode InstrRecode_D(IR_D,ID);
   InstrRecode InstrRecode_E(IR_E,EX);
	InstrRecode InstrRecode_M(IR_M,MEM);
	InstrRecode InstrRecode_W(IR_W,WB);
	
	parameter FR_INIT = 2'b00,FR_AO = 2'b01,FR_PC8 = 2'b10, FR_WB = 2'b11;
	
	assign ForwardRSD = !(ID == `BEQ | ID == `JR | ID == `CAL_R | ID == `CAL_I | ID == `SAVE) ? 3'b000: // 无转发
								(MEM == `CAL_R & IR_D[`rs] == IR_M[`rd] & RegWrite_M & IR_D[`rs] != 0) ? 3'b001: // ALU_out_M
								(MEM == `CAL_I & IR_D[`rs] == IR_M[`rt] & RegWrite_M & IR_D[`rs] != 0) ? 3'b001: // ALU_out_M
								(MEM == `JAL   & IR_D[`rs] == 5'h1f     & RegWrite_M & IR_D[`rs] != 0) ? 3'b010: // PC8_M
								(WB == `CAL_R  & IR_D[`rs] == IR_W[`rd] & RegWrite_W & IR_D[`rs] != 0) ? 3'b011: // WriteData_GRF
								(WB == `CAL_I  & IR_D[`rs] == IR_W[`rt] & RegWrite_W & IR_D[`rs] != 0) ? 3'b011: // WriteData_GRF
								(WB == `LOAD   & IR_D[`rs] == IR_W[`rt] & RegWrite_W & IR_D[`rs] != 0) ? 3'b011: // WriteData_GRF
								(WB == `JAL    & IR_D[`rs] == 5'h1f     & RegWrite_W & IR_D[`rs] != 0) ? 3'b011: // WriteData_GRF
								0; // 无转发
								
	assign ForwardRTD = !(ID == `BEQ | ID == `CAL_R | ID == `SAVE) ? 3'b000:
								(MEM == `CAL_R & IR_D[`rt] == IR_M[`rd] & RegWrite_M & IR_D[`rt] !=0) ? 3'b001: // ALU_out_M
								(MEM == `CAL_I & IR_D[`rt] == IR_M[`rt] & RegWrite_M & IR_D[`rt] !=0) ? 3'b001: // ALU_out_M
								(MEM == `JAL   & IR_D[`rt] == 5'h1f     & RegWrite_M & IR_D[`rt] !=0) ? 3'b010: // PC8_M
								(WB == `CAL_R  & IR_D[`rt] == IR_W[`rd] & RegWrite_W & IR_D[`rt] !=0) ? 3'b011: // WriteData_GRF
								(WB == `CAL_I  & IR_D[`rt] == IR_W[`rt] & RegWrite_W & IR_D[`rt] !=0) ? 3'b011: // WriteData_GRF
								(WB == `LOAD   & IR_D[`rt] == IR_W[`rt] & RegWrite_W & IR_D[`rt] !=0) ? 3'b011: // WriteData_GRF
								(WB == `JAL    & IR_D[`rt] == 5'h1f     & RegWrite_W & IR_D[`rt] !=0) ? 3'b011: // WriteData_GRF
								0; // 无转发
	
	assign ForwardRSE = !(EX == `CAL_R | EX == `CAL_I | EX == `LOAD | EX == `SAVE) ? 0 :  // 无转发
								(MEM == `CAL_R & IR_E[`rs] == IR_M[`rd] & RegWrite_M & IR_E[`rs] !=0) ? 3'b001: // ALU_out_M
								(MEM == `CAL_I & IR_E[`rs] == IR_M[`rt] & RegWrite_M & IR_E[`rs] !=0) ? 3'b001: // ALU_out_M
								(MEM == `JAL   & IR_E[`rs] == 5'h1f     & RegWrite_M & IR_E[`rs] !=0) ? 3'b010: // PC8_M
								(WB == `CAL_R  & IR_E[`rs] == IR_W[`rd] & RegWrite_W & IR_E[`rs] !=0) ? 3'b011: // WriteData_GRF
								(WB == `CAL_I  & IR_E[`rs] == IR_W[`rt] & RegWrite_W & IR_E[`rs] !=0) ? 3'b011: // WriteData_GRF
								(WB == `LOAD   & IR_E[`rs] == IR_W[`rt] & RegWrite_W & IR_E[`rs] !=0) ? 3'b011: // WriteData_GRF
								(WB == `JAL    & IR_E[`rs] == 5'h1f     & RegWrite_W & IR_E[`rs] !=0) ? 3'b011: // WriteData_GRF
								0; // 无转发
	
	assign ForwardRTE = !(EX == `CAL_R | EX == `SAVE) ? 0 :  // 无转发
								(MEM == `CAL_R & IR_E[`rt] == IR_M[`rd] & RegWrite_M & IR_E[`rt] !=0) ? 3'b001: // ALU_out_M
								(MEM == `CAL_I & IR_E[`rt] == IR_M[`rt] & RegWrite_M & IR_E[`rt] !=0) ? 3'b001: // ALU_out_M
								(MEM == `JAL   & IR_E[`rt] == 5'h1f     & RegWrite_M & IR_E[`rt] !=0) ? 3'b010: // PC8_M
								(WB == `CAL_R  & IR_E[`rt] == IR_W[`rd] & RegWrite_W & IR_E[`rt] !=0) ? 3'b011: // WriteData_GRF
								(WB == `CAL_I  & IR_E[`rt] == IR_W[`rt] & RegWrite_W & IR_E[`rt] !=0) ? 3'b011: // WriteData_GRF
								(WB == `LOAD   & IR_E[`rt] == IR_W[`rt] & RegWrite_W & IR_E[`rt] !=0) ? 3'b011: // WriteData_GRF
								(WB == `JAL    & IR_E[`rt] == 5'h1f     & RegWrite_W & IR_E[`rt] !=0) ? 3'b011: // WriteData_GRF
								0; // 无转发						
    
	assign ForwardRTM = !(MEM == `SAVE) ? 0 :  // 无转发
								(WB == `CAL_R  & IR_M[`rt] == IR_W[`rd] & RegWrite_W & IR_M[`rt] !=0) ? 3'b001: // WriteData_GRF
								(WB == `CAL_I  & IR_M[`rt] == IR_W[`rt] & RegWrite_W & IR_M[`rt] !=0) ? 3'b001: // WriteData_GRF
								(WB == `LOAD   & IR_M[`rt] == IR_W[`rt] & RegWrite_W & IR_M[`rt] !=0) ? 3'b001: // WriteData_GRF
								(WB == `JAL    & IR_M[`rt] == 5'h1f     & RegWrite_W & IR_M[`rt] !=0) ? 3'b001: // WriteData_GRF
								0; // 无转发		

endmodule


