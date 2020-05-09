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
	 input clk2,
    input reset,	 
	 input [1:0] Store,
	 input [2:0] Load,
	 input [31:0] PC,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD,
    input MemWrite,
	 output [4:0] ExcCode
    );
	
	//����Stroe�źź�ALUResult_M�������λ����BE�ź�
	wire [3:0] BE;
	assign BE = (Store == 2'b01 & A[1:0] == 2'b00) ? 4'b0001 :	//sb[7:0]
					(Store == 2'b01 & A[1:0] == 2'b01) ? 4'b0010 :	//sb[15:8]
					(Store == 2'b01 & A[1:0] == 2'b10) ? 4'b0100 :	//sb[23:16]
					(Store == 2'b01 & A[1:0] == 2'b11) ? 4'b1000 :	//sb[31:24]
					(Store == 2'b10 & A[1:0] == 2'b00) ? 4'b0011 :	//sh[15:0]
					(Store == 2'b10 & A[1:0] == 2'b10) ? 4'b1100 :	//sh[31:16]
					4'b1111;														//sw

	wire [31:0] WD_Verified, RD_Unverified;
   assign WD_Verified = (Store == 2'b11) ? (WD) : ( (Store == 2'b10) ? ({WD[15:0], WD[15:0]}) : {WD[7:0], WD[7:0], WD[7:0], WD[7:0]});

	//����IP
	DataMemory DataMemory (.clka(clk2), .wea(BE), .addra(A[14:2]), .dina(WD_Verified), .douta(RD_Unverified));

	//����Load�źŶ���������ݽ�����չ
	assign RD = (Load == 3'b001 & A[1:0] == 2'b00) ? {{RD_Unverified[7]}, RD_Unverified[7:0]} :		//lb
					(Load == 3'b001 & A[1:0] == 2'b01) ? {{RD_Unverified[15]}, RD_Unverified[15:8]} :
					(Load == 3'b001 & A[1:0] == 2'b10) ? {{RD_Unverified[23]}, RD_Unverified[23:16]} :
					(Load == 3'b001 & A[1:0] == 2'b11) ? {{RD_Unverified[31]}, RD_Unverified[31:24]} :
					
					(Load == 3'b010) ?  ((RD_Unverified << (24 - 8*A[1:0])) >> 24) :						//lbu		
					
					(Load == 3'b011 & A[1:0] == 2'b00) ?  {{16{RD_Unverified[15]}}, RD_Unverified[15:0]} :		//lh 		
					(Load == 3'b011 & A[1:0] == 2'b10) ?  {{16{RD_Unverified[31]}}, RD_Unverified[31:16]} :
					
					(Load == 3'b100) ?  ((RD_Unverified << (16 - 8*A[1:0])) >> 16) :						//lhu 
					
					(Load == 3'b101) ?  RD_Unverified : RD_Unverified;											//lw

	
	wire AddrInDM, AddrInTimer0, AddrInTimer1;
	assign AddrInDM = (32'h00000000 <= A & A <= 32'h00002fff);
	assign AddrInTimer0 = (32'h00007f00 <= A & A <= 32'h00007f0b);
	assign AddrInTimer1 = (32'h00007f10 <= A & A <= 32'h00007f1b);
	
	assign ExcCode = (Load == 3'b101 & A[1:0] != 2'b00) ? 4 :	//lwδ4�ֽڶ���
	
						  (Load == 3'b011 & A[0] != 0) ? 4 : 			//lhδ2�ֽڶ���
						  (Load == 3'b100 & A[0] != 0) ? 4 :			//lhuδ2�ֽڶ���

						  (Load == 3'b011 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lhȡTimer��ֵ
						  (Load == 3'b100 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lhuȡTimer��ֵ
						  (Load == 3'b001 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lbȡTimer��ֵ
						  (Load == 3'b010 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lbuȡTimer��ֵ
						  
						  (Load > 0 & !(AddrInDM | AddrInTimer0 | AddrInTimer1)) ? 4 :	//Load���ַ����DM��Timer
						  
						  (Store == 2'b11 & A[1:0] != 2'b00) ? 5 :	//swδ4�ֽڶ���
						  					  
						  (Store == 2'b10 & A[0] != 0) ? 5 : 			//shδ2�ֽڶ���
						  
						  (Store == 2'b10 & (AddrInTimer0 | AddrInTimer1)) ? 5 : 			//sh�浽Timer
						  (Store == 2'b01 & (AddrInTimer0 | AddrInTimer1)) ? 5 : 			//sb�浽Timer
						  
						  (Store == 2'b11 & (A == 32'h7f08 | A == 32'h7f18))? 5 :			//Store����Timer_Count

						  (Store > 0 & !(AddrInDM | AddrInTimer0 | AddrInTimer1)) ? 5 :	//Store���ַ����DM��Timer						  
						  0;
	
endmodule