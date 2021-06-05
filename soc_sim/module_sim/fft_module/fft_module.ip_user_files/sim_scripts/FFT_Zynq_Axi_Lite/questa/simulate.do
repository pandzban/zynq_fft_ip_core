onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FFT_Zynq_Axi_Lite_opt

do {wave.do}

view wave
view structure
view signals

do {FFT_Zynq_Axi_Lite.udo}

run -all

quit -force
