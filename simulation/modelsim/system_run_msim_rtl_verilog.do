transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise/rtl/imagen {C:/Users/Felipe/git/frogger_excercise/rtl/imagen/PINTAR_MATRIZ.v}
vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise/rtl/imagen {C:/Users/Felipe/git/frogger_excercise/rtl/imagen/PINTAR_DATA_DEMUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise/rtl/imagen {C:/Users/Felipe/git/frogger_excercise/rtl/imagen/imagen.v}
vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise/rtl/max7219_ctrl {C:/Users/Felipe/git/frogger_excercise/rtl/max7219_ctrl/shift_reg_start_done.v}
vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise/rtl/max7219_ctrl {C:/Users/Felipe/git/frogger_excercise/rtl/max7219_ctrl/matrix_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise {C:/Users/Felipe/git/frogger_excercise/System.v}

vlog -vlog01compat -work work +incdir+C:/Users/Felipe/git/frogger_excercise/simulation/modelsim {C:/Users/Felipe/git/frogger_excercise/simulation/modelsim/system.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  System_vlg_tst

add wave *
view structure
view signals
run -all
