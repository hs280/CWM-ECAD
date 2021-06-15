//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module colour_conv(clk,colour,enable,rgb);
	input clk;
	input [2:0] colour;
	input enable;
	
	output wire [23:0]rgb ;
	
	
	blk_mem_gen_0 your_instance_name (       //IPA NOT WORKING
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(),      // input wire [0 : 0] wea
  .addra(colour),  // input wire [2 : 0] addra
  .dina(),    // input wire [23 : 0] dina
  .douta(rgb)  // output wire [23 : 0] douta
);



endmodule
