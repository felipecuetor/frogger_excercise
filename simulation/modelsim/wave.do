onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /System_vlg_tst/eachvec
add wave -noupdate /System_vlg_tst/ii
add wave -noupdate /System_vlg_tst/B_Down
add wave -noupdate /System_vlg_tst/B_Left
add wave -noupdate /System_vlg_tst/B_Rigth
add wave -noupdate /System_vlg_tst/B_Up
add wave -noupdate /System_vlg_tst/CLOCK_50
add wave -noupdate /System_vlg_tst/RESET
add wave -noupdate /System_vlg_tst/Start
add wave -noupdate /System_vlg_tst/LED
add wave -noupdate /System_vlg_tst/MAX7219_CLK
add wave -noupdate /System_vlg_tst/MAX7219_CS
add wave -noupdate /System_vlg_tst/MAX7219_DIN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6991597 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 148
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {100758336 ps}
