//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - VALVE OPENING
// 
//
//
//  Description: CONTROLS VALVE TARGET OPEN AMOUNT [(0-3),(0-3),(0-3)]
//
//  inputs:
//           clk, [5:0] addr_in, enable
//
//  outputs:
//           [5:0] valve_out 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module colour_conv(clk,Temp,Desired_Temp);
	input clk;
	input [6:0] Temp;
	input [6:0] Desired_Temp;
	
	output wire [1:0]hot_valve ;
	output wire [1:0]cold_valve ;
	output wire [1:0]purge_valve ;	
	
	reg [6:0] lb_temp;
	reg [6:0] ub_temp;
	reg [5:0] lb_time;
	reg [5:0] ub_time;
	reg [7:0] ub_change;
	reg [7:0] lb_change;
	
	wire [5:0] address;
	wire [5:0] valve_out;


	////// LOGIC TO GET MODEL PARAMS FROM MEMORY  //////


	data_sorter inst1 (
	.clk(clk),    				// input wire clk
	.Temp(Temp),      			// input wire Temp
	.Desired_Temp(Desired_temp),      	// input wire Desired_temp
	.lb_temp(lb_temp),  			// input wire lb_temp
	.ub_temp(ub_temp),    			// input wire ub_temp
	.lb_time(lb_time),  			// output wire lb_time
	.ub_time(ub_time),  			// ub_time
	.ub_change(ub_change),			// ub_change
	.lb_change(lb_change),			// lb change
	.addr_out(address)
	);
	
	valve_target inst2 (
	.clk(clk),
	.addr_in(address),
	.enable(1'b1),
	.valve_out(valve_out)
	);

	assign hot_valve=valve_out[5:2];
	assign cold_valve=valve_out[3:2];
	assign purge_valve=valve_out[3:2];
	
endmodule
