`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:31:15 12/21/2019 
// Design Name: 
// Module Name:    Buttons 
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
module Buttons(
	input clk,
	input reset,
	input [7:0] user_key,
	output reg [31:0] RD
   );
	
	always @(posedge clk) begin
		if (reset)
			RD <= 32'b0;
		else 
			RD <= {24'd0, ~user_key}; 
	end

endmodule
