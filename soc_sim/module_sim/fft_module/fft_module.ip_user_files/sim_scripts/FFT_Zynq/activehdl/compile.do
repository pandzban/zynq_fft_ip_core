vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_4
vlib activehdl/processing_system7_vip_v1_0_6
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/fifo_generator_v13_2_3
vlib activehdl/lib_fifo_v1_0_12
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/axi_datamover_v5_1_20
vlib activehdl/axi_sg_v4_1_11
vlib activehdl/axi_dma_v7_1_19
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/blk_mem_gen_v8_4_2
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_data_fifo_v2_1_17
vlib activehdl/axi_register_slice_v2_1_18
vlib activehdl/axi_protocol_converter_v2_1_18

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 activehdl/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 activehdl/processing_system7_vip_v1_0_6
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 activehdl/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 activehdl/lib_fifo_v1_0_12
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_20 activehdl/axi_datamover_v5_1_20
vmap axi_sg_v4_1_11 activehdl/axi_sg_v4_1_11
vmap axi_dma_v7_1_19 activehdl/axi_dma_v7_1_19
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap blk_mem_gen_v8_4_2 activehdl/blk_mem_gen_v8_4_2
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_17 activehdl/axi_data_fifo_v2_1_17
vmap axi_register_slice_v2_1_18 activehdl/axi_register_slice_v2_1_18
vmap axi_protocol_converter_v2_1_18 activehdl/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip  -sv2k12 "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/sim/FFT_Zynq.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4  -sv2k12 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6  -sv2k12 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0/sim/FFT_Zynq_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_11 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/efa7/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_19 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/09b0/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_axi_dma_0_0/sim/FFT_Zynq_axi_dma_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_rst_ps7_0_100M_0/sim/FFT_Zynq_rst_ps7_0_100M_0.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Im_Factor_ROM_Memory/ip/Phase_Im_Factor_ROM_Memory/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Im_Factor_ROM_Memory/ip/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \
"../../../bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Re_Factor_ROM_Memory/ip/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
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

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_18  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl" "+incdir+../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0" "+incdir+E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/FFT_Zynq/ip/FFT_Zynq_auto_pc_0/sim/FFT_Zynq_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

