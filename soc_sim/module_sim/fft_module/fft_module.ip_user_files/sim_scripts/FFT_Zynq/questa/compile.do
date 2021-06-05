vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_4
vlib questa_lib/msim/processing_system7_vip_v1_0_6
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_3
vlib questa_lib/msim/lib_fifo_v1_0_12
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_20
vlib questa_lib/msim/axi_sg_v4_1_11
vlib questa_lib/msim/axi_dma_v7_1_19
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/blk_mem_gen_v8_4_2
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_data_fifo_v2_1_17
vlib questa_lib/msim/axi_register_slice_v2_1_18
vlib questa_lib/msim/axi_protocol_converter_v2_1_18

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 questa_lib/msim/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 questa_lib/msim/processing_system7_vip_v1_0_6
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 questa_lib/msim/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 questa_lib/msim/lib_fifo_v1_0_12
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_20 questa_lib/msim/axi_datamover_v5_1_20
vmap axi_sg_v4_1_11 questa_lib/msim/axi_sg_v4_1_11
vmap axi_dma_v7_1_19 questa_lib/msim/axi_dma_v7_1_19
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_17 questa_lib/msim/axi_data_fifo_v2_1_17
vmap axi_register_slice_v2_1_18 questa_lib/msim/axi_register_slice_v2_1_18
vmap axi_protocol_converter_v2_1_18 questa_lib/msim/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/sim/FFT_Zynq.v" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0/sim/FFT_Zynq_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_11 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/efa7/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_19 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/09b0/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_axi_dma_0_0/sim/FFT_Zynq_axi_dma_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_rst_ps7_0_100M_0/sim/FFT_Zynq_rst_ps7_0_100M_0.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Im_Factor_ROM_Memory/ip/Phase_Im_Factor_ROM_Memory/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Im_Factor_ROM_Memory/ip/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Re_Factor_ROM_Memory/ip/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/sources_1/new/fft_package.sv" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/sources_1/new/FFT_STAGE.sv" \
"../../../bd/FFT_Zynq/ipshared/84eb/src/Main_Module.sv" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/sources_1/new/Reverse_Input_Data_Adress.sv" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/sources_1/new/Simplified_fft_stage.sv" \
"../../../bd/FFT_Zynq/ipshared/84eb/src/fft_butterlfy_ip_v1_0_M00_AXIS.sv" \
"../../../bd/FFT_Zynq/ipshared/84eb/src/fft_butterlfy_ip_v1_0_S00_AXIS.sv" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/sources_1/imports/rtl_blocks/s_mult_rtl.sv" \
"../../../bd/FFT_Zynq/ipshared/84eb/src/fft_butterlfy_ip_v1_0.sv" \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_fft_butterlfy_ip_0_1/sim/FFT_Zynq_fft_butterlfy_ip_0_1.sv" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_18 -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_auto_pc_0/sim/FFT_Zynq_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

