`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:49:55 12/22/2018
// Design Name:   mips
// Module Name:   E:/ISE_project/CPU_P8/mips_test.v
// Project Name:  CPU_P8
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
	reg clk;
	reg reset;
	reg [7:0] dip_switch0, dip_switch1, dip_switch2, dip_switch3, dip_switch4, dip_switch5, dip_switch6, dip_switch7;
	reg [7:0] user_key;

	wire [7:0] digital_tube2, digital_tube1, digital_tube0;
	wire [3:0] digital_tube_sel1, digital_tube_sel0;
	wire digital_tube_sel2;
	wire [31:0] led_light;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk_in(clk), 
		.sys_rstn(reset),
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
		clk = 0;
		reset = 0;
		{dip_switch7,dip_switch6,dip_switch5,dip_switch4,dip_switch3,dip_switch2,dip_switch1,dip_switch0} = ~0;
		user_key = ~0;
		#600
		reset = 1;

		#1000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		#2000
		user_key = 8'b11111110;
		#10
		user_key = 8'b11111111;
		
	end
	always #1 clk = ~clk;
      
endmodule

