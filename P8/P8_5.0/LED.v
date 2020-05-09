`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:28:05 12/21/2019 
// Design Name: 
// Module Name:    LED 
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
module LED(
	input clk,
	input reset,
	input We,
	input [31:0] WD,
	output reg [31:0] RD
   );

	always @(posedge clk) begin
		if(reset) begin
            RD <= ~(32'd0);
        end
        else if(We) begin
            RD <= ~WD;
        end
	end

endmodule
