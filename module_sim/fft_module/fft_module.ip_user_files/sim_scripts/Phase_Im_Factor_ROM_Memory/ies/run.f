-makelib ies_lib/xil_defaultlib -sv \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Vivado_2018_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../../../../SDUP/Lab2/cordic_acc/cordic_acc.tmp/cordic_ip_v1_0/Phase_Im_Factor_ROM_Memory/sim/Phase_Im_Factor_ROM_Memory.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

