`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:59 11/16/2019 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(
	 //以下为寄存器的时钟信号、复位信号
	 input clk,
	 input reset,
	 //以下为IR、PC4、PC8、RS、RT、EXT的寄存器信号
	 input [31:0] IRIn,
	 output [31:0] IROut,
	 input [31:0] PC4In,
	 output [31:0] PC4Out,
	 input [31:0] PC8In,
	 output [31:0] PC8Out,
	 input [31:0] ALUResultIn,
	 output [31:0] ALUResultOut,
	 input [31:0] RTIn,
	 output [31:0] RTOut,
	 //以下是标记转发新增的信号
	 input [4:0] A1In,
	 output [4:0] A1Out,
	 input [4:0] A2In,
	 output [4:0] A2Out,	  
	 input [4:0] WriteAddrIn,
	 output [4:0] WriteAddrOut,
	 input [1:0] TnewIn,
	 output [1:0] TnewOut	 
   );

	reg [31:0] IR_EM;
	reg [31:0] PC4_EM;
	reg [31:0] PC8_EM;
	reg [31:0] ALUResult_EM;
	reg [31:0] RT_EM;
	reg [4:0] A1_EM;
	reg [4:0] A2_EM;
	reg [4:0] WriteAddr_EM;
	reg [1:0] Tnew_EM;	
	
	initial begin
		IR_EM = 0;		
		PC4_EM = 0;			
		PC8_EM = 0;			
		ALUResult_EM = 0;
		RT_EM = 0;
		A1_EM = 0;
		A2_EM = 0;
		WriteAddr_EM = 0;
		Tnew_EM = 0;
	end
	
	assign IROut = IR_EM;
	assign PC4Out = PC4_EM;
	assign PC8Out = PC8_EM;
	assign ALUResultOut = ALUResult_EM;
	assign RTOut = RT_EM;
	assign A1Out = A1_EM;
	assign A2Out = A2_EM;
	assign WriteAddrOut = WriteAddr_EM;
	assign TnewOut = Tnew_EM; 

	always @(posedge clk) begin
		if (reset) begin
			IR_EM <= 0;		
			PC4_EM <= 0;			
			PC8_EM <= 0;			
			ALUResult_EM <= 0;
			RT_EM <= 0;		
			A1_EM <= 0;
			A2_EM <= 0;
			WriteAddr_EM <= 0;
			Tnew_EM <= 0;			
		end
		else begin
			IR_EM <= IRIn;		
			PC4_EM <= PC4In;			
			PC8_EM <= PC8In;			
			ALUResult_EM <= ALUResultIn;
			RT_EM <= RTIn;
			A1_EM <= A1In;
			A2_EM <= A2In;			
			WriteAddr_EM <= WriteAddrIn;
			if(TnewIn == 0) 
				Tnew_EM <= 0;
			else 
				Tnew_EM <= (TnewIn - 1);	
		end
	end


endmodule
