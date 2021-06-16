//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module testbench;

	reg bench_clk=1'b0;
	reg bench_sel=1'b0;
	reg bench_rst=1'b0;
	reg bench_button=1'b0;
	reg [23:0] expected=24'hx;
	reg error_flag=1'b0;
	wire [23:0] bench_light;


	always
	begin
		#5 bench_clk<=~bench_clk;   
    end
	
	always begin
		#4 bench_button<=~bench_button;
		#6 bench_button<=~bench_button;
		#10;
	end
	
	initial begin 
	   #1;	
	   forever begin 
	   #5;
	        error_flag<=(expected!=bench_light)? 1'b1:error_flag;
        if (error_flag)
            $display("***TEST FAILED*** ACTUAL=%h , EXPECTED=%h",bench_light,expected); 
        end
end 
	full inst(
        .clk(bench_clk), 
        .sel(bench_sel), 
        .rst(bench_rst), 
        .button(bench_button),
        .light(bench_light)
    );

			always@ (posedge bench_clk)  begin
				if (bench_sel) begin 
				    case({bench_light,bench_button})  //propagation delay of ipa
					{24'h0000FF,1}: #25 expected<=24'h00FF00;
					{24'h00FF00,1}: #25 expected<=24'h00FFFF;
					{24'h00FFFF,1}: #25 expected<=24'hFF0000;
					{24'hFF0000,1}: #25 expected<=24'hFF00FF;
					{24'hFF00FF,1}: #25 expected<=24'hFF0000;
					{24'hFFFF00,1}: #25 expected<=24'h0000FF;
					default:#25 expected<=expected;		
                endcase 
                end 
                else 
                expected<=24'hFFFFFF;
           end    	    
    // implement sel and rst logic
    
    
    
	initial
	begin
		#600 
		if (error_flag)
			$display("***TEST FAILED***");
		else 
			$display("***TEST PASSED***");
		$finish;
	end
endmodule
