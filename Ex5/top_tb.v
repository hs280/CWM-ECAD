//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

module testbench;

	parameter heat_ratio=5'd2;	// modify paramater for testing purposes
    	parameter natural_temperature=5'd17;

	reg bench_clk=1'b0;
	reg [4:0]bench_temperature=5'd5;
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
			     if (bench_temperature<natural_temperature) begin 
				bench_temperature<=(bench_temperature<10)? bench_temperature+5'd1:bench_temperature+5'd1; end
				else begin 
			bench_temperature<=bench_temperature-1;end end 
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
	begin
		#500 $finish;
	end
endmodule
