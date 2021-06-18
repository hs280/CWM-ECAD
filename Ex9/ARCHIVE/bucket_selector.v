//// module bucket selector /////
module bucket_selector (clk, reset, enable, given_k, no_more_data, full_data, selection, done_selecting, conf);
   /////PARAMERTERS/////
	parameter m = 45; //full size of the data that is coming in from above
	parameter n = 35;
	parameter Nb = 100;

   /////INPUTS/////
   input clk, reset, enable, no_more_data;
   input [m:0] full_data;
	input [4:0] given_k;
   
   /////OUTPUTS/////
   output      done_selecting;
   output [2:0] selection;
	output [4:0] conf;
   
   /////REGISTERS/////
   reg 	 	done_sorting, selector_done_selecting;
	reg [10:0] total_datums;
	reg [4:0] face_count [4:0];
	reg [2:0] select_face;
	reg [4:0] index;
	reg [4:0] confidence;
   

   /////WIRES/////
   wire [n-1:0] 			data_to_sort;
   wire [n*Nb-1:0] 		data_to_select;
	wire [10:0] datums_sorted;
	wire enable_sorter, reset_sorter;
	wire i_tester;
	


   integer 	 i;
	
	   
   
   bucket_sorter data_sorter_1(clk, reset_sorter, enable_sorter, data_to_sort, data_to_select, datums_sorted);

	
	//ASSIGNMENTS
	assign data_to_sort = full_data[n-1:0];	
	assign selection = select_face;
	assign done_selecting = selector_done_selecting;
	assign enable_sorter = (enable && (~no_more_data));
	assign reset_sorter = reset;
	assign i_tester = (i < given_k);
	assign conf = confidence;
	
	
	//INTIAL BEGIN
	initial begin
		
		//enable_sorter <= 0;
		done_sorting <= 0;
		selector_done_selecting <= 0;
		i = 0;
		face_count[0] = 5'd0;
		face_count[1] = 5'd0;
		face_count[2] = 5'd0;
		face_count[3] = 5'd0;
		face_count[4] = 5'd0;
		select_face = 3'd7;
		confidence = 5'd0;
				
	end
	
	
   always @ (posedge clk) begin

      if (reset) begin //if reset

			//enable_sorter <= 0;
			done_sorting <= 0;
			selector_done_selecting <= 0;
			i = 0;
			face_count[0] = 5'd0;
			face_count[1] = 5'd0;
			face_count[2] = 5'd0;
			face_count[3] = 5'd0;
			face_count[4] = 5'd0;
			select_face = 3'd7;
			confidence = 5'd0;
	 
      end //end if reset

      else begin //if not reset

			if (no_more_data) begin //if there IS still more data

				done_sorting = 1;
	    
			end //end else  no more data
			if (done_sorting) begin
				if (i < given_k) begin //if we are going through k

					if (data_to_select[(35*i+32)+:3] == 3'd0) begin
						face_count[0] = face_count[0]+5'd1;
					end
					else if (data_to_select[(35*i+32)+:3] == 3'd1) begin
						face_count[1] = face_count[1]+5'd1;
					end
					else if (data_to_select[(35*i+32)+:3] == 3'd2) begin
						face_count[2] = face_count[2]+5'd1;
					end
					else if (data_to_select[(35*i+32)+:3] == 3'd3) begin
						face_count[3] = face_count[3]+5'd1;
					end
					else if (data_to_select[(35*i+32)+:3] == 3'd4) begin
						face_count[4] = face_count[4]+5'd1;
					end
					i = i + 1;
				end //end if we are going through k
				else begin //if we are done going through k
				
					select_face = (face_count[0]>>face_count[1] && 
											face_count[0]>>face_count[2] && 
											face_count[0]>>face_count[3] && 
											face_count[0]>>face_count[4])?3'd0:
										((face_count[1]>>face_count[2] && 
											face_count[1]>>face_count[3] &&
											face_count[1]>>face_count[4])?3'd1:
									((face_count[2]>>face_count[3] && 
											face_count[2]>>face_count[4])?3'd2:
									((face_count[3]>>face_count[4])?3'd3:3'd4)));
									
					confidence = (face_count[0]>>face_count[1] && 
											face_count[0]>>face_count[2] && 
											face_count[0]>>face_count[3] && 
											face_count[0]>>face_count[4])?face_count[0]:
										((face_count[1]>>face_count[2] && 
											face_count[1]>>face_count[3] &&
											face_count[1]>>face_count[4])?face_count[1]:
									((face_count[2]>>face_count[3] && 
											face_count[2]>>face_count[4])?face_count[2]:
									((face_count[3]>>face_count[4])?face_count[3]:face_count[4])));

					selector_done_selecting <= 1;
				end //end if we are going through k
			end //end if done_sorting and enable

		end //end else ~reset
      
   end //end always at posedge clk

//   //maybe it should just be if done_sorting...
//   always @ (posedge done_sorting) begin
//	
//		if (~reset && enable) begin
//      
//			for(i=0;i<given_k+1;i=i+1) begin
//				//if (data_to_select[(36*(i+1)-1)-:4] == 0) begin
//				if (i < given_k) begin //if we are going through k
//					if (data_to_select[(35*i+32)+:3] == 3'd0) begin
//						face_count[0] = face_count[0]+5'd1;
//					end
//					else if (data_to_select[(35*i+32)+:3] == 3'd1) begin
//						face_count[1] = face_count[1]+5'd1;
//					end
//					else if (data_to_select[(35*i+32)+:3] == 3'd2) begin
//						face_count[2] = face_count[2]+5'd1;
//					end
//					else if (data_to_select[(35*i+32)+:3] == 3'd3) begin
//						face_count[3] = face_count[3]+5'd1;
//					end
//					else if (data_to_select[(35*i+32)+:3] == 3'd4) begin
//						face_count[4] = face_count[4]+5'd1;
//					end
//				
//					//face_count[data_to_select[(36*(i+1)-1)-:4]] =
//					//face_count[data_to_select[(36*(i+1)-1)-:4]] +1 ;
//				end //end if i <given_k+_1
//				else begin //if we are done going through k a lot of nested ifs
//					select_face = (face_count[0]>>face_count[1] && 
//											face_count[0]>>face_count[2] && 
//											face_count[0]>>face_count[3] && 
//											face_count[0]>>face_count[4])?3'd0:
//										((face_count[1]>>face_count[2] && 
//											face_count[1]>>face_count[3] &&
//											face_count[1]>>face_count[4])?3'd1:
//									((face_count[2]>>face_count[3] && 
//											face_count[2]>>face_count[4])?3'd2:
//									((face_count[3]>>face_count[4])?3'd3:3'd4)));
//					//selector_done_selecting = 1;
//				end //end else i<given_k +1
//			
//			end //end for //don't think is necessary
//      
//		end //end if not reset
//      
//      
//   end //end always @ posedge done_selecting
   


  
endmodule