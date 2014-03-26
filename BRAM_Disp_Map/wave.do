onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestBench_v2/reset
add wave -noupdate /TestBench_v2/clka
add wave -noupdate /TestBench_v2/ena
add wave -noupdate /TestBench_v2/addra
add wave -noupdate /TestBench_v2/dina
add wave -noupdate /TestBench_v2/clkb
add wave -noupdate /TestBench_v2/dinb
add wave -noupdate /TestBench_v2/go
add wave -noupdate /TestBench_v2/window
add wave -noupdate /TestBench_v2/done
add wave -noupdate /TestBench_v2/wea
add wave -noupdate -radix unsigned /TestBench_v2/counter
add wave -noupdate -radix unsigned /TestBench_v2/read_counter
add wave -noupdate /glbl/GSR
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
quietly WaveActivateNextPane
add wave -noupdate /TestBench_v2/uut/reset
add wave -noupdate /TestBench_v2/uut/clkb
add wave -noupdate /TestBench_v2/uut/go
add wave -noupdate /TestBench_v2/uut/window
add wave -noupdate /TestBench_v2/uut/done
add wave -noupdate -radix unsigned /TestBench_v2/uut/window_half
add wave -noupdate -radix unsigned /TestBench_v2/uut/pixels_in_window
add wave -noupdate /TestBench_v2/uut/next_state
add wave -noupdate -radix unsigned /TestBench_v2/uut/start_addr
add wave -noupdate /TestBench_v2/uut/enb
add wave -noupdate /TestBench_v2/uut/busy
add wave -noupdate -radix unsigned /TestBench_v2/uut/comp_p_row
add wave -noupdate -radix unsigned /TestBench_v2/uut/comp_p_col
add wave -noupdate /TestBench_v2/uut/curr_state
add wave -noupdate -radix unsigned /TestBench_v2/uut/addrb
add wave -noupdate -radix unsigned /TestBench_v2/uut/doutb
add wave -noupdate -radix unsigned /TestBench_v2/uut/address_counter
add wave -noupdate -radix unsigned /TestBench_v2/uut/address_win_count
add wave -noupdate -radix unsigned /TestBench_v2/uut/counter
add wave -noupdate -radix unsigned /TestBench_v2/uut/win_row_index
add wave -noupdate -radix unsigned /TestBench_v2/uut/win_col_index
add wave -noupdate -radix unsigned /TestBench_v2/uut/win_count
add wave -noupdate -radix unsigned /TestBench_v2/uut/total_num_of_pix
add wave -noupdate -radix unsigned /TestBench_v2/uut/window_sum
add wave -noupdate -radix unsigned /TestBench_v2/uut/lowest_disp
add wave -noupdate -radix hexadecimal -childformat {{{/TestBench_v2/uut/lowest_disp_index[5]} -radix hexadecimal} {{/TestBench_v2/uut/lowest_disp_index[4]} -radix hexadecimal} {{/TestBench_v2/uut/lowest_disp_index[3]} -radix hexadecimal} {{/TestBench_v2/uut/lowest_disp_index[2]} -radix hexadecimal} {{/TestBench_v2/uut/lowest_disp_index[1]} -radix hexadecimal} {{/TestBench_v2/uut/lowest_disp_index[0]} -radix hexadecimal}} -subitemconfig {{/TestBench_v2/uut/lowest_disp_index[5]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/lowest_disp_index[4]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/lowest_disp_index[3]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/lowest_disp_index[2]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/lowest_disp_index[1]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/lowest_disp_index[0]} {-height 15 -radix hexadecimal}} /TestBench_v2/uut/lowest_disp_index
add wave -noupdate /TestBench_v2/uut/wr_en_fifo
add wave -noupdate /TestBench_v2/uut/grayscale_fifo_wr_sel
add wave -noupdate -radix hexadecimal -childformat {{{/TestBench_v2/uut/grayscale_pixels[31]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[30]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[29]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[28]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[27]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[26]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[25]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[24]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[23]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[22]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[21]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[20]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[19]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[18]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[17]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[16]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[15]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[14]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[13]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[12]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[11]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[10]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[9]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[8]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[7]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[6]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[5]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[4]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[3]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[2]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[1]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[0]} -radix hexadecimal}} -subitemconfig {{/TestBench_v2/uut/grayscale_pixels[31]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[30]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[29]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[28]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[27]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[26]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[25]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[24]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[23]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[22]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[21]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[20]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[19]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[18]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[17]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[16]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[15]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[14]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[13]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[12]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[11]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[10]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[9]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[8]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[7]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[6]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[5]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[4]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[3]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[2]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[1]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[0]} {-height 15 -radix hexadecimal}} /TestBench_v2/uut/grayscale_pixels
add wave -noupdate /TestBench_v2/uut/finished_pixel
add wave -noupdate /TestBench_v2/uut/web
add wave -noupdate /TestBench_v2/uut/rst_fifo
add wave -noupdate /TestBench_v2/uut/wr_clk_fifo
add wave -noupdate -radix unsigned /TestBench_v2/uut/din_fifo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99942207 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 234
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
WaveRestoreZoom {99939965 ps} {100003160 ps}
