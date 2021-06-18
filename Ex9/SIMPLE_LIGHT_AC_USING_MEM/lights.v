//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:Haris Saeed
// Date: 14/06/21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a heating/cooling is on and stay the same white it is released. 
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

module lights(clk,rst,state,colour);
	input clk;
	input rst;
	input [1:0] state;
	output reg [2:0] colour;
	
	reg counter;
	
	always @(posedge clk or posedge rst)
		begin
		if (rst) begin 
			colour<=3'b000;    /// assume goes to 0 at reset i.e. white
			counter<=0; end
		else begin 
			counter<=counter+1'b1;
			case(state)
				2'b00: begin colour<=3'b000;
						counter<=0; end
				2'b10: colour<=(counter)? 3'b001: 3'b010;
				2'b01: colour<=(counter)? 3'b011: 3'b100;
				default: colour<=3'bxxx;
			endcase
		end		
		end
endmodule 
