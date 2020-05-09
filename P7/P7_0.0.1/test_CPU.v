`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:43:19 12/15/2019
// Design Name:   CPU
// Module Name:   D:/tongt/Desktop/P7/P7_0.0.1/test_CPU.v
// Project Name:  P7_0.0.1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_CPU;

	// Inputs
	reg clk;
	reg reset;
	reg [7:2] HWInt;
	reg [31:0] PrRD;

	// Outputs
	wire PrWe;
	//wire [3:0] PrBE;
	wire [31:0] PrWD;
	wire [31:0] PrAddr;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset(reset), 
		.HWInt(HWInt), 
		.PrRD(PrRD), 
		.PrWe(PrWe), 
		//.PrBE(PrBE), 
		.PrWD(PrWD), 
		.PrAddr(PrAddr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		HWInt = 0;
		PrRD = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     
	always #5 clk=~clk;
	  
endmodule

