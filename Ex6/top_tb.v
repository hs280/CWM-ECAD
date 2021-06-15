//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module testbench;

	reg bench_clk=1'b0;
	reg [2:0]bench_colour=3'b0;
	reg bench_enable=1'd1;
	reg [23:0]expected=24'hx;
	reg error_flag=1'b0;
	wire bench_rgb;


	always
	begin
		#5 bench_clk<=~bench_clk;
    end
	
	always begin 
		#5 bench_enable<=~bench_enable;
		#5 bench_enable<=~bench_enable;
		#10;
	end
		
	colour_conv inst(
        .clk(bench_clk), 
        .colour(bench_colour), 
        .enable(bench_enable), 
        .rgb(bench_rgb)
    );

	initial 
	   
    		#5;
			always@ (posedge bench_clk  && bench_enable)  begin
				case(bench_colour)
					3'b000: expected<=24'h000000;
					3'b001: expected<=24'h0000FF;
					3'b010: expected<=24'h00FF00;
					3'b011: expected<=24'h00FFFF;
					3'b100: expected<=24'hFF0000;
					3'b101: expected<=24'hFF00FF;
					3'b110: expected<=24'hFFFF00;
					3'b111: expected<=24'hFFFFFF;
					default:  expected<=24'hx;		
                endcase 
            end    	    
initial 
    #2;
    always 
		  begin
			#5 bench_colour<=bench_colour+3'b1;
			error_flag<=(expected!=bench_rgb)? 1'b1:error_flag;
			$display("***TEST FAILED*** ACTUAL=%h , EXPECTED=%h,  COLOUR=%b",bench_rgb,expected,bench_colour);			
        end
    
	initial
	begin
		#500 
		if (error_flag)
			$display("***TEST FAILED***");
		else 
			$display("***TEST PASSED***");
		$finish;
	end
endmodule
