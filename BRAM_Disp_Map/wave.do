onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /TestBench/reset
add wave -noupdate -radix unsigned /TestBench/clka
add wave -noupdate -radix unsigned /TestBench/ena
add wave -noupdate -radix unsigned /TestBench/addra
add wave -noupdate -radix unsigned /TestBench/dina
add wave -noupdate -radix unsigned /TestBench/clkb
add wave -noupdate -radix unsigned /TestBench/enb
add wave -noupdate -radix unsigned /TestBench/dinb
add wave -noupdate -radix unsigned /TestBench/go
add wave -noupdate -radix unsigned /TestBench/window
add wave -noupdate -radix unsigned /TestBench/done
add wave -noupdate -radix unsigned /TestBench/wea
add wave -noupdate -radix unsigned /TestBench/counter
add wave -noupdate -radix unsigned /glbl/GSR
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -radix unsigned /TestBench/uut/mybram/clka
add wave -noupdate -radix unsigned /TestBench/uut/mybram/ena
add wave -noupdate -radix unsigned /TestBench/uut/mybram/wea
add wave -noupdate -radix hexadecimal /TestBench/uut/mybram/addra
add wave -noupdate -radix unsigned /TestBench/uut/mybram/dina
add wave -noupdate -radix unsigned /TestBench/uut/mybram/douta
add wave -noupdate -radix unsigned /TestBench/uut/mybram/clkb
add wave -noupdate -radix unsigned /TestBench/uut/mybram/enb
add wave -noupdate -radix unsigned /TestBench/uut/mybram/web
add wave -noupdate -radix unsigned /TestBench/uut/mybram/addrb
add wave -noupdate -radix unsigned /TestBench/uut/mybram/dinb
add wave -noupdate -radix unsigned /TestBench/uut/mybram/doutb
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /TestBench/uut/reset
add wave -noupdate /TestBench/uut/clka
add wave -noupdate /TestBench/uut/ena
add wave -noupdate /TestBench/uut/wea
add wave -noupdate /TestBench/uut/addra
add wave -noupdate /TestBench/uut/dina
add wave -noupdate /TestBench/uut/clkb
add wave -noupdate /TestBench/uut/enb
add wave -noupdate /TestBench/uut/dinb
add wave -noupdate /TestBench/uut/go
add wave -noupdate /TestBench/uut/window
add wave -noupdate /TestBench/uut/done
add wave -noupdate /TestBench/uut/ref_window
add wave -noupdate /TestBench/uut/i
add wave -noupdate /TestBench/uut/curr_state
add wave -noupdate /TestBench/uut/next_state
add wave -noupdate /TestBench/uut/addrb
add wave -noupdate /TestBench/uut/douta
add wave -noupdate /TestBench/uut/doutb
add wave -noupdate /TestBench/uut/start_addr
add wave -noupdate /TestBench/uut/comp_p_row
add wave -noupdate /TestBench/uut/comp_p_col
add wave -noupdate /TestBench/uut/counter
add wave -noupdate /TestBench/uut/win_row_index
add wave -noupdate /TestBench/uut/win_col_index
add wave -noupdate /TestBench/uut/win_count
add wave -noupdate /TestBench/uut/total_num_of_pix
add wave -noupdate /TestBench/uut/window_sum
add wave -noupdate /TestBench/uut/lowest_disp
add wave -noupdate /TestBench/uut/grayscale_pixels
add wave -noupdate /TestBench/uut/finished_pixel
add wave -noupdate /TestBench/uut/web
add wave -noupdate /TestBench/uut/rst_fifo
add wave -noupdate /TestBench/uut/wr_clk_fifo
add wave -noupdate /TestBench/uut/rd_clk_fifo
add wave -noupdate /TestBench/uut/rd_en_fifo
add wave -noupdate /TestBench/uut/full_fifo
add wave -noupdate /TestBench/uut/empty_fifo
add wave -noupdate /TestBench/uut/wr_en_fifo
add wave -noupdate /TestBench/uut/din_fifo
add wave -noupdate /TestBench/uut/dout_fifo
add wave -noupdate /TestBench/uut/rd_data_count_fifo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {695000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1026814 ps}
