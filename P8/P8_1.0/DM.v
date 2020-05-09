`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:27 10/14/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,
    input reset,	 
	 input [1:0] Store,
	 input [2:0] Load,
	 input [31:0] PC,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD,
    input MemWrite,
	 output [4:0] ExcCode
    );

	reg [31:0] dm[4095:0];
	integer i;
	initial begin
		for(i = 0 ; i <= 4095 ; i = i+1) begin
			dm[i] <= 0;
		end
	end
	
	//根据Stroe信号和ALUResult_M的最后两位生成BE信号
	wire [3:0] BE;
	assign BE = (Store == 2'b01 & A[1:0] == 2'b00) ? 4'b0001 :	//sb[7:0]
					(Store == 2'b01 & A[1:0] == 2'b01) ? 4'b0010 :	//sb[15:8]
					(Store == 2'b01 & A[1:0] == 2'b10) ? 4'b0100 :	//sb[23:16]
					(Store == 2'b01 & A[1:0] == 2'b11) ? 4'b1000 :	//sb[31:24]
					(Store == 2'b10 & A[1:0] == 2'b00) ? 4'b0011 :	//sh[15:0]
					(Store == 2'b10 & A[1:0] == 2'b10) ? 4'b1100 :	//sh[31:16]
					4'b1111;														//sw

	always @(posedge clk) begin
		if (reset)
			for (i = 0 ; i <= 4095 ; i = i+1)
				dm[i]<=0;
		else 
			if (MemWrite) begin
				case (BE) 
					4'b1111 : dm[A[13:2]]			= WD;
					4'b1100 : dm[A[13:2]][31:16]	= WD;
					4'b0011 : dm[A[13:2]][15:0]	= WD;
					4'b1000 : dm[A[13:2]][31:24]	= WD;		
					4'b0100 : dm[A[13:2]][23:16]	= WD;	
					4'b0010 : dm[A[13:2]][15:8]	= WD;	
					4'b0001 : dm[A[13:2]][7:0]		= WD;	
				endcase
				//$display("@%h: *%h <= %h", PC, A - A[1:0], dm[A[13:2]]);
				$display("%d@%h: *%h <= %h", $time, PC, A - A[1:0], dm[A[13:2]]);
			end
			
		
	end	

	//根据Load信号对输出的数据进行扩展
	assign RD = (Load == 3'b001 & A[1:0] == 2'b00) ? {{24{dm[A[13:2]][7]}}, dm[A[13:2]][7:0]} :		//lb
					(Load == 3'b001 & A[1:0] == 2'b01) ? {{24{dm[A[13:2]][15]}}, dm[A[13:2]][15:8]} :
					(Load == 3'b001 & A[1:0] == 2'b10) ? {{24{dm[A[13:2]][23]}}, dm[A[13:2]][23:16]} :
					(Load == 3'b001 & A[1:0] == 2'b11) ? {{24{dm[A[13:2]][31]}}, dm[A[13:2]][31:24]} :
					
					(Load == 3'b010) ?  ((dm[A[13:2]] << (24 - 8*A[1:0])) >> 24) :						//lbu		
					
					(Load == 3'b011 & A[1:0] == 2'b00) ?  {{16{dm[A[13:2]][15]}}, dm[A[13:2]][15:0]} :		//lh 		
					(Load == 3'b011 & A[1:0] == 2'b10) ?  {{16{dm[A[13:2]][31]}}, dm[A[13:2]][31:16]} :
					
					(Load == 3'b100) ?  ((dm[A[13:2]] << (16 - 8*A[1:0])) >> 16) :						//lhu 
					
					(Load == 3'b101) ?  dm[A[13:2]] : dm[A[13:2]];											//lw

	
	wire AddrInDM, AddrInTimer0, AddrInTimer1;
	assign AddrInDM = (32'h00000000 <= A & A <= 32'h00002fff);
	assign AddrInTimer0 = (32'h00007f00 <= A & A <= 32'h00007f0b);
	assign AddrInTimer1 = (32'h00007f10 <= A & A <= 32'h00007f1b);
	
	assign ExcCode = (Load == 3'b101 & A[1:0] != 2'b00) ? 4 :	//lw未4字节对齐
	
						  (Load == 3'b011 & A[0] != 0) ? 4 : 			//lh未2字节对齐
						  (Load == 3'b100 & A[0] != 0) ? 4 :			//lhu未2字节对齐

						  (Load == 3'b011 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lh取Timer的值
						  (Load == 3'b100 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lhu取Timer的值
						  (Load == 3'b001 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lb取Timer的值
						  (Load == 3'b010 & (AddrInTimer0 | AddrInTimer1)) ? 4 :	//lbu取Timer的值
						  
						  (Load > 0 & !(AddrInDM | AddrInTimer0 | AddrInTimer1)) ? 4 :	//Load类地址不在DM和Timer
						  
						  (Store == 2'b11 & A[1:0] != 2'b00) ? 5 :	//sw未4字节对齐
						  					  
						  (Store == 2'b10 & A[0] != 0) ? 5 : 			//sh未2字节对齐
						  
						  (Store == 2'b10 & (AddrInTimer0 | AddrInTimer1)) ? 5 : 			//sh存到Timer
						  (Store == 2'b01 & (AddrInTimer0 | AddrInTimer1)) ? 5 : 			//sb存到Timer
						  
						  (Store == 2'b11 & (A == 32'h7f08 | A == 32'h7f18))? 5 :			//Store存入Timer_Count

						  (Store > 0 & !(AddrInDM | AddrInTimer0 | AddrInTimer1)) ? 5 :	//Store类地址不在DM和Timer						  
						  0;
	
endmodule