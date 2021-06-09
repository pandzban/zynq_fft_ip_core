`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 12:22:46
// Design Name: 
// Module Name: Reverse_Input_Data_Adress
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

module Reverse_Input_Data_Adress(
    input logic [15:0] Data_Input [DEFAULT_INPUTS-1:0], //Surowe dane na wejœciu
    input logic clk,
    input reset,
    output logic Valid_Out,
    output complex_t Data_A [DEFAULT_INPUTS-1:0],
    output logic start_nxt
    );
    parameter MUL_LATENCY = 5;
    
    
    complex_t Data_Output_Buff [DEFAULT_INPUTS-1:0];
    logic [MAX_ADRESS:0] Addr_Counter = 0;
    logic [MAX_ADRESS-1:0] Reverse_Adress;
    
    always_ff @(posedge clk) begin
        Data_A <= Data_Output_Buff;
    end
    
    always_ff @(posedge clk) begin
        if(reset) begin
            Addr_Counter <= 0;
            Valid_Out <= 0;
            Data_Output_Buff <= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
            start_nxt <= 1;
        end else begin
            Valid_Out <= 0;
            Addr_Counter <= Addr_Counter + 1;
            Data_Output_Buff[Addr_Counter].Re <= Data_Input[Reverse_Adress];
            Data_Output_Buff[Addr_Counter].Im <= 16'h0000;
            if(Addr_Counter == DEFAULT_INPUTS) begin
                Addr_Counter <= 0;
                Valid_Out <= 1;
                start_nxt <= 0;
            end
        end
    end
    
    addr_rearr_comb Reverse_First_Adress(
        .addr_in(Addr_Counter),
        .addr_out(Reverse_Adress)
    );
    
    
endmodule
