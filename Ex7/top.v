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

	output [23:0] light;                
	
	wire [2:0]colour
	
	lights inst1(
        .clk(clk), 
        .rst(rst), 
        .button(button), 
        .colour(colour)
	);

	colour_conv inst2(
        .clk(clk), 
        .colour(colour), 
        .enable(enable), 	//where enable
        .rgb(bench_rgb)
    	);

	mult inst3(
	.a(rgb),
	.b(6'hFFFFFF)
	.sel(sel)
	.out(light)
	);

endmodule
