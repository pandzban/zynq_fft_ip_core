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


class Input_vector;
	rand bit [M-1:-F] x_input [DEFAULT_INPUTS];
	constraint input_cstr {
		foreach (x_input[i]){
			x_input[i][M-1:0] == 0; // below 1.0
		}
	}
endclass : Input_vector

import fft_package::*;

module butterfly_tb;
	logic clk;
	logic reset;
	logic [M-1:-F] Input [DEFAULT_INPUTS];
	//logic [M-1:-F] Output [8];
	complex_t Output [DEFAULT_OUTPUTS];
	Input_vector input_rand;
	parameter SIM_TIME = 20;	// in clk cycles

	butterfly_beh uut(
	   .clk,
	   .reset,
	   .Input,
	   .Output
	);

	initial begin
		clk = 0;
		reset = 0;
		input_rand = new();
		input_rand.randomize();
		foreach(Input[i]) begin
			Input[i] = input_rand.x_input[i];
		end
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
