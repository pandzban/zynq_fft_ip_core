vlib work
vlib activehdl

vlib activehdl/blk_mem_gen_v8_4_2
vlib activehdl/xil_defaultlib

vmap blk_mem_gen_v8_4_2 activehdl/blk_mem_gen_v8_4_2
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work blk_mem_gen_v8_4_2  -v2k5 \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../../../../SDUP/Lab2/cordic_acc/cordic_acc.tmp/cordic_ip_v1_0/blk_mem_gen_0_2/sim/blk_mem_gen_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

