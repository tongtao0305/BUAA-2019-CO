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
    input MemWrite,
	 input b,
	 input h,
	 input w
    );

	reg [31:0] dm[1023:0];
	integer i;
	initial begin
		for(i = 0 ; i <= 1023 ; i = i+1) begin
			dm[i] <= 0;
		end
	end
	
	assign RD = (h ? ((dm[ A[11:2] ] << (16 - (8*A[ 1:0 ]))) >> ( 16 )):(b ? ((dm[ A[11:2] ] << (24 - (8*A[ 1:0 ]))) >> ( 24 )) : dm[ A[11:2] ])); 
	
	always @(posedge clk or posedge reset) begin
		if (reset)
			for (i = 0 ; i <= 1023 ; i = i+1)
				dm[i]<=0;
		else 
			if (MemWrite) begin
				if (b) begin
					dm[ A[11:2] ] <= ((WD[7:0] << (8*A[1:0])) + ((dm[ A[11:2] ] >> (8 + 8*A[1:0])) << (8 + 8*A[1:0])) + ((dm[ A[11:2] ] << (32 - 8*A[1:0])) >> (32 - 8*A[1:0])));
					$display("@%h: *%h <= %h", PC, A, ((WD[7:0] << (8*A[1:0])) + ((dm[ A[11:2] ] >> (8 + 8*A[1:0])) << (8 + 8*A[1:0])) + ((dm[ A[11:2] ] << (32 - 8*A[1:0])) >> (32 - 8*A[1:0]))));
				end
				else if (h) begin
					dm[ A[11:2] ] = ((WD[15:0] << (8*A[1:0])) + ((dm[ A[11:2] ][(31 - (8*A[1:0])) -: 16]) << (16 - 8*A[1:0])));
					$display("@%h: *%h <= %h", PC, A, dm[ A[11:2] ]);
					//dm[ A[11:2] ] <= ((WD[15:0] << (8*A[1:0])) + ((dm[ A[11:2] ][(31 - (8*A[1:0])) -: 16]) << (16 - 8*A[1:0])));
					//$display("@%h: *%h <= %h", PC, A, ((WD[15:0] << (8*A[1:0])) + ((dm[ A[11:2] ][(31 - (8*A[1:0])) -: 16]) << (16 - 8*A[1:0]))));
				end
				else if (w) begin
					dm[ A[11:2] ] <= (((dm[ A[11:2] ] >> (8 + 8*A[1:0])) << (8 + 8*A[1:0])) + (WD >> (24 - 8*A[1:0])));
					$display("@%h: *%h <= %h", PC, A, (((dm[ A[11:2] ] >> (8 + 8*A[1:0])) << (8 + 8*A[1:0])) + (WD >> (24 - 8*A[1:0]))));
				end
				else begin
					dm[A[11:2]] <= WD;
					$display("@%h: *%h <= %h", PC, A, WD); 
				end
			end
	end
	
	assign RD = dm[A[11:2]];

endmodule
