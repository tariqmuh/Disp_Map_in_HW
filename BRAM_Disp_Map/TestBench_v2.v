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
	reg busy;
	wire [31:0] doutb;
	
	
	reg [31:0] dinb;

	// Outputs
	wire enb;
	wire [3:0] web;
	wire [31:0] addrb;
	wire done;
	wire [31:0] din_fifo;
	wire wr_en_fifo;
	
	reg clka;
	reg [3:0] wea;
	reg [31:0] addra;
	wire [31:0] douta;
	reg [31:0] dina;
	reg ena;
	
	reg [31:0] counter;
	reg [31:0] read_counter;

	// Instantiate the Unit Under Test (UUT)
	bram_dm uut (
		.reset(reset), 
		.clkb(clkb), 
		.enb(enb), 
		.web(web), 
		.addrb(addrb), 
		.go(go), 
		.window(window), 
		.busy(busy), 
		.doutb(doutb), 
		.done(done),
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
		//enb = 0;
		//addrb = 0;
		dinb = 0;
		go = 0;
		window = 3;
		busy = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
	//	enb = 1;
		ena = 1;
		busy = 0;
	end
	
	//reg [24 : 0] num_pixel_count;
	
	always #5 clka = ~clka;
	always #5 clkb = ~clkb;
   
	always @(posedge clka)
	begin
		if(reset) begin
			counter <= #1 0;
			read_counter <= #1 0;
			wea <= #1 'b0000;
			addra <= #1 -1;
			wea <= #2 'b1111;
		end
		else begin
			dina <= #1 1;
			counter <= #1 counter + 1;
			wea <= #1 15;
			addra <= #1 counter;
			
			if (addra == 252)
				dina <= #1 'hDEADBEEF;
			
			if (counter == 640 * 7) begin
				ena <= #1 0;
				go <= #1 1;
				counter <= #1 counter;
			end
			
//			if (counter == 640 * 7) begin
//				wea <= #1 0;
//				read_counter <= read_counter + 1;
//				addra <= #1 read_counter;
////				addra <= #1 252;
//				if (read_counter == 640 * 7) begin
//					ena <= #1 0;
//					go <= #1 1;
//					read_counter<= #1 read_counter;
//				end
//			end			
		end
	end
	
bram mybram (
  .clka(clka), // input clka
  .ena(ena), // input ena
  .wea(wea), // input [3 : 0] wea
  .addra(addra), // input [31 : 0] addra
  .dina(dina), // input [31 : 0] dina
  .douta(douta), // output [31 : 0] douta
  .clkb(clkb), // input clkb
  .enb(enb), // input enb
  .web(web), // input [3 : 0] web
  .addrb(addrb), // input [31 : 0] addrb
  .dinb(dinb), // input [31 : 0] dinb
  .doutb(doutb) // output [31 : 0] doutb
);
     
endmodule

