`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:08 11/17/2019 
// Design Name: 
// Module Name:    MUX 
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
module CMP_MUX(
	input [2:0] ForwardRSD,
	input [2:0] ForwardRTD,
	input [31:0] GRF_RD1,
	input [31:0] GRF_RD2,
	input [31:0] ALUResult_M,
	input [31:0] PC8_M,
	input [31:0] WriteData_M,
	output [31:0] MFRSD,
	output [31:0] MFRTD
	);
	
	assign MFRSD = (ForwardRSD == 3'b000)  ? GRF_RD1 :
					   (ForwardRSD == 3'b001)  ? ALUResult_M :
					   (ForwardRSD == 3'b010)  ? PC8_M :
					   (ForwardRSD == 3'b011)  ? WriteData_M : GRF_RD1;
					 
	assign MFRTD = (ForwardRTD == 3'b000)  ? GRF_RD2 :
					   (ForwardRTD == 3'b001)  ? ALUResult_M :
					   (ForwardRTD == 3'b010)  ? PC8_M :
					   (ForwardRTD == 3'b011)  ? WriteData_M : GRF_RD2;
endmodule	

module ALU_MUX(
	input [2:0] ForwardRSE,
	input [2:0] ForwardRTE,
	input [31:0] RS_E,
	input [31:0] RT_E,
	input [31:0] WriteData_M,
	input [31:0] ALUResult_M,
	input [31:0] PC8_M,
	output [31:0] MFRSE,
	output [31:0] MFRTE
	);
	
	assign MFRSE = (ForwardRSE == 3'b000)  ? RS_E :
					   (ForwardRSE == 3'b001)  ? ALUResult_M :
					   (ForwardRSE == 3'b010)  ? PC8_M :
					   (ForwardRSE == 3'b011)  ? WriteData_M : RS_E;
					 
	assign MFRTE = (ForwardRTE == 3'b000)  ? RT_E :
					   (ForwardRTE == 3'b001)  ? ALUResult_M :
					   (ForwardRTE == 3'b010)  ? PC8_M :
					   (ForwardRTE == 3'b011)  ? WriteData_M : RT_E;
	
endmodule

module DM_MUX(
    input [31:0] RT_M,
	 input [31:0] WriteData_M,
	 input [1:0] ForwardRTM,
	 output [31:0] MFRTM
	 );
	 
	 assign MFRTM = (ForwardRTM == 2'b01) ? WriteData_M : RT_M;

endmodule	

module WriteBack_Addr_MUX(
	input [4:0] rd,
	input [4:0] rt,
	input [4:0] ra,
	input [1:0] RegDst,
	output reg [4:0] WriteAddr
	);
	
	 always @ (*) begin
		if (RegDst == 2'b01) begin
				WriteAddr <= rd;
			end
		if (RegDst == 2'b00) begin
				WriteAddr <= rt;
			end
		if (RegDst == 2'b10) begin
				WriteAddr <= ra;
			end
	 end
endmodule

module WriteBack_Data_MUX(
	input MemtoReg,
	input jal,
	input [31:0] PC8_W,
	input [31:0] ALUResult_W,
	input [31:0] DM_W,
	output reg [31:0] WriteData
	);
	 always @ (*) begin
		if (jal== 1) begin
			WriteData <= PC8_W;
		end
	   else if (MemtoReg == 0) begin
	      WriteData <= ALUResult_W;
		end
	   else if (MemtoReg == 1) begin
			WriteData <= DM_W;
		end
	 end
	
endmodule