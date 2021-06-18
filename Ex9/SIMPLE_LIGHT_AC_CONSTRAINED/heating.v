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
	input clk_p;
	input clk_n;
	input rst_n;
	input temperature_0;
	input temperature_1;
	input temperature_2;
	input temperature_3;
	input temperature_4;
	
	input desired_temperature_0;
	input desired_temperature_1;
	input desired_temperature_2;
	input desired_temperature_3;
	input desired_temperature_4;	



	output reg heating;
	output reg cooling;
    
    reg [4:0] temperature;
    reg [4:0] 	desired_temperature=({desired_temperature_4,desired_temperature_3,desired_temperature_2,desired_temperature_1,desired_temperature_0});
/////* clock infrastructure, do not modify *///////////////////////////////////////
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );
///////////////////////////////////////////////////////////////////////////////////

always begin 
    #1;
        temperature<=({temperature_4,temperature_3,temperature_2,temperature_1,temperature_0});
end


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
