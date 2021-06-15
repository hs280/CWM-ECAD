//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:Haris Saeed
// Date: 14/06/21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module lights(clk,rst,button,colour);
	input clk;
	input rst;
	input button;
	output reg [2:0] colour;
	always @(posedge clk or posedge rst)
		begin
		if (rst || ^colour==3'bx)
			colour<=3'b001;    /// assume goes to 1 at reset 
		else 
			case(colour)
				3'b000: colour<=3'b001;
				3'b111: colour<=3'b001;
				3'b110: colour<=(button)? 3'b001: colour;
				default: colour<=(button)? colour+3'b1: colour;	// could use mult but mult bad 
			endcase
		end
endmodule 
