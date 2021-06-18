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
	reg [4:0]bench_temperature=5'd6;
	reg [1:0]expected=2'bx;
	reg error_flag=1'b0;
	wire bench_heating;
	wire bench_cooling;
    wire temperature_0;
    wire temperature_1;
    wire temperature_2;
    wire temperature_3;
    wire temperature_4;
    
    assign temperature_0=bench_temperature[0];
    assign temperature_1=bench_temperature[1];
    assign temperature_2=bench_temperature[2];
    assign temperature_3=bench_temperature[3];
    assign temperature_4=bench_temperature[4];



always begin
#5;
bench_clk_p=~bench_clk_p;
		bench_clk_n=~bench_clk_n;
		end


initial begin 
#15;
	forever
	begin
		#3  
			if (bench_heating) 	begin
				bench_temperature<=bench_temperature+5; end
			else if (bench_cooling) begin 
				bench_temperature<=bench_temperature-5; end
			else	begin		
			bench_temperature<=bench_temperature-1;end  
		#2;
    end end

	top inst(.rst_n(bench_rst_n),
	.clk_n(bench_clk_n),
	.clk_p(bench_clk_p),
	.temperature_0(bench_temperature[0]),
    .temperature_1(bench_temperature[1]),
    .temperature_2(bench_temperature[2]),
    .temperature_3(bench_temperature[3]),
    .temperature_4(bench_temperature[4]),	
	.heating(bench_heating),
	.cooling(bench_cooling)
);

	initial
	begin
		$monitor($time, " clk = %b , temperature = %b , heating = %b , cooling = %b  ",
			bench_clk_p, bench_temperature, bench_heating, bench_cooling);
	end

	initial begin
    	#7;
        forever @(posedge bench_clk_p) begin
    case({bench_heating,bench_cooling})
        2'b10:        expected<=(bench_temperature<5'd20)? 2'b10:2'b00;
        2'b01:        expected<=(bench_temperature>5'd20)? 2'b01:2'b00;
        default: expected<=(bench_temperature<=5'd18)? 2'b10:(bench_temperature>=5'd22)? 2'b01:2'b00;
     endcase
		if (expected!={bench_heating,bench_cooling}) begin
			error_flag<=1'b1;
			$display("***TEST FAILED***  ACTUAL= %b, EXPECTED+ %b",{bench_cooling,bench_heating},expected); end
		else error_flag<=error_flag;
    	end  
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
