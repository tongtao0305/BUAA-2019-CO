`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:45:19 12/17/2019
// Design Name:   PC
// Module Name:   D:/tongt/Desktop/P7/P7_1.0/PC_test.v
// Project Name:  P7_1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_test;

	// Inputs
	reg clk;
	reg reset;
	reg PCUpdate;
	reg [31:0] PCIn;

	// Outputs
	wire [31:0] PCOut;
	wire [4:0] ExcCode;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.reset(reset), 
		.PCUpdate(PCUpdate), 
		.PCIn(PCIn), 
		.PCOut(PCOut), 
		.ExcCode(ExcCode)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		PCUpdate = 0;
		PCIn = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		PCUpdate = 1;
		PCIn = 32'h3001;
		
		// Add stimulus here

	end
   
	always #5 clk=!clk;
   
endmodule

