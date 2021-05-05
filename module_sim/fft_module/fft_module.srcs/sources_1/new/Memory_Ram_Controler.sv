`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2021 15:49:52
// Design Name: 
// Module Name: Memory_Ram_Controler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import fft_package::*;

module Memory_Ram_Controler(
    input logic Clk, //input Clk - common for these two block memory
    input logic Write_Read, //input signal Write and Read; Write - 1, Read - 0
    input logic [9:0] Adress, //input Adress - common for these two block memory
    input complex_t Write_A, //input Data_A - Re and Im is splited to two separated Ports in one block memory
//    input complex_t Write_B, //input Data_B - Re and Im is splited to two separated Ports in one block memory
    output complex_t Read_A //output Data_A - Re and Im are combined to complex_t Data_A
//    output complex_t Read_B //output Data_A - Re and Im are combined to complex_t Data_B
    );
    
    //First block Ram Memory
    
    blk_mem_gen_0 RAM_A(
        .dina(Write_A),
        .douta(Read_A),
        .clka(Clk),
        .addra(Adress),
        .wea(Write_Read)
//        .dinb(Write_A),
//        .doutb(Read_A),
//        .clkb(Clk),
//        .addrb(Adress),
//        .enb(Write_Read)
    );
    
    //Second Block Ram Memory
    
//    blk_mem_gen_0 RAM_B(
//        .dina(Write_B),
//        .douta(Read_B),
//        .clka(Clk),
//        .addra(Adress),
//        .wea(Write_Read)
////        .dinb(Write_B),
////        .doutb(Read_B),
////        .clkb(Clk),
////        .addrb(Adress),
////        .enb(Write_Read)
//    );
    
    
endmodule
