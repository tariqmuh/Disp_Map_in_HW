onerror {resume}
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[31], /TestBench_v2/uut/grayscale_pixels[30], /TestBench_v2/uut/grayscale_pixels[29], /TestBench_v2/uut/grayscale_pixels[28], /TestBench_v2/uut/grayscale_pixels[27], /TestBench_v2/uut/grayscale_pixels[26], /TestBench_v2/uut/grayscale_pixels[25], /TestBench_v2/uut/grayscale_pixels[24], /TestBench_v2/uut/grayscale_pixels[23], /TestBench_v2/uut/grayscale_pixels[22], /TestBench_v2/uut/grayscale_pixels[21], /TestBench_v2/uut/grayscale_pixels[20], /TestBench_v2/uut/grayscale_pixels[19], /TestBench_v2/uut/grayscale_pixels[18], /TestBench_v2/uut/grayscale_pixels[17], /TestBench_v2/uut/grayscale_pixels[16] }} High_Pixel
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[15], /TestBench_v2/uut/grayscale_pixels[14], /TestBench_v2/uut/grayscale_pixels[13], /TestBench_v2/uut/grayscale_pixels[12], /TestBench_v2/uut/grayscale_pixels[11], /TestBench_v2/uut/grayscale_pixels[10], /TestBench_v2/uut/grayscale_pixels[9], /TestBench_v2/uut/grayscale_pixels[8], /TestBench_v2/uut/grayscale_pixels[7], /TestBench_v2/uut/grayscale_pixels[6], /TestBench_v2/uut/grayscale_pixels[5], /TestBench_v2/uut/grayscale_pixels[4], /TestBench_v2/uut/grayscale_pixels[3], /TestBench_v2/uut/grayscale_pixels[2], /TestBench_v2/uut/grayscale_pixels[1], /TestBench_v2/uut/grayscale_pixels[0] }} Low_Pixel
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[15], /TestBench_v2/uut/grayscale_pixels[14], /TestBench_v2/uut/grayscale_pixels[13], /TestBench_v2/uut/grayscale_pixels[12], /TestBench_v2/uut/grayscale_pixels[11] }} Low_Red
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[10], /TestBench_v2/uut/grayscale_pixels[9], /TestBench_v2/uut/grayscale_pixels[8], /TestBench_v2/uut/grayscale_pixels[7], /TestBench_v2/uut/grayscale_pixels[6], /TestBench_v2/uut/grayscale_pixels[5] }} Low_Green
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[4], /TestBench_v2/uut/grayscale_pixels[3], /TestBench_v2/uut/grayscale_pixels[2], /TestBench_v2/uut/grayscale_pixels[1], /TestBench_v2/uut/grayscale_pixels[0] }} Low_Bluw
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/Low_Red, /TestBench_v2/uut/Low_Green, /TestBench_v2/uut/Low_Bluw }} Low
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[31], /TestBench_v2/uut/grayscale_pixels[30], /TestBench_v2/uut/grayscale_pixels[29], /TestBench_v2/uut/grayscale_pixels[28], /TestBench_v2/uut/grayscale_pixels[27] }} High_Red
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[26], /TestBench_v2/uut/grayscale_pixels[25], /TestBench_v2/uut/grayscale_pixels[24], /TestBench_v2/uut/grayscale_pixels[23], /TestBench_v2/uut/grayscale_pixels[22], /TestBench_v2/uut/grayscale_pixels[21] }} High_Green
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/grayscale_pixels[20], /TestBench_v2/uut/grayscale_pixels[19], /TestBench_v2/uut/grayscale_pixels[18], /TestBench_v2/uut/grayscale_pixels[17], /TestBench_v2/uut/grayscale_pixels[16] }} High_Blue
quietly virtual function -install /TestBench_v2/uut -env /TestBench_v2 { &{/TestBench_v2/uut/High_Red, /TestBench_v2/uut/High_Green, /TestBench_v2/uut/High_Blue }} High_Pixel001
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestBench_v2/reset
add wave -noupdate /TestBench_v2/clkb
add wave -noupdate /TestBench_v2/go
add wave -noupdate /TestBench_v2/window
add wave -noupdate /TestBench_v2/busy_ref
add wave -noupdate /TestBench_v2/dinb
add wave -noupdate /TestBench_v2/busy_search
add wave -noupdate /TestBench_v2/en_search
add wave -noupdate /TestBench_v2/we_search
add wave -noupdate /TestBench_v2/addr_search
add wave -noupdate /TestBench_v2/dout_search
add wave -noupdate /TestBench_v2/done
add wave -noupdate /TestBench_v2/din_fifo
add wave -noupdate /TestBench_v2/wr_en_fifo
add wave -noupdate /TestBench_v2/en_ref
add wave -noupdate /TestBench_v2/we_ref
add wave -noupdate /TestBench_v2/addr_ref
add wave -noupdate /TestBench_v2/dout_ref
add wave -noupdate /TestBench_v2/clka
add wave -noupdate /TestBench_v2/wea
add wave -noupdate /TestBench_v2/addra
add wave -noupdate /TestBench_v2/douta
add wave -noupdate /TestBench_v2/douta_ref
add wave -noupdate /TestBench_v2/dina
add wave -noupdate /TestBench_v2/dina_ref
add wave -noupdate /TestBench_v2/ena
add wave -noupdate /TestBench_v2/counter
add wave -noupdate /TestBench_v2/read_counter
add wave -noupdate /glbl/GSR
add wave -noupdate /TestBench_v2/reset
add wave -noupdate /TestBench_v2/clkb
add wave -noupdate /TestBench_v2/go
add wave -noupdate /TestBench_v2/window
add wave -noupdate /TestBench_v2/busy_ref
add wave -noupdate -radix unsigned /TestBench_v2/dinb
add wave -noupdate /TestBench_v2/busy_search
add wave -noupdate /TestBench_v2/en_search
add wave -noupdate /TestBench_v2/we_search
add wave -noupdate -radix unsigned /TestBench_v2/addr_search
add wave -noupdate -radix unsigned /TestBench_v2/dout_search
add wave -noupdate /TestBench_v2/done
add wave -noupdate -radix unsigned /TestBench_v2/din_fifo
add wave -noupdate /TestBench_v2/wr_en_fifo
add wave -noupdate /TestBench_v2/en_ref
add wave -noupdate /TestBench_v2/we_ref
add wave -noupdate -radix unsigned /TestBench_v2/addr_ref
add wave -noupdate -radix unsigned /TestBench_v2/dout_ref
add wave -noupdate /TestBench_v2/clka
add wave -noupdate /TestBench_v2/wea
add wave -noupdate -radix unsigned /TestBench_v2/addra
add wave -noupdate -radix unsigned /TestBench_v2/douta
add wave -noupdate -radix unsigned /TestBench_v2/douta_ref
add wave -noupdate -radix unsigned /TestBench_v2/dina
add wave -noupdate /TestBench_v2/ena
add wave -noupdate -radix unsigned /TestBench_v2/counter
add wave -noupdate -radix unsigned /TestBench_v2/read_counter
add wave -noupdate /glbl/GSR
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /TestBench_v2/uut/reset
add wave -noupdate /TestBench_v2/uut/busy_ref
add wave -noupdate /TestBench_v2/uut/busy_search
add wave -noupdate /TestBench_v2/uut/clk
add wave -noupdate /TestBench_v2/uut/en_search
add wave -noupdate /TestBench_v2/uut/we_search
add wave -noupdate -radix unsigned /TestBench_v2/uut/addr_search
add wave -noupdate -radix unsigned /TestBench_v2/uut/dout_search
add wave -noupdate /TestBench_v2/uut/en_ref
add wave -noupdate /TestBench_v2/uut/we_ref
add wave -noupdate -radix unsigned /TestBench_v2/uut/addr_ref
add wave -noupdate -radix unsigned /TestBench_v2/uut/dout_ref
add wave -noupdate /TestBench_v2/uut/go
add wave -noupdate -radix hexadecimal /TestBench_v2/uut/din_fifo
add wave -noupdate /TestBench_v2/uut/wr_en_fifo
add wave -noupdate /TestBench_v2/uut/curr_state
add wave -noupdate /TestBench_v2/uut/next_state
add wave -noupdate /TestBench_v2/uut/saved_state
add wave -noupdate -radix unsigned /TestBench_v2/uut/start_addr
add wave -noupdate -radix unsigned /TestBench_v2/uut/comp_p_row
add wave -noupdate -radix unsigned /TestBench_v2/uut/comp_p_col
add wave -noupdate -radix unsigned /TestBench_v2/uut/counter
add wave -noupdate -radix unsigned /TestBench_v2/uut/address_counter
add wave -noupdate -radix unsigned /TestBench_v2/uut/address_win_count
add wave -noupdate -radix unsigned /TestBench_v2/uut/win_row_index
add wave -noupdate -radix unsigned /TestBench_v2/uut/win_col_index
add wave -noupdate -radix unsigned /TestBench_v2/uut/win_count
add wave -noupdate -radix unsigned /TestBench_v2/uut/window_sum
add wave -noupdate -radix unsigned /TestBench_v2/uut/lowest_disp
add wave -noupdate -radix unsigned /TestBench_v2/uut/lowest_disp_index
add wave -noupdate -label {High_Pixel
} -expand /TestBench_v2/uut/High_Pixel001
add wave -noupdate -label Low_Pixel -expand /TestBench_v2/uut/Low
add wave -noupdate -radix hexadecimal -childformat {{{/TestBench_v2/uut/grayscale_pixels[31]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[30]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[29]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[28]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[27]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[26]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[25]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[24]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[23]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[22]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[21]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[20]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[19]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[18]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[17]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[16]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[15]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[14]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[13]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[12]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[11]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[10]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[9]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[8]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[7]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[6]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[5]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[4]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[3]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[2]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[1]} -radix hexadecimal} {{/TestBench_v2/uut/grayscale_pixels[0]} -radix hexadecimal}} -subitemconfig {{/TestBench_v2/uut/grayscale_pixels[31]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[30]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[29]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[28]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[27]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[26]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[25]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[24]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[23]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[22]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[21]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[20]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[19]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[18]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[17]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[16]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[15]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[14]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[13]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[12]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[11]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[10]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[9]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[8]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[7]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[6]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[5]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[4]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[3]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[2]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[1]} {-height 15 -radix hexadecimal} {/TestBench_v2/uut/grayscale_pixels[0]} {-height 15 -radix hexadecimal}} /TestBench_v2/uut/grayscale_pixels
add wave -noupdate /TestBench_v2/uut/grayscale_fifo_wr_sel
add wave -noupdate -radix unsigned /TestBench_v2/uut/window_half
add wave -noupdate -radix unsigned /TestBench_v2/uut/pixels_in_window
add wave -noupdate /TestBench_v2/uut/finished_row
add wave -noupdate /TestBench_v2/uut/busy
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4287000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 234
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {109754466 ps} {110012923 ps}
