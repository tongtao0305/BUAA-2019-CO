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
	 input [31:0] PC,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    output [31:0] RD1,
    output [31:0] RD2,
    input [31:0] WD,
    input RegWrite,
    input clk,
    input reset,
	 input w,
	 input [31:0] A
    );

	reg [31:0] register[31:0];	//定义31个寄存器，$0保持为0
	integer i;
	initial begin
		for (i = 0 ; i <= 31 ; i = i+1) begin
			register[i] <= 0;
		end
	end
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			for(i = 0 ; i <= 31 ; i=i+1) begin
				register[i] <= 0;	//若有Reset信号，则将所有寄存器清零
			end	
		end
		else begin
			if (RegWrite) begin
				if (A3 != 0) begin
					if (w) begin 
						register[A3] <= ((WD << (24 - 8*A[1:0])) + ((register[A3] << (8 + 8*A[1:0])) >> (8 + 8*A[1:0])));
						$display("@%h: $%d <= %h", PC, A3, ((WD << (24 - 8*A[1:0])) + ((register[A3] << (8 + 8*A[1:0])) >> (8 + 8*A[1:0]))));
					end
					else begin
						register[A3] <= WD;
						$display("@%h: $%d <= %h", PC, A3, WD);
					end
				end
			end
		end
	end
	
	assign RD1 = (A1 == 0) ? 32'b0 : register[A1];
	assign RD2 = (A2 == 0) ? 32'b0 : register[A2];	
	
endmodule
