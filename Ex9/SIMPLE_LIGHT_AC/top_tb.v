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
	reg bench_sel=1'b0;
    reg bench_rst=1'b0;
	reg [4:0] bench_desired_temperature=5'd22;
    wire [1:0] bench_state;
    
	 wire [23:0] bench_light;                	
    
    wire [2:0]colour;
    wire [23:0] rgb;
    wire  [23:0] light;
    
    
initial begin 
#12;
	forever
	begin
		#10  
			if (bench_state==2'b10) 	begin
				bench_temperature<=bench_temperature+5; end
			else if (bench_state==2'b01) begin 
				bench_temperature<=bench_temperature-5; end
			else	begin		
			bench_temperature<=bench_temperature-1;end  
    end
end

always  begin
    #5 bench_clk=~bench_clk;
    			 end


initial begin 
    #5 bench_rst=~bench_rst;
    #15 bench_rst=~bench_rst;
	#5
		forever begin
			#5 bench_sel<=~bench_sel;
			#11 bench_sel<=~bench_sel;
			#14;
		end
end

		full inst(
		.clk(bench_clk), 
		.sel(bench_sel), 
		.rst(bench_rst), 
		.temperature(bench_temperature),
		.desired_temperature(bench_desired_temperature),
		.light(bench_light),
		.state(bench_state)	
	    );


	lights inst1(
        .clk(bench_clk), 
        .rst(bench_rst), 
        .state(bench_state), 
        .colour(colour)
	);

	colour_conv inst2(
        .clk(bench_clk), 
        .colour(colour), 
        .enable(1'b1), 	//assume always enabled?
        .rgb(rgb)
    	);

	mult inst3(
	.a(24'hFFFFFF),
	.b(rgb),
	.sel(bench_sel),
	.out(light)
	);
    
    
//	initial 
//   	#2;
//      always @(posedge bench_clk) begin
//		if (bench_heating) 
//			expected<=(bench_temperature<5'd20)? 2'b10: 2'b00;
//		else if (bench_cooling)  
//			expected<=(bench_temperature>5'd20)? 2'b01:2'b00;
//		else 
//			expected<=(bench_temperature>=22)? 2'b01:(bench_temperature<=18)? 2'b10:2'b00;

//		if (expected!={bench_heating,bench_cooling}) begin
//			error_flag<=1'b1;
//			$display("***TEST FAILED***  ACTUAL= %b, EXPECTED+ %b",{bench_cooling,bench_heating},expected); end
//		else error_flag<=error_flag;
//    	end   
    
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
