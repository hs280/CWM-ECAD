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
	reg bench_enable=1'b0;
	reg [23:0]expected=24'h0;
	reg error_flag=1'b0;
	wire [23:0] bench_rgb;


	always
	begin
		#5 bench_clk<=~bench_clk;
        error_flag<=(expected!=bench_rgb)? 1'b1:error_flag;
        if (error_flag)
            $display("***TEST FAILED*** ACTUAL=%h , EXPECTED=%h,  COLOUR=%b",bench_rgb,expected,bench_colour); 
    end
	
	always begin
		#4 bench_enable<=~bench_enable;
		#6 bench_enable<=~bench_enable;
		#10;
	end
		
	colour_conv inst(
        .clk(bench_clk), 
        .colour(bench_colour), 
        .enable(bench_enable), 
        .rgb(bench_rgb)
    );


			always@ (posedge bench_clk)  begin
				if (bench_enable) begin 
				    case(bench_colour)  //propagation delay of ipa
					3'b000: #20 expected<=24'h000000;
					3'b001: #20 expected<=24'h0000FF;
					3'b010: #20 expected<=24'h00FF00;
					3'b011: #20 expected<=24'h00FFFF;
					3'b100: #20 expected<=24'hFF0000;
					3'b101: #20 expected<=24'hFF00FF;
					3'b110: #20 expected<=24'hFFFF00;
					3'b111: #20 expected<=24'hFFFFFF;
					default:#20 expected<=24'hx;		
                endcase 
                end 
                else 
                expected<=expected;
           end    	    

    always 
		  begin
			#12 bench_colour<=bench_colour+3'b1;			
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
