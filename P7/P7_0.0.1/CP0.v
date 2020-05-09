`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:29 12/15/2019 
// Design Name: 
// Module Name:    CP0 
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
module CP0(
	input clk,
	input reset,   
	// 以下五个是关于CP0的写入读取信号
	input We,					// CP0写使能信号
	input [4:0] A1,			// 读CP0寄存器编号
	input [4:0] A2,			// 写CP0寄存器编号
	input [31:0] DIn,			// CP0写入数据
	output [31:0] DOut,		// CPO输出数据
	// 以下是跟中断异常有关的信号
	input [31:0] PC,			// 中断异常的PC
	input [6:2] ExcCode,		//	中断异常的类型
	input [5:0] HWInt,		// 外部设备中断
	output Interrupt,				// 中断请求
	//以下是关于EXL的信号
	input EXLSet,				// 用于置位SR的EXL
	input EXLClr,				// 用于清除SR的EXL
	//以下是保存异常时的PC
	output [31:0] EPC,		// EPC寄存器输出至NPC
	//判断延迟槽的信号
	input Jump,
	input Branch
	);
	
	//定义SR中使用到的寄存器位
	//SR = {16'b0, im, 8'b0, exl, ie}
	reg [15:10] im;
	reg exl, ie;
	//定义Cause中使用到的寄存器位
	//CAUSE = {bd, 15'b0, hwint_pend[15:10], 3'b0, exccode[6:2], 2'b0}
	reg bd;	
	reg [15:10] hwint_pend;
	reg [6:2] exccode;
	//定义EPC中使用到的寄存器位
	reg [31:0] epc;
	//定义PRId中使用到的寄存器位
	reg [31:0] PRId;	
	
	//输出EPC的值
	assign EPC = epc;
	//输出DOut的指
	assign DOut = (A1 == 5'd12) ? {16'b0, im, 8'b0, exl, ie} :
					  (A1 == 5'd13) ? {bd, 15'b0, hwint_pend[15:10], 3'b0, exccode[6:2], 2'b0} : 
					  (A1 == 5'd14) ? epc :
					  (A1 == 5'd15) ? PRId :
					  32'h0;	
	
	//定义并判断外部中断和内部异常
	wire IntReq, ExcReq;
	assign IntReq = (|(HWInt[5:0] & im[15:10])) & ie & !exl ;
	assign ExcReq = (ExcCode != 5'b00000) & (~exl);
	assign Interrupt = IntReq | ExcReq;
	
	initial begin
		im <= 6'b0;
		exl <= 0;
		ie <= 0;
		hwint_pend <= 6'b0;
		exccode <= 0;
		bd <= 0;
		epc <= 0;	
		PRId = 32'h12345678;			//PRId任意定义一个初始值
	end
	
	always @(posedge clk) begin
		hwint_pend <= HWInt;
		//复位信号
		if (reset) begin
			im <= 6'b0;
			exl <= 0;
			ie <= 0;
			hwint_pend <= 6'b0;
			exccode <= 0;
			bd <= 0;
			epc <= 0;
		end
		else begin
			//CP0寄存器写入
			if (We) begin
				case (A2) 
					5'd12 : {im, exl, ie} <= {DIn[15:10], DIn[1], DIn[0]};
					5'd13 : {hwint_pend} <= {DIn[15:10]};
					5'd14 : {epc} <= {DIn[31:0]};
					5'd15 : PRId <= DIn;
				endcase
			end			
			
			//更新epc的值
			epc <= (Interrupt && bd) ? {PC[31:2], 2'b00} - 4 :
					 (Interrupt &&!bd) ? {PC[31:2], 2'b00} :
					 epc;	
			
			//更新bd值
			if (PC < 32'h00004180) begin
				if (bd == 1'b0) begin
					if (Branch | Jump) begin
						bd <= 1'b1;
					end
				end
				else if (bd == 1'b1) begin
					if (exl == 1'b0 & Interrupt == 1'b0) begin
						bd <= 1'b0;
					end
				end
			end
			else begin
				bd <= bd;
			end
			
			// 对EXL进行置位和清除
			if (EXLSet | Interrupt) begin
				exl <= 1'b1;
				exccode <= ExcCode;
			end
			if (EXLClr) begin
				exl <= 1'b0;
				bd <= 1'b0;
			end	
		end	
	end

endmodule
