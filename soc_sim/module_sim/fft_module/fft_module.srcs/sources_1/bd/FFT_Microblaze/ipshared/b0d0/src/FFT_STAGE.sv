`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2021 10:45:17
// Design Name: 
// Module Name: FFT_STAGE
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

module FFT_STAGE#(
    parameter Number_Of_Stage = 1
    )(
    input logic clk,
    input logic reset,
    input Valid_In,
    input complex_t Data_Input [DEFAULT_INPUTS-1:0],
    output complex_t Data_Output [DEFAULT_INPUTS-1:0],
    output logic Valid_Out
    );
    parameter MUL_LATENCY = 5;
    
    
    //Buffer input output Data
    complex_t Data_Input_Buffer [DEFAULT_INPUTS-1:0];
    complex_t Data_Output_Buffer [DEFAULT_INPUTS-1:0];
    logic RST_ADRESS;
    
    assign RST_ADRESS = Valid_In | reset;
      
    //Combinational logic to enable reset
    always_ff @(posedge Valid_In) begin
        Data_Input_Buffer <= Data_Input;
    end
    
    always_ff @(posedge clk) begin
        if(RST_ADRESS) begin
            Data_Output <= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        end else begin
            Data_Output <= Data_Output_Buffer;
        end
    end
    
    logic [4:0] Valid_Ctr;
    
    always_ff @(posedge clk) begin
        if(RST_ADRESS) begin
            Valid_Out <= 0;
            Valid_Ctr <= 0;
        end else begin
            Valid_Ctr <= Valid_Ctr + 1;
            Valid_Out <= 0;
            if(Valid_Ctr == DEFAULT_INPUTS/2 + MUL_LATENCY) begin
                Valid_Out <= 1;
                Valid_Ctr <= 0;
            end
        end
    end
    
    //Signals for adress generator
    // In each stage you have n/2 fft_blocks for n input fft, for example 8 input fft require 4 fft_block in every stage
    logic [$clog2(DEFAULT_INPUTS/2):0] Number_of_fft_block = 1; // Its looks similar to logic Adress but it enable future upgrades with FFT_Blocks
    logic [MAX_ADRESS-1:0] phase_factor_adress = 0; //Adress for ROMs with Phase_Factor_Data(Weights in behavioral)
    logic [DEFAULT_INPUTS-1:0] Adress = 0; //Adress for input and output buffer
    logic send_to_mult; //Signal enable for sending Data_A and Data_B to FFT_Block
    //Data for FFT_Block
    complex_t Phase_Factor_Data; //Phase_Factor_Data from ROMs 
    complex_t Data_A,Data_B,Data_C,Data_D; //Data_input FFT_Block and Data_output FFT_Block
    //Adress generator for FFT_Block
    always_ff @(posedge clk) begin
        if(RST_ADRESS) begin
            Number_of_fft_block <= 1;
            Adress <= 0;
            phase_factor_adress <= (1 << Number_Of_Stage) - 2; //Adress Start; Number_Of_Stage = 1 -> adress start = 0; Number_Of_Stage = 2 -> adress start -> 2; Number_Of_Stage = 4 -> adress start = 14
            send_to_mult <= 0;
        end else begin
            Number_of_fft_block <= Number_of_fft_block + 1;
            //this if check when to change adress for next butterfly in stage for example:
            //Number_Of_Stage = 1 -> Adress = 0 -> Adress = 1 -> Adress = 4 -> Adress = 5 -> Adress = 12 -> Adress = 13
            if(Number_of_fft_block % (1 << Number_Of_Stage) == 0) begin
                phase_factor_adress <= (1 << Number_Of_Stage) - 2;
                Adress <= Number_of_fft_block << 1;
//            end else if(Number_of_fft_block == (DEFAULT_INPUTS >> 1)) begin
//                send_to_mult <= 0;
            end else if(Adress >= DEFAULT_INPUTS) begin
                send_to_mult <= 0;
            end else begin
                phase_factor_adress <= phase_factor_adress + 1;
                Adress <= Adress + 1;
                send_to_mult <= 1;
            end
        end
    end

    //These buffers are to synchronize Data for FFT_Block with Data from ROMs due to the fact
    //that reading from ROM require one additional clock cycle and additionaly we need them to properly map Data from FFT_Block to Output Buffer
    logic [DEFAULT_INPUTS-1:0] Adress_Delay [MUL_LATENCY:0];
    integer i;
    always_ff @(posedge clk) begin
        Adress_Delay[0] <= Adress;
        for(i = 1;i <= MUL_LATENCY;i++) begin
            Adress_Delay[i] <= Adress_Delay[i-1];
        end
    end
    
    //Properly Data for FFT_Block
    always_comb begin
        if(send_to_mult) begin
            Data_A <= Data_Input_Buffer[Adress_Delay[0]];
            Data_B <= Data_Input_Buffer[Adress_Delay[0] + (1 << Number_Of_Stage)];
        end
        Data_Output_Buffer[Adress_Delay[MUL_LATENCY]] <= Data_C;
        Data_Output_Buffer[Adress_Delay[MUL_LATENCY] + (1 << Number_Of_Stage)] <= Data_D;
    end
    //ROM_IM Memory
    Phase_Im_Factor_ROM_Memory Im_Memory(
	   .clka(clk),
	   .addra(phase_factor_adress),
	   .douta(Phase_Factor_Data.Im)
	);
	//ROM_RE Memory
	Phase_Re_Factor_ROM_Memory Re_Memory(
	   .clka(clk),
	   .addra(phase_factor_adress),
	   .douta(Phase_Factor_Data.Re)
	);
    //One FFT_Block for one stage. It can be upgraded in futher
    fft_block_rtl FFT_Block(
		.clk,
		.reset,
		.first(Data_A),
		.second(Data_B),
		.phase_factor(Phase_Factor_Data),
		.first_out(Data_C),
		.second_out(Data_D)
	);
	
     
endmodule
