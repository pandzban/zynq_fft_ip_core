-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jun  9 11:47:02 2021
-- Host        : DESKTOP-DJCF65G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top FFT_Butterfly_Microblaze_clk_wiz_1_0 -prefix
--               FFT_Butterfly_Microblaze_clk_wiz_1_0_ FFT_Microblaze_clk_wiz_1_0_stub.vhdl
-- Design      : FFT_Microblaze_clk_wiz_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFT_Butterfly_Microblaze_clk_wiz_1_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end FFT_Butterfly_Microblaze_clk_wiz_1_0;

architecture stub of FFT_Butterfly_Microblaze_clk_wiz_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
