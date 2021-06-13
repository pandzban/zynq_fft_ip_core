onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FFT_Butterfly_Microblaze_opt

do {wave.do}

view wave
view structure
view signals

do {FFT_Butterfly_Microblaze.udo}

run -all

quit -force
