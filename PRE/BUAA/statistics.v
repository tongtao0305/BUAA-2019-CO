`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:30 10/12/2019 
// Design Name: 
// Module Name:    statistics 
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
module statistics(
    input [7:0] In,
    input clk,
    output [7:0] Out
    );
	
	reg[7:0] state;
	reg[7:0] count;
	reg[7:0] result;
 	
	initial begin
		state=0;
		count=0;
		result=0;
	end
	
	always @(posedge clk) begin
		if (In==8'd35)
			state <= 5;	//输入#开始计数
		if (In ==8'd63) begin
			state <= 0;	//输入?结束计数
			if (state==4)
				result=count+1;
			else 
				result=count;
		end
		
		if (state>=1) begin
			//输入为b/B
			if ((In==8'd66 || In==8'd98) &&(state==5))
				state <= 2;
			if ((In!=8'd66 && In!=8'd98) &&(state==5))
				state <= 6;			
				
			if ((In==8'd85 || In==8'd117)&&(state==2)) 
				state <= 3;
			if ((In!=8'd85 && In!=8'd117)&&(state==2)) 
				state <= 6;
				
			if ((In==8'd65 || In==8'd97)&&(state==3)) 
				state <= 4;
			if ((In!=8'd65 && In!=8'd97)&&(state==3||state==4)) 
				state <= 6;
			
			if (In==8'd32) begin
				state <= 5;
				if (state==4)
					count=count+1;
			end		
	
		end
	end

	assign Out = result;	

endmodule
