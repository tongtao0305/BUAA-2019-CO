`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:52:54 12/21/2019
// Design Name:   mips
// Module Name:   D:/tongt/Desktop/P8/P8_4.0/mips_test.v
// Project Name:  P8_4.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_test;

	// Inputs
	reg clk_in;
	reg sys_rstn;
	reg uart_rxd;
	reg [7:0] dip_switch0;
	reg [7:0] dip_switch1;
	reg [7:0] dip_switch2;
	reg [7:0] dip_switch3;
	reg [7:0] dip_switch4;
	reg [7:0] dip_switch5;
	reg [7:0] dip_switch6;
	reg [7:0] dip_switch7;
	reg [7:0] user_key;

	// Outputs
	wire uart_txd;
	wire [31:0] led_light;
	wire [7:0] digital_tube2;
	wire digital_tube_sel2;
	wire [7:0] digital_tube1;
	wire [3:0] digital_tube_sel1;
	wire [7:0] digital_tube0;
	wire [3:0] digital_tube_sel0;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk_in(clk_in), 
		.sys_rstn(sys_rstn), 
		.uart_rxd(uart_rxd), 
		.uart_txd(uart_txd), 
		.dip_switch0(dip_switch0), 
		.dip_switch1(dip_switch1), 
		.dip_switch2(dip_switch2), 
		.dip_switch3(dip_switch3), 
		.dip_switch4(dip_switch4), 
		.dip_switch5(dip_switch5), 
		.dip_switch6(dip_switch6), 
		.dip_switch7(dip_switch7), 
		.user_key(user_key), 
		.led_light(led_light), 
		.digital_tube2(digital_tube2), 
		.digital_tube_sel2(digital_tube_sel2), 
		.digital_tube1(digital_tube1), 
		.digital_tube_sel1(digital_tube_sel1), 
		.digital_tube0(digital_tube0), 
		.digital_tube_sel0(digital_tube_sel0)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		sys_rstn = 0;
		uart_rxd = 0;
		dip_switch0 = 0;
		dip_switch1 = 0;
		dip_switch2 = 0;
		dip_switch3 = 0;
		dip_switch4 = 0;
		dip_switch5 = 0;
		dip_switch6 = 0;
		dip_switch7 = 0;
		user_key = 0;

		// Wait 100 ns for global reset to finish
		#600;
		sys_rstn = 1;
		dip_switch0 = 1;
		dip_switch1 = 1;
		dip_switch2 = 1;
		dip_switch3 = 1;
		dip_switch4 = 1;
		dip_switch5 = 1;
		dip_switch6 = 1;
		dip_switch7 = 1;
		user_key = 8'b11111110;		
		
	end
	
	always #25 clk_in = ~clk_in;
	
endmodule

