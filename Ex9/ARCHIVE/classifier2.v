module classifier2(
  clk, rst, numEntries, rdata, test, label, rstall, conf
);

	//Knn parameters
	parameter m = 45; //full size of the data that is coming in from above
	parameter n = 35;
	parameter Nb = 100;

	//Expects top level memory manager to feed
	//reset, test data, first rdata, and numEntries on initial
	//then feeds in new data each cycle...
   input clk;
   input rst;
   input [10:0] numEntries; 
   input [1026:0] rdata;
   input [1023:0] test;

	output [2:0] label;
   output 	 rstall;
	output[4:0] conf;

	reg[4:0] state;
	reg[10:0] currentEntry;
	wire[2:0] arb_label;
	reg arb_en;
	reg arb_flag;
	
	wire[34:0] w_currentDistance;
	wire[31:0] bucketDistances[63:0];
	wire[31:0] sumDistances[63:0];
	wire arb_rstall;
	
	genvar p;
	generate
	assign sumDistances[0] = ((rdata[15:0] > test[15:0])?
		rdata[15:0] - test[15:0]:
		test[15:0] - rdata[15:0]);
	for(p=1;p<64;p=p+1)
	begin:datamap
		assign sumDistances[p] =
		sumDistances[p-1]+

		((rdata[16*p+:16] > test[16*p+:16])?
		(rdata[16*p+:16] - test[16*p+:16]):
		(test[16*p+:16] - rdata[16*p+:16]));
	end
	endgenerate
	
	
	assign w_currentDistance = {rdata[1026:1024], sumDistances[63]};
	
	wire [4:0] confidence;
	bucket_selector arbiter(
						.clk				(clk),
						.reset			(rst),
						.enable			(arb_en),
						.no_more_data	(arb_flag),
						.full_data		(w_currentDistance), /* need to add class in dist */
						.given_k			(5'd10), /*hard-coded for now*/
						.done_selecting(arb_rstall),
						.selection		(arb_label),
						.conf				(confidence)
						);
	
	assign label = arb_label;
	assign rstall =  (state==0)? 1'b0 : 1'b1;
	assign conf = confidence;
	
   initial begin
		state = 0;
   end

   always @ (posedge clk)begin
		if(state==0)begin
			arb_flag <= 0;
			currentEntry <= 0;
			if(rst ==1)begin
				state <= 1;
			end
		end
		if(state ==1)begin
			arb_en <= 1;
			currentEntry <= currentEntry+1'b1;
			if(currentEntry == numEntries)begin
				state <= 2;
				arb_flag <= 1;
			end
		end
		if(state==2)begin
			if(arb_rstall==1)begin
				state <= 0;
			end
		end
		
	end
endmodule
   