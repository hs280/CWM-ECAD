//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - DATA SORTER
// 
//
//
//  Description: CONTROLS DATA USED TO ADDRESS MEMORY FROM TRAINED SET
//
//  inputs:
//           clk, Temp, Desired_Temp,lb_temp,ub_temp,lb_time,ub_time,ub_change_lb_change,addr_out 
//
//  outputs:
//           [5:0] valve_out 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module data_sorter(clk, Temp, Desired_Temp,lb_temp,ub_temp,lb_time,ub_time,ub_change_lb_change,addr_out);
	input clk;
	input [6:0] Temp;
	input [6:0] Desired_Temp;


	//////perhaps change to access memory within this module////////
	input [6:0] lb_temp;
	input [6:0] ub_temp;
	input [5:0] lb_time;
	input [5:0] ub_time;
	input [6:0] ub_change;
	input [6:0] lb_change;
	/////////////////////////////////////////////////////////////////

	
	output wire addr_out;

	reg [6:0] old_temp_desired;
	reg [5:0] time_factor;
	reg [2:0] time_state;
	reg [2:0] change_state;
	reg [2:0] Temp_state;
	
	assign addr_out=({Temp_state,change_state,time_state});
	
	always @(posedge clk) begin 
		Temp_state<=(Temp<=lb_temp)? 2'b1: (Temp>=ub_temp)? 2'b11: 2'b10;
		change_state<=(Temp>Desired_Temp+ub_change)? 2'b1:(Temp<Desired_Temp-lb_change)? 2'b11:2'b10;
		time_factor<=(Desired_temp==old_temp_desired && time_factor<6'b111111)? time_factor+6'b1:(time_factor=6'b111111)? time_factor:6'b0;
		time_state<=(time_factor<=lb_time)? 2'b1:(time_factor>=ub_time)? 2'b11:2'b10;
	end

endmodule
