//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Haris Saeed
// Date: 14/06/21
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
	
	parameter half_period=5;	
    
	reg bench_clk=1'b0;
	reg err=1'b0;
	reg [7:0] expected;
	reg [7:0] difference=8'd0;
	reg err=1'b0;
	reg bench_rst=1'b0;
	reg bench_change=1'b0;
	reg bench_on_off=1'b0;
	wire [7:0]bench_counter_out;

	always begin 
		#(half_period) bench_clk<=~bench_clk;
		$display($time, "clk=%b, rst=%b, change=%b, on_off=%b, counter_out=%d ", 			bench_clk,bench_rst,bench_change,bench_on_off,bench_counter_out);
		difference<=expected-bench_counter_out; //glitch when rst triggers asynchronously
		if (difference!=0) begin 
            		$display("***TEST FAILED!**");
			err<=1'b1;
		end
	end

 
	monitor top(
	        .clk(bench_clk), 
        	.rst(bench_rst), 
        	.change(bench_change), 
        	.on_off(bench_on_off), 
        	.counter_out(bench_counter_out)
	);

	initial begin 
		bench_rst<=1'b1;
		bench_on_off<=1'b1;
		expected<=8'd0;
		#(2*half_period) bench_rst<=1'b0;
		#(4*half_period) bench_change<=1'b1;
		#(half_period)   expected<=8'd1;
		#(2*half_period) expected<=8'd2;
		#(2*half_period) expected<=8'd3;
		#(2*half_period) expected<=8'd4;
		#(1*half_period) bench_change<=1'b0;
				 bench_on_off<=1'b0;
		#(4*half_period) bench_change<=1'b1;
		#(half_period)   expected<=8'd3;
		#(2*half_period) expected<=8'd2;
		#(half_period)   bench_change<=1'b0;
				 bench_rst<=1'b1;
				 expected<=8'd0;
		#(2*half_period) bench_rst<=1'b0;
				 bench_change<=1'b1;
				 bench_on_off<=1'b1;
		#(half_period)   expected<=8'd1;
		#(2*half_period) expected<=8'd2;
		#(half_period)   bench_on_off<=1'b0;
		#(half_period)   expected<=8'd1;
		#(half_period)   bench_change<=1'b0;
	end

	initial
	begin
		 #(40*half_period)
		if (err) begin
            		$display("***TEST FAILED!**"); end
		else begin
			$display("***TEST PASSED!**");


		end	 
		$finish;



	end

endmodule 
