`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2021 17:30:51
// Design Name: 
// Module Name: single_fft_block
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

module single_fft_block#(
		parameter STAGE = 0,
		parameter INPUT_NUM = 2 ** (STAGE+1)
	)(
		input logic clk,
		input logic reset,
		input complex_t Input [INPUT_NUM-1:0],
		output complex_t Output [INPUT_NUM-1:0]
	);

	// typedef so that function can return whole array
	typedef complex_t w_t [INPUT_NUM/2-1:0];

	complex_t buffer [INPUT_NUM-1:0]; 
	const w_t weights = fill_weights(); // constant values // need immidiate assignment

	function w_t fill_weights();
		for (int j = 0; j < (INPUT_NUM/2); j++) begin 
			fill_weights[j] = calc_weight(j, INPUT_NUM); // returned array
		end
	endfunction : fill_weights

	always_ff @(posedge clk) begin
		for (int i = 0; i < (INPUT_NUM/2); i++) begin
			buffer[i] <= Input[i];
			buffer[i + (INPUT_NUM/2)] <= mult_comp(Input[i + (INPUT_NUM/2)], weights[i]); // use BRAM
			Output[i] <= add_comp(buffer[i], buffer[i + (INPUT_NUM/2)]);
			Output[i + (INPUT_NUM/2)] <= sub_comp(buffer[i], buffer[i + (INPUT_NUM/2)]);  
		end
	end
endmodule
