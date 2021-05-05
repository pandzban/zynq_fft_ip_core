-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Apr 28 13:01:38 2021
-- Host        : DESKTOP-DJCF65G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Vrael/Desktop/SDUP/Lab2/cordic_acc/cordic_acc.tmp/cordic_ip_v1_0/Phase_Im_Factor_ROM_Memory/Phase_Im_Factor_ROM_Memory_stub.vhdl
-- Design      : Phase_Im_Factor_ROM_Memory
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Phase_Im_Factor_ROM_Memory is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end Phase_Im_Factor_ROM_Memory;

architecture stub of Phase_Im_Factor_ROM_Memory is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[3:0],douta[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_2,Vivado 2018.3";
begin
end;
