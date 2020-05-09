`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:28 11/16/2019 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(
	 //以下为寄存器的时钟信号、复位信号和使能信号,还有来自冲突单元的刷新信号
	 input clk,
	 input reset,
	 input IF_ID_EN,
	 //以下为IR、PC4、PC8的寄存器信号
	 input [31:0] IRIn,
	 output [31:0] IROut,
	 input [31:0] PC4In,
	 output [31:0] PC4Out,
	 input [31:0] PC8In,
	 output [31:0] PC8Out
    );
	
	reg [31:0] IR_FD;
	reg [31:0] PC4_FD;
	reg [31:0] PC8_FD;
	
	initial begin
		IR_FD = 0;			//IR_FD初始化为0
		PC4_FD = 0;			//PC4_FD初始化为0
		PC8_FD = 0;			//PC8_FD初始化为0
	end
	
	assign IROut = IR_FD;
	assign PC4Out = PC4_FD;
	assign PC8Out = PC8_FD;
	
	always @(posedge clk) begin
		if (reset) begin
			IR_FD <= 0;
			PC4_FD <= 0;
			PC8_FD <= 0;
		end
		else if (IF_ID_EN) begin
			IR_FD <= IRIn;
			PC4_FD <= PC4In;
			PC8_FD <= PC8In;
		end
	end

endmodule
