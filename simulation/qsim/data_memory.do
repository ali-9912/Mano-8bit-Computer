onerror {quit -f}
vlib work
vlog -work work data_memory.vo
vlog -work work data_memory.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.data_memory_vlg_vec_tst
vcd file -direction data_memory.msim.vcd
vcd add -internal data_memory_vlg_vec_tst/*
vcd add -internal data_memory_vlg_vec_tst/i1/*
add wave /*
run -all
