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
	 //��CPU��IO��32λ��ַ
	 input [31:0] PrAddr,
	 output [31:0] DEVAddr,
	 //��CPU��IO��дʹ���ź�
	 input PrWe,
	 output DEV0We,
	 output DEV1We,  
	 //��CPU��IO��д������
	 input [31:0] PrWD,
	 output [31:0] DEVWD,
	 //��IO��CPU�ķ���ֵPrRD
	 input [31:0] DEV0RD,
	 input [31:0] DEV1RD,
	 output [31:0] PrRD
    );
	
	wire HitDEV0, HitDEV1;
	
	assign DEVAddr = PrAddr;
	
	//���ݵ�ַ�ж��豸���
	assign HitDEV0 =  (32'h00007F00 <= PrAddr & PrAddr <= 32'h00007F0B);
	assign HitDEV1 =  (32'h00007F10 <= PrAddr & PrAddr <= 32'h00007F1B);
	assign DEV0We = HitDEV0 & PrWe;
	assign DEV1We = HitDEV1 & PrWe;
	
	assign DEVWD = PrWD;
	
	//�����豸���ѡ�񷵻�ֵ
	assign PrRD = (HitDEV0) ? DEV0RD :
					  (HitDEV1) ? DEV1RD :
					  32'b0;
endmodule
