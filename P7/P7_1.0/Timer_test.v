`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:15:05 12/17/2019
// Design Name:   Timer
// Module Name:   D:/tongt/Desktop/P7/P7_1.0/Timer_test.v
// Project Name:  P7_1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Timer_test;

	// Inputs
	reg clk;
	reg reset;
	reg [31:2] Addr;
	reg WE;
	reg [31:0] Din;

	// Outputs
	wire [31:0] Dout;
	wire IRQ;

	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.clk(clk), 
		.reset(reset), 
		.Addr(Addr), 
		.WE(WE), 
		.Din(Din), 
		.Dout(Dout), 
		.IRQ(IRQ)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Addr = 0;
		WE = 0;
		Din = 0;

		// Wait 100 ns for global reset to finish
		#100;
      Addr = 30'h1fc1;
		Din = 32'hf;
		WE = 1;
		// Add stimulus here

	end
   
	always #5 clk = ~clk;
   
endmodule

