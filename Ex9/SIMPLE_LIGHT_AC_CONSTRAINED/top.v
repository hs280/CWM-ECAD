//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - 
// Student Name:
// Date: 
// FLASHES RED/ORANGE if heating and sel BLUE/GREEN if cooling and sel else white
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module full(clk,sel,rst,temperature,desired_temperature,light,state);
	input clk;
	input sel;
    	input rst;
	input [4:0]temperature;
	input [4:0] desired_temperature;

	output wire [23:0] light;                
	output wire [1:0] state;	

	wire [2:0]  colour;
	wire [23:0] rgb;
	wire cooling;
	wire heating;
	
	assign state=({heating,cooling});
	
	heating inst0(
	.clk(clk),
	.temperature(temperature),
	.desired_temp(desired_temperature),
	.heating(heating),
	.cooling(cooling));
			
		lights inst1(
        .clk(clk), 
        .rst(rst), 
        .state(state), 
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
