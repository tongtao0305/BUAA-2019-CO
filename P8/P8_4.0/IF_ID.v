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
	 input Interrupt,
	 input IF_ID_EN,
	 //����ΪIR��PC4��PC8�ļĴ����ź�
	 input [31:0] IRIn,
	 output [31:0] IROut,
	 input [31:0] PC4In,
	 output [31:0] PC4Out,
	 input [31:0] PC8In,
	 output [31:0] PC8Out,
	 //
	 input [4:0] ExcCodeIn,
	 output [4:0] ExcCodeOut,
	 input BDIn,
	 output BDOut
    );
	
	reg [31:0] IR_FD;
	reg [31:0] PC4_FD;
	reg [31:0] PC8_FD;
	reg [4:0] ExcCode_FD;
	reg BD_FD;
	
	assign IROut = IR_FD;
	assign PC4Out = PC4_FD;
	assign PC8Out = PC8_FD;
	assign ExcCodeOut = ExcCode_FD;
	assign BDOut = BD_FD;
	
	always @(posedge clk) begin
		if (reset) begin
			IR_FD <= 0;
			PC4_FD <= 0;
			PC8_FD <= 0;
			ExcCode_FD <= 0;
			BD_FD <= 0;
		end
		else if (Interrupt) begin
			IR_FD <= 0;
			PC4_FD <= 0;
			PC8_FD <= 0;
			ExcCode_FD <= 0;
			BD_FD <= 0;
		end
		else if (IF_ID_EN) begin
			IR_FD <= IRIn;
			PC4_FD <= PC4In;
			PC8_FD <= PC8In;
			ExcCode_FD <= ExcCodeIn;
			BD_FD <= BDIn;			
		end
	end

endmodule
