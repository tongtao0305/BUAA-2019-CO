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
	input [31:0] PC8_E,
	input [31:0] ALUResult_M,
	input [31:0] PC8_M,
	input [31:0] WriteData_M,
	input [31:0] PC8_W,
	output [31:0] MFRSD,
	output [31:0] MFRTD
	);
	
	assign MFRSD = (ForwardRSD == 3'b000)  ? GRF_RD1 :
						(ForwardRSD == 3'b001)  ? PC8_E :
					   (ForwardRSD == 3'b010)  ? ALUResult_M :
					   (ForwardRSD == 3'b011)  ? PC8_M :
					   (ForwardRSD == 3'b100)  ? WriteData_M :
						(ForwardRSD == 3'b101)  ? PC8_W :
						GRF_RD1;
					 
	assign MFRTD = (ForwardRTD == 3'b000)  ? GRF_RD2 :
						(ForwardRTD == 3'b001)  ? PC8_E :
					   (ForwardRTD == 3'b010)  ? ALUResult_M :
					   (ForwardRTD == 3'b011)  ? PC8_M :
					   (ForwardRTD == 3'b100)  ? WriteData_M :
						(ForwardRTD == 3'b101)  ? PC8_W :
						GRF_RD2;
endmodule	

module ALU_MUX(
	input [2:0] ForwardRSE,
	input [2:0] ForwardRTE,
	input [31:0] RS_E,
	input [31:0] RT_E,
	input [31:0] WriteData_M,
	input [31:0] ALUResult_M,
	input [31:0] PC8_M,
	input [31:0] PC8_W,
	output [31:0] MFRSE,
	output [31:0] MFRTE
	);
	
	assign MFRSE = (ForwardRSE == 3'b000)  ? RS_E :
					   (ForwardRSE == 3'b001)  ? ALUResult_M :
					   (ForwardRSE == 3'b010)  ? PC8_M :
					   (ForwardRSE == 3'b011)  ? WriteData_M :
						(ForwardRSE == 3'b100)  ? PC8_W : RS_E;
					 
	assign MFRTE = (ForwardRTE == 3'b000)  ? RT_E :
					   (ForwardRTE == 3'b001)  ? ALUResult_M :
					   (ForwardRTE == 3'b010)  ? PC8_M :
					   (ForwardRTE == 3'b011)  ? WriteData_M :
						(ForwardRTE == 3'b100)  ? PC8_W : RT_E;
	
endmodule

module DM_MUX(
    input [31:0] RT_M,
	 input [31:0] WriteData_M,
	 input [31:0] PC8_W,
	 input [2:0] ForwardRTM,
	 output [31:0] MFRTM
	 );
	 
	 assign MFRTM = (ForwardRTM == 3'b000)  ? RT_M :
					    (ForwardRTM == 3'b001)  ? WriteData_M :
					    (ForwardRTM == 3'b010)  ? PC8_W : RT_M;
	

endmodule	

module WriteBack_Addr_MUX(
	input [4:0] rt,
	input [4:0] rd,
	input [4:0] ra,
	input [1:0] RegDst,
	output reg [4:0] WriteAddr
	);
	
	 always @ (*) begin
		case (RegDst) 
			2'b00 : WriteAddr <= rt;
			2'b01 : WriteAddr <= rd;
			2'b10 : WriteAddr <= ra;
		endcase
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
		if (jal) begin
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