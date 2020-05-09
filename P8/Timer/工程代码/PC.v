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

	always @(posedge clk) begin
		if (reset) begin
			PCOut <= 32'h00003000;		//若有reset信号则将PC进行复位
		end
		else if(PCUpdate) begin
			PCOut <= PCIn;					//若有PCUpdate信号则将PC进行更新
		end
	end	

	assign ExcCode = ( (PCOut[1:0]!=2'b00) | (PCOut < 32'h00003000) | (PCOut > 32'h00004ffc) ) ? 5'd4: 0;
	
endmodule
