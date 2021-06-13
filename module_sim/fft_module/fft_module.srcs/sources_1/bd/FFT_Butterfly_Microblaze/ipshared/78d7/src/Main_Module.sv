`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 15:07:26
// Design Name: 
// Module Name: Main_Module
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

module Main_Module #(
    parameter Num_Of_Stages = $clog2(DEFAULT_INPUTS)
    )(
    input logic [15:0] Data_Input [DEFAULT_INPUTS-1:0],
    input logic clk,
    input logic reset,
    output complex_t Data_Output [DEFAULT_INPUTS-1:0],
    output logic Valid_Data,
    output logic Valid_Input
    );
    
    genvar i;
    logic Valid_Adress_Change;
    complex_t Reverse_Data [DEFAULT_INPUTS-1:0];
    wire start_first_stage;
    
    Reverse_Input_Data_Adress Adress_Change(
        .Data_Input,
        .clk,
        .reset,
        .Valid_Out(Valid_Adress_Change),
        .Data_A(Reverse_Data),
        .start_nxt(start_first_stage)
    );
    
    complex_t Data_FFT_STAGE [Num_Of_Stages-1:0][DEFAULT_INPUTS-1:0];
    logic Valid_FFT_STAGE [Num_Of_Stages-1:0];
    logic FFT_start [Num_Of_Stages-1:0];
    
    Simplified_fft_stage First_Stage(
        .clk,
        .reset,
        .start(start_first_stage),
        .start_nxt(FFT_start[0]),
        .Valid_In(Valid_Adress_Change),
        .Data_Input(Reverse_Data),
        .Data_Output(Data_FFT_STAGE[0]),
        .Valid_Out(Valid_FFT_STAGE[0])
    );
    
    for(i = 1;i < Num_Of_Stages;i++) begin
        FFT_STAGE #(.Number_Of_Stage(i)) FFT_INSTANCE(
            .clk,
            .reset,
            .start(FFT_start[i-1]),
            .start_nxt(FFT_start[i]),
            .Valid_In(Valid_FFT_STAGE[i-1]),
            .Valid_Out(Valid_FFT_STAGE[i]),
            .Data_Input(Data_FFT_STAGE[i-1]),
            .Data_Output(Data_FFT_STAGE[i])
        );
    end
    
    assign Valid_Data = Valid_FFT_STAGE[Num_Of_Stages-1];
    assign Valid_Input = Valid_Adress_Change;
    
    always_ff @(posedge Valid_Data) begin
        Data_Output <= Data_FFT_STAGE[Num_Of_Stages-1];
    end
    
    
//    xilinx_true_dual_port_write_first_1_clock_ram #(
//        .RAM_WIDTH(32),
//        .RAM_DEPTH(DEFAULT_INPUTS-1)
//    ) FIRST_RAM (
//        .addra(Adress_First_Port),
//        .addrb(Adress_Second_Port),  // Port B address bus, width determined from RAM_DEPTH
//        .dina(Data_A),           // Port A RAM input data
//        .dinb(Data_B),           // Port B RAM input data
//        .clka(clk),                           // Clock
//        .wea(Write_Read),                            // Port A write enable
//        .web(Write_Read)                            // Port B write enable

//    );
endmodule
