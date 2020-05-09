`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/24 14:58:38
// Design Name: 
// Module Name: tb_buaa
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_buaa(

    );
    reg [7:0] in;
    wire [7:0] out;
    reg clk;
    statistics A(in,clk,out);
    initial begin
      clk=0;
		#1.25;
      in=35; //#
		#5
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=63; //?
		#5; 
		  
		  
		  /*clk=0;
        #1.25;
        in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=35; //#
		#5;
		in=32; // 
		#5;
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=66; //B
		#5;
		in=85; //U
		#5;
		in=65; //A
		#5;
		in=65; //A
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=98; //b
		#5;
		in=85; //U
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=122; //z
		#5;
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=66; //B
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=98; //b
		#5;
		in=110; //n
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=97; //a
		#5;
		in=114; //r
		#5;
		in=63; //?
		#5;
		in=32; // 
		#5;
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		#5;
		in=32; // 
		#5;
		in=98; //b
		#5;
		in=117; //u
		#5;
		in=97; //a
		
		#5;
		in=97; //a
		#5;
		*/
    end
    always #2.5 clk=~clk;
endmodule
