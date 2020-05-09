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
	 input clk,					//ʱ���ź�
    input reset,				//ͬ����λ�ź�
	 input interrupt,			//�ⲿ�ж��ź�
	 output [31:0] addr		//���PC
    );
	
	 wire [31:0] PrAddr, DEVAddr;
	 wire PrWe, DEV0We, DEV1We;  
	 wire [31:0] PrWD, DEVWD;
	 wire [31:0] DEV0RD, DEV1RD, PrRD;		
	 wire IRQ0, IRQ1;
	 
	 //����6λ�ж������ź�
	 wire [7:2] HWInt;
	 assign HWInt[7:2]= {3'b0, interrupt, IRQ1, IRQ0};
	
	//������ˮ��CPU
	CPU CPU(
		//����Ϊ������ʱ�Ӻ͸�λ�ź�
		.clk(clk),
		.reset(reset),	
		//����ΪP7�¼ӵ�ָ��
		.HWInt(HWInt),			//6��Ӳ���ж�����	
		.PrRD(PrRD),			//��Bridgeģ����������
		.PrWe(PrWe),			//cpuдʹ��
		//.PrBE(PrBE),			//4λ�ֽ�ʹ��
		.PrWD(PrWD),			//�����Bridgeģ�������
		.PrAddr(PrAddr)		//32λ��ַ����			
		);
		
	//����Bridge��������CPU��IO�������ݽ���
	Bridge Bridge(
		//��CPU��IO��32λ��ַ
		.PrAddr(PrAddr),
		.DEVAddr(DEVAddr),
		//��CPU��IO��дʹ���ź�
		.PrWE(PrWE),
		.DEV0We(DEV0We),
		.DEV1We(DEV1We),
		//��CPU��IO��д������
		.PrWD(PrWD),
		.DEVWD(DEVWD),
		//��IO��CPU�ķ���ֵPrRD
		.DEV0RD(DEV0RD),
		.DEV1RD(DEV1RD),
		.PrRD(PrRD)
		);

	//����Timer0���м�ʱ
	Timer Timer0(
		.clk(clk),
		.reset(reset),
		.Addr(DEVAddr[31:2]),
		.WE(DEV0We),
		.Din(DEVWD),
		.Dout(DEV0RD),
		.IRQ(IRQ0)
		);

	//����Timer1���м�ʱ
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
