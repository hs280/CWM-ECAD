//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 - VALVE TARGET
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


module valve_target(clk,addr_in,enable,valve_out);
	input clk;
	input [5:0] addr_in;
	input enable;
	
	output wire [5:0]valve_out ;
	
	
blk_mem_gen_0 inst1 (
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(addr_in),  // input wire [5 : 0] addra
  .dina(5'b0),    // input wire [5 : 0] dina
  .douta(valve_out)  // output wire [5 : 0] douta
);


endmodule
