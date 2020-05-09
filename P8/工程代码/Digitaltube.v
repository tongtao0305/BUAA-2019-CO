`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:35 12/20/2019 
// Design Name: 
// Module Name:    Nixietube 
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
module Digitaltube(
	 input clk,
	 input reset,
	 input we,
	 input [2:0] addr,
	 input [31:0] din,
	 output [31:0] dout,
	 //以下是三个数码管的输出信号
	 output [7:0] digital_tube0,
	 output [7:0] digital_tube1,
	 output [7:0] digital_tube2,
	 output [3:0] sel0,
	 output [3:0] sel1,
	 output sel2
    );
	
	reg [35:0] data;			//用来保存数据
	reg [9:0] counter;		//计时器
	
	wire [35:0] datawi;
	wire [9:0] counterwi;
	
	wire [3:0] trans0;
	wire [3:0] trans1;
	wire [3:0] trans2;
	
	assign datawi = (we) ? ((addr == 3'b000) ? {data[35:32], din} : {din[3:0], data[31:0]}) : data;
	assign counterwi = (counter == 10'b1111111111) ? 0 : counter + 1;
	
	assign dout = (addr == 3'b110) ? data[31:0] : {28'b0, data[35:32]};
	
	//根据counter更新sel信号
	assign sel2 = 1'b1;
	assign sel1 = (counter[1:0]==2'b00) ? 4'b0001 :
					  (counter[1:0]==2'b01) ? 4'b0010 :
					  (counter[1:0]==2'b10) ? 4'b0100 :
					  (counter[1:0]==2'b11) ? 4'b1000 :
					  4'b0000;
	assign sel0 = sel1;	
	
	//根据sel信号生成对应的trans
	assign trans0 = (sel0 == 4'b0001) ? data[3:0] :
						 (sel0 == 4'b0010) ? data[7:4] :
						 (sel0 == 4'b0100) ? data[11:8] :
						 (sel0 == 4'b1000) ? data[15:12] :
						 4'b0;
						
	assign trans1 = (sel1 == 4'b0001) ? data[19:16] :
						 (sel1 == 4'b0010) ? data[23:20] :
						 (sel1 == 4'b0100) ? data[27:24] :
						 (sel1 == 4'b1000) ? data[31:28] :
						 4'b0;
						
	assign trans2 =data[35:32];

	//根据trans生成对应的digital_tube输出信号
	assign digital_tube0 = (trans0 == 4'h0) ? 8'b10000001:	
								  (trans0 == 4'h1) ? 8'b11001111:
								  (trans0 == 4'h2) ? 8'b10010010:
								  (trans0 == 4'h3) ? 8'b10000110:
								  (trans0 == 4'h4) ? 8'b11001100:
								  (trans0 == 4'h5) ? 8'b10100100:
								  (trans0 == 4'h6) ? 8'b10100000:
								  (trans0 == 4'h7) ? 8'b10001111:
								  (trans0 == 4'h8) ? 8'b10000000:
								  (trans0 == 4'h9) ? 8'b10000100:
								  (trans0 == 4'ha) ? 8'b10001000:
								  (trans0 == 4'hb) ? 8'b11100000:
								  (trans0 == 4'hc) ? 8'b10110001:
								  (trans0 == 4'hd) ? 8'b11000010:
								  (trans0 == 4'he) ? 8'b10110000:
								  (trans0 == 4'hf) ? 8'b10111000:
								  8'b00000000;

	assign digital_tube1 = (trans1 == 4'h0) ? 8'b10000001:	
								  (trans1 == 4'h1) ? 8'b11001111:
								  (trans1 == 4'h2) ? 8'b10010010:
								  (trans1 == 4'h3) ? 8'b10000110:
								  (trans1 == 4'h4) ? 8'b11001100:
								  (trans1 == 4'h5) ? 8'b10100100:
								  (trans1 == 4'h6) ? 8'b10100000:
								  (trans1 == 4'h7) ? 8'b10001111:
								  (trans1 == 4'h8) ? 8'b10000000:
								  (trans1 == 4'h9) ? 8'b10000100:
								  (trans1 == 4'ha) ? 8'b10001000:
								  (trans1 == 4'hb) ? 8'b11100000:
								  (trans1 == 4'hc) ? 8'b10110001:
								  (trans1 == 4'hd) ? 8'b11000010:
								  (trans1 == 4'he) ? 8'b10110000:
								  (trans1 == 4'hf) ? 8'b10111000:
								  8'b00000000;
								 
	assign digital_tube2 = (trans2 == 4'h0) ? 8'b10000001:	
								  (trans2 == 4'h1) ? 8'b11001111:
								  (trans2 == 4'h2) ? 8'b10010010:
								  (trans2 == 4'h3) ? 8'b10000110:
								  (trans2 == 4'h4) ? 8'b11001100:
								  (trans2 == 4'h5) ? 8'b10100100:
								  (trans2 == 4'h6) ? 8'b10100000:
								  (trans2 == 4'h7) ? 8'b10001111:
								  (trans2 == 4'h8) ? 8'b10000000:
								  (trans2 == 4'h9) ? 8'b10000100:
								  (trans2 == 4'ha) ? 8'b10001000:
								  (trans2 == 4'hb) ? 8'b11100000:
								  (trans2 == 4'hc) ? 8'b10110001:
								  (trans2 == 4'hd) ? 8'b11000010:
								  (trans2 == 4'he) ? 8'b10110000:
								  (trans2 == 4'hf) ? 8'b10111000:
								  8'b00000000;

	integer i;

	always @(posedge clk) begin
		if (reset) begin
			i <= 0;
			data <= 0;
			counter <= 0;
		end
		else begin
			if (i == 2500) begin
				i <= 0;
				data <= datawi;
				counter <= counterwi;
			end
			else begin
				i <= i + 1;
			end
			
		end
	end

endmodule
