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
	 output [31:0] EXTOut
    );

	reg [31:0] IR_DE;
	reg [31:0] PC4_DE;
	reg [31:0] PC8_DE;
	reg [31:0] RS_DE;
	reg [31:0] RT_DE;
	reg [31:0] EXT_DE;
	
	initial begin
		IR_DE = 0;		
		PC4_DE = 0;			
		PC8_DE = 0;			
		RS_DE = 0;
		RT_DE = 0;
		EXT_DE = 0;
	end
	
	assign IROut = IR_DE;
	assign PC4Out = PC4_DE;
	assign PC8Out = PC8_DE;
	assign RSOut = RS_DE;
	assign RTOut = RT_DE;
	assign EXTOut = EXT_DE;

	always @(posedge clk) begin
		if (reset | clr) begin
			IR_DE <= 0;		
			PC4_DE <= 0;			
			PC8_DE <= 0;			
			RS_DE <= 0;
			RT_DE <= 0;
			EXT_DE <= 0;			
		end
		else begin
			IR_DE <= IRIn;		
			PC4_DE <= PC4In;			
			PC8_DE = PC8In;			
			RS_DE = RSIn;
			RT_DE = RTIn;
			EXT_DE = EXTIn;
		end
	end

endmodule
