module DE1_SoC_Computer (
	////////////////////////////////////
	// FPGA Pins
	////////////////////////////////////

	// Clock pins
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	CLOCK4_50,

	// ADC
	ADC_CS_N,
	ADC_DIN,
	ADC_DOUT,
	ADC_SCLK,

	// Audio
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	// SDRAM
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_UDQM,
	DRAM_WE_N,

	// I2C Bus for Configuration of the Audio and Video-In Chips
	FPGA_I2C_SCLK,
	FPGA_I2C_SDAT,

	// 40-Pin Headers
	GPIO_0,
	GPIO_1,
	
	// Seven Segment Displays
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,

	// IR
	IRDA_RXD,
	IRDA_TXD,

	// Pushbuttons
	KEY,

	// LEDs
	LEDR,

	// PS2 Ports
	PS2_CLK,
	PS2_DAT,
	
	PS2_CLK2,
	PS2_DAT2,

	// Slider Switches
	SW,

	// Video-In
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	// VGA
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	////////////////////////////////////
	// HPS Pins
	////////////////////////////////////
	
	// DDR3 SDRAM
	HPS_DDR3_ADDR,
	HPS_DDR3_BA,
	HPS_DDR3_CAS_N,
	HPS_DDR3_CKE,
	HPS_DDR3_CK_N,
	HPS_DDR3_CK_P,
	HPS_DDR3_CS_N,
	HPS_DDR3_DM,
	HPS_DDR3_DQ,
	HPS_DDR3_DQS_N,
	HPS_DDR3_DQS_P,
	HPS_DDR3_ODT,
	HPS_DDR3_RAS_N,
	HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ,
	HPS_DDR3_WE_N,

	// Ethernet
	HPS_ENET_GTX_CLK,
	HPS_ENET_INT_N,
	HPS_ENET_MDC,
	HPS_ENET_MDIO,
	HPS_ENET_RX_CLK,
	HPS_ENET_RX_DATA,
	HPS_ENET_RX_DV,
	HPS_ENET_TX_DATA,
	HPS_ENET_TX_EN,

	// Flash
	HPS_FLASH_DATA,
	HPS_FLASH_DCLK,
	HPS_FLASH_NCSO,

	// Accelerometer
	HPS_GSENSOR_INT,
		
	// General Purpose I/O
	HPS_GPIO,
		
	// I2C
	HPS_I2C_CONTROL,
	HPS_I2C1_SCLK,
	HPS_I2C1_SDAT,
	HPS_I2C2_SCLK,
	HPS_I2C2_SDAT,

	// Pushbutton
	HPS_KEY,

	// LED
	HPS_LED,
		
	// SD Card
	HPS_SD_CLK,
	HPS_SD_CMD,
	HPS_SD_DATA,

	// SPI
	HPS_SPIM_CLK,
	HPS_SPIM_MISO,
	HPS_SPIM_MOSI,
	HPS_SPIM_SS,

	// UART
	HPS_UART_RX,
	HPS_UART_TX,

	// USB
	HPS_CONV_USB_N,
	HPS_USB_CLKOUT,
	HPS_USB_DATA,
	HPS_USB_DIR,
	HPS_USB_NXT,
	HPS_USB_STP
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

////////////////////////////////////
// FPGA Pins
////////////////////////////////////

// Clock pins
input						CLOCK_50;
input						CLOCK2_50;
input						CLOCK3_50;
input						CLOCK4_50;

// ADC
inout						ADC_CS_N;
output					ADC_DIN;
input						ADC_DOUT;
output					ADC_SCLK;

// Audio
input						AUD_ADCDAT;
inout						AUD_ADCLRCK;
inout						AUD_BCLK;
output					AUD_DACDAT;
inout						AUD_DACLRCK;
output					AUD_XCK;

// SDRAM
output 		[12: 0]	DRAM_ADDR;
output		[ 1: 0]	DRAM_BA;
output					DRAM_CAS_N;
output					DRAM_CKE;
output					DRAM_CLK;
output					DRAM_CS_N;
inout			[15: 0]	DRAM_DQ;
output					DRAM_LDQM;
output					DRAM_RAS_N;
output					DRAM_UDQM;
output					DRAM_WE_N;

// I2C Bus for Configuration of the Audio and Video-In Chips
output					FPGA_I2C_SCLK;
inout						FPGA_I2C_SDAT;

// 40-pin headers
inout			[35: 0]	GPIO_0;
inout			[35: 0]	GPIO_1;

// Seven Segment Displays
output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
output		[ 6: 0]	HEX2;
output		[ 6: 0]	HEX3;
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;

// IR
input						IRDA_RXD;
output					IRDA_TXD;

// Pushbuttons
input			[ 3: 0]	KEY;

// LEDs
output		[ 9: 0]	LEDR;

// PS2 Ports
inout						PS2_CLK;
inout						PS2_DAT;

inout						PS2_CLK2;
inout						PS2_DAT2;

// Slider Switches
input			[ 9: 0]	SW;

// Video-In
input						TD_CLK27;
input			[ 7: 0]	TD_DATA;
input						TD_HS;
output					TD_RESET_N;
input						TD_VS;

// VGA
output		[ 7: 0]	VGA_B;
output					VGA_BLANK_N;
output					VGA_CLK;
output		[ 7: 0]	VGA_G;
output					VGA_HS;
output		[ 7: 0]	VGA_R;
output					VGA_SYNC_N;
output					VGA_VS;



////////////////////////////////////
// HPS Pins
////////////////////////////////////
	
// DDR3 SDRAM
output		[14: 0]	HPS_DDR3_ADDR;
output		[ 2: 0]  HPS_DDR3_BA;
output					HPS_DDR3_CAS_N;
output					HPS_DDR3_CKE;
output					HPS_DDR3_CK_N;
output					HPS_DDR3_CK_P;
output					HPS_DDR3_CS_N;
output		[ 3: 0]	HPS_DDR3_DM;
inout			[31: 0]	HPS_DDR3_DQ;
inout			[ 3: 0]	HPS_DDR3_DQS_N;
inout			[ 3: 0]	HPS_DDR3_DQS_P;
output					HPS_DDR3_ODT;
output					HPS_DDR3_RAS_N;
output					HPS_DDR3_RESET_N;
input						HPS_DDR3_RZQ;
output					HPS_DDR3_WE_N;

// Ethernet
output					HPS_ENET_GTX_CLK;
inout						HPS_ENET_INT_N;
output					HPS_ENET_MDC;
inout						HPS_ENET_MDIO;
input						HPS_ENET_RX_CLK;
input			[ 3: 0]	HPS_ENET_RX_DATA;
input						HPS_ENET_RX_DV;
output		[ 3: 0]	HPS_ENET_TX_DATA;
output					HPS_ENET_TX_EN;

// Flash
inout			[ 3: 0]	HPS_FLASH_DATA;
output					HPS_FLASH_DCLK;
output					HPS_FLASH_NCSO;

// Accelerometer
inout						HPS_GSENSOR_INT;

// General Purpose I/O
inout			[ 1: 0]	HPS_GPIO;

// I2C
inout						HPS_I2C_CONTROL;
inout						HPS_I2C1_SCLK;
inout						HPS_I2C1_SDAT;
inout						HPS_I2C2_SCLK;
inout						HPS_I2C2_SDAT;

// Pushbutton
inout						HPS_KEY;

// LED
inout						HPS_LED;

// SD Card
output					HPS_SD_CLK;
inout						HPS_SD_CMD;
inout			[ 3: 0]	HPS_SD_DATA;

// SPI
output					HPS_SPIM_CLK;
input						HPS_SPIM_MISO;
output					HPS_SPIM_MOSI;
inout						HPS_SPIM_SS;

// UART
input						HPS_UART_RX;
output					HPS_UART_TX;

// USB
inout						HPS_CONV_USB_N;
input						HPS_USB_CLKOUT;
inout			[ 7: 0]	HPS_USB_DATA;
input						HPS_USB_DIR;
input						HPS_USB_NXT;
output					HPS_USB_STP;	

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire			[15: 0]	hex3_hex0;
//wire			[15: 0]	hex5_hex4;

//assign HEX0 = ~hex3_hex0[ 6: 0]; // hex3_hex0[ 6: 0]; 
//assign HEX1 = ~hex3_hex0[14: 8];
//assign HEX2 = ~hex3_hex0[22:16];
//assign HEX3 = ~hex3_hex0[30:24];
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;

HexDigit Digit0(HEX0, hex3_hex0[3:0]);
HexDigit Digit1(HEX1, hex3_hex0[7:4]);
HexDigit Digit2(HEX2, hex3_hex0[11:8]);
HexDigit Digit3(HEX3, hex3_hex0[15:12]);


// MAY need to cycle this switch on power-up to get video
assign TD_RESET_N = SW[1];

// get some signals exposed
// connect bus master signals to i/o for probes
assign GPIO_0[0] = TD_HS ;
assign GPIO_0[1] = TD_VS ;
assign GPIO_0[2] = TD_DATA[6] ;
assign GPIO_0[3] = TD_CLK27 ;
assign GPIO_0[4] = TD_RESET_N ;

//=======================================================
// Bus controller for AVALON bus-master
//=======================================================
wire [31:0] vga_bus_addr, video_in_bus_addr ; // Avalon addresses
reg  [31:0] bus_addr ;
wire [31:0] vga_out_base_address = 32'h0000_0000 ;  // Avalon address
wire [31:0] video_in_base_address = 32'h0800_0000 ;  // Avalon address
reg [3:0] bus_byte_enable ; // four bit byte read/write mask
reg bus_read  ;       // high when requesting data
reg bus_write ;      //  high when writing data
reg [31:0] bus_write_data ; //  data to send to Avalog bus
wire bus_ack  ;       //  Avalon bus raises this when done
wire [31:0] bus_read_data ; // data from Avalon bus
reg [31:0] timer ;
reg [5:0] state ;
reg last_vs, wait_one;
reg [19:0] vs_count ;
reg last_hs, wait_one_hs ;
reg [19:0] hs_count ;

//////////////////////////////////
// Image Reading Interface
//////////////////////////////////

// pixel address is
reg [9:0] vga_x_cood, vga_y_cood, video_in_x_cood, video_in_y_cood ;
reg [7:0] current_pixel_color1, current_pixel_color2 ;
// compute address
assign vga_bus_addr = vga_out_base_address + {22'b0,video_in_x_cood + vga_x_cood} + ({22'b0,video_in_y_cood + vga_y_cood}<<10) ;
assign video_in_bus_addr = video_in_base_address + {22'b0,video_in_x_cood} + ({22'b0,video_in_y_cood}<<9) ;	 

reg[16:0] histogram[63:0];
reg[16:0] histogram_stable[63:0];

wire[7:0] b = current_pixel_color1 & 8'd3;
wire[7:0] g = (current_pixel_color1 >> 2) & 8'd7;
wire[7:0] r = current_pixel_color1 >> 5;
wire[7:0] grey = 8'd8 * b + 8'd11 * r + 8'd22 * g;

//////////////////////////////////
// Debug Interface
//////////////////////////////////

reg[9:0] testMem;
assign hex3_hex0[3:0] = numFaces%10;
assign hex3_hex0[7:4] = (numFaces/10)%10;
assign hex3_hex0[11:8] = classResult[2:0];
assign hex3_hex0[15:12] = confData[3:0];	//histogram_stable[0][3:0];
assign LEDR[7:0] = testMem[7:0];
assign LEDR[8] = prevCEN;
assign LEDR[9] = class_en;
//////////////////////////////////
// Memory Interface
//////////////////////////////////

// 9 bit addresses for 512 words
reg[8:0] memAddr;

// Data is an entire histogram for faster write/read
wire[1027:0] memData;

wire [1027:0] dataOut; 

reg mem_wren;
reg [10:0] numFaces;

test Memory(CLOCK2_50, memData, memAddr, memAddr, mem_wren, dataOut);
		
// Generate the wires from the histogram to the data into memory
genvar p;
generate
for(p=0;p<64;p=p+1)
begin:datamap
	assign memData[(((p+1)<<4)-1):(p<<4)] = histogram_stable[p];//SW[3:2];//memReset?16'b0:16'b1010101010101010;//
end
endgenerate

assign memData[1026:1024] = /*(~class_en)?class:*/SW[6:4];

//////////////////////////////////
// KNN Machine Interface
//////////////////////////////////

reg mem_en;
wire knn_en;
wire[2:0] class;
wire class_en;
reg knnRST;
reg prevCEN;
wire[4:0] conf;
reg[4:0] confData;


classifier2 knn(CLOCK2_50, knnRST, numFaces, dataOut, memData[1023:0], class, class_en, conf);

//////////////////////////////////
// HPS KNN Interface
//////////////////////////////////

reg [15:0] miniHist [7:0];
reg [15:0] miniHist_stable [7:0];

wire 		[31:0]  pio_hist_0;
wire 		[31:0]  pio_hist_1;
wire 		[31:0]  pio_hist_2;
wire 		[31:0]  pio_hist_3;
wire 		[31:0]  pio_hist_4;
wire 		[31:0]  pio_hist_5;
wire 		[31:0]  pio_hist_6;
wire 		[31:0]  pio_hist_7;		

assign pio_hist_0 = {15'b0, miniHist_stable[0]};
assign pio_hist_1 = {15'b0, miniHist_stable[1]};
assign pio_hist_2 = {15'b0, miniHist_stable[2]};
assign pio_hist_3 = {15'b0, miniHist_stable[3]};
assign pio_hist_4 = {15'b0, miniHist_stable[4]};
assign pio_hist_5 = {15'b0, miniHist_stable[5]};
assign pio_hist_6 = {15'b0, miniHist_stable[6]};
assign pio_hist_7 = {15'b0, miniHist_stable[7]};
integer i;

//////////////////////////////////
// State Machine Interface
//////////////////////////////////

reg memReset;
reg [8:0] keyDebounce;
reg readingMutex;
reg[9:0] currFace;
reg[2:0] classResult;

always @(posedge CLOCK2_50) begin //CLOCK_50
	// reset state machine and read/write controls
		if(prevCEN==1'b1 && class_en==0)begin
			classResult <= class;
			confData <= conf;
		end
	
		if (~KEY[0] && keyDebounce==0) begin
			bus_read <= 0 ; // set to one if a read opeation from bus
			bus_write <= 0 ; // set to on if a write operation to bus
			// base address of upper-left corner of the screen
			vga_x_cood <= 10'd100 ;
			vga_y_cood <= 10'd50 ;
			video_in_x_cood <= 0 ;
			video_in_y_cood <= 0 ;
			bus_byte_enable <= 4'b0001;
			timer <= 0;
			for(i=0;i<8;i=i+1)begin
				miniHist[i] <= 0;
				histogram[i] <= 0;
			end
			currFace <= 0;
			keyDebounce <= 500;
			state <= 12;
			knnRST <= 0;
			testMem <= 10'b0;
		end
		
		// Begin write sequence
		else if ((~KEY[3] && keyDebounce==0) /*|| (prevCEN==1'b1 && !class_en)*/ && ~readingMutex) begin
			mem_wren <= 1;
			memAddr <= numFaces; // Location in block of each face
			numFaces <= numFaces + 1'b1;
			keyDebounce <= 500;
			state <= 13;
		end
		
		// Face Check Button
		else if (~KEY[2] && keyDebounce==0) begin
			state <= 10;
			readingMutex<=1;
			currFace <= 0;
			keyDebounce <= 500;
		end
		// Debug key
		else if (~KEY[1] && keyDebounce==0) begin
			memAddr <= SW[9:7];
			keyDebounce <= 500;
		end
		else begin
			timer <= timer + 1;
		end
		
		
		if(KEY[3] && KEY[2] && KEY[1] && KEY[0])begin
			prevCEN <= class_en;
			if(keyDebounce>0)begin
				keyDebounce <= keyDebounce-1'b1;
			end
			// write to the bus-master
			// and put in a small delay to aviod bus hogging
			// timer delay can be set to 2**n-1, so 3, 7, 15, 31
			// bigger numbers mean slower frame update to VGA
			if (state==0 && SW[0] && (timer & 3)==0 ) begin //
				state <= 1;	
				readingMutex<=0;
				
				// read all the pixels in the video input
				video_in_x_cood <= video_in_x_cood + 10'd1 ;
				if (video_in_x_cood > 10'd319) begin
					video_in_x_cood <= 0 ;
					video_in_y_cood <= video_in_y_cood + 10'd1 ;
					if (video_in_y_cood > 10'd239) begin
						video_in_y_cood <= 10'd0 ;
						// Reset and store to stable state
						for(i=0;i<8;i=i+1) begin
							miniHist[i] <= 0;
							miniHist_stable[i] <= miniHist[i];
						end
						for(i=0;i<64;i=i+1) begin
							histogram[i] <= 0;
							histogram_stable[i] <= histogram[i];
						end
					end
				end
				// one byte data
				bus_byte_enable <= 4'b0001;
				// read first pixel
				bus_addr <= video_in_bus_addr ;
				// signal the bus that a read is requested
				bus_read <= 1'b1 ;	
			end
			
			// finish the  read
			// You MUST do this check
			if (state==1 && bus_ack==1) begin
				state <= 8 ; //state <= 2 ;
				bus_read <= 1'b0;
				current_pixel_color1 <= bus_read_data ;
			end
			
			// write a pixel to VGA memory
			if (state==8) begin
				state <= 9 ;
				bus_write <= 1'b1;
				bus_addr <= vga_bus_addr ;
				bus_write_data <= current_pixel_color1;
				bus_byte_enable <= 4'b0001;
				if(histogram[grey>>2]<16'b1111111111111111)begin
					histogram[grey>>2] <= histogram[grey>>2]+1'b1;
				end
				// HPS Version
				if(miniHist[grey>>5]<16'b1111111111111111)begin
					miniHist[grey>>5] <= miniHist[grey>>5]+1'b1;
				end
			end
			
			// and finish write, update histogram
			if (state==9 && bus_ack==1) begin
				state <= 0 ;
				bus_write <= 1'b0;
			end
			
			// State loop to send all data to the knn system
			if(state == 10)begin
				bus_write <= 1'b0;
				mem_wren <= 0;
				bus_read <= 1'b0;
				state <= 11;
			end
			
			// Memory states - not reading states.
			if(state == 11)begin
				mem_wren <= 0;
				
				// Cycle 2 write
				if(currFace==2)begin
					testMem[currFace-2] <= dataOut[1];
					knnRST <= 1;
				end
				else begin
					knnRST <= 0;
				end
				// Done check
				if(currFace == numFaces+1'b1)begin
					state <= 0;
				end
				// Read face from memory, then increment counter
				memAddr <= currFace;
				currFace <= currFace + 1'b1;
			end
			
			// Clearing all memory
			if(state == 12)begin
				mem_wren <= 1'b1;
				memAddr <= currFace;
				currFace <= currFace + 1'b1;
				if(currFace == numFaces)begin
					state <= 0;
					numFaces <= 0;
					memReset <= 0;
				end
				else begin 
					memReset <= 1;
				end
			end
			
			// If we're writing, write!
			if(state==13)begin
				mem_wren <= 0;
				state <= 0;
			end
		end
	
end // always @(posedge state_clock)

//=======================================================
//  Structural coding
//=======================================================

Computer_System The_System (
	////////////////////////////////////
	// FPGA Side
	////////////////////////////////////

	// Global signals
	.system_pll_ref_clk_clk					(CLOCK_50),
	.system_pll_ref_reset_reset			(1'b0),

	// AV Config
	.av_config_SCLK							(FPGA_I2C_SCLK),
	.av_config_SDAT							(FPGA_I2C_SDAT),

	// Audio Subsystem
	.audio_pll_ref_clk_clk					(CLOCK3_50),
	.audio_pll_ref_reset_reset				(1'b0),
	.audio_clk_clk								(AUD_XCK),
	.audio_ADCDAT								(AUD_ADCDAT),
	.audio_ADCLRCK								(AUD_ADCLRCK),
	.audio_BCLK									(AUD_BCLK),
	.audio_DACDAT								(AUD_DACDAT),
	.audio_DACLRCK								(AUD_DACLRCK),

	// Slider Switches
	.slider_switches_export					(SW),

	// Pushbuttons (~KEY[3:0]),
	.pushbuttons_export						(~KEY[3:0]),

	// Expansion JP1
	//.expansion_jp1_export					({GPIO_0[35:19], GPIO_0[17], GPIO_0[15:3], GPIO_0[1]}),

	// Expansion JP2
	//.expansion_jp2_export					({GPIO_1[35:19], GPIO_1[17], GPIO_1[15:3], GPIO_1[1]}),

	// PIOs
	.pio_hist_0_export (pio_hist_0),
	.pio_hist_1_export (pio_hist_1),
	.pio_hist_2_export (pio_hist_2),
	.pio_hist_3_export (pio_hist_3),
	.pio_hist_4_export (pio_hist_4),
	.pio_hist_5_export (pio_hist_5),
	.pio_hist_6_export (pio_hist_6),
	.pio_hist_7_export (pio_hist_7),
	
	// LEDs
	.leds_export_in_port								(LEDR),
	
	// Seven Segs
	.hex3_hex0_in_port							(hex3_hex0),
	//.hex5_hex4_export							(hex5_hex4),
	
	// PS2 Ports
	//.ps2_port_CLK								(PS2_CLK),
	//.ps2_port_DAT								(PS2_DAT),
	//.ps2_port_dual_CLK						(PS2_CLK2),
	//.ps2_port_dual_DAT						(PS2_DAT2),

	// IrDA
	//.irda_RXD									(IRDA_RXD),
	//.irda_TXD									(IRDA_TXD),

	// VGA Subsystem
	.vga_pll_ref_clk_clk 					(CLOCK2_50),
	.vga_pll_ref_reset_reset				(1'b0),
	.vga_CLK										(VGA_CLK),
	.vga_BLANK									(VGA_BLANK_N),
	.vga_SYNC									(VGA_SYNC_N),
	.vga_HS										(VGA_HS),
	.vga_VS										(VGA_VS),
	.vga_R										(VGA_R),
	.vga_G										(VGA_G),
	.vga_B										(VGA_B),
	
	// Video In Subsystem
	.video_in_TD_CLK27 						(TD_CLK27),
	.video_in_TD_DATA							(TD_DATA),
	.video_in_TD_HS							(TD_HS),
	.video_in_TD_VS							(TD_VS),
	.video_in_clk27_reset					(),
	.video_in_TD_RESET						(),
	.video_in_overflow_flag					(),
	
	.ebab_video_in_external_interface_address     (bus_addr),     // 
	.ebab_video_in_external_interface_byte_enable (bus_byte_enable), //  .byte_enable
	.ebab_video_in_external_interface_read        (bus_read),        //  .read
	.ebab_video_in_external_interface_write       (bus_write),       //  .write
	.ebab_video_in_external_interface_write_data  (bus_write_data),  //.write_data
	.ebab_video_in_external_interface_acknowledge (bus_ack), //  .acknowledge
	.ebab_video_in_external_interface_read_data   (bus_read_data),   
	// clock bridge for EBAb_video_in_external_interface_acknowledge
	.clock_bridge_0_in_clk_clk                    (CLOCK_50),
		
	// SDRAM
	.sdram_clk_clk								(DRAM_CLK),
   .sdram_addr									(DRAM_ADDR),
	.sdram_ba									(DRAM_BA),
	.sdram_cas_n								(DRAM_CAS_N),
	.sdram_cke									(DRAM_CKE),
	.sdram_cs_n									(DRAM_CS_N),
	.sdram_dq									(DRAM_DQ),
	.sdram_dqm									({DRAM_UDQM,DRAM_LDQM}),
	.sdram_ras_n								(DRAM_RAS_N),
	.sdram_we_n									(DRAM_WE_N),
	
	////////////////////////////////////
	// HPS Side
	////////////////////////////////////
	// DDR3 SDRAM
	.memory_mem_a			(HPS_DDR3_ADDR),
	.memory_mem_ba			(HPS_DDR3_BA),
	.memory_mem_ck			(HPS_DDR3_CK_P),
	.memory_mem_ck_n		(HPS_DDR3_CK_N),
	.memory_mem_cke		(HPS_DDR3_CKE),
	.memory_mem_cs_n		(HPS_DDR3_CS_N),
	.memory_mem_ras_n		(HPS_DDR3_RAS_N),
	.memory_mem_cas_n		(HPS_DDR3_CAS_N),
	.memory_mem_we_n		(HPS_DDR3_WE_N),
	.memory_mem_reset_n	(HPS_DDR3_RESET_N),
	.memory_mem_dq			(HPS_DDR3_DQ),
	.memory_mem_dqs		(HPS_DDR3_DQS_P),
	.memory_mem_dqs_n		(HPS_DDR3_DQS_N),
	.memory_mem_odt		(HPS_DDR3_ODT),
	.memory_mem_dm			(HPS_DDR3_DM),
	.memory_oct_rzqin		(HPS_DDR3_RZQ),
		  
	// Ethernet
	.hps_io_hps_io_gpio_inst_GPIO35	(HPS_ENET_INT_N),
	.hps_io_hps_io_emac1_inst_TX_CLK	(HPS_ENET_GTX_CLK),
	.hps_io_hps_io_emac1_inst_TXD0	(HPS_ENET_TX_DATA[0]),
	.hps_io_hps_io_emac1_inst_TXD1	(HPS_ENET_TX_DATA[1]),
	.hps_io_hps_io_emac1_inst_TXD2	(HPS_ENET_TX_DATA[2]),
	.hps_io_hps_io_emac1_inst_TXD3	(HPS_ENET_TX_DATA[3]),
	.hps_io_hps_io_emac1_inst_RXD0	(HPS_ENET_RX_DATA[0]),
	.hps_io_hps_io_emac1_inst_MDIO	(HPS_ENET_MDIO),
	.hps_io_hps_io_emac1_inst_MDC		(HPS_ENET_MDC),
	.hps_io_hps_io_emac1_inst_RX_CTL	(HPS_ENET_RX_DV),
	.hps_io_hps_io_emac1_inst_TX_CTL	(HPS_ENET_TX_EN),
	.hps_io_hps_io_emac1_inst_RX_CLK	(HPS_ENET_RX_CLK),
	.hps_io_hps_io_emac1_inst_RXD1	(HPS_ENET_RX_DATA[1]),
	.hps_io_hps_io_emac1_inst_RXD2	(HPS_ENET_RX_DATA[2]),
	.hps_io_hps_io_emac1_inst_RXD3	(HPS_ENET_RX_DATA[3]),

	// Flash
	.hps_io_hps_io_qspi_inst_IO0	(HPS_FLASH_DATA[0]),
	.hps_io_hps_io_qspi_inst_IO1	(HPS_FLASH_DATA[1]),
	.hps_io_hps_io_qspi_inst_IO2	(HPS_FLASH_DATA[2]),
	.hps_io_hps_io_qspi_inst_IO3	(HPS_FLASH_DATA[3]),
	.hps_io_hps_io_qspi_inst_SS0	(HPS_FLASH_NCSO),
	.hps_io_hps_io_qspi_inst_CLK	(HPS_FLASH_DCLK),

	// Accelerometer
	.hps_io_hps_io_gpio_inst_GPIO61	(HPS_GSENSOR_INT),

	//.adc_sclk                        (ADC_SCLK),
	//.adc_cs_n                        (ADC_CS_N),
	//.adc_dout                        (ADC_DOUT),
	//.adc_din                         (ADC_DIN),

	// General Purpose I/O
	.hps_io_hps_io_gpio_inst_GPIO40	(HPS_GPIO[0]),
	.hps_io_hps_io_gpio_inst_GPIO41	(HPS_GPIO[1]),

	// I2C
	.hps_io_hps_io_gpio_inst_GPIO48	(HPS_I2C_CONTROL),
	.hps_io_hps_io_i2c0_inst_SDA		(HPS_I2C1_SDAT),
	.hps_io_hps_io_i2c0_inst_SCL		(HPS_I2C1_SCLK),
	.hps_io_hps_io_i2c1_inst_SDA		(HPS_I2C2_SDAT),
	.hps_io_hps_io_i2c1_inst_SCL		(HPS_I2C2_SCLK),

	// Pushbutton
	.hps_io_hps_io_gpio_inst_GPIO54	(HPS_KEY),

	// LED
	.hps_io_hps_io_gpio_inst_GPIO53	(HPS_LED),

	// SD Card
	.hps_io_hps_io_sdio_inst_CMD	(HPS_SD_CMD),
	.hps_io_hps_io_sdio_inst_D0	(HPS_SD_DATA[0]),
	.hps_io_hps_io_sdio_inst_D1	(HPS_SD_DATA[1]),
	.hps_io_hps_io_sdio_inst_CLK	(HPS_SD_CLK),
	.hps_io_hps_io_sdio_inst_D2	(HPS_SD_DATA[2]),
	.hps_io_hps_io_sdio_inst_D3	(HPS_SD_DATA[3]),

	// SPI
	.hps_io_hps_io_spim1_inst_CLK		(HPS_SPIM_CLK),
	.hps_io_hps_io_spim1_inst_MOSI	(HPS_SPIM_MOSI),
	.hps_io_hps_io_spim1_inst_MISO	(HPS_SPIM_MISO),
	.hps_io_hps_io_spim1_inst_SS0		(HPS_SPIM_SS),

	// UART
	.hps_io_hps_io_uart0_inst_RX	(HPS_UART_RX),
	.hps_io_hps_io_uart0_inst_TX	(HPS_UART_TX),

	// USB
	.hps_io_hps_io_gpio_inst_GPIO09	(HPS_CONV_USB_N),
	.hps_io_hps_io_usb1_inst_D0		(HPS_USB_DATA[0]),
	.hps_io_hps_io_usb1_inst_D1		(HPS_USB_DATA[1]),
	.hps_io_hps_io_usb1_inst_D2		(HPS_USB_DATA[2]),
	.hps_io_hps_io_usb1_inst_D3		(HPS_USB_DATA[3]),
	.hps_io_hps_io_usb1_inst_D4		(HPS_USB_DATA[4]),
	.hps_io_hps_io_usb1_inst_D5		(HPS_USB_DATA[5]),
	.hps_io_hps_io_usb1_inst_D6		(HPS_USB_DATA[6]),
	.hps_io_hps_io_usb1_inst_D7		(HPS_USB_DATA[7]),
	.hps_io_hps_io_usb1_inst_CLK		(HPS_USB_CLKOUT),
	.hps_io_hps_io_usb1_inst_STP		(HPS_USB_STP),
	.hps_io_hps_io_usb1_inst_DIR		(HPS_USB_DIR),
	.hps_io_hps_io_usb1_inst_NXT		(HPS_USB_NXT)
);
endmodule