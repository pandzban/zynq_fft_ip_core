onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Phase_Re_Factor_ROM_Memory -L blk_mem_gen_v8_4_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Phase_Re_Factor_ROM_Memory xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Phase_Re_Factor_ROM_Memory.udo}

run -all

endsim

quit -force