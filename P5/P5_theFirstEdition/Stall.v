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

module Stall(
    input [31:0] IR_D,
    input [31:0] IR_E,
    input [31:0] IR_M,	
	 input RegWrite_E,
	 input RegWrite_M,
	 output StallF,
	 output StallD,
	 output FlushE
    );
	
	 //将三个阶段的指令重新编码
	 wire [3:0] ID, EX, MEM;
	 InstrRecode InstrRecode_ID(IR_D, ID);
	 InstrRecode InstrRecode_EX(IR_E, EX);
	 InstrRecode InstrRecode_MEM(IR_M, MEM);
	 
	 //根据不同类型的暂停进行分析
	 wire Stall_CAL_R_Rs, Stall_CAL_R_Rt; 
	 wire Stall_CAL_I_Rs; 
	 wire Stall_BEQ_Rs, Stall_BEQ_Rt; 
    wire Stall_LOAD_Rs; 
    wire Stall_SAVE_Rs; 
    wire Stall_JR_Rs;    
	 
	 assign Stall_BEQ_Rs = 
	 (ID == `BEQ & EX  == `CAL_R & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rd] & RegWrite_E) | 
    (ID == `BEQ & EX  == `CAL_I & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E) |
    (ID == `BEQ & EX  == `LOAD  & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E) | 
    (ID == `BEQ & MEM == `LOAD  & IR_D[`rs]!=0 & IR_D[`rs] == IR_M[`rt] & RegWrite_M);

    assign Stall_BEQ_Rt = 
	 (ID == `BEQ & EX  == `CAL_R & IR_D[`rt]!=0 & IR_D[`rt] == IR_E[`rd] & RegWrite_E) | 
    (ID == `BEQ & EX  == `CAL_I & IR_D[`rt]!=0 & IR_D[`rt] == IR_E[`rt] & RegWrite_E) |
    (ID == `BEQ & EX  == `LOAD  & IR_D[`rt]!=0 & IR_D[`rt] == IR_E[`rt] & RegWrite_E) | 
    (ID == `BEQ & MEM == `LOAD  & IR_D[`rt]!=0 & IR_D[`rt] == IR_M[`rt] & RegWrite_M);
    
	 assign Stall_CAL_R_Rs =
    (ID == `CAL_R & EX == `LOAD & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E);

    assign Stall_CAL_R_Rt =
    (ID == `CAL_R & EX == `LOAD & IR_D[`rt]!=0 & IR_D[`rt] == IR_E[`rt] & RegWrite_E);

    assign Stall_CAL_I_Rs =
    (ID == `CAL_I & EX == `LOAD & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E);

    assign Stall_LOAD_Rs =
    (ID == `LOAD & EX == `LOAD & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E);

    assign Stall_SAVE_Rs =
    (ID == `SAVE & EX == `LOAD & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E);
	 
    assign Stall_JR_Rs = 
    (ID == `JR & EX == `CAL_R & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rd] & RegWrite_E) | 
    (ID == `JR & EX == `CAL_I & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E) |
    (ID == `JR & EX == `LOAD  & IR_D[`rs]!=0 & IR_D[`rs] == IR_E[`rt] & RegWrite_E) | 
    (ID == `JR & MEM == `LOAD  & IR_D[`rs]!=0 & IR_D[`rs] == IR_M[`rt] & RegWrite_M);
	 
	 //将不同类型的暂停统一为一个信号
	 wire Stall;
    assign Stall = Stall_BEQ_Rs | 
						 Stall_BEQ_Rt | 
						 Stall_CAL_R_Rs | 
						 Stall_CAL_R_Rt | 
						 Stall_CAL_I_Rs | 
						 Stall_LOAD_Rs | 
						 Stall_SAVE_Rs | 
						 Stall_JR_Rs;
						 
	 //根据Stall信号输出对应的控制信号
    assign StallF = !Stall;
    assign StallD = !Stall;
    assign FlushE = Stall;

endmodule
