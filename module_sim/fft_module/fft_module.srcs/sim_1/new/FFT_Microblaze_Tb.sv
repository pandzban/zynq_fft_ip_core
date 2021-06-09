`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2021 11:55:12
// Design Name: 
// Module Name: FFT_Microblaze_Tb
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


module FFT_Microblaze_Tb;
reg clk_n, clk_p;
reg reset, reset_n;

initial begin
    reset = 1'b1;
    reset_n = 1'b0;
#10 reset = 1'b0;
    reset_n = 1'b1;
end

initial begin
    clk_n = 1'b0;
    clk_p = 1'b1;
end

always begin
    #5 clk_n = ~clk_n;
    clk_p = ~clk_p;
end

FFT_Microblaze_wrapper FFT_Microblaze( clk_n, clk_p, reset, reset_n);
    



endmodule
