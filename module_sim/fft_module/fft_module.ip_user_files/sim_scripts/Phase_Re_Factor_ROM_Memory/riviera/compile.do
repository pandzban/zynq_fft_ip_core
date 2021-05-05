vlib work
vlib riviera

vlib riviera/blk_mem_gen_v8_4_2
vlib riviera/xil_defaultlib

vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work blk_mem_gen_v8_4_2  -v2k5 \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../fft_module.srcs/Phase_Re_Factor_ROM_Memory/ip/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \


vlog -work xil_defaultlib \
"glbl.v"

