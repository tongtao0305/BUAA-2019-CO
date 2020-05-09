`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:59 11/16/2019 
// Design Name: 
// Module Name:    MMW_WB 
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
module MEM_WB(
	 //以下为寄存器的时钟信号、复位信号
	 input clk,
	 input reset,
	 //以下为IR、PC4、PC8、ALUResult、RD的寄存器信号
	 input [31:0] IRIn,
	 output [31:0] IROut,
	 input [31:0] PC4In,
	 output [31:0] PC4Out,
	 input [31:0] PC8In,
	 output [31:0] PC8Out,
	 input [31:0] ALUResultIn,
	 output [31:0] ALUResultOut,
	 input [31:0] RDIn,
	 output [31:0] RDOut,
	 input [4:0] WriteAddrIn,
	 output [4:0] WriteAddrOut,
	 input [1:0] TnewIn,
	 output [1:0] TnewOut	 	 
   );

	reg [31:0] IR_MW;
	reg [31:0] PC4_MW;
	reg [31:0] PC8_MW;
	reg [31:0] ALUResult_MW;
	reg [31:0] RD_MW;
	reg [4:0] WriteAddr_MW;
	reg [1:0] Tnew_MW;		
	
	initial begin
		IR_MW = 0;		
		PC4_MW = 0;			
		PC8_MW = 0;			
		ALUResult_MW = 0;
		RD_MW = 0;
		WriteAddr_MW = 0;
		Tnew_MW = 0;		
	end
	
	assign IROut = IR_MW;
	assign PC4Out = PC4_MW;
	assign PC8Out = PC8_MW;
	assign ALUResultOut = ALUResult_MW;
	assign RDOut = RD_MW;
	assign WriteAddrOut = WriteAddr_MW;
	assign TnewOut = Tnew_MW; 

	always @(posedge clk) begin
		if (reset) begin
			IR_MW <= 0;		
			PC4_MW <= 0;			
			PC8_MW <= 0;			
			ALUResult_MW <= 0;
			RD_MW <= 0;		
			WriteAddr_MW <= 0;
			Tnew_MW <= 0;			
		end
		else begin
			IR_MW <= IRIn;		
			PC4_MW <= PC4In;			
			PC8_MW <= PC8In;			
			ALUResult_MW <= ALUResultIn;
			RD_MW <= RDIn;
			WriteAddr_MW <= WriteAddrIn;
			if(TnewIn == 0) 
				Tnew_MW <= 0;
			else 
				Tnew_MW <= (TnewIn - 1);				
		end
	end


endmodule
