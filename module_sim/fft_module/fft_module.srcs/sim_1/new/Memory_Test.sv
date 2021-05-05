`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2021 15:54:55
// Design Name: 
// Module Name: Memory_Test
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
//`include "fft_package.sv"
import fft_package::*;



module Memory_Test;
logic Clk;
logic [9:0] Adress;
complex_t Write_A;
complex_t Read_A;
complex_t Write_B;
complex_t Read_B;
logic Write_Read;

initial begin
    Clk = 0;
    Adress = 0;
    Write_A.Re = 16'h6789;
    Write_A.Im = 16'h9876;
    Write_B.Re = 16'h1234;
    Write_B.Im = 16'h4321;
    Write_Read = 0;
    #3;
    Write_Read = 1;
    #10;
    Adress = 10;
    Write_A.Re = 16'hcccc;
    Write_A.Im = 16'hbbbb;
    Write_B.Re = 16'haaaa;
    Write_B.Im = 16'hdddd;
    Write_Read = 0;
    #10;
    Adress = 0;
    #10;
    Adress = 10;
    #10;
    $finish;
end

always begin
    #1 Clk = 1;
    #1 Clk = 0;
end

Memory_Ram_Controler RAM(
    .Clk(Clk),
    .Adress(Adress),
    .Write_A(Write_A),
    .Read_A(Read_A),
    .Write_B(Write_B),
    .Read_B(Read_B),
    .Write_Read(Write_Read)
);




endmodule
