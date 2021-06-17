//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module top(rst_n,clk_n,clk_p,temperature,heating, cooling);
	
	input clk_p;
	input clk_n;
	input rst_n;
	input [4:0] temperature;
	
	output reg heating;
	output reg cooling;
    

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

always @(posedge clk) begin
    case({heating,cooling})
        2'b10:        heating<=(temperature<5'd20)? 1:0;
        2'b01:        cooling<=(temperature>5'd20)? 1:0;
        default:begin heating<=(temperature>5'd18)? 0:1;
                      cooling<=(temperature<5'd22)? 0:1; end
     endcase
end

endmodule
