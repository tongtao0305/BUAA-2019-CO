`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:28 11/03/2019 
// Design Name: 
// Module Name:    P8_BLACKBOX 
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
module wrapper(
	 // interface for P8_BLACKBOX
	 input clk,
	 input reset,
	 input [31:0] F_addr,
	 input [31:0] F_instr,
	 input [31:0] M_addr,
	 input M_WE,
	 input M_RE,
	 input [31:0] M_WData,
	 input [31:0] M_RData,
	 
	 output [31:0] user_F_addr,
	 output [31:0] user_F_instr,
	 output [31:0] user_M_addr,
	 output user_M_WE,
	 output user_M_RE,
	 output [31:0] user_M_WData,
	 output [31:0] user_M_RData,
	 
	 //For main FPGA
	 input rxd,
	 output TxD,
	 
	 //For testing
	 output[7:0]  txd_buffer
);
endmodule
