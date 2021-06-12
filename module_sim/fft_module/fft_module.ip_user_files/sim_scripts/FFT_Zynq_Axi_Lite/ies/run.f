-makelib ies_lib/xilinx_vip -sv \
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
-makelib ies_lib/xil_defaultlib -sv \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_FFT_Butterfly_Axi_Li_0_0/src/Phase_Re_Factor_ROM_Memory/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_FFT_Butterfly_Axi_Li_0_0/src/Phase_Re_Factor_ROM_Memory/sim/Phase_Re_Factor_ROM_Memory.v" \
  "../../../bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_FFT_Butterfly_Axi_Li_0_0/src/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/hdl/FFT_Butterfly_Axi_Lite_v1_0_S00_AXI.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/src/fft_package.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/src/FFT_STAGE.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/src/Main_Module.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/src/Reverse_Input_Data_Adress.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/src/Simplified_fft_stage.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/src/s_mult_rtl.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ipshared/7694/hdl/FFT_Butterfly_Axi_Lite_v1_0.sv" \
  "../../../bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_FFT_Butterfly_Axi_Li_0_0/sim/FFT_Zynq_Axi_Lite_FFT_Butterfly_Axi_Li_0_0.sv" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_4 -sv \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_6 -sv \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_processing_system7_0_0/sim/FFT_Zynq_Axi_Lite_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_rst_ps7_0_100M_0/sim/FFT_Zynq_Axi_Lite_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_3 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_3 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_3 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_17 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_18 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_18 \
  "../../../../fft_module.srcs/sources_1/bd/FFT_Zynq_Axi_Lite/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/FFT_Zynq_Axi_Lite/ip/FFT_Zynq_Axi_Lite_auto_pc_0/sim/FFT_Zynq_Axi_Lite_auto_pc_0.v" \
  "../../../bd/FFT_Zynq_Axi_Lite/sim/FFT_Zynq_Axi_Lite.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

