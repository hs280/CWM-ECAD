ML PROJECT ABANDONED AS RECCOMENDED DUE TO OVER COMPLEXITY FOR THE LABS
		--> reccomended to do a similar project for a 4yp so perhaps it was a bit above my level

SORT MEMORY PARRALELLISIM SO AS TO ACCESS TREE PARAMATERS INITIALLY IN PARRALELL ALLOWING INTIALISATION TO OCCUR IN ONLY 2 CLOCKS THE ISSUE WOULD BE BUS BUT IF I WERE TO SEGMENT THE MEMORY INTO 6 FRAGMENTS IT MAY BE SUFFICIENT WHILE ALSO MINIMISING WASTE

Or in fact even better than that, tehre are effectively 27 end points and it makes sense to group these in three due to the tree format so that is 9 sets of 3,
then quite straightforwardly it is best to make 9 4 word memory blocks where a word is 6bit,
so firstly you would access the first 6 memory blocks in paralell and take the first word from each, i.e. the tree paramaters,
you would then feed these into anothe function that determines the correct memory block to access and the adress in that block and then the correct word is extracted.
the rest is straight forward 

i.e

from(blk0)--load(0) to param0
....
from(blk5)--load(0) to param5

always @clk begin
	block_number=trace(state,params[0:4])   		//goes up to last level i.e. does first two links in tree only 1 check left
	adress_number=eval_address(state,params[5:6])		// finds block relative address
	valve_output=mem_extract(block_number,adress_number)	//extracts from memory
	end


and done, prralellisim of FPGA's exploited and memory usage is reduced, a significantly better design in speed effectiveness and memory cost, if only I thought of it sooner....
