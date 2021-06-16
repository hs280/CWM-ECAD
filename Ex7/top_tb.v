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
	reg [2:0]expected_colour;
	reg [23:0]expected_rgb=24'b0;
	wire [23:0] bench_rgb;
	wire [2:0]bench_colour;
	wire [23:0] bench_light;


	always
	begin
		#5 bench_clk<=~bench_clk;   
    end
	
initial begin
#10;
	forever begin
		#4 bench_button<=~bench_button;
		#6 bench_button<=~bench_button;
		#10;
	end
end
	initial begin 
	   #3.1;	
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

    	colour_conv inst2(
        .clk(bench_clk), 
        .colour(bench_colour), 
        .enable(1'b1), 	//assume always enabled?
        .rgb(bench_rgb)
    	);

    always @(posedge bench_rst) begin
        expected_colour<=3'b1  ;
    end



    always @(posedge bench_clk && bench_button) begin
        case(bench_rst)
           1'b0: expected_colour<=(expected_colour==3'b110)? 3'b1: expected_colour+3'b001; 
           default:expected_colour<=3'b001;
           endcase      
    end         
    initial begin
			forever@ (posedge bench_clk)  begin
			if (bench_rst==1) begin
			            #10;
                        expected_rgb=24'h0000FF;
                        #20;
                        end
            else begin
				    case(expected_colour)  //propagation delay of ipa
					3'b000: expected_rgb<=24'h000000;
					3'b001: expected_rgb<=24'h0000FF;
					3'b010: expected_rgb<=24'h00FF00;
					3'b011: expected_rgb<=24'h00FFFF;
					3'b100: expected_rgb<=24'hFF0000;
					3'b101: expected_rgb<=24'hFF00FF;
					3'b110: expected_rgb<=24'hFFFF00;
					3'b111: expected_rgb<=24'hFFFFFF;
					default expected_rgb<=24'hx;		
                endcase 
                #20;
           end 
       end
end
			always@ (posedge bench_sel or posedge (!bench_sel))  begin
                #5 expected<=(bench_sel)? expected_rgb:24'hFFFFFF;
           end   
  
   initial 
   begin
   #10;
   if (!bench_sel) begin 
        expected<=24'hFFFFFF;
   end
    #10;             
	forever begin
		#5 bench_sel<=~bench_sel;
		#11 bench_sel<=~bench_sel;
		#14;
	end
end
    
    
	initial
	begin
	   #1 bench_rst<=~bench_rst;
	   expected_colour=3'b1;
	   #19 bench_rst<=~bench_rst;
	   #280;
	   bench_rst<=~bench_rst;
	   #10; bench_rst<=~bench_rst; 
		#290 
		if (error_flag)
			$display("***TEST FAILED***");
		else 
			$display("***TEST PASSED***");
		$finish;
	end
endmodule
