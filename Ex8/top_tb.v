//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
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

	reg bench_clk_n=1'b1;
	reg bench_clk_p=1'b0;
	reg bench_rst_n=1'b0;
	reg [4:0]bench_temperature=5'd5;
	reg [1:0]expected=2'bx;
	reg error_flag=1'b0;
	wire bench_heating;
	wire bench_cooling;
    
    
            wire bench_clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(bench_clk_p),
	.IB(bench_clk_n),
	.O(bench_clk_ibufds)
);

     wire bench_clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (bench_clk_ibufds),
	.O  (bench_clk)
      );




	always
	begin
		#3  
			if (bench_heating) 	begin
				bench_temperature<=bench_temperature+5; end
			else if (bench_cooling) begin 
				bench_temperature<=bench_temperature-5; end
			else	begin		
			bench_temperature<=bench_temperature-1;end  
		#2 bench_clk_p=~bench_clk_p;
		bench_clk_n=~bench_clk_n;
    end

	top inst(.rst_n(bench_rst_n),
	.clk_n(bench_clk_n),
	.clk_p(bench_clk_p),
	.temperature(bench_temperature),
	.heating(bench_heating),
	.cooling(bench_cooling)
);

	initial
	begin
		$monitor($time, " clk = %b , temperature = %b , heating = %b , cooling = %b  ",
			bench_clk_p, bench_temperature, bench_heating, bench_cooling);
	end

	initial 
    	#2;
        always @(posedge bench_clk_p) begin
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
