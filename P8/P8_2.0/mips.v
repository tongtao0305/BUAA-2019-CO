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
	// system clock
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
	
	 wire [31:0] PrAddr, DEVAddr;
	 wire PrWe, DEV0We, DEV1We;  
	 wire [31:0] PrWD, DEVWD;
	 wire [31:0] DEV0RD, DEV1RD, PrRD;		
	 wire IRQ0, IRQ1;
	 
	 //生成6位中断请求信号
	 wire [7:2] HWInt;
	 assign HWInt[7:2]= {3'b0, interrupt, IRQ1, IRQ0};
	 
	// 
	Clock The_Main_Clock (.CLK_IN1(clk_in), .CLK_OUT1(clk1), .CLK_OUT2(clk2));
	
	//调用流水线CPU
	CPU CPU(
		//以下为基础的时钟和复位信号
		.clk(clk),
		.reset(reset),	
		//以下为P7新加的指令
		.HWInt(HWInt),			//6个硬件中断请求	
		.PrRD(PrRD),			//从Bridge模块读入的数据
		.PrWe(PrWe),			//cpu写使能
		//.PrBE(PrBE),			//4位字节使能
		.PrWD(PrWD),			//输出至Bridge模块的数据
		.PrAddr(PrAddr),		//32位地址总线
		.addr(addr)
		);
		
	//调用Bridge进行连接CPU与IO进行数据交换
	Bridge Bridge(
		//从CPU到IO的32位地址
		.PrAddr(PrAddr),
		.DEVAddr(DEVAddr),
		//从CPU到IO的写使能信号
		.PrWe(PrWe),
		.DEV0We(DEV0We),
		.DEV1We(DEV1We),
		//从CPU到IO的写入数据
		.PrWD(PrWD),
		.DEVWD(DEVWD),
		//从IO到CPU的返回值PrRD
		.DEV0RD(DEV0RD),
		.DEV1RD(DEV1RD),
		.PrRD(PrRD)
		);

	//调用Timer0进行计时
	Timer Timer0(
		.clk(clk),
		.reset(reset),
		.Addr(DEVAddr[31:2]),
		.WE(DEV0We),
		.Din(DEVWD),
		.Dout(DEV0RD),
		.IRQ(IRQ0)
		);

	//调用Timer1进行计时
	Timer Timer1(
		.clk(clk),
		.reset(reset),
		.Addr(DEVAddr[31:2]),
		.WE(DEV1We),
		.Din(DEVWD),
		.Dout(DEV1RD),
		.IRQ(IRQ1)
		);
	 
endmodule
