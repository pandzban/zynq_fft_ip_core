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

import fft_package::*;

module butterfly_tb;
	logic clk;
	logic reset;
	logic valid_in;
	logic valid_out;
	real Input_ref [6] = {0.135, 0.45, 0.95, 0.12, 0.0, 0.89};
	real Input_ref2 [3] = {0.12, 0.435, 0.89};
	logic [M-1:-F] Input [6];
	//logic [M-1:-F] Output [8];
	complex_t Output [DEFAULT_OUTPUTS];
	//Input_vector input_rand;
	parameter SIM_TIME = 20;	// in clk cycles

	butterfly_beh uut(
	   .clk,
	   .reset,
	   .valid_in,
	   .Input,
	   .valid_out,
	   .Output
	);

	initial begin
		clk = 0;
		reset = 0;
		valid_in = 0;
		#10;
		valid_in = 1;
		foreach(Input_ref[i]) begin
			Input[i] = Input_ref[i] * (2**F);
		end
		#10;
		valid_in = 0;
		// input_rand = new();
		// input_rand.randomize();
		// foreach(Input[i]) begin
		// 	Input[i] = input_rand.x_input[i];
		// end
	end

	always begin
		#5; 
		clk = ~clk;
	end

	initial begin 
		for (int i = 0; i < SIM_TIME; i++) begin 
			@(posedge clk);
		end
		$finish;
	end

endmodule
