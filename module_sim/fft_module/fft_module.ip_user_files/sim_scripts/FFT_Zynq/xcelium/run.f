-makelib xcelium_lib/xilinx_vip -sv \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq/sim/FFT_Zynq.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_4 -sv \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_6 -sv \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq/ip/FFT_Zynq_processing_system7_0_0/sim/FFT_Zynq_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_12 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_20 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_11 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/efa7/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_19 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/09b0/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq/ip/FFT_Zynq_axi_dma_0_0/sim/FFT_Zynq_axi_dma_0_0.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq/ip/FFT_Zynq_rst_ps7_0_100M_0/sim/FFT_Zynq_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Im_Factor_ROM_Memory/ip/Phase_Im_Factor_ROM_Memory/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Im_Factor_ROM_Memory/ip/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \
  "../../../bd/FFT_Zynq/fft_module/fft_module.srcs/Phase_Re_Factor_ROM_Memory/ip/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
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
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_17 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_18 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_18 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq/ip/FFT_Zynq_auto_pc_0/sim/FFT_Zynq_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

