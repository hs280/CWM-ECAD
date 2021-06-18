//bucket_sorter module ///////////////////////////////////
module bucket_sorter(clk, reset, enable, data_to_sort, sorted_data, datums_sorted);
   
   /////PARAMETERS/////
   parameter n = 35; // 4 bit classifier (which face) followed by 32 bit distance
   parameter Nb = 100; //This is how many buckets there will be
	//integer step = 0;
   
   /////INPUTS/////
   input clk, reset, enable;
   input [n-1:0] data_to_sort;//input [n:0] data_to_sort[N:0];
	//Need to change the above to input [n*N:0] data_to_sort;
	//Then address them manually
   
	
   /////OUTPUTS/////
   //output 	    done_sorting;
   output [(n*Nb)-1:0]     sorted_data;
	output[9:0]					datums_sorted;
   
	
   /////REGISTERS/////
   //reg 		     drink_settle;//, sorter_done_sorting;
	reg			  enable_buckets, reset_buckets;
   reg [9:0] 	     step_count; //step should be log_base_2(N) +1 
	//reg [n:0] 	     current_data;
   //reg [n-1:0] 	     current_data;
	
   /////WIRES/////
   
   wire [n-1:0] 	     bucket_data[Nb-1:0];
   wire [n-1:0] 	     upper_bucket_data[Nb-1:0];
   wire 	     bucket_full[Nb-1:0];
   wire 	     upper_bucket_full[Nb-1:0];
   
   //ASSIGNING OUTPUTS
	//assign done_sorting = sorter_done_sorting;
	assign datums_sorted = step_count;
	
   
   //Now we generate the buckets
   genvar 	     i;
   generate
      for(i=0;i<Nb;i=i+1) begin: all_these_buckets
	 bucket data_cell_1(clk, reset, enable, upper_bucket_full[i],
			     upper_bucket_data[i],
			    data_to_sort, bucket_full[i],  bucket_data[i]);
	 assign upper_bucket_full[i] = i==0?1'b1:bucket_full[i-1];
	 
	 assign upper_bucket_data[i] = i==0?35'd0:bucket_data[i-1]; //used to have n'b0 here instead of 0 for value
	 assign sorted_data[35*i +: 35] = bucket_data[i];
      end
   endgenerate
	
	initial begin
		//drink_settle <= 1; <<-- old thing from 2 cycle sort
		step_count= 0;
		//sorter_done_sorting <= 0;
		//enable_buckets <= 0;
	end
   
   always @ (posedge clk) begin
      if(reset) begin
			//drink_settle <= 1; <<-- old thing from 2 cycle sort
			step_count = 0;
      end //end if reset
		else begin
			if(enable) begin		
				step_count = step_count + 10'b1; //up the step_count
			end //end if enable
      end //end else reset
   end //end always at posedge clock
	
endmodule