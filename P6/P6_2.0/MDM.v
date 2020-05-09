`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:06 11/24/2019 
// Design Name: 
// Module Name:    MDM 
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
module MDM(
	 input clk,
	 input reset,
	 input start,
	 input addr,
	 input MDMWrite,
	 input [2:0] MDMOp,
	 input [31:0] D1,
	 input [31:0] D2,
	 output [31:0] HIOut,
	 output [31:0] LOOut,
	 output busy
    );

	reg [31:0] HI, LO, a, b;
	integer cnt1, cnt2;
	
	initial begin
		HI = 0;
		LO = 0;
		a = 0;
		b = 0;
		cnt1 = 0;
		cnt2 = 0;
	end
	
	assign HIOut = HI;
	assign LOOut = LO;
	assign busy = (cnt1 != 0);

	 always @(posedge clk) begin
		if(reset) begin
			HI <= 0;
			LO <= 0;
			cnt1 <= 0;
			cnt2 <= 0;
		end
		else begin
			if(MDMWrite) begin
				if(addr == 0) 
					HI <= D1;
				else 
					LO <= D1;
				cnt1 = 0;
				cnt2 = 0;
			end
			if (start) begin
				if (MDMOp == 3'b000) begin							//multu
					cnt1 = 5;
					{a, b} = D1 * D2;				
				end
				else if (MDMOp == 3'b001) begin					//mult
					cnt1 = 5;
					{a, b} = $signed(D1) * $signed(D2);		
				end
				else if (MDMOp == 3'b010 && D2 != 0) begin		//divu
					cnt1 = 10;
					a = D1 % D2;
					b = D1 / D2;	
				end
				else if (MDMOp == 3'b011 && D2 != 0) begin		//div
					cnt1 = 10;
					a = $signed(D1) % $signed(D2);
					b = $signed(D1) / $signed(D2);	
				end
				else if (MDMOp == 3'b101) begin					//madd
					cnt1 = 5;
					{a, b} = $signed({a,b}) + $signed(D1) * $signed(D2);				
				end	
				else if (MDMOp == 3'b110) begin					//msub
					cnt1 = 5;
					{a, b} = $signed({a,b}) - $signed(D1) * $signed(D2);				
				end					
				else begin
					a = a;
					b = b;
					cnt1 = 0;					
				end
			end
				
			if((cnt2 == cnt1) && (cnt1 != 0)) begin
				{HI, LO} = {a, b};
				cnt1 = 0;
				cnt2 = 0;
			end
			else if (cnt1 != 0) 
				cnt2 = cnt2 + 1;
			
		end
	 end

endmodule
