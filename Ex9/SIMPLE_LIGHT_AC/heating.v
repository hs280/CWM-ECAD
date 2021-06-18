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

 module heating(clk,temperature,desired_temp,heating,cooling);
	input clk;
	input [4:0]temperature;
	input [4:0] desired_temp;
	output reg heating;
	output reg cooling;

	always @(posedge clk)
		begin 
		#4;
            case({heating,cooling})
                2'b10:        heating<=(temperature<desired_temp)? 1:0;
                2'b01:        cooling<=(temperature>desired_temp)? 1:0;
                default:begin heating<=(temperature>desired_temp-5'd2)? 0:1;
                              cooling<=(temperature<desired_temp+5'd2)? 0:1; end
             endcase
		end
endmodule
