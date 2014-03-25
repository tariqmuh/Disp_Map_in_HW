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
input clka,
input ena,
input [3 : 0] wea,
input [31 : 0] addra,
input [31 : 0] dina,
//output [31 : 0] douta,
input clkb,
input enb,
//input [3 : 0] web,
//input [31 : 0] addrb,
input [31 : 0] dinb,

input go,
input [2:0] window,
//output [31 : 0] doutb,
output done
    );

parameter IDLE  = 3'b000, START_3 = 3'b001, START_5 = 3'b010, START_7 = 3'b011,
			 COMP_3 = 3'b100, COMP_5 = 3'b101, COMP_7 = 3'b110, DONE = 3'b111;

/* CONFIGURABLE PARAMETERS*/
parameter NUM_OF_WIN = 64;
parameter TOTAL_NUM_PIXELS = 199076; // (640 - 6) * (320-6)
parameter TOTAL_NUM_ROWS = 640 - 6;
parameter TOTAL_NUM_COLS = 480 - 6;
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

reg [31 : 0] addrb;

wire [31 : 0] douta;
wire [31 : 0] doutb;

reg [31 : 0] start_addr;

reg [11 : 0] comp_p_row;
reg [11 : 0] comp_p_col;

reg [5 : 0] counter; // number index in a window processed

reg [5 : 0] win_row_index; // number of each row index in a window
reg [5 : 0] win_col_index; // number of each column index in a window
reg [5 : 0] win_count; // number of total windows calculated
reg [11 : 0] total_num_of_pix;

reg [11 : 0] window_sum;

reg [11 : 0] lowest_disp;

reg [11 : 0] grayscale_pixels;


reg finished_pixel;

reg [3 : 0] web;


wire rst_fifo, wr_clk_fifo, rd_clk_fifo, rd_en_fifo, full_fifo, empty_fifo;
reg wr_en_fifo;
wire [31 : 0] din_fifo;
wire [31 : 0] dout_fifo;
wire [5 : 0] rd_data_count_fifo;

assign done = finished_pixel;

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

always @(*)
begin : FSM
	case (curr_state)
		IDLE:
			if (go == 1'b1) begin
				case (window)
					3'b011:  next_state = START_3;
					3'b101:  next_state = START_5;
					3'b111:  next_state = START_7;
//					3'b011:  next_state = COMP_3;
//					3'b101:  next_state = COMP_5;
//					3'b111:  next_state = COMP_7;
					default: next_state = IDLE;
				endcase
			end
			else
				next_state = IDLE;
		START_3:
			next_state = COMP_3;
		START_5:
			next_state = COMP_5;
		START_7:
			next_state = COMP_7;
		COMP_3:
			if (win_count == NUM_OF_WIN)
				next_state = DONE;
			else
				next_state = COMP_3;
		COMP_5:
			if (win_count == NUM_OF_WIN)
				next_state = DONE;
			else
				next_state = COMP_5;
		COMP_7:
			if (win_count == NUM_OF_WIN)
				next_state = DONE;
			else
				next_state = COMP_7;
		DONE: begin
			case (window)
				3'b011:  next_state = START_3;
				3'b101:  next_state = START_5;
				3'b111:  next_state = START_7;
//					3'b011:  next_state = COMP_3;
//					3'b101:  next_state = COMP_5;
//					3'b111:  next_state = COMP_7;
				default: next_state = IDLE;
			endcase
		end
		default: next_state = IDLE;
	endcase
end

always @(posedge clkb)
begin
	if (reset) begin
		start_addr 			<= 0;
		curr_state 			<= IDLE;
		counter 				<= 0;
		comp_p_row 			<= 3;
		comp_p_col 			<= 63; // Start 64 pixels over as we search 64 pixels to the left
		win_row_index 		<= 0;
		win_col_index 		<= 0; 
		win_count 			<= 0; 
		total_num_of_pix 	<= 0;
		window_sum 			<= 0;
		lowest_disp 		<= 12'hFFF;
		web <= 0;
	end
	else begin
		finished_pixel <= 0;
		curr_state <= next_state;
		case (curr_state)
			IDLE: begin end
			START_3: begin
				//counter = counter + 1;
				/* [i*TOTAL_NUM_COLS + j] */
				start_addr <= (comp_p_row - (1 - win_row_index)) * TOTAL_NUM_COLS + (comp_p_col - (1 - win_col_index));
				addrb <= start_addr;
			end
			START_5: begin
				//counter = counter + 1;
				start_addr <= (comp_p_row - (2 - win_row_index)) * TOTAL_NUM_COLS + (comp_p_col - (2 - win_col_index));
				addrb <= start_addr;
			end
			START_7: begin
				//counter <= counter + 1;
				start_addr <= ((comp_p_row - (3 - win_row_index)) % 7) * TOTAL_NUM_COLS + (comp_p_col - (3 - win_col_index));
				addrb <= start_addr;
			end
			COMP_3: begin
				if (win_row_index < 2)
					win_row_index <= win_row_index + 1;
				else
					win_row_index <= 0;
				
				if (win_col_index < 2)
					win_col_index <= win_col_index + 1;
				else
					win_col_index <= 0;
				
				counter <= counter + 1;
				start_addr <= (comp_p_row - (1 - win_row_index)) * TOTAL_NUM_COLS + (comp_p_col - (1 - win_col_index));
				
				if (win_col_index == 2 & win_col_index == 2) begin
					win_count <= win_count + 1;
				end
			end
			COMP_5: begin
			end
			COMP_7: begin
				
				if (win_col_index < 6)
					win_col_index <= win_col_index + 1;
				else begin
					win_col_index <= 0;					
					win_row_index <= win_row_index + 1;
				end
					
				start_addr <= ((comp_p_row - (1 - win_row_index)) % 7) * TOTAL_NUM_COLS + (comp_p_col - win_count - (1 - win_col_index));
				
				addrb <= start_addr;
				
				window_sum <= window_sum + (doutb [11 : 0] - ref_window[counter]);
				
				counter <= counter + 1;
				
				if (counter == 49) begin
					win_count <= win_count + 1;
					lowest_disp <= (lowest_disp < window_sum) ? lowest_disp : window_sum;
					//counter = 0;
					wr_en_fifo <= 1;
					grayscale_pixels <= lowest_disp;
				end
			end
			DONE: begin
				total_num_of_pix <= total_num_of_pix + 1;
				window_sum <= 0;
				counter <= 0;
				win_count <= 0;
				lowest_disp <= 'hFFF;
				if (comp_p_col < TOTAL_NUM_COLS)
					comp_p_col <= comp_p_col + 1;
				else begin
					comp_p_col <= 63;					
					comp_p_row <= comp_p_row + 1;
				end
				if(total_num_of_pix == TOTAL_NUM_PIXELS) begin
					comp_p_col <= 63;					
					comp_p_row <= 3;
				end
					
				finished_pixel <= 1;
			end
			
			default: next_state = IDLE;
		endcase
	end
end 


assign rst_fifo = reset;

assign din_fifo = grayscale_pixels;

assign wr_clk_fifo = clkb;

grayscale_pixel_FIFO grascale_fifo (
  .rst(rst_fifo), // input rst
  .wr_clk(wr_clk_fifo), // input wr_clk
  .rd_clk(rd_clk_fifo), // input rd_clk
  .din(din_fifo), // input [31 : 0] din
  .wr_en(wr_en_fifo), // input wr_en
  .rd_en(rd_en_fifo), // input rd_en
  .dout(dout_fifo), // output [31 : 0] dout
  .full(full_fifo), // output full
  .empty(empty_fifo), // output empty
  .rd_data_count(rd_data_count_fifo) // output [5 : 0] rd_data_count
);

endmodule
