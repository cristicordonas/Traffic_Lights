onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk -radix binary /semafor_test/i_semafor/clk
add wave -noupdate -label rst_n -radix binary /semafor_test/i_semafor/rst_n
add wave -noupdate -label buton -radix binary /semafor_test/i_semafor/buton
add wave -noupdate -label stare_prezenta -radix binary /semafor_test/i_semafor/stare_prezenta
add wave -noupdate -label stare_viitoare -radix binary /semafor_test/i_semafor/stare_viitoare
add wave -noupdate -label counter -radix decimal /semafor_test/i_semafor/counter
add wave -noupdate -label buton_apasat /semafor_test/i_semafor/buton_apasat
add wave -noupdate -color Yellow -label semafor_masini -radix binary /semafor_test/i_semafor/semafor_masini
add wave -noupdate -color Blue -label semafor_pietoni -radix binary /semafor_test/i_semafor/semafor_pietoni
add wave -noupdate -label ok1 -radix binary /semafor_test/i_semafor/ok1
add wave -noupdate -label ok2 -radix binary /semafor_test/i_semafor/ok2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5600 ms} 0}
quietly wave cursor active 1
configure wave -namecolwidth 222
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
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ms} {43600 ms}
