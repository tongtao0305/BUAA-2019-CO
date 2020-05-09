`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:17 11/16/2019 
// Design Name: 
// Module Name:    PC 
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
module PC(
	 input clk,
    input reset,
	 input PCUpdate,
	 input [31:0] PCIn,
	 output reg [31:0] PCOut,
	 output [4:0] ExcCode
    );
	
	initial begin
		PCOut <= 32'h00003000;			//��PC��ʼ��Ϊ0x3000
	end

	always @(posedge clk) begin
		if (reset) begin
			PCOut <= 32'h00003000;		//����reset�ź���PC���и�λ
		end
		else if(PCUpdate) begin
			PCOut <= PCIn;					//����PCUpdate�ź���PC���и���
		end
	end	

	assign ExcCode = ( (PCIn[1:0]!=2'b00) | (PCIn < 32'h00003000) | (PCIn > 32'h00004ffc) ) ? 4: 0;
	
endmodule
