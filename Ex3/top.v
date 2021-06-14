//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (clk,rst,change,on_off,counter_out);

	input clk;
	input rst;
	input change;
	input on_off;
	output reg [7:0] counter_out;
                    
	always @ (posedge clk or posedge rst) begin 
		if (rst)
			counter_out<=8'd0;
		else 
			counter_out<=counter_out+8'd1*(change)*(on_off-!on_off); 			// could use if statements instead but more lines of code
 
		end
			
				
	
endmodule
