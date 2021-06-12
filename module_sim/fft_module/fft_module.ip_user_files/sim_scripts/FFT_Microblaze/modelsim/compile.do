vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/blk_mem_gen_v8_4_2
vlib modelsim_lib/msim/microblaze_v11_0_0
vlib modelsim_lib/msim/lmb_v10_v3_0_9
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_15
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/mdm_v3_2_15
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap blk_mem_gen_v8_4_2 modelsim_lib/msim/blk_mem_gen_v8_4_2
vmap microblaze_v11_0_0 modelsim_lib/msim/microblaze_v11_0_0
vmap lmb_v10_v3_0_9 modelsim_lib/msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_15 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_15
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_15 modelsim_lib/msim/mdm_v3_2_15
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 -incr "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ip/FFT_Microblaze_FFT_Butterfly_Axi_Li_0_0/src/Phase_Re_Factor_ROM_Memory/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_FFT_Butterfly_Axi_Li_0_0/src/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_FFT_Butterfly_Axi_Li_0_0/src/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Microblaze/ipshared/7694/hdl/FFT_Butterfly_Axi_Lite_v1_0_S00_AXI.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/src/fft_package.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/src/FFT_STAGE.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/src/Main_Module.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/src/Reverse_Input_Data_Adress.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/src/Simplified_fft_stage.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/src/s_mult_rtl.sv" \
"../../../bd/FFT_Microblaze/ipshared/7694/hdl/FFT_Butterfly_Axi_Lite_v1_0.sv" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_FFT_Butterfly_Axi_Li_0_0/sim/FFT_Microblaze_FFT_Butterfly_Axi_Li_0_0.sv" \

vcom -work microblaze_v11_0_0 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/2ed1/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_microblaze_0_0/sim/FFT_Microblaze_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_dlmb_v10_0/sim/FFT_Microblaze_dlmb_v10_0.vhd" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_ilmb_v10_0/sim/FFT_Microblaze_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_15 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/92fd/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_dlmb_bram_if_cntlr_0/sim/FFT_Microblaze_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_ilmb_bram_if_cntlr_0/sim/FFT_Microblaze_ilmb_bram_if_cntlr_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_lmb_bram_0/sim/FFT_Microblaze_lmb_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_15 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/41ef/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_mdm_1_0/sim/FFT_Microblaze_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_clk_wiz_1_0/FFT_Microblaze_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_clk_wiz_1_0/FFT_Microblaze_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Microblaze/ip/FFT_Microblaze_rst_clk_wiz_1_100M_0/sim/FFT_Microblaze_rst_clk_wiz_1_100M_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Microblaze/ipshared/85a3" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Microblaze/sim/FFT_Microblaze.v" \

vlog -work xil_defaultlib \
"glbl.v"
