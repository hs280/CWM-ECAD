//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Haris Saeed
// Date: 14/06/21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
module testbench;
	parameter [2:0] initial_colour=3'b000;
	
	reg bench_clk=1'b0;
	reg bench_rst=1'b0;
	reg bench_button=1'b0;
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
    
    
	initial
	begin  
		bench_rst<=1'b1;
		#2 bench_rst<=1'b0;
		#54 bench_rst<=1'b1;
		#2 bench_rst<=1'b0 ;
	end

	initial
	begin
		#100 $finish;
	end
endmodule
