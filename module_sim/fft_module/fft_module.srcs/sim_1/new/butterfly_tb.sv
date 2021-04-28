`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2021 20:38:47
// Design Name: 
// Module Name: butterfly_tb
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


// class Input_vector;
// 	rand bit [M-1:-F] x_input [DEFAULT_INPUTS];
// 	constraint input_cstr {
// 		foreach (x_input[i]){
// 			x_input[i][M-1:0] == 0; // below 1.0
// 		}
// 	}
// endclass : Input_vector
//`include "fft_package.sv"
import fft_package::*;

module butterfly_tb;
    parameter NUM_OF_VECTORS = 4; //CHOOSE HOW MANY VECTOR DO YOU WANT TO LOAD TO MEMORY AND CHOOSE FROM
    logic [15:0] Data_Input_Vectors [NUM_OF_VECTORS-1:0][DEFAULT_INPUTS-1:0];
    logic [15:0] Data_Vector_Inputs [NUM_OF_VECTORS*15+NUM_OF_VECTORS-1:0];
    logic [15:0] Data_Output_Vectors [NUM_OF_VECTORS-1:0][DEFAULT_INPUTS-1:0];
    logic [15:0] Data_Vector_Outputs [NUM_OF_VECTORS*15+NUM_OF_VECTORS-1:0];
	logic clk;
	logic reset;
	logic [M-1:-F] Input_FFT [DEFAULT_INPUTS-1:0];
	logic valid_in;
	logic valid_out;
	//logic [M-1:-F] Output [8];
	complex_t Output_FFT [DEFAULT_OUTPUTS-1:0];
	parameter SIM_TIME = 20;	// in clk cycles

    initial begin
        int Adress;
//          Read_Input = $fopen("C:/Users/Vrael/Desktop/FFT_Project/Input_Vectors.csv","r");
//          Read_Output = $fopen("C:/Users/Vrael/Desktop/FFT_Project/Output_Vectors.csv","r");
//          status = $fread(Read_Input,"%d\n",Data_Vector_Inputs);
//          status = $fread(Read_Output,"%d\n",Data_Vector_Outputs);
        $readmemb("C:/Users/Vrael/Desktop/FFT_Project/SDUP_FFT/Input_Vectors.csv", Data_Vector_Inputs);
        $readmemb("C:/Users/Vrael/Desktop/FFT_Project/SDUP_FFT/Output_Vectors.csv", Data_Vector_Outputs);
        for(Adress =0; Adress < NUM_OF_VECTORS;Adress = Adress + 1) begin
            Data_Input_Vectors[Adress] = Data_Vector_Inputs[Adress*16+:16];
//            Data_Output_Vectors[Adress] = Data_Vector_Outputs[Adress*16+:16];
        end
    end
    
    initial begin
		clk = 0;
		reset = 0;
		valid_in = 0;
		#10;
		//0 - CONST SIGNAL = 0, 1 - CONST SIGNAL = 1, 2 - SQUARE SIGNAL, 3 - SINUS SIGNAL, 4 - COSINUS SIGNAL
		Input_FFT = Data_Input_Vectors[3]; //CHOOSE WHICH INPUT_VECTOR IS GOING TO BE LOADED 
		valid_in = 1;
		#10;
		valid_in = 0;
		// input_rand = new();
		// input_rand.randomize();
		// foreach(Input[i]) begin
		// 	Input[i] = input_rand.x_input[i];
		// end
	end
    
    initial begin 
		for (int i = 0; i < SIM_TIME; i++) begin 
			@(posedge clk);
		end
		$finish;
	end
    
    //Clock
    always begin
        #5; 
        clk = ~clk;
	end

	butterfly_beh uut(
	   .clk,
	   .reset,
	   .valid_in,
	   .Input(Input_FFT),
	   .valid_out,
	   .Output(Output_FFT)
	);

endmodule
