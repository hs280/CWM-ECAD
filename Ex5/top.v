//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

 module main(clk,temperature,heating,cooling);
	input clk;
	input [4:0]temperature;
	output reg heating;
	output reg cooling;

	always @(posedge clk)
		begin 
            case({heating,cooling})
                2'b10:        heating<=(temperature<5'd20)? 1:0;
                2'b01:        cooling<=(temperature>5'd20)? 1:0;
                default:begin heating<=(temperature>5'd18)? 0:1;
                              cooling<=(temperature<5'd22)? 0:1; end
             endcase
		end
endmodule
