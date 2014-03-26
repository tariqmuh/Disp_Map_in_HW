`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:01:54 03/11/2014 
// Design Name: 
// Module Name:    bram_dm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bram_dm(
input reset,
input clkb,
output reg enb,
output reg [3 : 0] web,
output [31 : 0] addrb,

// Reference Frame
output reg en_ref,
output reg [3 : 0] we_ref,
output reg [31 : 0] addr_ref,
input [31 : 0] dout_ref,

input go,
input [2:0] window,
input busy,
input [31 : 0] doutb,
output done,
output [31 : 0] din_fifo,
output reg wr_en_fifo
    );

parameter IDLE  = 3'b000, START = 3'b001, COMP = 3'b010, DONE = 3'b011, BUSY = 3'b100;

/* CONFIGURABLE PARAMETERS*/
parameter NUM_OF_WIN = 64;
parameter VRES = 480;
parameter HRES = 640;
parameter TOTAL_NUM_PIXELS = (VRES - 6) * (HRES - 6); // (640 - 6) * (320-6)
parameter TOTAL_NUM_ROWS = VRES - 6;
parameter TOTAL_NUM_COLS = HRES - 6;
/**************************/

reg [8:0] ref_window [0:49];
integer i;
initial begin
	
 	for (i = 0; i < 49; i = i +1) begin
  	  	//$display ("Current value of i is %d", i);
		ref_window [i] = i;
  	end
end

reg [2:0] curr_state;
reg [2:0] next_state;
reg [2:0] saved_state;

//wire [31 : 0] addrb;

//wire [31 : 0] doutb;

reg [31 : 0] start_addr;

reg [11 : 0] comp_p_row;
reg [11 : 0] comp_p_col;

reg [5 : 0] counter; // number of pixels in a window processed

reg [5 : 0] address_counter; // number of pixels an address has been generated for
reg [6 : 0] address_win_count; // number of total window addresses calculated

reg [5 : 0] win_row_index; // number of each row index in a window
reg [5 : 0] win_col_index; // number of each column index in a window
reg [6 : 0] win_count; // number of total windows calculated
reg [11 : 0] total_num_of_pix;

reg [11 : 0] window_sum;

reg [11 : 0] lowest_disp;
reg [5 : 0] lowest_disp_index;

reg [31 : 0] grayscale_pixels;
reg grayscale_fifo_wr_sel;

wire [2:0] window_half;
wire [5 : 0] pixels_in_window;

assign window_half = window >> 1; 
assign pixels_in_window = window * window;

reg finished_pixel;

//reg [3 : 0] web;

//reg enb;
//wire rst_fifo, wr_clk_fifo, rd_clk_fifo, rd_en_fifo, full_fifo, empty_fifo;
//output reg wr_en_fifo;
//wire [31 : 0] din_fifo;
//wire [31 : 0] dout_fifo;
//wire [5 : 0] rd_data_count_fifo;

assign done = finished_pixel;


always @(*)
begin : FSM
	case (curr_state)
	
		IDLE:
			if (go == 1'b1) begin
				if(~busy)
					next_state = START;
				else
					next_state = BUSY;
				saved_state = curr_state;
			end
			else begin
				next_state = IDLE;
			end
			
		START:
			if (~busy) begin
				next_state = COMP;
			end
			else begin
				next_state = BUSY;
				saved_state = COMP;
			end
			
		COMP:
			if(~busy) begin
				if (win_count == (NUM_OF_WIN))
					next_state = DONE;
				else
					next_state = COMP;
			end
			else begin
				next_state = BUSY;
				if (win_count == (NUM_OF_WIN))
					saved_state = DONE;
				else
					saved_state  = COMP;
			end
			
		DONE:
			if (~busy) begin
				next_state = START;
			end
			else begin
				next_state = BUSY;
				saved_state = START;
			end
		
		BUSY:
			if (busy)
				next_state = BUSY;
			else
				next_state = saved_state;
		
		default: next_state = IDLE;
	endcase
end

always @(posedge clkb)
begin
	if (reset) begin
		start_addr 					<= 0;
		curr_state 					<= IDLE;
		counter 						<= 0;
		comp_p_row 					<= 3;
		comp_p_col 					<= 63; // Start 64 pixels over as we search 64 pixels to the left
		win_row_index 				<= 0;
		win_col_index 				<= 0; 
		win_count 					<= 0; 
		total_num_of_pix 			<= 0;
		window_sum 					<= 0;
		lowest_disp 				<= 12'hFFF; // highest value
		lowest_disp_index			<= 63;		// highest value
		web 							<= 0;
		enb 							<= 0;
		grayscale_fifo_wr_sel	<= 0;
		address_counter			<= 1;
		address_win_count			<= 0;
		grayscale_pixels			<= 0;
		
		en_ref						<= 0;
		we_ref						<= 0;
		addr_ref						<= 0;
	end
	else begin
		curr_state <= #2 next_state;
		
		/* default values */
		finished_pixel 			<= 0;
		enb 							<= 0;
		start_addr 					<= start_addr;
		counter 						<= counter;
		comp_p_row 					<= comp_p_row;
		comp_p_col 					<= comp_p_col;
		win_row_index 				<= win_row_index;
		win_col_index 				<= win_col_index; 
		win_count 					<= win_count; 
		total_num_of_pix 			<= total_num_of_pix;
		window_sum 					<= window_sum;
		lowest_disp 				<= lowest_disp;
		lowest_disp_index			<= lowest_disp_index;
		grayscale_fifo_wr_sel	<= grayscale_fifo_wr_sel;
		wr_en_fifo					<= 0;
		address_win_count			<= address_win_count;
		address_counter			<= address_counter;
		grayscale_pixels			<= grayscale_pixels;
		
		en_ref						<= 0;
		we_ref						<= 0;
		addr_ref						<= 0;
	
		case (curr_state)
			IDLE: begin 
				start_addr <= #2 ((comp_p_row - (window_half - win_row_index)) % 7) * HRES + (comp_p_col - address_win_count - (window_half - win_col_index));
				addr_ref <= #2 ((comp_p_row - (window_half - win_row_index)) % 7) * HRES + (comp_p_col - (window_half - win_col_index));
				if (go) begin
					enb <= #2 1;
					en_ref <= #2 1;
					win_col_index <= #2 win_col_index + 1'b1;
					address_counter <= #2 address_counter + 1'b1;
					
				end
			end
			START: begin
				start_addr <= #2 ((comp_p_row - (window_half - win_row_index)) % 7) * HRES + (comp_p_col - address_win_count - (window_half - win_col_index));
				addr_ref <= #2 ((comp_p_row - (window_half - win_row_index)) % 7) * HRES + (comp_p_col - (window_half - win_col_index));
				address_counter <= #2 address_counter + 1'b1;
				enb <= #2 1;
				en_ref <= #2 1;
				win_col_index <= #2 win_col_index + 1'b1;
				//counter <= #2 counter + 1;
			end
			COMP: begin
			
				if (address_win_count == NUM_OF_WIN) begin
					enb <= #2 0;
					en_ref <= #2 0;
				end
				else begin
					enb <= #2 1;
					en_ref <= #2 1;
				end
				
				start_addr <= #2 ((comp_p_row - (window_half - win_row_index)) % 7) * HRES + (comp_p_col - address_win_count - (window_half - win_col_index));
				addr_ref <= #2 ((comp_p_row - (window_half - win_row_index)) % 7) * HRES + (comp_p_col - (window_half - win_col_index));
				

				// Increment window indexes
				// If the address for all pixels in a window have been calculated
				//		- increment address_win_count (affects address)
				//		- reset pixel position in window
				//		- reset pixel counter for window (for address calculation)
				if (address_counter == pixels_in_window) begin
					win_col_index <= #2 0;
					win_row_index <= #2 0;
					address_win_count <= #2 address_win_count + 1'b1;
					address_counter <= #2 1;
				end
				else begin
					if (win_col_index < (window - 1) )
						win_col_index <= #2 win_col_index + 1'b1;
					else begin
						win_col_index <= #2 0;					
						win_row_index <= #2 win_row_index + 1'b1;
					end
					address_counter <= #2 address_counter + 1'b1;
				end
				
					
				// Accumulate window sum (absolute difference)
				// Hack as there are two pipeline stages
				// Note: the address is 2 clocks ahead of the sum -- CONFIRM THIS
				if (counter == pixels_in_window) begin
//					if (doutb [11 : 0] > ref_window[counter])
					if (doutb [11 : 0] > dout_ref [11 : 0])
//						window_sum <= #2 (doutb [11 : 0] - ref_window[counter]);
						window_sum <= #2 (doutb [11 : 0] - dout_ref [11 : 0]);
					else
						window_sum <= #2 (dout_ref [11 : 0] - doutb [11 : 0]);
//						window_sum <= #2 (ref_window[counter] - doutb [11 : 0]);
				end
				else begin
					if (doutb [11 : 0] > dout_ref [11 : 0])
//					if (doutb [11 : 0] > ref_window[counter])
						window_sum <= #2 window_sum + (doutb [11 : 0] - dout_ref [11 : 0]);
//						window_sum <= #2 window_sum + (doutb [11 : 0] - ref_window[counter]);
					else
						window_sum <= #2 window_sum + (dout_ref [11 : 0] - doutb [11 : 0]);
//						window_sum <= #2 window_sum + (ref_window[counter] - doutb [11 : 0]);
				end
				
				// Counter for each pixel in a window
				if (counter == pixels_in_window) 
					counter <= #2 1;
				else
					counter <= #2 counter + 1'b1;
					
				// If window has been calculated, 
				// increase window_count and check if it a lower sum
				if (counter == pixels_in_window) begin
					win_count <= #2 win_count + 1'b1;
					if (lowest_disp > window_sum) begin
						lowest_disp <= #2 window_sum;
						lowest_disp_index <= #2 win_count ;
					end
				end
			end
			DONE: begin
				// Enable Write to FIFO
				wr_en_fifo <= #2 grayscale_fifo_wr_sel;
				
				// Should alternate writes to upper and lower half word
				if (~grayscale_fifo_wr_sel) begin
					grayscale_pixels [15:11] <= #2 lowest_disp_index [5:1];
					grayscale_pixels [10:5] <= #2 lowest_disp_index;
					grayscale_pixels [4:0] <= #2 lowest_disp_index [5:1];
				end
				else begin
					grayscale_pixels [31:27] <= #2 lowest_disp_index [5:1];
					grayscale_pixels [26:21] <= #2 lowest_disp_index;
					grayscale_pixels [20:16] <= #2 lowest_disp_index [5:1];
				end
				
				grayscale_fifo_wr_sel <= #2 ~grayscale_fifo_wr_sel;
				
				enb <= #2 1;
				en_ref <= #2 1;
				
				// Increase total_num_pix calculated
				// Reset variables: window_sum, counter,  
				total_num_of_pix <= #2 total_num_of_pix + 1'b1;
				window_sum <= #2 0;
				counter <= #2 0;
				win_count <= #2 0;
				lowest_disp <= #2 'hFFF;
				lowest_disp_index <= #2 63;
				address_counter			<= 1;
				address_win_count			<= 0;
				
				if (comp_p_col < TOTAL_NUM_COLS)
					comp_p_col <= #2 comp_p_col + 1'b1;
				else begin
					comp_p_col <= #2 63;					
					comp_p_row <= #2 comp_p_row + 1'b1;
				end
				
				// Start over if finished frame
//				if(total_num_of_pix == TOTAL_NUM_PIXELS) begin
//					comp_p_col <= #2 63;					
//					comp_p_row <= #2 3;
//				end
				if (comp_p_col == (HRES - 3))
					comp_p_col <= #2 63;
				if (comp_p_row == (VRES - 3))
					comp_p_row <= #2 3;
				
				// inform that a pixel is finished
				finished_pixel <= #2 1;
			end
			
			default: curr_state <= IDLE;
		endcase
	end
end 

assign addrb = start_addr;

assign rst_fifo = reset;

assign din_fifo = grayscale_pixels;

assign wr_clk_fifo = clkb;

//grayscale_pixel_FIFO grascale_fifo (
//  .rst(rst_fifo), // input rst
//  .wr_clk(wr_clk_fifo), // input wr_clk
//  .rd_clk(rd_clk_fifo), // input rd_clk
//  .din(din_fifo), // input [31 : 0] din
//  .wr_en(wr_en_fifo), // input wr_en
//  .rd_en(rd_en_fifo), // input rd_en
//  .dout(dout_fifo), // output [31 : 0] dout
//  .full(full_fifo), // output full
//  .empty(empty_fifo), // output empty
//  .rd_data_count(rd_data_count_fifo) // output [5 : 0] rd_data_count
//);

endmodule
