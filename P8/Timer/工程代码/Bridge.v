`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:27 12/14/2019 
// Design Name: 
// Module Name:    Bridge 
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
module Bridge(
	input clk,
	input reset,
	
	input PrWe,	
	input [31:0] PrAddr,
	input [31:0] PrWD,
	output [31:0] PrRD,
	output [7:2] HWInt,

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

	//对地址进行分析
	wire hit_DEV1, hit_DEV2, hit_DEV3, hit_DEV4, hit_DEV5, hit_DEV6;
	assign hit_DEV1 = (32'h00007F00 <= PrAddr && PrAddr <= 32'h00007F0B);	// Timer:	3 Regs
	assign hit_DEV2 = (32'h00007F10 <= PrAddr && PrAddr <= 32'h00007F2B);	// UART:	7 Regs
	assign hit_DEV3 = (32'h00007F2C <= PrAddr && PrAddr <= 32'h00007F33);	// 64 Switches
	assign hit_DEV4 = (32'h00007F34 <= PrAddr && PrAddr <= 32'h00007F37);	// 32b LED
	assign hit_DEV5 = (32'h00007F38 <= PrAddr && PrAddr <= 32'h00007F3F);	// 4+4+1 Digital Tubes
	assign hit_DEV6 = (32'h00007F40 <= PrAddr && PrAddr <= 32'h00007F43);	// 8 User Buttons

	//生成使能信号
	wire DEV1_We, DEV2_We, DEV4_We, DEV5_We;
	assign DEV1_We = PrWe & hit_DEV1;
	assign DEV2_We = PrWe & hit_DEV2;
	assign DEV4_We = PrWe & hit_DEV4;
	assign DEV5_We = PrWe & hit_DEV5;	


	wire [31:0] DEV1_RD, DEV2_RD, DEV3_RD, DEV4_RD, DEV5_RD, DEV6_RD;
	
	//输出数据，返回CPU
	assign PrRD = (hit_DEV1) ? DEV1_RD : 
					  (hit_DEV2) ? DEV2_RD : 
					  (hit_DEV3) ? DEV3_RD : 
					  (hit_DEV4) ? DEV4_RD : 
					  (hit_DEV5) ? DEV5_RD : 
					  (hit_DEV6) ? DEV6_RD : 
					  32'hffffffff;
	assign led_light = DEV4_RD;

	wire [1:0] DEV1_Addr;
	wire [2:0] DEV2_Addr;
	wire [2:0] DEV3_Addr, DEV5_Addr;
	assign DEV1_Addr = PrAddr[3:0] / 4;	// 0 for CTRL, 1 for PRESET, 2 for COUNT
	assign DEV2_Addr = (PrAddr[7:0] - 8'h10) / 4;	// 0~6 for 7 32bit Regs
	assign DEV3_Addr = (PrAddr[7:0] - 8'h2c);		// 0~7 for switch group 0~7
	assign DEV5_Addr = (PrAddr[7:0] - 8'h38);		// 0~7 for 8 bytes


	wire DEV1_Int, DEV2_Int;	
	wire ack_uart;


	//调用Timer, DEV1
	Timer Timer(
		.clk(clk),
		.reset(reset),
		.Addr(PrAddr[31:2]),
		.WE(DEV1_We),
		.Din(PrWD),
		.Dout(DEV1_RD),
		.IRQ(DEV1_Int)
		);

	//调用MiniUART, DEV2
	MiniUART MiniUART(
		// WISHBONE slave interface
		.CLK_I(clk),
		.DAT_I(PrWD),
		.DAT_O(DEV2_RD),
		.RST_I(reset),
		.ADD_I(PrAddr[6:2]),
		.STB_I(1),
		.WE_I(DEV2_We),
		.ACK_O(ack_uart),
		.RxD(uart_rxd),
		.TxD(uart_txd),
		.IRQ(DEV2_Int)
	);

	//调用Switched, DEV3
	Switches Switches(
		.clk(clk),
		.reset(reset),
		.dip_switch7(dip_switch7),
		.dip_switch6(dip_switch6),
		.dip_switch5(dip_switch5),
		.dip_switch4(dip_switch4),
		.dip_switch3(dip_switch3),
		.dip_switch2(dip_switch2),
		.dip_switch1(dip_switch1),
		.dip_switch0(dip_switch0),
		.Addr(DEV3_Addr),
		.RD(DEV3_RD)
   );

	//调用LED, DEV4
	LED LED(
		.clk(clk),
		.reset(reset),
		.We(DEV4_We),
		.WD(PrWD),
		.RD(DEV4_RD)
   );

	//调用Digitaltube, DEV5
	Digitaltube Digitaltube(
		.clk(clk),
		.reset(reset),
		.we(DEV5_We),
		.addr(DEV5_Addr),
		.din(PrWD),
		.dout(DEV5_RD),
		.digital_tube0(digital_tube0),
		.digital_tube1(digital_tube1),
		.digital_tube2(digital_tube2),		
		.sel0(digital_tube_sel0),
		.sel1(digital_tube_sel1),
		.sel2(digital_tube_sel2)
    );	

	//调用Buttons, DEV6
	Buttons Buttons(
		.clk(clk),
		.reset(reset),
		.user_key(user_key),
		.RD(DEV6_RD)
   );
	
	assign HWInt = {4'd0, DEV2_Int, DEV1_Int};
endmodule
