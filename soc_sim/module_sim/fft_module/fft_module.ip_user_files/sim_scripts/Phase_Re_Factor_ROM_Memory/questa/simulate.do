onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Phase_Re_Factor_ROM_Memory_opt

do {wave.do}

view wave
view structure
view signals

do {Phase_Re_Factor_ROM_Memory.udo}

run -all

quit -force
