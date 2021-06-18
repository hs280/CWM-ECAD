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
///////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module colour_conv(clk,colour,enable,rgb);
	input clk;
	input [2:0] colour;
	input enable;
	
	output wire [23:0]rgb;
	
	assign rgb=(colour==3'b000)? 24'hFFFFFF:
	(colour==3'b001)? 24'hFF0000:
	(colour==3'b010)? 24'hFFa500:
	(colour==3'b011)? 24'h0000FF:
	(colour==3'b100)? 24'h00FF00:24'h0;
	
//	case(colour)
//		3'b000:  wire rgb=	24'hFFFFFF;
//		3'b001:  wire rgb=	24'hFF0000;
//		3'b010:  wire rgb=	24'hFFa500;
//		3'b011:	 wire rgb=	24'h0000FF;
//		3'b100:  wire rgb=	24'h00FF00;
//		default:  wire rgb= 	24'h000000;
//    endcase

endmodule
