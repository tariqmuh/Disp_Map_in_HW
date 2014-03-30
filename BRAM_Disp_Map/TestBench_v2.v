`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:09:01 03/26/2014
// Design Name:   bram_dm
// Module Name:   C:/Users/tariqmuh/Documents/GitHub/Disp_Map_in_HW/BRAM_Disp_Map/TestBench_v2.v
// Project Name:  BRAM_Disp_Map
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bram_dm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench_v2;

	// Inputs
	reg reset;
	reg clkb;
	reg go;
	reg [2:0] window;
	
	reg busy_ref;

	reg [15:0] dinb;

	// Outputs
	reg busy_search;
	wire en_search;
	wire [0:0] we_search;
	wire [12:0] addr_search;
	wire [15:0] dout_search;
	
	
	wire done;
	wire [31:0] din_fifo;
	wire wr_en_fifo;
	
	wire en_ref;
	wire [0:0] we_ref;
	wire [12:0] addr_ref;	
	wire [15:0] dout_ref;
	
	reg clka;
	reg [0:0] wea;
	reg [12:0] addra;
	wire [15:0] douta;
	wire [15:0] douta_ref;
	reg [15:0] dina;
	reg [15:0] dina_ref;
	reg ena;
	
	reg [12:0] counter;
	reg [12:0] read_counter;

	// Instantiate the Unit Under Test (UUT)
	Disp_Map_Calc 
	#(
	.window(3),
	.NUM_OF_ROWS_IN_BRAM(8),
//	.ROWS_TO_OPERATE(13),
	.NUM_OF_WIN(64),
	.VRES(480),
	.HRES(640),
	.BRAM_DATA_WIDTH(16),
	.BRAM_ADDR_WIDTH(13),
	.BRAM_WE_WIDTH(1)
	)
	
	uut (
		.reset(reset), 
		.clk(clkb), 
		.en_search(en_search), 
		.we_search(we_search), 
		.addr_search(addr_search),
		.dout_search(dout_search), 
		
		.en_ref(en_ref),
		.we_ref(we_ref),
		.addr_ref(addr_ref),
		.dout_ref(dout_ref),
		
		.go(go), 
		.busy_ref(busy_ref), 
		.busy_search(busy_search), 
		.finished_row(done),
		
		.wr_en_fifo(wr_en_fifo),
		.din_fifo(din_fifo)
	);

	initial begin
	
		// Initialize Inputs
		reset = 1;
		clka = 0;
		ena = 0;
		addra = 0;
		dina = 0;
		clkb = 0;
		//en_search = 0;
		//addr_search = 0;
		dinb = 0;
		go = 0;
		window = 3;
		busy_search = 1;
		busy_ref = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
	//	en_search = 1;
		ena = 1;
		busy_search = 0;
		busy_ref = 0;
	end
	
	always #5 clka = ~clka;
	always #5 clkb = ~clkb;
   
	always @(posedge clka)
	begin
		if(reset) begin
			counter <= #1 0;
			read_counter <= #1 0;
			addra <= #1 -1;
			wea <= #2 'b1;
		end
		else begin
//			dina <= #1 counter;
			dina <= #1 {$random} % 10;
			dina_ref <= #1 {$random} % 10;
			counter <= #1 counter + 1;
			wea <= #1 1;
			addra <= #1 counter;
			
			if (counter == 640*8) begin
				wea <= #1 0;
				ena <= #1 0;
				go <= #1 1;
				counter <= #1 counter;
			end
			
//			if (counter == 640*8) begin
//				wea <= #1 0;
//				read_counter <= read_counter + 1;
//				addra <= #1 read_counter;
////				addra <= #1 252;
//				if (read_counter == 640*8) begin
//					ena <= #1 0;
//					go <= #1 1;
//					read_counter<= #1 read_counter;
//				end
//			end			
		end
	end
	
bram 	search_bram (
  .clka(clka), // input clka
  .ena(ena), // input ena
  .wea(wea), // input [3 : 0] wea
  .addra(addra), // input [31 : 0] addra
  .dina(dina), // input [31 : 0] dina
  .douta(douta), // output [31 : 0] douta
  .clkb(clkb), // input clkb
  .enb(en_search), // input en_search
  .web(we_search), // input [3 : 0] we_search
  .addrb(addr_search), // input [31 : 0] addr_search
  .dinb(dinb), // input [31 : 0] dinb
  .doutb(dout_search) // output [31 : 0] dout_search
);

bram 	ref_bram(
  .clka(clka), // input clka
  .ena(ena), // input ena
  .wea(wea), // input [3 : 0] wea
  .addra(addra), // input [31 : 0] addra
  .dina(dina_ref), // input [31 : 0] dina
  .douta(douta_ref), // output [31 : 0] douta
  .clkb(clkb), // input clkb
  .enb(en_ref), // input en_search
  .web(we_ref), // input [3 : 0] we_search
  .addrb(addr_ref), // input [31 : 0] addr_search
  .dinb(dinb), // input [31 : 0] dinb
  .doutb(dout_ref) // output [31 : 0] dout_search
);
endmodule

