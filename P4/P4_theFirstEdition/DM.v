`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:27 10/14/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
	 input [31:0] PC,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD,
    input clk,
    input reset,
    input MemWrite
    );

	reg [31:0] dm[1023:0];
	integer i;
	initial begin
		for(i = 0 ; i <= 1023 ; i = i+1) begin
			dm[i] <= 0;
		end
	end
	
	always @(posedge clk or posedge reset) begin
		if (reset)
			for (i = 0 ; i <= 1023 ; i = i+1)
				dm[i]<=0;
		else 
			if (MemWrite) begin
				dm[A[11:2]] <= WD;
				$display("@%h: *%h <= %h", PC, A, WD); 
			end
	end
	
	assign RD = dm[A[11:2]];

endmodule
