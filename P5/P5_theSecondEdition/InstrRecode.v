`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:53 11/17/2019 
// Design Name: 
// Module Name:    InstrRecode 
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

module InstrRecode(
    input [31:0] IR,
    output [3:0] Out
    );

    assign Out = 
    {IR[`OP],IR[`FUNCT]}		== `_ADDU	?	`CAL_R	:
	 {IR[`OP],IR[`FUNCT]}		== `_SUBU	?	`CAL_R	:
	 {IR[`OP]}						== `_ORI		?	`CAL_I	:
	 {IR[`OP]}						== `_LUI		?	`CAL_I	:
	 {IR[`OP]}						== `_BEQ		?	`BEQ		:
    {IR[`OP]}						== `_LW		?	`LOAD		:
	 {IR[`OP]}						== `_SW		?	`SAVE		:
	 {IR[`OP]}						== `_J		?	`J			:
    {IR[`OP]}						== `_JAL		?	`JAL		:
    {IR[`OP],IR[`FUNCT]}		== `_JR		?	`JR		:	0;

endmodule
