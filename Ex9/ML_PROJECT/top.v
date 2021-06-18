//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - top
// 
//
//
//  Description: CONTROLS VALVE TARGET OPEN AMOUNT (0-3),(0-3),(0-3)
//
//  inputs:
//           clk,Temp,Desired_Temp,rst
//
//  outputs:
//          hot_valve,cold_valve,purge_valve
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module colour_conv(clk,Temp,Desired_Temp,rst,hot_valve,cold_valve,purge_valve);
	input clk;
	input [6:0] Temp;
	input [6:0] Desired_Temp;
	
	output wire [1:0]hot_valve ;
	output wire [1:0]cold_valve ;
	output wire [1:0]purge_valve ;	
	
	reg [6:0] lb_temp;  	//000000
	reg [6:0] ub_temp;	//000001
	reg [5:0] lb_time;	//000010
	reg [5:0] ub_time;	//000011
	reg [6:0] ub_change;	//000100
	reg [6:0] lb_change;	//000101
	
	wire [5:0] lb_temp_w;  	//000000
	wire [5:0] ub_temp_w;	//000001
	wire [5:0] lb_time_w;	//000010
	wire [5:0] ub_time_w;	//000011
	wire [5:0] ub_change_w;	//000100
	wire [5:0] lb_change_w;	//000101

	wire [5:0] address;
	wire [5:0] valve_out;
	wire [5:0] temp;

	
	always @posedge(rst) begin 
	////// LOGIC TO GET MODEL PARAMS FROM MEMORY  //////	
		blk_mem_gen_0 inst0 (
		  .clka(clk),    // input wire clka
		  .ena(rst),      // input wire ena
		  .wea(1'b0),      // input wire [0 : 0] wea
		  .addra(6'b000000),  // input wire [5 : 0] addra
		  .dina(5'b0),    // input wire [5 : 0] dina
		  .douta(lb_temp_w)  // output wire [5 : 0] douta
		);
		

		blk_mem_gen_0 inst1 (
		  .clka(clk),    // input wire clka
		  .ena(rst),      // input wire ena
		  .wea(1'b0),      // input wire [0 : 0] wea
		  .addra(6'b000001),  // input wire [5 : 0] addra
		  .dina(5'b0),    // input wire [5 : 0] dina
		  .douta(ub_temp_w)  // output wire [5 : 0] douta
		);

		blk_mem_gen_0 inst2 (
		  .clka(clk),    // input wire clka
		  .ena(rst),      // input wire ena
		  .wea(1'b0),      // input wire [0 : 0] wea
		  .addra(6'b000010),  // input wire [5 : 0] addra
		  .dina(5'b0),    // input wire [5 : 0] dina
		  .douta(lb_time_w)  // output wire [5 : 0] douta
		);

		blk_mem_gen_0 inst3 (
		  .clka(clk),    // input wire clka
		  .ena(rst),      // input wire ena
		  .wea(1'b0),      // input wire [0 : 0] wea
		  .addra(6'b000011),  // input wire [5 : 0] addra
		  .dina(5'b0),    // input wire [5 : 0] dina
		  .douta(ub_time_w)  // output wire [5 : 0] douta
		);

		blk_mem_gen_0 inst4 (
		  .clka(clk),    // input wire clka
		  .ena(rst),      // input wire ena
		  .wea(1'b0),      // input wire [0 : 0] wea
		  .addra(6'b000100),  // input wire [5 : 0] addra
		  .dina(5'b0),    // input wire [5 : 0] dina
		  .douta(ub_change_w)  // output wire [5 : 0] douta
		);
		
		blk_mem_gen_0 inst5 (
		  .clka(clk),    // input wire clka
		  .ena(rst),      // input wire ena
		  .wea(1'b0),      // input wire [0 : 0] wea
		  .addra(6'b000101),  // input wire [5 : 0] addra
		  .dina(5'b0),    // input wire [5 : 0] dina
		  .douta(lb_change_w)  // output wire [5 : 0] douta
		);
	
		#20;		// memory delay 
			
			lb_temp<=({1'b0,lb_temp_w)};
			ub_temp<=({1'b0,ub_temp_w)};
			lb_time<=lb_time_w;
			ub_time<=ub_time_w;
			ub_change<=({1'b0,ub_change_w)};
			lb_change<=({1'b0,lb_change_w)};
	end
	

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
	
	always @(posedge clk) begin 
		valve_target inst2 (
		.clk(clk),
		.addr_in(address),
		.enable(1'b1),
		.valve_out(valve_out)
		);
	end

	assign hot_valve=valve_out[5:2];
	assign cold_valve=valve_out[3:2];
	assign purge_valve=valve_out[3:2];
	
endmodule
