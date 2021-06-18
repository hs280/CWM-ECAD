// the bucket module ////
module bucket(clk, reset, enable, above_full, above_data,
 new_data, full, data);
	
	/////PARAMETERS/////
   parameter n = 35;
	//4 bit classifier (which face) followed by 32 bit distance
	
	//INPUTS
	input clk, reset, enable;
	input above_full; // drink_settle; <-- old value for 2 cycle sort
	input[n-1:0] new_data, above_data;

	//OUTPUTS
	output full;
	output[n-1:0] data;

	//REGS
	reg [n-1:0] bucket_data;
	reg bucket_full;
	
	
	//WIRES
	wire [3:0] premises;
	
	//ASSIGNING OUTPUTS
	assign full = bucket_full;
	assign data = bucket_data;
	assign premises[3] = bucket_full;
	assign premises[2] = above_full;
	assign premises[1] = bucket_data[n-4:0] > new_data[n-4:0];
	assign premises[0] = above_data[n-4:0] > new_data[n-4:0];
	
	initial begin
		bucket_data <= 0;
		bucket_full <= 0;
		
	end
	

	always @ (posedge clk) begin
		if(reset) begin
			
			bucket_data <= 0;
			bucket_full <= 0;
			
		end //end if reset
		
		else begin
			if(enable) begin
				
				casex (premises)
				
					4'b???1: //above is greater than new_data (it will be pouring)
						begin
							bucket_data <= above_data;
							bucket_full <= 1;
						end
					4'b??10: //this one is greater and the above isn't (take new)
						begin
							bucket_data <= new_data;
							bucket_full <= 1;
						end
					4'b0100: //the above one is full and this one is 
						begin
							bucket_data <= new_data;
							bucket_full <= 1;
						end
					
					default begin
						bucket_data = bucket_data;
					end
					
				endcase
				
//				//COMMENTING OUT THE OLD NESTED IFS
//				//is the bucket above full?
//				if(above_full) begin
//						
//					//is current value strictly greater than new value
//					if(bucket_data[n-4:0] > new_data[n-4:0]) begin
//						//is the above value less than or equal to new value? (will the 
//						if (above_data[n-4:0] <= new_data[n-4:0] ) begin
//							
//							bucket_data <= new_data;
//							bucket_full <= 1;
//							
//						end //end above_data is less than or equal to new data
//						else begin //if above_data is greater than new data
//							
//							bucket_data <= above_data;
//							bucket_full <= 1;
//							
//						end //end else for if above data is greater than new data
//						
//						
//					end //end if above above data is greater than new data
//						
//					else begin //if the above is less than or equal to new data
//							
//						//is this bucket empty?
//						if(~bucket_full && (above_data[n-4:0] <= new_data[n-4:0])) begin
//						
//							bucket_data <= new_data;
//							bucket_full <= 1;
//							
//						end //end if this bucket is empty
//						
//					end //end else if above data is less than or equal to new data
//				end //end if full
//					
//				//if the above bucket is empty
//				else begin
//					
//					bucket_data = bucket_data;
//					
//				end //end else for above is empty
			end //end if enable
		end //end else reset
	end //end always at posedge clk
	
endmodule