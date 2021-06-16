//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module full(clk,sel,rst,button,light);
	input clk;
	input sel;
    input rst;
	input button;

	output wire [23:0] light;                
	
	wire [2:0]colour;
	wire [23:0]rgb;
	
	lights inst1(
        .clk(clk), 
        .rst(rst), 
        .button(button), 
        .colour(colour)
	);

	colour_conv inst2(
        .clk(clk), 
        .colour(colour), 
        .enable(1'b1), 	//assume always enabled?
        .rgb(rgb)
    	);

	mult inst3(
	.a(24'hFFFFFF),
	.b(rgb),
	.sel(sel),
	.out(light)
	);

endmodule
