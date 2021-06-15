//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Haris Saeed
// Date: 14/06/21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps





module testbench;
	reg bench_clk=1'b0;
	reg bench_rst=1'b0;
	reg bench_button=1'b0;
	reg [2:0]expected_colour;
	reg error_flag=1'b0;
	wire [2:0]bench_colour;


    always 
	begin
		#2 bench_clk<=~bench_clk;
		$monitor($time, " clk = %b , rst = %b , button = %b , colour = %b  ",
		bench_clk, bench_rst, bench_button, bench_colour);
		#2 bench_button<=~bench_button;
		bench_clk<=~bench_clk;
		$monitor($time, " clk = %b , rst = %b , button = %b , colour = %b  ",
		bench_clk, bench_rst, bench_button, bench_colour);
	end 
	top inst(
        .clk(bench_clk), 
        .rst(bench_rst), 
        .button(bench_button), 
        .colour(bench_colour)
    );

	always 
		begin 
		#1
		if (expected_colour!=bench_colour)  begin 
	       		error_flag<=1;
			$display("**TEST FAILED**  actual %b, expected %b", bench_colour, expected_colour); end
	     else  begin 
	        	error_flag<=error_flag; end 		

	end

	initial
	begin  
		#1 bench_rst<=1'b1;
		expected_colour<=3'b1;
		#2 bench_rst<=1'b0;
		#54 bench_rst<=1'b1;
		expected_colour<=3'b1;
		#2 bench_rst<=1'b0 ;
	end

initial 
    #2;
        always @(posedge bench_clk && bench_button) begin
            expected_colour<=(expected_colour==3'b110)? 3'b1: expected_colour+3'b001;       
    end            
	
	initial
	begin
	   #150;
	   if (!error_flag)
	       $display("***TEST PASSED***");
       else 
        $display("***TEST FAILED***");
		$finish;
	end

endmodule
