`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2021 08:46:26
// Design Name: 
// Module Name: Simplified_fft_stage
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


module Simplified_fft_stage(
    input logic clk,
    input logic reset,
    input logic Valid_In,
    input complex_t Data_Input [DEFAULT_INPUTS-1:0],
    output complex_t Data_Output [DEFAULT_INPUTS-1:0],
    output logic Valid_Out,
    output logic start_nxt,
    input logic start
    );
    parameter MUL_LATENCY = 5;
    
     //Buffer input output Data
    complex_t Data_Input_Buffer [DEFAULT_INPUTS-1:0];
    complex_t Data_Output_Buffer [DEFAULT_INPUTS-1:0];
    logic RST_ADRESS;
    
    assign RST_ADRESS = Valid_In | reset | start;
    
    //Combinational logic to enable reset
    //Check if OK 
    reg Valid_In_Buff[1:0];
    
    
    always_ff @(posedge clk) begin
        Valid_In_Buff[0] <= Valid_In;
        Valid_In_Buff[1] <= Valid_In_Buff[0];
        if(Valid_In_Buff[1] == 0 & Valid_In_Buff[0]) begin
            Data_Input_Buffer <= Data_Input;
        end
    end
    
    always_ff @(posedge clk) begin
//        if(RST_ADRESS) begin
//            Data_Output <= {32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000};
//        end else begin
            Data_Output <= Data_Output_Buffer;
//        end
    end
    
    logic [4:0] Valid_Ctr;
    
    always_ff @(posedge clk) begin
        if(reset) begin
            start_nxt <= 1;
        end
        if(RST_ADRESS) begin
            Valid_Out <= 0;
            Valid_Ctr <= 0;
        end else begin
            Valid_Ctr <= Valid_Ctr + 1;
            Valid_Out <= 0;
            if(Valid_Ctr == DEFAULT_INPUTS/2 + MUL_LATENCY) begin
                start_nxt <= 0;
                Valid_Out <= 1;
                Valid_Ctr <= 0;
            end
        end
    end
    
    //Signals for adress generator
    // In each stage you have n/2 fft_blocks for n input fft, for example 8 input fft require 4 fft_block in every stage
    logic [$clog2(DEFAULT_INPUTS/2)-1:0] Number_of_fft_block = 0; // Its looks similar to logic Adress but it enable future upgrades with FFT_Blocks
    logic [DEFAULT_INPUTS-1:0] Adress = 0;
    logic send_to_mult;
    //Data for FFT_Block
    complex_t Data_A,Data_B,Data_C,Data_D;
    //Adress generator for FFT_Block
    always_ff @(posedge clk) begin
        if(RST_ADRESS) begin
            Number_of_fft_block <= 0;
            Adress <= 0;
            send_to_mult <= 0;
        end else begin
            Number_of_fft_block <= Number_of_fft_block + 1;
//            if(Number_of_fft_block == (DEFAULT_INPUTS >> 1) - 1) begin
//                Number_of_fft_block <= 0;
//            end
            if(Adress >= DEFAULT_INPUTS) begin
                send_to_mult <= 0;
                Adress <= Adress;
            end else begin
                send_to_mult <= 1;
                Adress <= Adress + 2;
            end
        end
    end
    
    logic Send_to_Output [MUL_LATENCY:0];
    logic [DEFAULT_INPUTS-1:0] Adress_Delay [MUL_LATENCY:0];
    integer i;
    always_ff @(posedge clk) begin
        Send_to_Output[0] <= send_to_mult;
        Adress_Delay[0] <= Adress;
        for(i = 1;i <= MUL_LATENCY;i++) begin
            Adress_Delay[i] <= Adress_Delay[i-1];
            Send_to_Output[i] <= Send_to_Output[i-1];
        end
    end
    
    //Properly Data for FFT_Block
    always_comb begin
        if(send_to_mult) begin
            Data_A <= Data_Input_Buffer[Adress_Delay[0]];
            Data_B <= Data_Input_Buffer[Adress_Delay[0] + 1];
        end else begin
            Data_A <= Data_A;
            Data_B <= Data_B;
        end//else begin
//            Data_A <= 0;
//            Data_B <= 0;
//        end
    end
    
    always_comb begin
        if(Send_to_Output[MUL_LATENCY-1]) begin
            Data_Output_Buffer[Adress_Delay[MUL_LATENCY]] <= Data_C;
            Data_Output_Buffer[Adress_Delay[MUL_LATENCY] + 1] <= Data_D;
        end else begin
            Data_Output_Buffer <= Data_Output_Buffer;
        end
    end
    
    fft_block_simplified_rtl FFT_Block(
        .clk,
		.reset,
		.first(Data_A),
		.second(Data_B),
		.first_out(Data_C),
		.second_out(Data_D)
	);
    
endmodule
