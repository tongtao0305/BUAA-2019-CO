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
	 //����Ϊ�Ĵ�����ʱ���źš���λ�źź�ʹ���ź�,�������Գ�ͻ��Ԫ��ˢ���ź�
	 input clk,
	 input reset,
	 input IF_ID_EN,
	 //����ΪIR��PC4��PC8�ļĴ����ź�
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
		IR_FD = 0;			//IR_FD��ʼ��Ϊ0
		PC4_FD = 0;			//PC4_FD��ʼ��Ϊ0
		PC8_FD = 0;			//PC8_FD��ʼ��Ϊ0
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
