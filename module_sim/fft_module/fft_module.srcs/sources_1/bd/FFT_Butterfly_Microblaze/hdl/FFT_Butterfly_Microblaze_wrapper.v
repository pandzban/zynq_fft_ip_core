//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Jun 13 16:54:37 2021
//Host        : DESKTOP-DJCF65G running 64-bit major release  (build 9200)
//Command     : generate_target FFT_Butterfly_Microblaze_wrapper.bd
//Design      : FFT_Butterfly_Microblaze_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FFT_Butterfly_Microblaze_wrapper
   (diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    reset_rtl,
    reset_rtl_0);
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  input reset_rtl;
  input reset_rtl_0;

  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire reset_rtl;
  wire reset_rtl_0;

  FFT_Butterfly_Microblaze FFT_Butterfly_Microblaze_i
       (.diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .reset_rtl(reset_rtl),
        .reset_rtl_0(reset_rtl_0));
endmodule
