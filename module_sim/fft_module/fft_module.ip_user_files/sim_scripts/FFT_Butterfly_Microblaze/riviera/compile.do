vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/blk_mem_gen_v8_4_2
vlib riviera/microblaze_v11_0_0
vlib riviera/lmb_v10_v3_0_9
vlib riviera/lmb_bram_if_cntlr_v4_0_15
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/mdm_v3_2_15
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2
vmap microblaze_v11_0_0 riviera/microblaze_v11_0_0
vmap lmb_v10_v3_0_9 riviera/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_15 riviera/lmb_bram_if_cntlr_v4_0_15
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_15 riviera/mdm_v3_2_15
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_FFT_Butterfly_Axi_Li_0_0/src/Phase_Re_Factor_ROM_Memory/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_FFT_Butterfly_Axi_Li_0_0/src/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_FFT_Butterfly_Axi_Li_0_0/src/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/hdl/FFT_Butterfly_Axi_Lite_v1_0_S00_AXI.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/src/fft_package.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/src/FFT_STAGE.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/src/Main_Module.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/src/Reverse_Input_Data_Adress.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/src/Simplified_fft_stage.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/src/s_mult_rtl.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ipshared/45ee/hdl/FFT_Butterfly_Axi_Lite_v1_0.sv" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_FFT_Butterfly_Axi_Li_0_0/sim/FFT_Butterfly_Microblaze_FFT_Butterfly_Axi_Li_0_0.sv" \

vcom -work microblaze_v11_0_0 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/2ed1/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_microblaze_0_0/sim/FFT_Butterfly_Microblaze_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_dlmb_v10_0/sim/FFT_Butterfly_Microblaze_dlmb_v10_0.vhd" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_ilmb_v10_0/sim/FFT_Butterfly_Microblaze_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_15 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/92fd/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_dlmb_bram_if_cntlr_0/sim/FFT_Butterfly_Microblaze_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_ilmb_bram_if_cntlr_0/sim/FFT_Butterfly_Microblaze_ilmb_bram_if_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_lmb_bram_0/sim/FFT_Butterfly_Microblaze_lmb_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_15 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/41ef/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_mdm_1_0/sim/FFT_Butterfly_Microblaze_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_clk_wiz_1_0/FFT_Butterfly_Microblaze_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_clk_wiz_1_0/FFT_Butterfly_Microblaze_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Butterfly_Microblaze/ip/FFT_Butterfly_Microblaze_rst_clk_wiz_1_100M_0/sim/FFT_Butterfly_Microblaze_rst_clk_wiz_1_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Butterfly_Microblaze/ipshared/85a3" \
"../../../bd/FFT_Butterfly_Microblaze/sim/FFT_Butterfly_Microblaze.v" \

vlog -work xil_defaultlib \
"glbl.v"

