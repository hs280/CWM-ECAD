//////////////////////////////////////////////////////////////////////////////////
// shows all outputs for better debugging 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module testbench;
    wire temperature_0;
    wire temperature_1;
    wire temperature_2;
    wire temperature_3;
    wire temperature_4;
    
 

	reg bench_clk=1'b0;
	reg [4:0]bench_temperature=5'd5;
	reg [23:0]expected_rgb=24'hx;
    	reg [23:0]expected=24'h0;
	reg error_flag=1'b0;
	reg bench_sel=1'b0;
    	reg bench_rst=1'b0;
	reg [4:0] bench_desired_temperature=5'd22;
    	wire [1:0] bench_state;
	reg bench_counter=1'b0;
    
	wire [23:0] bench_light;                	
    
//    	wire [2:0]colour;
//    	wire [23:0] rgb;
//    	wire  [23:0] light;
    
	assign temperature_0=bench_temperature[0];
    	assign temperature_1=bench_temperature[1];
    	assign temperature_2=bench_temperature[2];
    	assign temperature_3=bench_temperature[3];
    	assign temperature_4=bench_temperature[4];


 initial begin #3;   
    forever begin
      expected=(bench_sel)? expected_rgb:24'hFFFFFF;
    #1;
    end end
    
	initial begin 
	   #3.1;	
	   forever begin 
	   #5;
	        error_flag<=(expected!=bench_light)? 1'b1:error_flag;
        if (error_flag)
            $display("***TEST FAILED*** ACTUAL=%h , EXPECTED=%h",bench_light,expected); 
        end
end     



    
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


//	lights inst1(
//        .clk(bench_clk), 
//        .rst(bench_rst), 
//        .state(bench_state), 
//        .colour(colour)
//	);

//	colour_conv inst2(
//        .clk(bench_clk), 
//        .colour(colour), 
//        .enable(1'b1), 	//assume always enabled?
//        .rgb(rgb)
//   	);

//	mult inst3(
//	.a(24'hFFFFFF),
//	.b(rgb),
//	.sel(bench_sel),
//	.out(light)
//	);
    
    
	initial 
        forever @(posedge bench_clk or posedge bench_rst)
		begin
		if (bench_rst) begin 
			expected_rgb<=24'hFFFFFF;    /// assume goes to 0 at reset i.e. white
			bench_counter<=0; end
        else begin
        //#4;
            bench_counter<=bench_counter+1;
                case(bench_state)
				2'b00: begin expected_rgb<=24'hFFFFFF;
						bench_counter<=0; end
				2'b10: expected_rgb<=(bench_counter)? 24'hFF0000: 24'hFFa500;
				2'b01: expected_rgb<=(bench_counter)? 24'h0000FF: 24'h00FF00;
				default: expected_rgb<=24'hxxx;
			endcase
			end
			 
    end
    
    
	initial begin 
		#200 bench_temperature<=5'd26;
		#200 bench_temperature<=5'd10;
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
