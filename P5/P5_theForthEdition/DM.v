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
    input clk,
    input reset,	 
	 input [1:0] Store,
	 input [2:0] Load,
	 input [31:0] PC,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD,
    input MemWrite
    );

	reg [31:0] dm[1023:0];
	integer i;
	initial begin
		for(i = 0 ; i <= 1023 ; i = i+1) begin
			dm[i] <= 0;
		end
	end
	
	//����Stroe�źź�ALUResult_M�������λ����BE�ź�
	wire [3:0] BE;
	assign BE = (Store == 2'b01 & A[1:0] == 2'b00) ? 4'b0001 :	//sb[7:0]
					(Store == 2'b01 & A[1:0] == 2'b01) ? 4'b0010 :	//sb[15:8]
					(Store == 2'b01 & A[1:0] == 2'b10) ? 4'b0100 :	//sb[23:16]
					(Store == 2'b01 & A[1:0] == 2'b11) ? 4'b1000 :	//sb[31:24]
					(Store == 2'b10 & A[1:0] == 2'b00) ? 4'b0011 :	//sh[15:0]
					(Store == 2'b10 & A[1:0] == 2'b10) ? 4'b1100 :	//sh[31:16]
					4'b1111;														//sw

	always @(posedge clk) begin
		if (reset)
			for (i = 0 ; i <= 4095 ; i = i+1)
				dm[i]<=0;
		else 
			if (MemWrite) begin
				case (BE) 
					4'b1111 : dm[A[11:2]]			= WD;
					4'b1100 : dm[A[11:2]][31:16]	= WD;
					4'b0011 : dm[A[11:2]][15:0]	= WD;
					4'b1000 : dm[A[11:2]][31:24]	= WD;		
					4'b0100 : dm[A[11:2]][23:16]	= WD;	
					4'b0010 : dm[A[11:2]][15:8]	= WD;	
					4'b0001 : dm[A[11:2]][7:0]		= WD;	
				endcase
				$display("%d@%h: *%h <= %h", $time, PC, A - A[1:0], dm[A[13:2]]);
				
			end
			
		
	end
	
	//����Load�źŶ���������ݽ�����չ
	assign RD = (Load == 3'b001) ?  (($signed(dm[A[11:2]] << (24 - 8*A[1:0])))) >>> 24 :		//lb
					(Load == 3'b010) ?  ((dm[A[11:2]] << (24 - 8*A[1:0])) >> 24) :						//lbu		
					(Load == 3'b011) ?  (($signed(dm[A[11:2]] << (16 - 8*A[1:0])))) >>> 16 :		//lh 		
					(Load == 3'b100) ?  ((dm[A[11:2]] << (16 - 8*A[1:0])) >> 16) :						//lhu 
					(Load == 3'b101) ?  dm[A[11:2]] : dm[A[11:2]];											//lw


endmodule