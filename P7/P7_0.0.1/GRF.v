`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:07 10/14/2019 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input clk,
    input reset,
	 input RegWrite,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
	 input [31:0] PC,
	 input [31:0] WD3,
    output [31:0] RD1,
    output [31:0] RD2
    );

	reg [31:0] register[31:0];			//定义31个寄存器，$0保持为0
	integer i;
	initial begin
		for (i = 0 ; i <= 31 ; i = i+1) begin
			register[i] <= 0;				//将寄存器初始化为0
		end
	end
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			for(i = 0 ; i <= 31 ; i=i+1) begin
				register[i] <= 0;			//若有Reset信号，则将所有寄存器清零
			end	
		end
		else begin
			if (RegWrite) begin
				if (A3 != 0) begin
					register[A3] <= WD3;
					$display("%d@%h: $%d <= %h", $time, PC, A3, WD3);					
				end
			end
		end
	end
	
	assign RD1 = (A1 == 0) ? 32'b0 : (A1 == A3 & RegWrite) ? WD3 : register[A1];
	assign RD2 = (A2 == 0) ? 32'b0 : (A2 == A3 & RegWrite) ? WD3 : register[A2];	
	
endmodule
