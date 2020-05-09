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
    input reset
    );

	reg [31:0] rf[31:1];	//定义31个寄存器，$0保持为0
	integer i;
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			for(i = 1 ; i <= 31 ; i=i+1) begin
				rf[i] <= 32'h0;	//若有Reset信号，则将所有寄存器清零
			end	
		end
		else begin
			if (RegWrite)
				rf[A3] <= WD;
				$display("@%h: $%d <= %h", PC, A3, WD);
		end
	end
	
	assign RD1 = (A1 == 0) ? 32'b0 : rf[A1];
	assign RD2 = (A2 == 0) ? 32'b0 : rf[A2];	
	
endmodule
