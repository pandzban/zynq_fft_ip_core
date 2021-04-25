`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2021 20:37:17
// Design Name: 
// Module Name: butterfly_beh
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.03 - added FFT blocks and other functions
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//`include "fft_package.sv"
import fft_package::*;

module butterfly_beh
    #(
		parameter NUM_OF_WORDS = DEFAULT_INPUTS,
		parameter DATA_PROCESS_TIME = 8, 	// minimum (NUM_OF_STAGES*2) + 1
		parameter POWER = 2**($clog2(NUM_OF_WORDS)),
		parameter NUM_OF_STAGES = $clog2(NUM_OF_WORDS),
		parameter BUFF_DELAY = DATA_PROCESS_TIME - (NUM_OF_STAGES*2),
		parameter BUFF_LENG = (NUM_OF_STAGES*2)+1+BUFF_DELAY
	)(
		input logic clk,
		input logic reset,
		input logic valid_in,
		input logic [M-1:-F] Input [NUM_OF_WORDS-1:0],
		output logic valid_out,
		// output logic [M-1:-F] Output [POWER]
		output complex_t Output [POWER-1:0]
	);
	

	complex_t x_input [POWER-1:0]; //input buffer
	complex_t internal_reg [NUM_OF_STAGES+1+BUFF_DELAY][POWER-1:0]; 	// internal memory
	logic valid_reg [BUFF_LENG-1:0]; //valid_in to valid_out buffers
	complex_t output_reg [POWER-1:0]; //output buffer
	//complex_t buffer_reg [BUFF_DELAY][POWER];

    //Rearrange input vector for FFT_Butterfly
    rearrange_zero_padd #(.NUM_OF_WORDS(NUM_OF_WORDS)) rearrange_inst(
		.clk,
		.reset,
		.Input,
		.Output(x_input)
	);


    //Transfer Input Signal Valid_In to Output Signal Valid_Out
    always_ff @(posedge clk) begin
		for (int i = 0; i < BUFF_LENG-1; i++) begin
			valid_reg [i + 1] <= valid_reg[i];
			valid_reg [0] <= valid_in;
			valid_out <= valid_reg[BUFF_LENG-1];
		end
	end

    //Rearranged input to first buffer in LUT memory
    always_comb begin
        internal_reg[0] = x_input;
    end
//	for (genvar j = 0; j < POWER; j++) begin
//		assign internal_reg[0][j] = x_input[j];
//	end
    
    // generation of fft internal blocks and their connections
	for (genvar j = 0; j < NUM_OF_STAGES; j++) begin 
		for (genvar k = 0; k < 2**j; k++) begin
			single_fft_block #(.STAGE(NUM_OF_STAGES-j-1)) fft_block_inst(
				.clk,
				.reset,
				.Input(internal_reg[NUM_OF_STAGES-j-1][((k+1)*POWER/(2**j))-1:k*POWER/(2**j)]),
				.Output(internal_reg[NUM_OF_STAGES-j][((k+1)*POWER/(2**j))-1:k*POWER/(2**j)])
			);
		end
	end

	// buffer registers
	always_ff @(posedge clk) begin
		for (int i = 0; i < BUFF_DELAY; i++) begin 	
			for (int k = 0; k < POWER; k++) begin
				internal_reg[i+NUM_OF_STAGES+1][k] <= internal_reg[i+NUM_OF_STAGES][k];  
			end
		end
	end

	// connect internal memory matrix to output registers
	always_ff @(posedge clk) begin
//		for (int j = 0; j < POWER; j++) begin
			output_reg <= internal_reg[NUM_OF_STAGES+BUFF_DELAY];
//		end
	end

	// only real outputs? -- for now
	//for (genvar j = 0; j < POWER; j++) begin
		//assign Output[j] = output_reg[j].Re;
		assign Output = output_reg;
	//end

//	initial begin
//		$display("NUM_OF_WORDS = %0d, POWER = %0d, NUM_OF_STAGES = %0d", NUM_OF_WORDS, POWER, NUM_OF_STAGES);
//	end

endmodule : butterfly_beh
