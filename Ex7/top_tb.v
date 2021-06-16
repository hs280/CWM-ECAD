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
	reg [23:0] expected=24'h0;
	reg error_flag=1'b0;
	reg [23:0]hold;
	wire [2:0]bench_colour;
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
	   #5;	
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


	lights inst1(
        .clk(bench_clk), 
        .rst(bench_rst), 
        .button(bench_button), 
        .colour(bench_colour)
	);



			always@ (posedge bench_clk)  begin
                if (bench_rst==1) begin
                    #5 expected<=expected<=24'h00FF00;
                    hold<=expected; end
                else if (bench_sel) begin 
				    case({bench_light,bench_button})  //propagation delay of ipa
					{24'h0000FF,1'b1}: #25 expected<=24'h00FF00;
					{24'h00FF00,1'b1}: #25 expected<=24'h00FFFF;
					{24'h00FFFF,1'b1}: #25 expected<=24'hFF0000;
					{24'hFF0000,1'b1}: #25 expected<=24'hFF00FF;
					{24'hFF00FF,1'b1}: #25 expected<=24'hFF0000;
					{24'hFFFF00,1'b1}: #25 expected<=24'h0000FF;
					default:#25 expected<=hold;		
                endcase 
                hold<=expected;
                end 
                else
                #5 expected<=24'hFFFFFF;
           end   
            	    
	always begin
		#4 bench_sel<=~bench_sel;
		#6 bench_sel<=~bench_sel;
		#20;
	end
    
    
    
	initial
	begin
	   #1 bench_rst<=~bench_rst;
	   #2 bench_rst<=~bench_rst;
	   #300;
	   bench_rst<=~bench_rst;
	   #4; bench_rst<=~bench_rst; 
		#296 
		if (error_flag)
			$display("***TEST FAILED***");
		else 
			$display("***TEST PASSED***");
		$finish;
	end
endmodule
