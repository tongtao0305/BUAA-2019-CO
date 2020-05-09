`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:51:46 12/17/2019
// Design Name:   ALU
// Module Name:   D:/tongt/Desktop/P7/P7_1.0/ALU_test.v
// Project Name:  P7_1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [4:0] s;
	reg [3:0] ALUOp;
	reg ADD_E;
	reg ADDI_E;
	reg SUB_E;
	reg [2:0] Load;
	reg [1:0] Store;

	// Outputs
	wire [31:0] C;
	wire [4:0] ExcCode;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.s(s), 
		.C(C), 
		.ALUOp(ALUOp), 
		.ExcCode(ExcCode), 
		.ADD_E(ADD_E), 
		.ADDI_E(ADDI_E), 
		.SUB_E(SUB_E), 
		.Load(Load), 
		.Store(Store)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		s = 0;
		ALUOp = 0;
		ADD_E = 0;
		ADDI_E = 0;
		SUB_E = 0;
		Load = 0;
		Store = 0;

		// Wait 100 ns for global reset to finish
		#100;
      A = 32'h79ffffff;
		B = 32'h79ff0000;	
		ADD_E = 1;

		#100;
      A = 32'h79ffffff;
		B = 32'h79ff0000;	
		ADD_E = 0;
		ADDI_E = 1;		

		#100;
      A = 32'h99ff0000;
		B = 32'hffffffff;	
		ADDI_E = 0;	
		SUB_E = 1;		

	end
   
endmodule

