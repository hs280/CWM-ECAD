//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module testbench;

	reg bench_clk=1'b0;
	reg [4:0]bench_temperature=5'd5;
	reg [1:0]expected=2'bx;
	reg error_flag=1'b0;
	wire bench_heating;
	wire bench_cooling;



	always
	begin
		#3  
			if (bench_heating) 	begin
				bench_temperature<=bench_temperature+5; end
			else if (bench_cooling) begin 
				bench_temperature<=bench_temperature-5; end
			else	begin		
			bench_temperature<=bench_temperature-1;end  
		#2 bench_clk=~bench_clk;
    end

	main inst(
        .clk(bench_clk), 
        .temperature(bench_temperature), 
        .heating(bench_heating), 
        .cooling(bench_cooling)
    );

	initial
	begin
		$monitor($time, " clk = %b , temperature = %b , heating = %b , cooling = %b  ",
			bench_clk, bench_temperature, bench_heating, bench_cooling);
	end

	initial 
    	#2;
        always @(posedge bench_clk) begin
		if (bench_heating) 
			expected<=(bench_temperature<5'd20)? 2'b10: 2'b00;
		else if (bench_cooling)  
			expected<=(bench_temperature>5'd20)? 2'b01:2'b00;
		else 
			expected<=(bench_temperature>=22)? 2'b01:(bench_temperature<=18)? 2'b10:2'b00;

		if (expected!={bench_heating,bench_cooling}) begin
			error_flag<=1'b1;
			$display("***TEST FAILED***  ACTUAL= %b, EXPECTED+ %b",{bench_cooling,bench_heating},expected); end
		else error_flag<=error_flag;
    	end   
    
	initial begin 
		#200 bench_temperature<=26;
		#200 bench_temperature<=20;
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
