`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:22 11/16/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
	// systhem clock input
	input clk_in,
   input sys_rstn,	
	// uart interface
	input uart_rxd,
	output uart_txd,
	// DIP switch
	input [7:0] dip_switch0,
	input [7:0] dip_switch1,
	input [7:0] dip_switch2,
	input [7:0] dip_switch3,
	input [7:0] dip_switch4,
	input [7:0] dip_switch5,
	input [7:0] dip_switch6,
	input [7:0] dip_switch7,
	// user keys
	input [7:0] user_key,
	// LED lights
	output [31:0] led_light,
	// Digital Tube
	output [7:0] digital_tube2,
	output digital_tube_sel2,
	output [7:0] digital_tube1,
	output [3:0] digital_tube_sel1,
	output [7:0] digital_tube0,
	output [3:0] digital_tube_sel0
   );
	
	wire [31:0] PrAddr, PrRD, PrWD;
	wire [7:2] HWInt; 
	wire PrWe, clk1, clk2;
 	
	//调用CLOCK产生时钟信号
	CLOCK CLOCK (
		.CLK_IN1(clk_in), 
		.CLK_OUT1(clk1), 
		.CLK_OUT2(clk2)
		);
	
	//调用流水线CPU
	CPU CPU(
		.clk(clk1),
		.clk2(clk2),
		.reset(!sys_rstn),	
		.HWInt(HWInt),			//6个硬件中断请求	
		.PrRD(PrRD),			//从Bridge模块读入的数据
		.PrWe(PrWe),			//cpu写使能
		.PrWD(PrWD),			//输出至Bridge模块的数据
		.PrAddr(PrAddr)		//32位地址总线
		);
		
	//调用Bridge进行连接CPU与外设
	Bridge Bridge(
		.clk(clk1),
		.reset(!sys_rstn),
		
		.PrWe(PrWe),
		.PrAddr(PrAddr),
		.PrWD(PrWD),
		.PrRD(PrRD),
		.HWInt(HWInt),
		// uart interface
		.uart_rxd(uart_rxd),
		.uart_txd(uart_txd),
		// DIP switch
		.dip_switch0(dip_switch0),
		.dip_switch1(dip_switch1),
		.dip_switch2(dip_switch2),
		.dip_switch3(dip_switch3),
		.dip_switch4(dip_switch4),
		.dip_switch5(dip_switch5),
		.dip_switch6(dip_switch6),
		.dip_switch7(dip_switch7),
		// user keys
		.user_key(user_key),
		// LED lights
		.led_light(led_light),
		// Digital Tube
		.digital_tube2(digital_tube2),
		.digital_tube_sel2(digital_tube_sel2),
		.digital_tube1(digital_tube1),
		.digital_tube_sel1(digital_tube_sel1),
		.digital_tube0(digital_tube0),
		.digital_tube_sel0(digital_tube_sel0)	
		);
 
endmodule
