`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:45 11/16/2019 
// Design Name: 
// Module Name:    ID_EXE 
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
module ID_EX(
	 //以下为寄存器的时钟信号、复位信号和使能信号,还有来自冲突单元的刷新信号
	 input clk,
	 input clr,
	 input reset,
	 //以下为IR、PC4、PC8、RS、RT、EXT的寄存器信号
	 input [31:0] IRIn,
	 output [31:0] IROut,
	 input [31:0] PC4In,
	 output [31:0] PC4Out,
	 input [31:0] PC8In,
	 output [31:0] PC8Out,
	 input [31:0] RSIn,
	 output [31:0] RSOut,
	 input [31:0] RTIn,
	 output [31:0] RTOut,	 
	 input [31:0] EXTIn,
	 output [31:0] EXTOut,
	 //以下是标记转发新增的信号
	 input [4:0] A1In,
	 output [4:0] A1Out,
	 input [4:0] A2In,
	 output [4:0] A2Out,	  
	 input [4:0] WriteAddrIn,
	 output [4:0] WriteAddrOut,
	 input [1:0] TnewIn,
	 output [1:0] TnewOut,
	 input [4:0] ExcCodeIn,
	 output [4:0] ExcCodeOut	  
    );

	reg [31:0] IR_DE;
	reg [31:0] PC4_DE;
	reg [31:0] PC8_DE;
	reg [31:0] RS_DE;
	reg [31:0] RT_DE;
	reg [31:0] EXT_DE;
	reg [4:0] A1_DE;
	reg [4:0] A2_DE;
	reg [4:0] WriteAddr_DE;
	reg [1:0] Tnew_DE;
	reg [4:0] ExcCode_DE;
	
	initial begin
		IR_DE = 0;		
		PC4_DE = 0;			
		PC8_DE = 0;			
		RS_DE = 0;
		RT_DE = 0;
		EXT_DE = 0;
		A1_DE = 0;
		A2_DE = 0;
		WriteAddr_DE = 0;
		Tnew_DE = 0;
		ExcCode_DE = 0;		
	end
	
	assign IROut = IR_DE;
	assign PC4Out = PC4_DE;
	assign PC8Out = PC8_DE;
	assign RSOut = RS_DE;
	assign RTOut = RT_DE;
	assign EXTOut = EXT_DE;
	assign A1Out = A1_DE;
	assign A2Out = A2_DE;
	assign WriteAddrOut = WriteAddr_DE;
	assign TnewOut = Tnew_DE; 
	assign ExcCode = ExcCode_DE;	

	always @(posedge clk) begin
		if (reset | clr) begin
			IR_DE <= 0;		
			PC4_DE <= 0;			
			PC8_DE <= 0;			
			RS_DE <= 0;
			RT_DE <= 0;
			EXT_DE <= 0;		
			A1_DE <= 0;
			A2_DE <= 0;
			WriteAddr_DE <= 0;
			Tnew_DE <= 0;
			ExcCode_DE <= 0;			
		end
		else begin
			IR_DE <= IRIn;		
			PC4_DE <= PC4In;			
			PC8_DE <= PC8In;			
			RS_DE <= RSIn;
			RT_DE <= RTIn;
			EXT_DE <= EXTIn;
			A1_DE <= A1In;
			A2_DE <= A2In;			
			WriteAddr_DE <= WriteAddrIn;
			ExcCode_DE <= ExcCodeIn;			
			if(TnewIn == 0) 
				Tnew_DE <= 0;
			else 
				Tnew_DE <= (TnewIn - 1);
		end
	end

endmodule
