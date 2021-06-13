`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 15:25:02
// Design Name: 
// Module Name: Main_Module_TB
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

module Main_Module_TB;
parameter DEFAULT_INPUTS = 16;
parameter M = 6;
parameter F = 10;
parameter NUM_OF_VECTORS = 5; //CHOOSE HOW MANY VECTOR DO YOU WANT TO LOAD TO MEMORY AND CHOOSE FROM
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
	parameter SIM_TIME = 40;	// in clk cycles

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
		reset = 1;
		#50;
		reset = 0;
		//0 - CONST SIGNAL = 0, 1 - CONST SIGNAL = 1, 2 - SQUARE SIGNAL, 3 - SINUS SIGNAL, 4 - COSINUS SIGNAL
		Input_FFT = Data_Input_Vectors[0]; //CHOOSE WHICH INPUT_VECTOR IS GOING TO BE LOADED 
		// input_rand = new();
		// input_rand.randomize();
		// foreach(Input[i]) begin
		// 	Input[i] = input_rand.x_input[i];
		// end
	end
    
    //Clock
    always begin
        #5; 
        clk = ~clk;
	end
	
	int counter = 1;
	
	always @(posedge clk) begin
        if(valid_in) begin
            Input_FFT = Data_Input_Vectors[counter];
            counter = counter + 1;
        end
	
	end
	
	Main_Module Main(
	   .Data_Input(Input_FFT),
	   .clk,
	   .reset,
	   .Data_Output(Output_FFT),
	   .Valid_Data(valid_out),
	   .Valid_Input(valid_in)
   );
	
	
	
	
	
	
endmodule
