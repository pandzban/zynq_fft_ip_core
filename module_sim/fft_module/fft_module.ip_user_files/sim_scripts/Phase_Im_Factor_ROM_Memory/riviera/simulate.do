onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Phase_Im_Factor_ROM_Memory -L xilinx_vip -L xil_defaultlib -L xpm -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Phase_Im_Factor_ROM_Memory xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Phase_Im_Factor_ROM_Memory.udo}

run -all

endsim

quit -force
